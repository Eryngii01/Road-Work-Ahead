using System.Collections.Generic;
using UnityEngine.InputSystem;
using UnityEngine;
using System;

[RequireComponent(typeof(AudioSource))]
public class Redirect : MonoBehaviour {
    public GameObject axel;
    public GameObject redirectIndicatorPrefab;
    public float deadZoneMag = 0.1f;
    public bool isTutorial = false;

    public Node node;
    public Node redirectTo;

    public AudioClip finalizeRedirectSound;

    public Color approachingColor = Color.red;
    public Color redirectingColor = Color.green;


    // A mapping from destination nodes to their respective
    // redirection indicator.
    private Controls.Player player;
    private AudioSource audioSource;
    private Dictionary<Node, GameObject> _destToRedirectIndicator;
    private PlayerInputActions _playerInputActions;

    private enum State {
        // In the highlight state we just show the highlight to indicate
        // where the intersection is but the arrows are hidden and we 
        // do not accept any player input.
        Highlight,
        // In the nascent state we see the highlight but we don't yet 
        // see the arrows. If we release the button in this state,
        // the redirect disappears.
        Nascent,
        // In the forming state we see all the arrows and the highlight. The longest arrow
        // will actually redirect the cars. If we release the button in this state,
        // the redirect will successfully spawn and remain on the map disappear.
        Forming,
        // In this state the redirect does not listen to player input and simply sits on the map.
        Committed,
        // The redirect is going to disappear. This state cannot be exited.
        Dieing,
    }

    private enum Signal {
        Reset,
        StartForming,
        Finalize,
        Movement,
    }

    private State state = State.Nascent;


    /// Events
    public static event Action created;
    public static event Action destroyed;


    void Awake() {
        _playerInputActions = new PlayerInputActions();
        audioSource = GetComponent<AudioSource>();
        _destToRedirectIndicator = new Dictionary<Node, GameObject>();
    }

    void Start() {
        player = GameObject.FindObjectOfType<Controls.Player>();
        ChangeAxelColor(approachingColor);

        // We start in the nascent state
        SubscribeToInputs();
        Debug.Assert(node != null, "Must provide node to redirect!");
        foreach (Node destination in node.Adjacent()) {
            GameObject indicator = Instantiate(redirectIndicatorPrefab, transform);
            indicator.transform.LookAt(destination.transform.position, Vector3.up);
            _destToRedirectIndicator[destination] = indicator;
        }
        HideRedirectionIndicators();
        Redirect.created?.Invoke();
        state = State.Highlight;
    }

    /// Immediately destroy this redirect
    public void Terminate() {
        UnsubscribeFromInputs();
        AIManager.Instance.UnregisterRedirect(this);
        Destroy(gameObject);
        Redirect.destroyed?.Invoke();
    }

    // Inputs
    public void ResetRedirect() {
        Controller(Signal.Reset);
    }

    public void StartForming() {
        Controller(Signal.StartForming);
    }

    public void FinalizeRedirect() {
        Controller(Signal.Finalize);
    }

    void InputDirectionChanged(InputAction.CallbackContext obj) {
        Controller(Signal.Movement);
    }

    // Controller
    void Controller(Signal action) {
        switch (state) {
            case State.Highlight:
                // Debug.Log("Highlight");
                switch (action) {
                    case Signal.StartForming:
                        HighlightStartForming();
                        break;
                    case Signal.Finalize:
                        HighlightFinalize();  // when the axel disappear at the interaction
                        break;
                }
                break;

            case State.Nascent:
                // Debug.Log("Nascent");
                switch (action) {
                    case Signal.Finalize:
                        NascentFinalize();
                        break;
                    case Signal.Movement:
                        NascentMovement();
                        break;
                }
                break;
            case State.Forming:
                // Debug.Log("Forming");
                switch (action) {
                    case Signal.Movement:
                        FormingMovement();
                        break;
                    case Signal.Finalize:
                        FormingFinalize();
                        break;
                }
                break;
            case State.Committed:
                // Debug.Log("Committed");
                switch (action) {
                    case Signal.Reset:
                        CommittedReset();
                        break;
                }
                break;
            case State.Dieing:
                // Debug.Log("Dieing");
                break;
        }
    }

    // State action pairs
    void HighlightStartForming() {
        state = State.Nascent;
        // We need to add this to catch the case where you are just holding down
        // the key/joystick and so we don't get another update.
        Controller(Signal.Movement);
    }

    void HighlightFinalize() {
        state = State.Dieing;
        Terminate();
    }

    void NascentFinalize() {
        ChangeAxelColor(redirectingColor);
        state = State.Dieing;
        Terminate();
    }

    void NascentMovement() {
        ChangeAxelColor(redirectingColor);
        if (isTutorial) {
            ScoreManager.Instance.TutorialApproach();
        }

        Vector2 inputDir = GetInputDirection();
        // Debug.Log("Nascent Movement " + inputDir.magnitude.ToString());
        if (inputDir.magnitude > deadZoneMag) {
            state = State.Forming;
            ShowRedirectionIndicators();
            AIManager.Instance.RegisterRedirect(this);
            ScaleRedirectionIndicatorsAndSetRedirectTo(inputDir);
        }
    }

    public void FormingFinalize() {
        state = State.Committed;
        Debug.Assert(_destToRedirectIndicator.ContainsKey(redirectTo), gameObject);

        if (isTutorial) {
            ScoreManager.Instance.TutorialRedirect();
        }

        GameObject correctIndicator = _destToRedirectIndicator[redirectTo];
        UnsubscribeFromInputs();
        HideRedirectionIndicators();
        HideAxel();
        audioSource.PlayOneShot(finalizeRedirectSound);
        correctIndicator.SetActive(true);
        correctIndicator.transform.localScale = Vector3.one;
    }

    void FormingMovement() {
        Vector2 inputDir = GetInputDirection();
        if (inputDir.magnitude < deadZoneMag) {
            state = State.Nascent;
            HideRedirectionIndicators();
            ShowAxel();
            AIManager.Instance.UnregisterRedirect(this);
            return;
        } else {
            ScaleRedirectionIndicatorsAndSetRedirectTo(inputDir);
        }
    }

    public void CommittedReset() {
        HideRedirectionIndicators();
        SubscribeToInputs();
        AIManager.Instance.UnregisterRedirect(this);
        ShowAxel();
        state = State.Highlight;
    }

    // Helpers
    void SubscribeToInputs() {
        _playerInputActions.Driving.RedirectDirection.performed += InputDirectionChanged;
        _playerInputActions.Driving.RedirectDirection.Enable();
    }

    void UnsubscribeFromInputs() {
        _playerInputActions.Driving.RedirectDirection.performed -= InputDirectionChanged;
        _playerInputActions.Driving.RedirectDirection.Disable();
    }

    Vector2 GetInputDirection() {
        return _playerInputActions.Driving.RedirectDirection.ReadValue<Vector2>();
    }

    void HideRedirectionIndicators() {
        foreach (Node destination in _destToRedirectIndicator.Keys) {
            _destToRedirectIndicator[destination].SetActive(false);
        }
    }

    void ShowRedirectionIndicators() {
        foreach (Node destination in _destToRedirectIndicator.Keys) {
            _destToRedirectIndicator[destination].SetActive(true);
        }
    }

    void ScaleRedirectionIndicatorsAndSetRedirectTo(Vector2 inputDir) {
        float smallestAngle = 180f;
        Node destWithSmallestAngle = null;
        Vector3 dirOnXZPlain = OnXZPlain(inputDir);
        foreach (Node destination in _destToRedirectIndicator.Keys) {
            GameObject ind = _destToRedirectIndicator[destination];
            float angle = Vector3.Angle(ind.transform.forward, dirOnXZPlain);
            if (destWithSmallestAngle == null || angle < smallestAngle) {
                smallestAngle = angle;
                destWithSmallestAngle = destination;
            }

            ind.transform.localScale = Vector3.one * (
                Vector3.Dot(dirOnXZPlain, ind.transform.forward)
            );
        }

        // axel.transform.localScale = Vector3.one * (1 - inputDir.magnitude);
        redirectTo = destWithSmallestAngle;
    }

    void HideAxel() {
        axel.SetActive(false);
    }

    void ChangeAxelColor(Color color) {
        ParticleSystem ps = axel.GetComponent<ParticleSystem>();
        ParticleSystem.MainModule psmain = ps.main;
        // color it green
        psmain.startColor = color;
    }

    void ShowAxel() {
        axel.SetActive(true);
        axel.transform.localScale = Vector3.one;
    }

    Vector3 OnXZPlain(Vector2 direction) {
        return new Vector3(direction.x, 0, direction.y);
    }

    // Cleanup
    void OnDisable() {
        UnsubscribeFromInputs();
    }
}
