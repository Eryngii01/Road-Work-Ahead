using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEditor;

namespace UI {
    public class BetaTest : MonoBehaviour {
        [Header("Max number of enemies allowed to reach the goal")]
        public bool isTutorial;
        public float speed;

        private float _percentage;
        private bool _isGameOver = false;
        private Image _matRenderer;

        void Awake() {
            _matRenderer = GetComponent<Image>();
            ResetBetaTest();
        }

        void Update() {
            float betaStatus = _matRenderer.material.GetFloat("_BetaStatus");
            if (betaStatus < _percentage) {
                _matRenderer.material.SetFloat("_BetaStatus", betaStatus + (Time.deltaTime * speed));
            } else if (betaStatus >= _percentage && _isGameOver) {
                _isGameOver = false;
                // Allow the UI animation to finish before ending the game
                ScoreManager.Instance.EndGame();
            }
        }

        void UpdateBetaTest(float percentage, int enemiesLeft) {
            if (percentage == 1 && !isTutorial) {
                _isGameOver = true;
            }

            _percentage = percentage;
        }

        void ResetBetaTest() {
            _percentage = 0;
            _matRenderer.material.SetFloat("_BetaStatus", 0);
        }

        void OnEnable() {
            ScoreManager.betaTestEvent += UpdateBetaTest;
            ScoreManager.resetBetaTestEvent += ResetBetaTest;
        }

        void OnDisable() {
            ScoreManager.betaTestEvent -= UpdateBetaTest;
            ScoreManager.resetBetaTestEvent -= ResetBetaTest;
        }
    }
}