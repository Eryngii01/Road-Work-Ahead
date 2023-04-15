using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CloudsController : MonoBehaviour {
    public float speed, targetXPos;
    public bool isMoving;
    private Vector3 _startPos;

    void Awake() {
        _startPos = transform.localPosition;
        StartCoroutine(MoveClouds());
    }

    private IEnumerator MoveClouds() {
        while (isMoving) {
            transform.Translate(Vector3.right * Time.deltaTime * speed);

            if (Mathf.Abs(transform.localPosition.x - targetXPos) < 1f) {
                transform.localPosition = _startPos;
            }
            
            yield return null;
        }
    }
}
