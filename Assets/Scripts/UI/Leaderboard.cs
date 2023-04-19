using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

namespace UI {
    public class Leaderboard : MonoBehaviour {
        public GameObject menu;
        
        void InvokeLeaderboardEntry(int score, int placement) {
            menu.SetActive(true);
            menu.gameObject.GetComponent<LeaderboardSetter>().SetPlacement(score, placement);
        }

        void OnEnable() {
            ScoreManager.highScoreEvent += InvokeLeaderboardEntry;
        }

        void OnDisable() {
            ScoreManager.highScoreEvent -= InvokeLeaderboardEntry;
        }
    }
}