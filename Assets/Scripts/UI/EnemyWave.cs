using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

namespace UI {
    public class EnemyWave : MonoBehaviour {
        void UpdateWave(int waveNumber, int enemiesDestroyed) {
            GetComponent<TMP_Text>().text = "" + waveNumber;
            GetComponent<WaveFX>().TriggerJump();
        }

        void OnEnable() {
            ScoreManager.updateWaveEvent += UpdateWave;
        }

        void OnDisable() {
            ScoreManager.updateWaveEvent -= UpdateWave;
        }
    }
}

