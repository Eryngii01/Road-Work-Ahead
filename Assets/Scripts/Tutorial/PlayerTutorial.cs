using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Tutorial {
    public class PlayerTutorial : MonoBehaviour {
        private static PlayerTutorial _instance;
        public static PlayerTutorial Instance {
            get {
                if (_instance == null) {
                    Debug.Log("PlayerTutorial is null");
                }

                return _instance;
            }
        }

        public float waitTime;
        public GameObject tutorialWindow, tutorialWindowPart2, controlPrompt;
        private Controls.Player _player;

        private bool _hasDefeatedEnemy = false;

        void Awake() {
            _instance = this;
        }
        
        void Start() {
            _player = GetComponent<Controls.Player>();
            StartCoroutine(StartTutorial());
        }

        public void SwitchController() {
            _player.EnableRedirect();
        }

        void EnemyDeath(int score, int enemiesDestroyed) {
            if (!_hasDefeatedEnemy) {
                _hasDefeatedEnemy = true;
                
                // Trigger part 2 of tutorial
                tutorialWindowPart2.SetActive(true);
                controlPrompt.SetActive(false);
                ScoreManager.Instance.BeginTutorial();
            }
        }

        IEnumerator StartTutorial() {
            _player.EnableDialogue();
            yield return new WaitForSeconds(waitTime);

            tutorialWindow.SetActive(true);
            ScoreManager.Instance.BeginTutorial();
        }

        void OnEnable() {
            ScoreManager.updateScoreEvent += EnemyDeath;
        }

        void OnDisable() {
            ScoreManager.updateScoreEvent -= EnemyDeath;
        }
    }
}

