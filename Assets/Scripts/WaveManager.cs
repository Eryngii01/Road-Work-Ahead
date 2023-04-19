using System.Collections;
using System.Collections.Generic;
using System;
using UnityEngine;

public class WaveManager : MonoBehaviour
{
    // -------------- Wave Information ---------------
    [System.Serializable]
    public class Wave {
        public int maxEnemies;
        public EnemySpawner[] activeSpawners;
    }

    [Header("Insert wave information below")]
    public Wave[] waveInfo;

    // -------------- Bookkeeping ---------------
    private int _waveNumber = 0, _enemiesDefeated = 0;
    public int enemyIncrease = 5;
    public float spawnIntervalDecrease = 0.5f;
    public float minSpawnInterval = 0.5f;
    public int preparationTime = 3, enemySpawnDelay;
    public int speedIncrease = 1;
    public int maxSpeed = 16;

    public static event Action waveStart;

    private GameObject[] allSpawners;
    public int itemsToSpawnThisWave = 0;

    public Camera mainCamera;
    public Camera secCamera;

    private void Start()
    {
        _waveNumber = 0;
        allSpawners = GameObject.FindGameObjectsWithTag("EnemySpawner");
        UpdateSpawners();
        mainCamera.enabled = true;
        secCamera.enabled = false;
    }

    void Update()
    {
        if (_enemiesDefeated >= waveInfo[_waveNumber].maxEnemies) {
            NextWave();
        }
    }

    IEnumerator NewWave()
    {
        Debug.Log("New Wave");
        _enemiesDefeated = 0;

        // Clear all enemies and redirects and items
        Node[] allNodes = transform.parent.GetComponentsInChildren<Node>();
        GameObject[] allRedirects = GameObject.FindGameObjectsWithTag("Redirect");
        foreach (GameObject redirectObj in allRedirects)
        {
            redirectObj.GetComponent<Redirect>()?.Terminate();
        }

        GameObject[] allItems = GameObject.FindGameObjectsWithTag("Item");
        foreach (GameObject item in allItems)
        {
            Destroy(item);
        }
        // Empty player inventory

        waveStart?.Invoke();

        UpdateSpawners();
        // Activate spawners that are active in the current wave
        itemsToSpawnThisWave = 0;

        var timeDelayForDeathAnimation = 0.25f;
        yield return new WaitForSeconds(preparationTime - timeDelayForDeathAnimation);

        // Calculate the enemies per spawner
        int enemiesPerSpawner = waveInfo[_waveNumber].maxEnemies / waveInfo[_waveNumber].activeSpawners.Length;
        int currentEnemies = 0;

        bool anySpawnerActive = false;
        for (int i = 0; i < waveInfo[_waveNumber].activeSpawners.Length; i++) {
            EnemySpawner spawner = waveInfo[_waveNumber].activeSpawners[i];

            spawner.enabled = true;
            spawner.gameObject.SetActive(true);

            itemsToSpawnThisWave++;
            anySpawnerActive = true;

            if (i + 1 < waveInfo[_waveNumber].activeSpawners.Length) {
                spawner.maxEnemies = enemiesPerSpawner;
                currentEnemies += enemiesPerSpawner;
            } else {
                spawner.maxEnemies = waveInfo[_waveNumber].maxEnemies - currentEnemies;
                Debug.Assert((currentEnemies + spawner.maxEnemies) == waveInfo[_waveNumber].maxEnemies, 
                                "Spawners aren't spawning the right number of enemies!");
            }
        }

        // If no spawner is active, activate all spawners
        if (!anySpawnerActive)
        {
            foreach (GameObject spawner in allSpawners)
            {
                spawner.SetActive(true);
                itemsToSpawnThisWave++;
            }
        }
        ScoreManager.Instance.NextWave(_waveNumber, waveInfo[_waveNumber].maxEnemies);
        ScoreManager.Instance.SetSpeedMultiplier(0f);

        var itemSpawner = GameObject.FindGameObjectsWithTag("ItemSpawner");
        foreach (GameObject spawner in itemSpawner)
        {
            spawner.GetComponent<ItemSpawner>().itemsToSpawn = 1;
        }

        yield return new WaitForSeconds(preparationTime - timeDelayForDeathAnimation);
        
        ScoreManager.Instance.EndUIWave();
        // Buffer time to allow the UI to disappear completely and for path to completely trace
        yield return new WaitForSeconds(0.3f);
        ScoreManager.Instance.ResetSpeedMultiplier();

        yield return new WaitForSeconds(enemySpawnDelay);
        ScoreManager.Instance.BeginWave();
    }

    void UpdateSpawners()
    {
        // Update all spawners regardless of whether they are active or not
        foreach (GameObject spawner in allSpawners)
        {
            spawner.SetActive(true);
            var spawnerScript = spawner.GetComponent<EnemySpawner>();
            spawnerScript.maxEnemies += enemyIncrease;
            spawnerScript.spawnInterval = Mathf.Max(spawnerScript.spawnInterval - spawnIntervalDecrease, minSpawnInterval);
            spawnerScript.enemySpeed = Mathf.Min(spawnerScript.enemySpeed + speedIncrease, maxSpeed);
            spawnerScript.enabled = false;
            spawner.SetActive(false);
        }
    }

    void UpdateWaveProgress(bool _lostLife) {
        _enemiesDefeated++;

        if (_lostLife) {
            ScoreManager.Instance.IncreaseBetaTest(_enemiesDefeated);
        } else {
            ScoreManager.Instance.AddScore(_enemiesDefeated);
        }
    }

    void NextWave() {
        _waveNumber++;
        StartCoroutine(NewWave());
    }

    void CeaseWave(int score, int placement) {
        StopAllCoroutines();
    }

    void OnEnable() {
        ScoreManager.updateDestructionEvent += UpdateWaveProgress;
        ScoreManager.skipWaveEvent += NextWave;
        ScoreManager.highScoreEvent += CeaseWave;
    }

    void OnDisable() {
        ScoreManager.updateDestructionEvent -= UpdateWaveProgress;
        ScoreManager.skipWaveEvent -= NextWave;
        ScoreManager.highScoreEvent -= CeaseWave;
    }
}
