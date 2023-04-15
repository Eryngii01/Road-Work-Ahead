using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using System.Linq;

namespace Controls {
    public class Player : MonoBehaviour, INavable {

        [Header("Misc")]
        public GameObject playerModel;
        public Item inventory;
        public int lifeCount = 3;

        [Header("Movement")]
        public float forwardAngle = 110f;
        public float swerveSize = 1f;

        [Header("Redirects")]
        [Min(0)]
        public int maxRedirects = 5;
        public Redirect redirectPrefab;

        public bool isSuperPlayer { get; set; } = false;
        public bool isTutorial;
        bool _hasPartialRedirected = false;

        // ----------- Movement -----------------------
        float _baseSpeed;
        Vector2 _lastDirectionalInput;
        NavigateOnNetwork _navigateOnNetwork;
        Vector3 _playerModelInitialOffset;

        // -------------- Input System ---------------
        PlayerInputActions _playerInputActions;
        InputAction _movement;
        // --------------- Game Speed ----------------
        int _speedMode = 1;
        // --------------- Redirect Placement ---------
        static DrivingState driving = new DrivingState();
        static RedirectAtIntersectionState atIntersection = new RedirectAtIntersectionState();
        static RedirectApproachingIntersectionState approachingIntersection = new RedirectApproachingIntersectionState();
        PlayerState state;

        Redirect redirectBeingPlaced;

        void Awake() {
            _playerInputActions = new PlayerInputActions();

            _lastDirectionalInput = new Vector2(0, 0);
            state = driving;
            _navigateOnNetwork = GetComponent<NavigateOnNetwork>();
        }

        void Start() {
            _playerModelInitialOffset = playerModel.transform.localPosition;
            _baseSpeed = _navigateOnNetwork.speed;
            ScoreManager.Instance.SetAvailableRedirects(maxRedirects, maxRedirects);
        }

        public Node NextDestination(Node last, Node curr) {
            return state.NextDestination(this, _CalculateNextDestination, state, redirectBeingPlaced, last, curr);
        }

        private Node _CalculateNextDestination(Node last, Node curr) {
            Node resultNode = curr;
            double maxCosAngle = -1;
            double cosAngle;
            Vector3 dirToNode;

            foreach (var node in curr.AdjacentComingFrom(last)) {
                dirToNode = (node.transform.position - transform.position).normalized;
                cosAngle = Vector3.Dot(JoystickVector().normalized, dirToNode);

                if (cosAngle > maxCosAngle) {
                    maxCosAngle = cosAngle;
                    resultNode = node;
                }
            }

            return resultNode;
        }

        Vector3 JoystickVector() {
            return new Vector3(_lastDirectionalInput.x, 0, _lastDirectionalInput.y);
        }

        void Movement(InputAction.CallbackContext obj) {
            
            _lastDirectionalInput = _playerInputActions.Driving.Movement.ReadValue<Vector2>();
            Node from = _navigateOnNetwork.from;
            Node to = _navigateOnNetwork.to;
            Vector3 joystick = JoystickVector();
            Vector3 dirToNode = (to.transform.position - from.transform.position).normalized;
            float angle = Vector3.Angle(joystick.normalized, dirToNode);

            // Delegate movement behaviour to state classes
            state.Movement(this, _navigateOnNetwork, StartRedirecting, StopRedirecting, _lastDirectionalInput, 
                            from, to, joystick, _playerModelInitialOffset, angle, forwardAngle, _baseSpeed);
        }

        void StartRedirectingHandler(InputAction.CallbackContext obj) {
            StartRedirecting();
        }

        // Try to place a redirect at the next intersection or edit the existing one.
        void StartRedirecting() {
            var redirectObjects = GameObject.FindObjectsOfType<Redirect>();
            Node intersection = GetNextIntersection();
            redirectBeingPlaced = null;
            foreach (var redirect in redirectObjects) {
                if (redirect.node == intersection) {
                    redirectBeingPlaced = redirect;
                }
            }

            if (!redirectBeingPlaced) {
                if (redirectObjects.Length >= maxRedirects) {
                    // Out of redirects!
                    OnRedirectCreatedOrDestroyed();
                    return;
                }

                redirectBeingPlaced = Instantiate(redirectPrefab, intersection.transform.position, 
                                                    intersection.transform.rotation);
                redirectBeingPlaced.node = intersection;

                if (isTutorial && !_hasPartialRedirected) {
                    ScoreManager.Instance.TutorialRedirect();
                    _hasPartialRedirected = true;
                } else if (isTutorial) {
                    redirectBeingPlaced.isTutorial = true;
                }
            }

            state = approachingIntersection;
            redirectBeingPlaced.ResetRedirect();
        }

        void StopRedirectingHandler(InputAction.CallbackContext obj) {
            StopRedirecting();
        }


        // Finalize the redirect being placed.
        void StopRedirecting() {
            state = driving;
            redirectBeingPlaced?.FinalizeRedirect();
        }

        /*
            Method to restart the level at any point in time with the press of the "R" keyboard button.

            TODO: Think of which button to map this with the game controller!
        */
        void PauseLevel(InputAction.CallbackContext obj) {
            DisableControls();

            ScoreManager.Instance.Pause();
        }

        void EndGame(int score) {
            DisableControls();
        }

        void IncreaseGameSpeed(InputAction.CallbackContext obj) {
            if (_speedMode == 3) {
                _speedMode = 1;
            } else {
                _speedMode++;
            }

            ScoreManager.Instance.UpdateFastForward(_speedMode);
            Time.timeScale = _speedMode;
        }

        void SetGameSpeed() {
            OnEnable();
            Time.timeScale = _speedMode;
        }

        void ResetGameSpeed(int waveNumber, int maxEnemies) {
            _speedMode = 1;
            Time.timeScale = _speedMode;

            ScoreManager.Instance.UpdateFastForward(_speedMode);
        }

        void DropItem(InputAction.CallbackContext obj) {
            if (inventory) {
                Item item = inventory;
                item.Deploy(_navigateOnNetwork.to);
                inventory = null;
                ScoreManager.Instance.ResetInventory();

                if (isTutorial) {
                    ScoreManager.Instance.TutorialItem();
                }
            }
        }

        void SkipWave(InputAction.CallbackContext obj) {
            ScoreManager.Instance.SkipWave();
        }

        void OnWaveStart() {
            if (inventory != null) {
                inventory = null;
                ScoreManager.Instance.ResetInventory();
            }
        }

        void UpdateDialogue(InputAction.CallbackContext obj) {
            ScoreManager.Instance.UpdateDialogue();
        }


        void OnRedirectCreatedOrDestroyed() {
            StartCoroutine(OnRedirectCreatedOrDestroyedCoroutine());
        }

        IEnumerator OnRedirectCreatedOrDestroyedCoroutine() {
            yield return null; // wait a frame for scene to update.
            var redirectObjects = GameObject.FindObjectsOfType<Redirect>();
            ScoreManager.Instance.SetAvailableRedirects(maxRedirects, maxRedirects - redirectObjects.Length);
        }

        /// Get the next place in the network where there is an intersection
        /// i.e. the next node where we actual have more than 1 choice of where to go.
        Node GetNextIntersection() {
            HashSet<Node> seen = new HashSet<Node>();
            Node last = _navigateOnNetwork.from;
            Node curr = _navigateOnNetwork.to;
            var adjacentComingFromLast = curr.AdjacentComingFrom(last);
            while (curr.AdjacentComingFrom(last).Count == 1 && !seen.Contains(curr)) {
                seen.Add(curr);
                last = curr;
                curr = adjacentComingFromLast.First();
                adjacentComingFromLast = curr.AdjacentComingFrom(last);
            }
            Debug.Assert(!seen.Contains(curr), "Cyclic node network detected. Bad!");
            Debug.Assert(adjacentComingFromLast.Count > 1, "Dead end in network!");
            return curr;
        }

        public void EnableDialogue() {
            /** Disable all the other controls to avoid errors **/
            _playerInputActions.Driving.Movement.performed -= Movement;
            _playerInputActions.Driving.Movement.Disable();

            _playerInputActions.Driving.ActivateRedirection.performed -= StartRedirectingHandler;
            _playerInputActions.Driving.ActivateRedirection.canceled -= StopRedirectingHandler;
            _playerInputActions.Driving.ActivateRedirection.Disable();

            _playerInputActions.Driving.PauseLevel.performed -= PauseLevel;
            _playerInputActions.Driving.PauseLevel.Disable();

            _playerInputActions.Driving.FastForward.performed -= IncreaseGameSpeed;
            _playerInputActions.Driving.FastForward.Disable();

            _playerInputActions.UI.Next.performed += UpdateDialogue;
            _playerInputActions.UI.Next.Enable();

            ScoreManager.playerLifeUpdateEvent -= UpdateLife;
        }

        public void EnableDriving() {
            _navigateOnNetwork.enabled = true;

            _playerInputActions.Driving.Movement.performed += Movement;
            _playerInputActions.Driving.Movement.Enable();
        }

        public void EnableRedirect() {
            _playerInputActions.Driving.ActivateRedirection.performed += StartRedirectingHandler;
            _playerInputActions.Driving.ActivateRedirection.canceled += StopRedirectingHandler;
            _playerInputActions.Driving.ActivateRedirection.Enable();
        }

        public void EnableLives() {
            ScoreManager.playerLifeUpdateEvent += UpdateLife;
        }

        /*
            When the gameObject is enabled or disabled, the methods to control the player object will be 
            subscribed/unsubscribed to prevent any odd behaviour. OnEnable and OnDisable will be useful as 
            well when using delegates for event-based responses in the game.
        */

        public void UpdateLife(int life) {
            if (!isTutorial) {
                lifeCount = life;
            }
            
            // become invincible for a short time
            if (lifeCount > 0) {
                StartCoroutine(Invincible());
            } else {
                ScoreManager.Instance.EndGame();
            }
        }

        IEnumerator Invincible() {
            isSuperPlayer = true;
            // blink the player
            var child = transform.GetChild(0);
            for (int i = 0; i < 10; i++) {
                child.gameObject.SetActive(false);
                yield return new WaitForSeconds(0.2f);
                child.gameObject.SetActive(true);
                yield return new WaitForSeconds(0.2f);
            }
            isSuperPlayer = false;
        }

        void EnableControls() {
            _playerInputActions.Driving.Movement.performed += Movement;
            _playerInputActions.Driving.Movement.Enable();

            _playerInputActions.Driving.ActivateRedirection.performed += StartRedirectingHandler;
            _playerInputActions.Driving.ActivateRedirection.canceled += StopRedirectingHandler;
            _playerInputActions.Driving.ActivateRedirection.Enable();

            _playerInputActions.Driving.PauseLevel.performed += PauseLevel;
            _playerInputActions.Driving.PauseLevel.Enable();

            _playerInputActions.Driving.FastForward.performed += IncreaseGameSpeed;
            _playerInputActions.Driving.FastForward.Enable();

            _playerInputActions.Driving.DropItem.performed += DropItem;
            _playerInputActions.Driving.DropItem.Enable();

            _playerInputActions.Cheats.SkipWave.performed += SkipWave;
            _playerInputActions.Cheats.SkipWave.Enable();
        }

        void DisableControls() {
            _playerInputActions.Driving.Movement.performed -= Movement;
            _playerInputActions.Driving.Movement.Disable();


            _playerInputActions.Driving.ActivateRedirection.performed -= StartRedirectingHandler;
            _playerInputActions.Driving.ActivateRedirection.canceled -= StopRedirectingHandler;
            _playerInputActions.Driving.ActivateRedirection.Disable();

            _playerInputActions.Driving.PauseLevel.performed -= PauseLevel;
            _playerInputActions.Driving.PauseLevel.Disable();

            _playerInputActions.Driving.FastForward.performed -= IncreaseGameSpeed;
            _playerInputActions.Driving.FastForward.Disable();

            _playerInputActions.Driving.DropItem.performed -= DropItem;
            _playerInputActions.Driving.DropItem.Disable();

            _playerInputActions.UI.Next.performed -= UpdateDialogue;
            _playerInputActions.UI.Next.Disable();

            _playerInputActions.Cheats.SkipWave.performed -= SkipWave;
            _playerInputActions.Cheats.SkipWave.Disable();
        }

        void OnEnable() {
            EnableControls();

            Redirect.created += OnRedirectCreatedOrDestroyed;
            Redirect.destroyed += OnRedirectCreatedOrDestroyed;
            WaveManager.waveStart += OnWaveStart;

            ScoreManager.tutorialDriveEvent += EnableDriving;
            ScoreManager.updateWaveEvent += ResetGameSpeed;
            ScoreManager.resumeEvent += SetGameSpeed;
            ScoreManager.tutorialLivesEvent += EnableLives;

            ScoreManager.playerLifeUpdateEvent += UpdateLife;

            ScoreManager.gameOverEvent += EndGame;
        }

        void OnDisable() {
            DisableControls();

            Redirect.created -= OnRedirectCreatedOrDestroyed;
            Redirect.destroyed -= OnRedirectCreatedOrDestroyed;
            WaveManager.waveStart -= OnWaveStart;

            ScoreManager.tutorialDriveEvent -= EnableDriving;
            ScoreManager.updateWaveEvent -= ResetGameSpeed;
            ScoreManager.resumeEvent -= SetGameSpeed;
            ScoreManager.tutorialLivesEvent -= EnableLives;

            ScoreManager.playerLifeUpdateEvent -= UpdateLife;

            ScoreManager.gameOverEvent -= EndGame;
        }
    }
}