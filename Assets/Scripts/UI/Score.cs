using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

namespace UI
{
    public class Score : MonoBehaviour
    {
        public float _duration;
        [Range(0.0f, 1.0f)]
        public float _vShift, _stretch;
        public EaseFunc easeType;

        public Vector3 targetScale;
        private Vector3 _startScale;
        public TMP_Text scoreText;
        public TMP_Text waveText;

        private int _waveNumber, _maxEnemies;

        void Awake()
        {
            _startScale = transform.localScale;
        }

        void EnemyDeath(int score, int enemiesLeft) {
            UpdateScore(score);
            UpdateEnemiesLeft(enemiesLeft);
        }

        void LoseEnemy(float percentage, int enemiesLeft) {
            UpdateEnemiesLeft(enemiesLeft);
        }

        void UpdateScore(int score) {
            scoreText.text = "$" + score;

            transform.localScale = targetScale;
            transform.DoScale(this, _startScale, _duration, easeType, _vShift, _stretch);
        }

        void UpdateEnemiesLeft(int enemiesLeft) {
            int carsLeft = _maxEnemies - enemiesLeft;
            waveText.text = (carsLeft < 0? 0 : carsLeft) + "";
            waveText.transform.localScale = targetScale;
            waveText.transform.DoScale(this, _startScale, _duration, easeType, _vShift, _stretch);
        }

        void UpdateWave(int waveNumber, int maxEnemies)
        {
            _maxEnemies = maxEnemies;
            waveText.text = _maxEnemies + "";

            _waveNumber = waveNumber;
        }


        void OnEnable()
        {
            ScoreManager.updateScoreEvent += EnemyDeath;
            ScoreManager.bonusScoreEvent += UpdateScore;
            ScoreManager.updateWaveEvent += UpdateWave;
            ScoreManager.betaTestEvent += LoseEnemy;
        }

        void OnDisable()
        {
            ScoreManager.updateScoreEvent -= EnemyDeath;
            ScoreManager.bonusScoreEvent -= UpdateScore;
            ScoreManager.updateWaveEvent -= UpdateWave;
            ScoreManager.betaTestEvent -= LoseEnemy;
        }
    }
}
