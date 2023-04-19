using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

namespace Tutorial {
    public class DrivingDialogue : MonoBehaviour {
        public TMP_Text dialogueText;
        public Image textPrompt;
        public GameObject nextWindow, nextPrompt;
        [TextArea(4, 8)]
        public string completeText;
        public float textDelay, drivingTime;
        public GameObject[] toSetInactive;

        private bool _isTyping, finishedDriving = false;

        public SFXManager _dialogueSound;

        public void UpdateDialogue() {
            Color newColor = textPrompt.color;

            if (_isTyping) {
                dialogueText.text = completeText;
                StopAllCoroutines();
                _isTyping = false;

                StartCoroutine(TutorialDriving());

                return;
            }

            if (finishedDriving) {
                /** If the text has finished, pressing the A button will continue the tutorial **/

                if (nextWindow != null) {
                    nextWindow?.SetActive(true);
                }

                if (nextPrompt != null) {
                    nextPrompt.SetActive(true);
                    nextPrompt.GetComponent<SpawnDialogue>()?.TriggerDialogue();
                }

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
            StartCoroutine(TutorialDriving());
        }
        
        IEnumerator TutorialDriving() {
            ScoreManager.Instance.TutorialDriving();
            yield return new WaitForSeconds(drivingTime);

            finishedDriving = true;
            Debug.Log("finished driving time");

            Color newColor = textPrompt.color;
            newColor.a = 1;
            textPrompt.color = newColor;
        }

        void OnEnable() {
            ScoreManager.dialogueEvent += UpdateDialogue;
            ScoreManager.beginTutorialEvent += TriggerDialogue;
        }

        void OnDisable() {
            ScoreManager.dialogueEvent -= UpdateDialogue;
            ScoreManager.beginTutorialEvent -= TriggerDialogue;
        }

        
    }
}

