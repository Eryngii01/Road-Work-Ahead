using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

namespace Tutorial {
    public class ControlPrompt : MonoBehaviour {
        public float _duration;
        [Range(0.0f, 1.0f)]
        public float _vShift, _stretch;
        public EaseFunc easeType;

        private CanvasGroup _canvas;

        void Awake() {
            _canvas = GetComponent<CanvasGroup>();
        }

        void OnEnable() {
            Debug.Log("Fading");
            _canvas.DoFade(this, 1, _duration, easeType, _vShift, _stretch);
        }
    }
}

