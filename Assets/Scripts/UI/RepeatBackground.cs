using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace UI {
    /*
        The RepeatBackground class recieves input for the scrolling speed and a box collider width that
        specifies when to reset the transform position to the original starting point. Paired with indefinite
        horizontal scrolling, this class will create an effect of indefinite horizontal scrolling.
    */
    [RequireComponent(typeof(BoxCollider2D))]
    public class RepeatBackground : MonoBehaviour {
        public float speed = 100;

        private Vector3 _startPos;
        private float _repeatWidth;

        void Awake() {
            _startPos = transform.localPosition;
            _repeatWidth = GetComponent<BoxCollider2D>().size.x;
        }

        void Update() {
            transform.Translate(Vector3.right * Time.deltaTime * speed);

            if (transform.position.x > _startPos.x + _repeatWidth) {
                ResetBackground();
            }
        }

        private void ResetBackground() {
            transform.localPosition = _startPos;
        }
    }
}

