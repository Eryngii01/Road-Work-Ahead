using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

namespace UI {
    public class GameOver : MonoBehaviour {
        public GameObject menu;
        [Header ("Text element to display final score")]
        public TMP_Text finalScore;
        

        void InvokeEndGame(int score) {
            menu.SetActive(true);
            Time.timeScale = 0;
            finalScore.text = "$" + score;
        }

        void OnEnable() {
            ScoreManager.gameOverMenuEvent += InvokeEndGame;
        }

        void OnDisable() {
            ScoreManager.gameOverMenuEvent -= InvokeEndGame;
        }
    }
}