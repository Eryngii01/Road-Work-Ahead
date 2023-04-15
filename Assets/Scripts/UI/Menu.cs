using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;

namespace UI {
    public class Menu : MonoBehaviour {
        public GameObject firstSelected;
        public EventSystem UISystem;

        void OnEnable() {
            UISystem.SetSelectedGameObject(firstSelected);
        }
    }
}
