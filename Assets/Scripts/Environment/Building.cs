using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Building : MonoBehaviour {
    public Material[] evilBuildings;
    public GameObject rendererHolder;

    private MeshRenderer _renderer;

    void Awake() {
        _renderer = rendererHolder.GetComponent<MeshRenderer>();
    }

    // Method to change the model texture to an evil building texture at random
    public void TurnEvil() {
        int random = Random.Range(0, evilBuildings.Length - 1);
        _renderer.material = evilBuildings[random];
        this.enabled = false;
    }
}
