using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace UI {
    /*
        The WaveFX class recieves input on the duration of the animation and jumpHeight, along with a gameObject
        for the next object to animate in order to create a vertical bobbing effect with delay to create a wave animation
        of text.
    */
    public class WaveFX : MonoBehaviour {
        public GameObject nextToAnim = null;
        public float animDuration, jumpHeight;
        private float _lerpTime = 0, _startYPosition, _targetYPosition;
        private bool _isApex = false, _isAnim = true;

        void Awake() {
            _startYPosition = transform.position.y;
            _targetYPosition = _startYPosition + jumpHeight;
        }

        public void TriggerJump() {
            _isAnim = true;
            StartCoroutine(LerpPosition());
        }

        void DisableAnim() {
            _isAnim = false;
        }

        IEnumerator LerpPosition() {
            _lerpTime = 0;
            _isApex = false;

            while (_lerpTime < animDuration * 3) {
                Vector3 startPosition = new Vector3(transform.position.x, _startYPosition, transform.position.z);
                Vector3 targetPosition = new Vector3(transform.position.x, _targetYPosition, transform.position.z);
                
                transform.position = Vector3.Lerp(startPosition, targetPosition, 
                                                  EasingFunctions.EaseOutQuad(_lerpTime, 0.5f, 0.5f, animDuration));

                if (_lerpTime > animDuration && !_isApex && _isAnim) {
                    nextToAnim.GetComponent<WaveFX>().TriggerJump();
                    _isApex = true;
                }

                _lerpTime += Time.deltaTime;
                yield return null;
            }
        }

        void OnEnable() {
            ScoreManager.beginWaveEvent += DisableAnim;
        }

        void OnDisable() {
            ScoreManager.beginWaveEvent -= DisableAnim;
        }
    }
}

