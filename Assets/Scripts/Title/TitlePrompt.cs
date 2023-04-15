using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Title {
    public class TitlePrompt : MonoBehaviour {
        public float _duration;
        [Range(0.0f, 1.0f)]
        public float _vShift, _stretch;
        public EaseFunc easeType;

        private CanvasGroup _canvas;

        void Awake() {
            _canvas = GetComponent<CanvasGroup>();
            _canvas.DoFadeInOut(this, _duration, easeType, _vShift, _stretch, -1, 1f);
        }

        void OnEnable() {
            _canvas.DoFadeInOut(this, _duration, easeType, _vShift, _stretch, -1, 1f);
        }
    }
}

