using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

namespace Tutorial {
    public class InventoryDialogue : MonoBehaviour {
        public TMP_Text dialogueText;
        public Image textPrompt;
        public GameObject nextPrompt, spawner;
        [TextArea(4, 8)]
        public string completeText;
        public float textDelay;
        public GameObject[] toSetInactive, toSetActive;

        public bool spawnItem;
        private bool _isTyping, _hasInventory = false;

        public SFXManager _dialogueSound;

        public void UpdateDialogue() {
            Color newColor = textPrompt.color;

            if (_isTyping) {
                dialogueText.text = completeText;
                StopAllCoroutines();
                _isTyping = false;

                if (spawnItem) {
                    spawner.SetActive(true);
                    ScoreManager.Instance.TutorialSpawnItem();
                }

                return;
            }

            if (_hasInventory && spawner == null) {
                /** If the text has finished, pressing the A button will continue the tutorial **/

                for (int i = 0; i < toSetActive.Length; i++) {
                    toSetActive[i].SetActive(true);
                }

                if (nextPrompt != null) {
                    nextPrompt.SetActive(true);
                    nextPrompt.GetComponent<Dialogue>()?.TriggerDialogue();
                    nextPrompt.GetComponent<InventoryDialogue>()?.TriggerDialogue();
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

        void TriggerTextPrompt() {
            _hasInventory = true; 

            if (spawnItem) {
                spawner.SetActive(false);

                for (int i = 0; i < toSetActive.Length; i++) {
                    toSetActive[i].SetActive(true);
                }

                if (nextPrompt != null) {
                    nextPrompt.SetActive(true);
                    nextPrompt.GetComponent<Dialogue>()?.TriggerDialogue();
                    nextPrompt.GetComponent<InventoryDialogue>()?.TriggerDialogue();
                }

                for (int i = 0; i < toSetInactive.Length; i++) {
                    toSetInactive[i].SetActive(false);
                }
                
                this.gameObject.SetActive(false);
            } else {
                Color newColor = textPrompt.color;
                newColor.a = 1;
                textPrompt.color = newColor;
            }   
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
            
            if (spawnItem) {
                spawner.SetActive(true);
                ScoreManager.Instance.TutorialSpawnItem();
            }
        }

        void OnEnable() {
            ScoreManager.dialogueEvent += UpdateDialogue;
            ScoreManager.beginTutorialEvent += TriggerDialogue;

            ScoreManager.tutorialItemEvent += TriggerTextPrompt;
        }

        void OnDisable() {
            ScoreManager.dialogueEvent -= UpdateDialogue;
            ScoreManager.beginTutorialEvent -= TriggerDialogue;

            ScoreManager.tutorialItemEvent -= TriggerTextPrompt;
        }
    }
}