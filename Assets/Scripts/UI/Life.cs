using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

namespace UI
{
    public class Life : MonoBehaviour
    {
        public float _duration;
        [Range(0.0f, 1.0f)]
        public float _vShift, _stretch;
        public EaseFunc easeType;

        public Vector3 targetScale;
        private Vector3 _startScale;
        private TMP_Text text;

        void Awake()
        {
            _startScale = transform.localScale;
            text = GetComponent<TMP_Text>();
        }

        void UpdateLife(int life)
        {
            text.text = "";

            for (int i = 0; i < life; i++)
            {
                text.text += " ♥ ";
            }

            transform.localScale = targetScale;
            transform.DoScale(this, _startScale, _duration, easeType, _vShift, _stretch);
        }

        void OnEnable()
        {
            ScoreManager.playerLifeUpdateEvent += UpdateLife;
        }

        void OnDisable()
        {
            ScoreManager.playerLifeUpdateEvent -= UpdateLife;
        }
    }
}
