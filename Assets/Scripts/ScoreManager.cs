using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;

public class ScoreManager : MonoBehaviour {
    public float _comboDepletionRate;
    public int score = 0;
    public int scoreScale = 100;
    public int enemyThreshold;
    private int _livesLost = 0, _toTurnEvil, _comboMultiplier = 1;
    private List<Building> _goodBuildings;

    private static ScoreManager _instance;

    public static ScoreManager Instance
    {
        get
        {
            if (_instance == null)
            {
                Debug.Log("Score Manager is null");
            }
            return _instance;
        }
    }

    // ------------- Observer Events -------------
    public static event Action<int>
        fastForwardEvent,
        bonusScoreEvent,
        gameOverEvent,
        gameOverMenuEvent,
        playerLifeUpdateEvent;

    public static event Action<float>
        setSpeedMultiplierEvent;

    public static event Action<bool>
        updateDestructionEvent;

    public static event Action<float, int>
        betaTestEvent;

    public static event Action<ItemType>
        inventoryEvent;

    public static event Action<int, int>
        highScoreEvent,
        updateWaveEvent;
    public static event Action<int, int, int, float>
        updateScoreEvent;

    /// Invoked whenever the number of redirects available to the player changes.
    public static event Action<(int total, int available)>
        availableRedirectsChangedEvent;

    public static event Action
        skipWaveEvent,
        beginTutorialEvent,
        endTutorialEvent,
        tutorialDriveEvent,
        tutorialSpawnEvent,
        tutorialRedirectEvent,
        tutorialApproachRedirectEvent,
        tutorialItemEvent,
        tutorialLivesEvent,
        dialogueEvent,
        pauseEvent,
        resumeEvent,
        resetBetaTestEvent,
        beginWaveEvent,
        beginUIWaveEvent,
        resetInventoryEvent,
        superEvent,
        resetSuperEvent,
        resetSpeedMultiplierEvent;
    // -------------------------------------------

    public static event Action<Node>
        waypointEvent;
        

    void Awake()
    {
        _instance = this;

        // Ensures that every time the scene is loaded, the timescale is reset
        Time.timeScale = 1;
    }

    void Start() {
        _goodBuildings = new List<Building>(FindObjectsOfType<Building>().Select(building => building));
        _toTurnEvil = _goodBuildings.Count / enemyThreshold;
    }

    public void EndGame() {
        int placement = 0;

        // Compare the current score to the existing scoreboard
        if (score >= PlayerPrefs.GetInt("highScore1")) {
            placement = 1;

            // Shift the rest of placements down
            PlayerPrefs.SetInt("highScore5", PlayerPrefs.GetInt("highScore4"));
            PlayerPrefs.SetString("name5", PlayerPrefs.GetString("name4"));
            
            PlayerPrefs.SetInt("highScore4", PlayerPrefs.GetInt("highScore3"));
            PlayerPrefs.SetString("name4", PlayerPrefs.GetString("name3"));
            
            PlayerPrefs.SetInt("highScore3", PlayerPrefs.GetInt("highScore2"));
            PlayerPrefs.SetString("name3", PlayerPrefs.GetString("name2"));
            
            PlayerPrefs.SetInt("highScore2", PlayerPrefs.GetInt("highScore1"));
            PlayerPrefs.SetString("name2", PlayerPrefs.GetString("name1"));
            
            PlayerPrefs.SetInt("highScore1", score);

            PlayerPrefs.Save();

            highScoreEvent?.Invoke(score, placement);
            setSpeedMultiplierEvent?.Invoke(0);
            return;
        } else if (score >= PlayerPrefs.GetInt("highScore2")) {
            placement = 2;

            PlayerPrefs.SetInt("highScore5", PlayerPrefs.GetInt("highScore4"));
            PlayerPrefs.SetString("name5", PlayerPrefs.GetString("name4"));
            
            PlayerPrefs.SetInt("highScore4", PlayerPrefs.GetInt("highScore3"));
            PlayerPrefs.SetString("name4", PlayerPrefs.GetString("name3"));
            
            PlayerPrefs.SetInt("highScore3", PlayerPrefs.GetInt("highScore2"));
            PlayerPrefs.SetString("name3", PlayerPrefs.GetString("name2"));
            
            PlayerPrefs.SetInt("highScore2", score);

            PlayerPrefs.Save();

            highScoreEvent?.Invoke(score, placement);
            setSpeedMultiplierEvent?.Invoke(0);
            return;
        } else if (score >= PlayerPrefs.GetInt("highScore3")) {
            placement = 3;

            PlayerPrefs.SetInt("highScore5", PlayerPrefs.GetInt("highScore4"));
            PlayerPrefs.SetString("name5", PlayerPrefs.GetString("name4"));
            
            PlayerPrefs.SetInt("highScore4", PlayerPrefs.GetInt("highScore3"));
            PlayerPrefs.SetString("name4", PlayerPrefs.GetString("name3"));
            
            PlayerPrefs.SetInt("highScore3", score);

            PlayerPrefs.Save();
            
            highScoreEvent?.Invoke(score, placement);
            setSpeedMultiplierEvent?.Invoke(0);
            return;
        } else if (score > PlayerPrefs.GetInt("highScore4")) {
            placement = 4;

            PlayerPrefs.SetInt("highScore5", PlayerPrefs.GetInt("highScore4"));
            PlayerPrefs.SetString("name5", PlayerPrefs.GetString("name4"));
            
            PlayerPrefs.SetInt("highScore4", score);

            PlayerPrefs.Save();

            highScoreEvent?.Invoke(score, placement);
            setSpeedMultiplierEvent?.Invoke(0);
            return;
        } else if (score > PlayerPrefs.GetInt("highScore5")) {
            placement = 5;

            PlayerPrefs.SetInt("highScore5", score);

            PlayerPrefs.Save();

            highScoreEvent?.Invoke(score, placement);
            setSpeedMultiplierEvent?.Invoke(0);
            return;
        }

        gameOverEvent?.Invoke(score);
        gameOverMenuEvent?.Invoke(score);
    }

    /*
        Method used to call the WaveManager upon enemy destruction to update and retrieve the total enemies destroyed
        to inform the UI of the current state of the wave. 
        
        ***Currently, the WaveManager will be informed with this delegate, which will trigger another delegate to update the UI***
    */
    public void TriggerScore() {
        updateDestructionEvent?.Invoke(false);
    }

    public void TriggerGameOverMenu() {
        gameOverMenuEvent?.Invoke(score);
    }

    public void AddScore(int enemiesLeft) {
        // Will need to be updated later if combos are going to be implemented
        score += scoreScale * _comboMultiplier;

        _comboMultiplier++;
        float comboSpeed = Mathf.Clamp(_comboDepletionRate + (0.08f * _comboMultiplier), 0.05f, 1.0f);

        updateScoreEvent?.Invoke(score, enemiesLeft, _comboMultiplier, comboSpeed);
    }

    /*
        * This method is used to add score when the player picks up an item
        * The score is added to the score manager and the score manager will
        * then notify the UI to update the score
    */
    public void BonusScore(int bonus) {
        score += bonus;
        bonusScoreEvent?.Invoke(score);
    }

    public void LoseEnemy() {
        updateDestructionEvent?.Invoke(true);
    }

    public void IncreaseBetaTest(int enemiesLeft)
    {
        _livesLost++;

        float percentage = (float)_livesLost / (float)enemyThreshold;
        betaTestEvent?.Invoke(percentage, enemiesLeft);

        // Turn buildings evil
        if (percentage == 1) {
            for (int i = 0; i < _goodBuildings.Count; i++) {
                _goodBuildings[i].TurnEvil();
            }
        } else {
            for (int i = 0; i < _toTurnEvil; i++) {
                // Randomly select buildings from the map to turn evil
                int random = UnityEngine.Random.Range(0, _goodBuildings.Count - 1);

                _goodBuildings[random].TurnEvil();
                _goodBuildings.RemoveAt(random);
            }
        }
    }

    public void ResetCombo() {
        _comboMultiplier = 1;
    }

    public void Pause()
    {
        pauseEvent?.Invoke();
    }

    public void ResumeGame()
    {
        resumeEvent?.Invoke();
    }

    public void ResetBetaTest()
    {
        resetBetaTestEvent?.Invoke();
    }

    public void NextWave(int waveNumber, int maxEnemies)
    {
        updateWaveEvent?.Invoke(waveNumber, maxEnemies);
    }

    public void BeginWave()
    {
        beginWaveEvent?.Invoke();
    }

    public void EndUIWave()
    {
        beginUIWaveEvent?.Invoke();
    }

    public void SkipWave() {
        skipWaveEvent?.Invoke();
    }

    public void SetAvailableRedirects(int total, int available)
    {
        availableRedirectsChangedEvent?.Invoke((total, available));
    }

    public void SetInventory(ItemType type)
    {
        inventoryEvent?.Invoke(type);
    }

    public void UpdateFastForward(int gameSpeed) {
        fastForwardEvent?.Invoke(gameSpeed);
    }

    public void ResetInventory()
    {
        resetInventoryEvent?.Invoke();
    }

    public void InvokeSuperPlayer()
    {
        superEvent?.Invoke();
    }

    public void UndoSuperPlayer()
    {
        resetSuperEvent?.Invoke();
    }

    public void BeginTutorial()
    {
        beginTutorialEvent?.Invoke();
    }

    public void TutorialDriving()
    {
        tutorialDriveEvent?.Invoke();
    }

    public void TutorialSpawn()
    {
        tutorialSpawnEvent?.Invoke();
    }

    public void TutorialRedirect()
    {
        tutorialRedirectEvent?.Invoke();
    }

    public void TutorialApproach() {
        tutorialApproachRedirectEvent?.Invoke();
    }

    public void TutorialSpawnItem() {
        // Tell some manager to spawn this
    }

    public void TutorialItem() {
        tutorialItemEvent?.Invoke();
    }

    public void TutorialLives() {
        tutorialLivesEvent?.Invoke();
    }

    public void EndTutorial()
    {
        endTutorialEvent?.Invoke();
    }

    public void UpdateDialogue()
    {
        dialogueEvent?.Invoke();
    }
    public void SetSpeedMultiplier(float multiplier)
    {
        setSpeedMultiplierEvent?.Invoke(multiplier);
    }

    public void ResetSpeedMultiplier()
    {
        resetSpeedMultiplierEvent?.Invoke();
    }

    public void UpdatePlayerLife(int lives)
    {
        playerLifeUpdateEvent?.Invoke(lives);
    }

    public void CreateWaypoint(Node node)
    {
        waypointEvent?.Invoke(node);
    }
}
