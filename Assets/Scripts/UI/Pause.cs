using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace UI {
    public class Pause : MonoBehaviour {
        public GameObject menu;

        void InvokePauseGame() {
            menu.SetActive(true);
            Time.timeScale = 0;
        }

        void OnEnable() {
            ScoreManager.pauseEvent += InvokePauseGame;
        }

        void OnDisable() {
            ScoreManager.pauseEvent -= InvokePauseGame;
        }
    }
}
