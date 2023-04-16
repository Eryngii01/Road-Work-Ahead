using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Pool;

public class EnemyPool : GameObjectPool {
    private Node _spawnNode, _goalNode;

    void Awake() {
        Pool = new ObjectPool<GameObject>(CreatePooledItem, OnTakeFromPool, OnReturnedToPool, 
                                          OnDestroyPoolObject, true, defaultCapacity, maxPoolSize);

        // TODO: Create loading screen to hide the freeze frame that results from this initialization
        for (int i=0; i < maxPoolSize; i++) {
            CreatePooledItem();
        }
    }

    new void OnTakeFromPool(GameObject enemy) {
        enemy.transform.position = _spawnNode.transform.position;

        var enemyScript = enemy.GetComponent<Enemy>();
        var enemyNavable = enemy.GetComponent<NavigateOnNetwork>();

        enemyScript.enabled = true;
        enemyScript.goal = _goalNode;

        enemyNavable.enabled = true;
        enemyNavable.spawn = _spawnNode;

        enemy.SetActive(true);
    }

    public void SetMarkers(Node spawn, Node goal) {
        _spawnNode = spawn;
        _goalNode = goal;
    }
}
