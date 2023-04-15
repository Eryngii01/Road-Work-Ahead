using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

namespace UI {
    public class FastForward : MonoBehaviour {
        public Sprite[] sprites;
        private Image _image;

        void Awake() {
            _image = GetComponent<Image>();
        }

        void UpdateImage(int gameSpeed) {
            _image.sprite = sprites[gameSpeed - 1];
        }

        void ResetSpeed(int waveNumber, int maxEnemies) {
            _image.sprite = sprites[0];
        }

        void OnEnable() {
            ScoreManager.fastForwardEvent += UpdateImage;
            ScoreManager.updateWaveEvent += ResetSpeed;
        }

        void OnDisable() {
            ScoreManager.fastForwardEvent -= UpdateImage;
            ScoreManager.updateWaveEvent -= ResetSpeed;
        }
    }
}