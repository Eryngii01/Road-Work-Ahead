using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.EventSystems;

namespace Title {
    public class StartMenu : MonoBehaviour {
        
        public GameObject unlockPrompt, firstSelected, logo;
        private bool _hasUnlocked = false;
        public EventSystem UISystem;
        private PlayerInputActions _playerInputActions;

        // ----------------- Tween -------------------
        public float _duration;
        [Range(0.0f, 1.0f)]
        public float _vShift, _stretch;
        public EaseFunc easeType;

        public Vector3 targetPosition, targetPosition2;
        private Vector3 _startPosition, _startPosition2;

        public float _duration2;
        [Range(0.0f, 1.0f)]
        public float _vShift2, _stretch2;
        public EaseFunc easeType2;

        private CanvasGroup _canvas;

        void Awake() {
            _playerInputActions = new PlayerInputActions();
            _canvas = GetComponent<CanvasGroup>();
            _startPosition = transform.localPosition;
            _startPosition2 = logo.transform.localPosition;
        }

        void TriggerTitle(InputAction.CallbackContext obj) {
            // Hide button prompt
            unlockPrompt.SetActive(false);

            // Trigger animation
            _canvas.alpha = 1;
            transform.DoMove(this, targetPosition, _duration, easeType, _vShift, _stretch);

            StartCoroutine(IntroLogo());

            // Switch controls
            _hasUnlocked = true;

            _playerInputActions.Title.LockScreen.performed += HideTitle;
            _playerInputActions.Title.LockScreen.Enable();

            _playerInputActions.Title.UnlockScreen.performed -= TriggerTitle;
            _playerInputActions.Title.UnlockScreen.Disable();
        }

        void HideTitle(InputAction.CallbackContext obj) {
            // Hide title
            _canvas.alpha = 0;
            logo.transform.localPosition = _startPosition2;
            transform.localPosition = _startPosition;

            // Activate button prompt
            unlockPrompt.SetActive(true);

            UISystem.SetSelectedGameObject(null);

            // Switch controls
            _playerInputActions.Title.UnlockScreen.performed += TriggerTitle;
            _playerInputActions.Title.UnlockScreen.Enable();

            _playerInputActions.Title.LockScreen.performed -= HideTitle;
            _playerInputActions.Title.LockScreen.Disable();
        }

        public void EnableControl() {
            OnEnable();
        }

        public void DisableControl() {
            OnDisable();
        }

        private IEnumerator IntroLogo() {
            yield return new WaitForSeconds(0.7f);
            logo.transform.DoMove(this, targetPosition2, _duration2, easeType2, _vShift2, _stretch2);

            yield return new WaitForSeconds(0.6f);
            UISystem.SetSelectedGameObject(firstSelected);
        }

        public void ResetControl() {
            UISystem.SetSelectedGameObject(firstSelected);
        }

        void OnEnable() {
            if (_hasUnlocked) {
                _playerInputActions.Title.LockScreen.performed += HideTitle;
                _playerInputActions.Title.LockScreen.Enable();
            } else {
                _playerInputActions.Title.UnlockScreen.performed += TriggerTitle;
                _playerInputActions.Title.UnlockScreen.Enable();
            }
        }

        void OnDisable() {
            _playerInputActions.Title.UnlockScreen.performed -= TriggerTitle;
            _playerInputActions.Title.UnlockScreen.Disable();

            _playerInputActions.Title.LockScreen.performed -= HideTitle;
            _playerInputActions.Title.LockScreen.Disable();
        }
    }
}

