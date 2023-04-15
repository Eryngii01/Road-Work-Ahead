using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
using UnityEngine.SceneManagement;

namespace UI {
    public class ButtonActions : MonoBehaviour {

        [Header ("Add the scene name to load if using the load method")]
        public string sceneName = null;

        [Header ("Reference to the text of this button")]
        public TMP_Text buttonText = null;

        [Header ("Reference to menu to close if button is for resume or for tutorial")]
        public GameObject menu;
        [Header ("Reference to menu to open")]
        public GameObject menuToOpen;
        [Header ("Reference to buttons to enable and disable when navigating through menus")]
        public Button[] oldButtons;
        [Header ("Reference to menu to give control when closing the previous")]
        public GameObject menuToGiveControl;

        [Header ("Reference to next tutorial prompt and its corresponding text")]
        public GameObject tutPrompt, dialogue;

        public void DisableButton() {
            Button button = GetComponent<Button>();
            button.interactable = false;
            buttonText.color = button.colors.highlightedColor;
        }

        public void OpenMenu() {
            menuToOpen.SetActive(true);

            // Disable the controls of the old menu
            menuToGiveControl.GetComponent<Title.StartMenu>()?.DisableControl();

            for (int i = 0; i < oldButtons.Length; i++) {
                oldButtons[i].interactable = false;
            }
        }

        public void ResumeGame() {
            menu.SetActive(false);
            ScoreManager.Instance.ResumeGame();
        }

        public void Back() {
            var titleMenu = menuToGiveControl.GetComponent<Title.StartMenu>();
            if (titleMenu) {
                titleMenu.ResetControl();
                titleMenu.EnableControl();
            }

            for (int i = 0; i < oldButtons.Length; i++) {
                oldButtons[i].interactable = true;
            }

            menu.SetActive(false);
        }

        public void QuitApplication() {
            Application.Quit();
        }

        public void ChangeScene() {
            StartCoroutine(LoadScene());
            Time.timeScale = 1;
            ScoreManager.Instance?.ResetBetaTest();
        }

        public void ContinueTutorial() {
            tutPrompt.SetActive(true);
            dialogue.GetComponent<Tutorial.Dialogue>().TriggerDialogue();

            menu.SetActive(false);
        }

        IEnumerator LoadScene() {
            AsyncOperation asyncLoad = SceneManager.LoadSceneAsync(sceneName);

            while (!asyncLoad.isDone) {
                yield return null;
            }
        }
    }
}