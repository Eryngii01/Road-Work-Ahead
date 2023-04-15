using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Tutorial {
    public class SpawnTutorial : MonoBehaviour {
        private EnemySpawner _spawner;
        
        void Start() {
            _spawner = GetComponent<EnemySpawner>();
        }

        void BeginTutSpawn() {
            _spawner.enabled = true;
        }

        void OnEnable() {
            ScoreManager.tutorialSpawnEvent += BeginTutSpawn;
        }

        void OnDisable() {
            ScoreManager.tutorialSpawnEvent -= BeginTutSpawn;
        }
    }
}