using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraController : MonoBehaviour
{
    private Vector3 startPosition;
    private GameObject player;
    void Awake() {
        startPosition = transform.position;
    }

    void Start() {
        player = GameObject.Find("Player");    
    }

    void Update()
    {
        transform.position = player.transform.position + startPosition;
    }
}
