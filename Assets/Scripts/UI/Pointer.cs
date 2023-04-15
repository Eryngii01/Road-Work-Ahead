using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace UI {
    public class Pointer : MonoBehaviour {
        public float _duration;
        [Range(0.0f, 1.0f)]
        public float _vShift, _stretch;
        public EaseFunc easeType;

        public float targetHeight;
        private RectTransform rectTransform;

        void Awake() {
            rectTransform = GetComponent<RectTransform>();
        }

        void Start() {
            Vector3 targetPos = new Vector3(rectTransform.localPosition.x, rectTransform.localPosition.y + targetHeight, rectTransform.localPosition.z);
            rectTransform.DoMove(this, targetPos, _duration, easeType, _vShift, _stretch, -1);
        }
    }
}

