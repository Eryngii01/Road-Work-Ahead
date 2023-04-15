using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemySpawner : MonoBehaviour {
    public float spawnInterval = 4f;
    public Node spawnNode = null;
    public GameObject spawnIndicator = null;
    public Node goalNode = null;
    public GameObject goalIndicator = null;
    public Tracer tracerPrefab;

    public int maxEnemies = 5;
    private int _enemiesSpawned = 0;

    public int enemySpeed = 2;
    private float t = 0f, _speedMultiplier;
    public bool isTutorial;
    private bool _isDelayed = false, _isWavePrep = false, _isBlinking = false;

    // -------------- Object Pooling ---------------
    public EnemyPool enemyPool;
    public TracerPool tracerPool;
    // ---------------------------------------------

    private void Start()
    {
        // Setup start and goal indicator
        if (spawnNode)
        {
            spawnIndicator = Instantiate(spawnIndicator, spawnNode.transform.position, Quaternion.identity);
            spawnIndicator.transform.SetParent(transform);
        }
        if (goalNode)
        {
            goalIndicator = Instantiate(goalIndicator, goalNode.transform.position, Quaternion.identity);
            goalIndicator.transform.SetParent(transform);
        }
        InvokeRepeating("SpawnTracers", 0f, tracerPrefab.interval);
    }


    IEnumerator Blink()
    {
        _enemiesSpawned = 0;
        _isBlinking = true;
        for (int i = 0; i < 10; i++)
        {
            spawnIndicator.SetActive(true);
            goalIndicator.SetActive(true);
            yield return new WaitForSeconds(0.25f);
            spawnIndicator.SetActive(false);
            goalIndicator.SetActive(false);
            yield return new WaitForSeconds(0.25f);
        }
        spawnIndicator.SetActive(true);
        goalIndicator.SetActive(true);

        t = spawnInterval;
        _isBlinking = false;
    }
    // Update is called once per frame
    void Update()
    {
        t += Time.deltaTime;
        if (t >= spawnInterval && !_isDelayed && !_isWavePrep && !_isBlinking)
        {
            t = 0;
            
            if (spawnNode && _enemiesSpawned < maxEnemies)
            { // Need to rename AICar and have all enemies inherit from it
                SpawnEnemies();
            }
        }
    }

    private void SpawnEnemies()
    {
        enemyPool.SetMarkers(spawnNode, goalNode);
        GameObject enemy = enemyPool.Pool.Get();

        var enemyScript = enemy.GetComponent<Enemy>();
        var enemyNavable = enemy.GetComponent<NavigateOnNetwork>();

        _enemiesSpawned++;

        if (isTutorial) {
            enemyScript.isTutorial = true;
        }

        if (enemyScript is Enemy)
        { // Set speed depending on enemy type
            enemyNavable.speed = enemySpeed;
        }
        else
        { // TODO: Add other enemy types
            enemyNavable.speed = 1f;
        }
    }

    private void SpawnTracers()
    {
        if (!isActiveAndEnabled)
        {
            return;
        }

        tracerPool.SetMarkers(spawnNode, goalNode, spawnNode, _speedMultiplier);
        GameObject tracer = tracerPool.Pool.Get();
    }

    void BeginWaveDelay(int wave, int maxEnemies) {
        _isWavePrep = true;
    }

    void DelaySpawn(float delay)
    {
        _isDelayed = true;
        _speedMultiplier = delay;
    }

    void EndWaveDelay()
    {
        _isWavePrep = false;
    }

    void ResumeSpawn()
    {
        _isDelayed = false;
        _speedMultiplier = 1f;
    }

    void ResumePlayerCollision() {
        isTutorial = false;
    }


    void OnEnable()
    {
        ScoreManager.setSpeedMultiplierEvent += DelaySpawn;
        StartCoroutine(Blink());
        ScoreManager.updateWaveEvent += BeginWaveDelay;
        ScoreManager.beginWaveEvent += EndWaveDelay;
        ScoreManager.resetSpeedMultiplierEvent += ResumeSpawn;

        ScoreManager.tutorialLivesEvent += ResumePlayerCollision;
    }

    void OnDisable()
    {
        ScoreManager.setSpeedMultiplierEvent -= DelaySpawn;
        ScoreManager.updateWaveEvent -= BeginWaveDelay;
        ScoreManager.beginWaveEvent -= EndWaveDelay;
        ScoreManager.resetSpeedMultiplierEvent -= ResumeSpawn;

        ScoreManager.tutorialLivesEvent -= ResumePlayerCollision;
    }
}
