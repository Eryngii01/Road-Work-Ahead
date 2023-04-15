using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ItemSpawner : MonoBehaviour
{
    public float spawnInterval = 5f;
    public Node[] spawnPoints;
    public int itemsToSpawn = 3;
    public float spawnRadius = 0f;

    public Tracer tracerPrefab;

    public GameObject itemPrefab;
    private float t = 0f;

    private void Start()
    {
        if (spawnPoints.Length == 0)
        {
            spawnPoints = FindObjectsOfType<Node>(); // if no spawn points are specified, find all nodes
        }
    }

    private void Update()
    {
        t += Time.deltaTime;
        if (t >= spawnInterval && 0 < itemsToSpawn)
        {
            t = 0;
            SpawnItem();
            itemsToSpawn--;
        }

    }

    private void SpawnItem()
    {
        int spawnIndex = Random.Range(0, spawnPoints.Length);
        Node spawnPoint = spawnPoints[spawnIndex];
        Vector3 spawnPosition = spawnPoint.transform.position + Random.insideUnitSphere * spawnRadius;
        spawnPosition.y = 0.5f;
        GameObject item = Instantiate(itemPrefab, spawnPosition, Quaternion.identity);

    }
}
