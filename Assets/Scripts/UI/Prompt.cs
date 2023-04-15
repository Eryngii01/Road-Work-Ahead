using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace UI {
    public class Prompt : MonoBehaviour {
        public float _duration;
        [Range(0.0f, 1.0f)]
        public float _vShift, _stretch;
        public EaseFunc easeType;

        public Vector3 startSize, targetSize;

        void Start() {
            transform.localScale = startSize;
            transform.DoScale(this, targetSize, _duration, easeType, _vShift, _stretch);
        }
    }
}