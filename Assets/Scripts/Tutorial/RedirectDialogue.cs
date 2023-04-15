using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

namespace Tutorial {
    public class RedirectDialogue : MonoBehaviour {
        public TMP_Text dialogueText;
        public Image textPrompt;
        public GameObject nextWindow, nextPrompt, controlPrompt;
        [TextArea(4, 8)]
        public string completeText;
        public float textDelay;
        public GameObject[] toSetInactive;

        public bool mustApproachRedirect;
        private bool _isTyping, _hasRedirected = false;

        public SFXManager _dialogueSound;

        public void UpdateDialogue() {

            if (_isTyping) {
                dialogueText.text = completeText;
                StopAllCoroutines();
                _isTyping = false;
                PlayerTutorial.Instance.SwitchController();

                return;
            }

            if (_hasRedirected) {
                /** If the text has finished, pressing the A button will continue the tutorial **/
                if (nextWindow != null) {
                    nextWindow?.SetActive(true);
                }

                if (nextPrompt != null) {
                    nextPrompt.SetActive(true);
                    nextPrompt.GetComponent<Dialogue>()?.TriggerDialogue();
                    nextPrompt.GetComponent<RedirectDialogue>()?.TriggerDialogue();
                }

                Color newColor = textPrompt.color;
                newColor.a = 0;
                textPrompt.color = newColor;

                for (int i = 0; i < toSetInactive.Length; i++) {
                    toSetInactive[i].SetActive(false);
                }
                
                this.gameObject.SetActive(false);
            }
        }

        public void TriggerDialogue() {
            StartCoroutine(TypeText());
            controlPrompt?.SetActive(true);
        }

        void TriggerTextPrompt() {
            /** If the text has finished, pressing the A button will continue the tutorial **/
            if (nextWindow != null) {
                nextWindow?.SetActive(true);
            }

            if (nextPrompt != null) {
                nextPrompt.SetActive(true);
                nextPrompt.GetComponent<Dialogue>()?.TriggerDialogue();
                nextPrompt.GetComponent<RedirectDialogue>()?.TriggerDialogue();
            }

            Color newColor = textPrompt.color;
            newColor.a = 0;
            textPrompt.color = newColor;

            for (int i = 0; i < toSetInactive.Length; i++) {
                toSetInactive[i].SetActive(false);
            }
            
            this.gameObject.SetActive(false);
        }
        
        IEnumerator TypeText() {
            _isTyping = true;
            dialogueText.text = "";
            foreach (char letter in completeText.ToCharArray()) {
                yield return new WaitForSeconds(textDelay);
                dialogueText.text += letter;
                _dialogueSound.PlayDialogue();
                yield return null;
            }

            _isTyping = false;
            PlayerTutorial.Instance.SwitchController();
        }

        void OnEnable() {
            ScoreManager.dialogueEvent += UpdateDialogue;
            ScoreManager.beginTutorialEvent += TriggerDialogue;

            if (mustApproachRedirect) {
                ScoreManager.tutorialApproachRedirectEvent += TriggerTextPrompt;
            } else {
                ScoreManager.tutorialRedirectEvent += TriggerTextPrompt;
            }
        }

        void OnDisable() {
            ScoreManager.dialogueEvent -= UpdateDialogue;
            ScoreManager.beginTutorialEvent -= TriggerDialogue;

            ScoreManager.tutorialApproachRedirectEvent -= TriggerTextPrompt;
            ScoreManager.tutorialRedirectEvent -= TriggerTextPrompt;
        }
    }
}