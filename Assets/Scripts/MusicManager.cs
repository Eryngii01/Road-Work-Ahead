using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MusicManager : MonoBehaviour {
    [SerializeField]
    private AudioClip _gameOver, _superCar;

    // Separated to pause the main theme for a better game experience instead of restarting the main theme every time
    [SerializeField]
    private AudioSource _themeAudio, _specialAudio;

    public void PlayGameOver(int score) {
        _themeAudio.Pause();

        _specialAudio.loop = false;
        _specialAudio.clip = _gameOver;
        _specialAudio.Play();
    }

    public void PlaySuperCar() {
        _themeAudio.Pause();
        
        _specialAudio.loop = true;
        _specialAudio.clip = _superCar;
        _specialAudio.Play();
    }

    public void UndoSuperCar() {
        _specialAudio.Stop();

        _themeAudio.Play();
    }

    void OnEnable() {
        ScoreManager.gameOverEvent += PlayGameOver;
        ScoreManager.superEvent += PlaySuperCar;
        ScoreManager.resetSuperEvent += UndoSuperCar;
    }

    void OnDisable() {
        ScoreManager.gameOverEvent -= PlayGameOver;
        ScoreManager.superEvent -= PlaySuperCar;
        ScoreManager.resetSuperEvent -= UndoSuperCar;
    }
}
