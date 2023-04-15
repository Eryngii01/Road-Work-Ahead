using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

namespace UI {
    /*
        The SlideFadeIn class receives input on the individual durations of a slide and fade effect, along
        with the target position to slide the GameObject along the x-axis to make an object slide and fade in
        simultaneously in response to the updateWaveEvent. The class also contains an effect to fade out the
        object and reset the position upon the beginWaveEvent delegate for future repetition.
    */
    public class SlideFadeIn : MonoBehaviour {
        public float slideDuration, fadeDuration, targetXPosition, transparency;
        private CanvasGroup _renderCanvas;
        private Vector3 _startPosition;
        private float _sLerpTime = 0, _fLerpTime = 0, _startAlpha, _startXPosition;

        void Awake() {
            _startPosition = transform.position;
            _startXPosition = transform.position.x;
            _renderCanvas = GetComponent<CanvasGroup>();
            _startAlpha = _renderCanvas.alpha;
        }

        void TriggerAnimation(int waveNumber, int maxEnemies) {
            StartCoroutine(LerpPosition());
            StartCoroutine(LerpFadeIn());
        }

        void DisableAnim() {
            StartCoroutine(LerpFadeOut());
        }

        IEnumerator LerpPosition() {
            _sLerpTime = 0;

            Vector3 startPosition = new Vector3(_startXPosition, transform.position.y, transform.position.z);
            Vector3 targetPosition = new Vector3(targetXPosition, transform.position.y, transform.position.z);
            
            while (_sLerpTime < slideDuration) {
                transform.position = Vector3.Lerp(startPosition, targetPosition, 
                                                  EasingFunctions.EaseOutCubic(_sLerpTime, 0.5f, 0.5f, slideDuration));

                _sLerpTime += Time.deltaTime;
                yield return null;
            }
        }

        IEnumerator LerpFadeIn() {
            _fLerpTime = 0;
            while (_fLerpTime < fadeDuration) {
                _renderCanvas.alpha = Mathf.Lerp(_startAlpha, transparency, EasingFunctions.EaseOutCubic(_fLerpTime, 0.5f, 0.5f, fadeDuration));

                _fLerpTime += Time.deltaTime;
                yield return null;
            }

            _renderCanvas.alpha = transparency;
        }

        IEnumerator LerpFadeOut() {
            _fLerpTime = 0;
            while (_fLerpTime < fadeDuration) {
                _renderCanvas.alpha = Mathf.Lerp(transparency, 0, EasingFunctions.EaseOutCubic(_fLerpTime, 0.5f, 0.5f, 1));

                _fLerpTime += Time.deltaTime;
                yield return null;
            }

            // Reset the UI to its previous state before fading in
            _renderCanvas.alpha = 0;
            transform.position = _startPosition;
        }

        void OnEnable() {
            ScoreManager.updateWaveEvent += TriggerAnimation;
            ScoreManager.beginUIWaveEvent += DisableAnim;
        }

        void OnDisable() {
            ScoreManager.updateWaveEvent -= TriggerAnimation;
            ScoreManager.beginUIWaveEvent -= DisableAnim;
        }
    }
}

