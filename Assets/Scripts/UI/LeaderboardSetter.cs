using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using TMPro;

namespace UI {
    public class LeaderboardSetter : MonoBehaviour {

        private enum Letter {
            A, B, C, D, E, F, G, H, I, 
            J, K, L, M, N, O, P, Q, R,
            S, T, U, V, W, X, Y, Z, _,
            Zero, One, Two, Three, Four, Five, Six, Seven, Eight, Nine, 
            Heart, Space
        }

        private enum State {
            firstInitial,
            secondInitial,
            thirdInitial,
            showLeaderboard
        }

        public GameObject setScoreMenu, showScoreMenu;
        private PlayerInputActions _playerInputActions;

        public TMP_Text letterOne, letterTwo, letterThree;
        private Letter _letterOne, _letterTwo, _letterThree;

        private State state = State.firstInitial;
        private Letter letter = Letter.A;
        private int _placement = 0, _letterIndex;
        public float selectionDuration = 1f;
        private float _selectionCooldown = 0f;
        private bool _canScroll;

        void Awake() {
            _playerInputActions = new PlayerInputActions();
        }

        void Update() {
            if (_selectionCooldown <= 0f) {
                _canScroll = true;
            } else {
                _selectionCooldown -= Time.deltaTime;
            }
        }

        public void SetPlacement(int score, int placement) {
            _placement = placement;
        }

        void ScrollLetter(InputAction.CallbackContext obj) {
            if (!_canScroll) {
                return;
            }

            Vector2 input = _playerInputActions.Leaderboard.Scroll.ReadValue<Vector2>();

            if (input.y > 0) {
                _letterIndex--;
                if (_letterIndex < 0) {
                    letter = Letter.Space;
                    _letterIndex = 38;
                } else {
                    letter--;
                }
            } else if (input.y < 0) {
                _letterIndex++;
                if (_letterIndex > 38) {
                    letter = Letter.A;
                    _letterIndex = 0;
                } else {
                    letter++;
                }
            } else {
                return;
            }

            TMP_Text selectedLetter = null;

            switch (state) {
                case State.firstInitial:
                    selectedLetter = letterOne;
                    break;
                case State.secondInitial:
                    selectedLetter = letterTwo;
                    break;
                case State.thirdInitial:
                    selectedLetter = letterThree;
                    break;
            }

            switch (letter) {
                case Letter.A:
                    selectedLetter.text = "A";
                    break;
                case Letter.B:
                    selectedLetter.text = "B";
                    break;
                case Letter.C:
                    selectedLetter.text = "C";
                    break;
                case Letter.D:
                    selectedLetter.text = "D";
                    break;
                case Letter.E:
                    selectedLetter.text = "E";
                    break;
                case Letter.F:
                    selectedLetter.text = "F";
                    break;
                case Letter.G:
                    selectedLetter.text = "G";
                    break;
                case Letter.H:
                    selectedLetter.text = "H";
                    break;
                case Letter.I:
                    selectedLetter.text = "I";
                    break;
                case Letter.J:
                    selectedLetter.text = "J";
                    break;
                case Letter.K:
                    selectedLetter.text = "K";
                    break;
                case Letter.L:
                    selectedLetter.text = "L";
                    break;
                case Letter.M:
                    selectedLetter.text = "M";
                    break;
                case Letter.N:
                    selectedLetter.text = "N";
                    break;
                case Letter.O:
                    selectedLetter.text = "O";
                    break;
                case Letter.P:
                    selectedLetter.text = "P";
                    break;
                case Letter.Q:
                    selectedLetter.text = "Q";
                    break;
                case Letter.R:
                    selectedLetter.text = "R";
                    break;
                case Letter.S:
                    selectedLetter.text = "S";
                    break;
                case Letter.T:
                    selectedLetter.text = "T";
                    break;
                case Letter.U:
                    selectedLetter.text = "U";
                    break;
                case Letter.V:
                    selectedLetter.text = "V";
                    break;
                case Letter.W:
                    selectedLetter.text = "W";
                    break;
                case Letter.X:
                    selectedLetter.text = "X";
                    break;
                case Letter.Y:
                    selectedLetter.text = "Y";
                    break;
                case Letter.Z:
                    selectedLetter.text = "Z";
                    break;
                case Letter._:
                    selectedLetter.text = "_";
                    break;
                case Letter.Zero:
                    selectedLetter.text = "0";
                    break;
                case Letter.One:
                    selectedLetter.text = "1";
                    break;
                case Letter.Two:
                    selectedLetter.text = "2";
                    break;
                case Letter.Three:
                    selectedLetter.text = "3";
                    break;
                case Letter.Four:
                    selectedLetter.text = "4";
                    break;
                case Letter.Five:
                    selectedLetter.text = "5";
                    break;
                case Letter.Six:
                    selectedLetter.text = "6";
                    break;
                case Letter.Seven:
                    selectedLetter.text = "7";
                    break;
                case Letter.Eight:
                    selectedLetter.text = "8";
                    break;
                case Letter.Nine:
                    selectedLetter.text = "9";
                    break;
                case Letter.Heart:
                    selectedLetter.text = "♥";
                    break;
                case Letter.Space:
                    selectedLetter.text = " ";
                    break;
            }

            _selectionCooldown = selectionDuration;
            _canScroll = false;
        }

        void SelectLetter(InputAction.CallbackContext obj) {
            switch (state) {
                case State.firstInitial:
                    _letterOne = letter;
                    state = State.secondInitial;
                    return;
                case State.secondInitial:
                    _letterTwo = letter;
                    state = State.thirdInitial;
                    return;
                case State.thirdInitial:
                    _letterThree = letter;
                    state = State.showLeaderboard;

                    PlayerPrefs.SetString("name" + _placement, letterOne.text + letterTwo.text + letterThree.text);

                    _playerInputActions.Leaderboard.Scroll.Disable();
                    _playerInputActions.Leaderboard.Select.Disable();

                    // Show the leaderboard menu
                    showScoreMenu.GetComponent<ScoreBoard>().SetPlacement(_placement);
                    showScoreMenu.SetActive(true);

                    setScoreMenu.SetActive(false);
                    return;
            }
        }

        void Back(InputAction.CallbackContext obj) {
            switch (state) {
                case State.secondInitial:
                    state = State.firstInitial;
                    letter = _letterOne;

                    letterTwo.text = "";
                    return;
                case State.thirdInitial:
                    state = State.secondInitial;
                    letter = _letterTwo;

                    letterThree.text = "";
                    return;
                case State.showLeaderboard:
                    ScoreManager.Instance.TriggerGameOverMenu();
                    gameObject.SetActive(false);
                    return;
            }
        }

        void OnEnable() {
            _playerInputActions.Leaderboard.Scroll.performed += ScrollLetter;
            _playerInputActions.Leaderboard.Scroll.Enable();

            _playerInputActions.Leaderboard.Select.performed += SelectLetter;
            _playerInputActions.Leaderboard.Select.Enable();

            _playerInputActions.Leaderboard.Back.performed += Back;
            _playerInputActions.Leaderboard.Back.Enable();
        }

        void OnDisable() {
            _playerInputActions.Leaderboard.Scroll.performed -= ScrollLetter;
            _playerInputActions.Leaderboard.Scroll.Disable();

            _playerInputActions.Leaderboard.Select.performed -= SelectLetter;
            _playerInputActions.Leaderboard.Select.Disable();

            _playerInputActions.Leaderboard.Back.performed -= Back;
            _playerInputActions.Leaderboard.Back.Disable();
        }
    }
}