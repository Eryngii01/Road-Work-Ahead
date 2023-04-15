using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Pool;

public class Pool : MonoBehaviour {
    public IObjectPool<GameObject> pool;

    public void ReturnToPool() {
        pool.Release(gameObject);
    }
}
