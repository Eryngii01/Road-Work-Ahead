using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Pool;

public class TracerPool : GameObjectPool {
    Node _spawnNode, _goalNode, _initialDestination;
    float _speedMultiplier;
    // float _count = 0;

    void Awake() {
        Pool = new ObjectPool<GameObject>(CreatePooledItem, OnTakeFromPool, OnReturnedToPool, 
                                          OnDestroyPoolObject, true, defaultCapacity, maxPoolSize);

        // TODO: Create loading screen to hide the freeze frame that results from this initialization
        for (int i=0; i < maxPoolSize; i++) {
            CreatePooledItem();
        }
    }

    // new public GameObject CreatePooledItem() {
    //     GameObject obj = Instantiate(prefab.gameObject);

    //     // Make all pooled tracers children of the pool object
    //     obj.transform.SetParent(gameObject.transform, false);

    //     obj.GetComponent<Pool>().pool = Pool;

    //     // _count++;
    //     // Debug.Log("Tracer count: " + _count);
    //     // obj.SetActive(false);

    //     return obj;
    // }

    new void OnTakeFromPool(GameObject tracer) {
        var tracerScript = tracer.GetComponent<Tracer>();

        tracer.transform.position = _spawnNode.transform.position;

        tracerScript.navigateOnNetwork.enabled = true;
        tracerScript.navigateOnNetwork.spawn = _spawnNode;
        tracerScript.navigateOnNetwork.initialDestination = _initialDestination;
        tracerScript.navigateOnNetwork.initialT = 0f;
        tracerScript.navigateOnNetwork.speedMultiplier = _speedMultiplier;
        
        tracerScript.goal = _goalNode;

        tracer.SetActive(true);
    }

    public void SetMarkers(Node spawn, Node goal, Node initialDestination, float speedMultiplier) {
        _spawnNode = spawn;
        _goalNode = goal;
        _initialDestination = initialDestination;
        _speedMultiplier = speedMultiplier;
    }
}
