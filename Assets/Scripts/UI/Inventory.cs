using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

namespace UI {
    public class Inventory : MonoBehaviour {
        public float _duration, _duration2;
        [Range(0.0f, 1.0f)]
        public float _vShift, _stretch, _vShift2, _stretch2;
        public EaseFunc easeType, easeType2;
        public Vector3 targetScale;
        private Vector3 _startScale;

        public Sprite[] inventoryIcons;
        private CanvasGroup _renderCanvas;
        private Image _iconSelector;

        void Awake() {
            _startScale = transform.localScale;
            _renderCanvas = GetComponent<CanvasGroup>();
            _iconSelector = GetComponent<Image>();
        }

        // Currently, the trigger inventory only accounts for one item and type at a time,
        // but this will be fixed with a later update
        void TriggerInventory(ItemType type) {
            StopAllCoroutines();

            _iconSelector.sprite = inventoryIcons[(int)type];
            _renderCanvas.alpha = 1;

            transform.localScale = targetScale;
            transform.DoScale(this, _startScale, _duration, easeType, _vShift, _stretch);
        }

        void DisableInventory() {
            StopAllCoroutines();
            
            _renderCanvas.alpha = 1;
            _renderCanvas.DoFade(this, 0, _duration2, easeType2, _vShift2, _stretch2);
        }

        void OnEnable() {
            ScoreManager.inventoryEvent += TriggerInventory;
            ScoreManager.resetInventoryEvent += DisableInventory;
        }

        void OnDisable() {
            ScoreManager.inventoryEvent -= TriggerInventory;
            ScoreManager.resetInventoryEvent -= DisableInventory;
        }
    }
}