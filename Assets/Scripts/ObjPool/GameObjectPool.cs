using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Pool;

public class GameObjectPool : MonoBehaviour {
    public Pool prefab;
    public int defaultCapacity = 10, maxPoolSize = 15;
    public IObjectPool<GameObject> Pool { get; set; }

    void Awake() {
        Pool = new ObjectPool<GameObject>(CreatePooledItem, OnTakeFromPool, OnReturnedToPool, 
                                          OnDestroyPoolObject, true, defaultCapacity, maxPoolSize);
        
        // TODO: Create loading screen to hide the freeze frame that results from this initialization
        for (int i=0; i < maxPoolSize; i++) {
            CreatePooledItem();
        }
    }

    public GameObject CreatePooledItem() {
        GameObject obj = Instantiate(prefab.gameObject);

        // Make all pooled enemies children of the spawner
        obj.transform.SetParent(gameObject.transform, false);

        obj.GetComponent<Pool>().pool = Pool;

        return obj;
    }

    public void OnTakeFromPool(GameObject obj) {
        obj.SetActive(true);
    }
    
    public void OnReturnedToPool(GameObject obj) {
        obj.SetActive(false);
    } 

    public void OnDestroyPoolObject(GameObject obj) {
        Destroy(obj);
    }
}
