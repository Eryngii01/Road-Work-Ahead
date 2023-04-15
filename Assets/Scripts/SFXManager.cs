using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SFXManager : MonoBehaviour {
    [SerializeField]
    private AudioClip _dialogue;

    private AudioSource _audio;

    void Awake() {
        _audio = GetComponent<AudioSource>();
    }

    public void PlayDialogue() {
        _audio.PlayOneShot(_dialogue, 1);
    }
}
