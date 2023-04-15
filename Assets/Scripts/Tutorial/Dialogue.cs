using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;
using TMPro;

namespace Tutorial {
    public class Dialogue : MonoBehaviour {
        public TMP_Text dialogueText;
        public Image textPrompt;
        public GameObject nextPrompt;
        [TextArea(4, 8)]
        public string completeText;
        public float textDelay;
        public GameObject[] toSetInactive, toSetActive;
        private bool _isTyping;

        public SFXManager _dialogueSound;

        public void UpdateDialogue() {
            Color newColor = textPrompt.color;

            if (_isTyping) {
                dialogueText.text = completeText;
                StopAllCoroutines();
                _isTyping = false;

                newColor.a = 1;
                textPrompt.color = newColor;

                return;
            }

            /** If the text has finished, pressing the A button will continue the tutorial **/
            for (int i = 0; i < toSetActive.Length; i++) {
                toSetActive[i].SetActive(true);
            }

            if (nextPrompt != null) {
                nextPrompt.SetActive(true);
                nextPrompt.GetComponent<Dialogue>()?.TriggerDialogue();
                nextPrompt.GetComponent<DrivingDialogue>()?.TriggerDialogue();
                nextPrompt.GetComponent<RedirectDialogue>()?.TriggerDialogue();
                nextPrompt.GetComponent<InventoryDialogue>()?.TriggerDialogue();
            } else {
                // Continue part 2 of tutorial
                ScoreManager.Instance.TutorialLives();
            }

            newColor.a = 0;
            textPrompt.color = newColor;

            for (int i = 0; i < toSetInactive.Length; i++) {
                toSetInactive[i].SetActive(false);
            }

            this.gameObject.SetActive(false);
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
