using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TweenInfo : MonoBehaviour {
    public float _duration;
    [Range(0.0f, 1.0f)]
    public float _vShift, _stretch;
    public EaseFunc easeType;
}
