
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace UI {
    /*
        With input for the duration and jump height, the JumpingFX class interpolates the gameObject to the
        specified height with a quadratic ease out function for a vertical bobbing effect.
    */
    public class JumpingFX : MonoBehaviour {
        public float animDuration, jumpHeight;
        private float _lerpTime = 0, _startYPosition, _targetYPosition;

        void Awake() {
            _startYPosition = transform.position.y;
            _targetYPosition = _startYPosition + jumpHeight;
        }

        void Update() {
            Vector3 startPosition = new Vector3(transform.position.x, _startYPosition, transform.position.z);
            Vector3 targetPosition = new Vector3(transform.position.x, _targetYPosition, transform.position.z);
            transform.position = Vector3.Lerp(startPosition, targetPosition, 
                                              EasingFunctions.EaseOutQuad(_lerpTime, 0.5f, 0.5f, animDuration));
            _lerpTime += Time.deltaTime;

            if (Vector3.Distance(transform.position, startPosition) < 0.001f) {
                _lerpTime = 0;
            }
        }
    }
}
    
