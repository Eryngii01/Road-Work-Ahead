using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

namespace UI {
    public class ComboSystem : MonoBehaviour {
        public float _duration;
        [Range(0.0f, 1.0f)]
        public float _vShift, _stretch;
        public EaseFunc easeType;

        public Vector3 targetScale;
        private Vector3 _startScale;
        private float _comboDuration = 0f, _comboDepletionSpeed;
        private bool _isTicking;
        public TMP_Text comboText;
        public Slider comboSlider;

        void Awake() {
            _startScale = comboText.gameObject.transform.localScale;
        }

        // Update is called once per frame
        void Update() {
            if (_isTicking && _comboDuration > 0f) {
                _comboDuration -= _comboDepletionSpeed * Time.deltaTime;
                comboSlider.value = _comboDuration;
            } else if (_isTicking) {
                comboSlider.gameObject.SetActive(false);
                comboText.gameObject.SetActive(false);

                _isTicking = false;

                // Notify ScoreManager that the combo has ended
                ScoreManager.Instance.ResetCombo();
            }
        }

        void UpdateCombo(int combo, int enemiesLeft, int comboMultiplier, float comboDepletion) {
            _comboDepletionSpeed = comboDepletion;
            _comboDuration = 1.0f;

            comboText.gameObject.SetActive(true);
            comboText.text = "x" + comboMultiplier;

            comboText.gameObject.transform.localScale = targetScale;
            comboText.gameObject.transform.DoScale(this, _startScale, _duration, easeType, _vShift, _stretch);

            comboSlider.gameObject.SetActive(true);

            _isTicking = true;
        }

        void OnEnable() {
            ScoreManager.updateScoreEvent += UpdateCombo;
        }

        void OnDisable() {
            ScoreManager.updateScoreEvent -= UpdateCombo;
        }
    }
}