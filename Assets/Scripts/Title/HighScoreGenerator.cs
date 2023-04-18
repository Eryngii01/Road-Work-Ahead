using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HighScoreGenerator : MonoBehaviour {

    // If there are no high scores entered yet, hard code some scores in
    void Awake() {
        if (!PlayerPrefs.HasKey("highScore1")) {
            PlayerPrefs.SetInt("highScore1", 6100);
            PlayerPrefs.SetString("name1","FNL");
            PlayerPrefs.SetInt("highScore2", 5700);
            PlayerPrefs.SetString("name2","LES");
            PlayerPrefs.SetInt("highScore3", 3200);
            PlayerPrefs.SetString("name3","KMD");
            PlayerPrefs.SetInt("highScore4", 1800);
            PlayerPrefs.SetString("name4","PAN");
            PlayerPrefs.SetInt("highScore5", 600);
            PlayerPrefs.SetString("name5","AAA");

            PlayerPrefs.Save();
        }
    }
}
