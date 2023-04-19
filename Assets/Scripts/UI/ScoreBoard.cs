using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class ScoreBoard : MonoBehaviour {
    private int _placement;

    public Color defaultColor, highlight;

    public TMP_Text one, oneScore, oneName;
    public TMP_Text two, twoScore, twoName;
    public TMP_Text three, threeScore, threeName;
    public TMP_Text four, fourScore, fourName;
    public TMP_Text five, fiveScore, fiveName;

    public void SetPlacement(int placement) {
        _placement = placement;
    }

    void OnEnable() {
        one.color = defaultColor;
        oneScore.color = defaultColor;
        oneName.color = defaultColor;

        oneScore.text = "$" + PlayerPrefs.GetInt("highScore1").ToString();
        oneName.text = PlayerPrefs.GetString("name1");

        two.color = defaultColor;
        twoScore.color = defaultColor;
        twoName.color = defaultColor;

        twoScore.text = "$" + PlayerPrefs.GetInt("highScore2").ToString();
        twoName.text = PlayerPrefs.GetString("name2");

        three.color = defaultColor;
        threeScore.color = defaultColor;
        threeName.color = defaultColor;

        threeScore.text = "$" + PlayerPrefs.GetInt("highScore3").ToString();
        threeName.text = PlayerPrefs.GetString("name3");

        four.color = defaultColor;
        fourScore.color = defaultColor;
        fourName.color = defaultColor;

        fourScore.text = "$" + PlayerPrefs.GetInt("highScore4").ToString();
        fourName.text = PlayerPrefs.GetString("name4");

        five.color = defaultColor;
        fiveScore.color = defaultColor;
        fiveName.color = defaultColor;

        fiveScore.text = "$" + PlayerPrefs.GetInt("highScore5").ToString();
        fiveName.text = PlayerPrefs.GetString("name5");

        switch (_placement) {
            case 1:
                one.color = highlight;
                oneScore.color = highlight;
                oneName.color = highlight;
                break;
            case 2:
                two.color = highlight;
                twoScore.color = highlight;
                twoName.color = highlight;
                break;
            case 3:
                three.color = highlight;
                threeScore.color = highlight;
                threeName.color = highlight;
                break;
            case 4:
                four.color = highlight;
                fourScore.color = highlight;
                fourName.color = highlight;
                break;
            case 5:
                five.color = highlight;
                fiveScore.color = highlight;
                fiveName.color = highlight;
                break;
        }

        
    }
}
