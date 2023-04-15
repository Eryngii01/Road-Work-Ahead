using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public enum EaseFunc {
    Linear = 0,
    QuadEaseIn = 1,
    QuadEaseOut = 2,
    QuadEaseInOut = 3,
    CubicEaseIn = 4,
    CubicEaseOut = 5,
    CubicEaseInOut = 6,
    QuarticEaseIn = 7,
    QuarticEaseOut = 8,
    QuarticEaseInOut = 9,
    QuinticEaseIn = 10,
    QuinticEaseOut = 11,
    QuinticEaseInOut = 12,
    SineEaseIn = 13,
    SineEaseOut = 14,
    SineEaseInOut = 15,
    ExpoEaseIn = 16,
    ExpoEaseOut = 17,
    ExpoEaseInOut = 18,
    CircleEaseIn = 19,
    CircleEaseOut = 20,
    CircleEaseInOut = 21,
    BackEaseIn = 22,
    BackEaseOut = 23,
    BackEaseInOut = 24,
    BounceEaseIn = 25,
    BounceEaseOut = 26,
    BounceEaseInOut = 27,    
    ElasticEaseIn = 28,
    ElasticEaseOut = 29,
    ElasticEaseInOut = 30,
}

public delegate float Ease(float current, float vShift, float stretch, float duration);


/*
    The ClassicTween class contains a library of tweening extension methods for Unity's components to easily employ
    tweens within gamescripts outside of this class. With inspiration from DOTween, each extension method is named
    "Do<action>" to easily discern which methods are a part of the tweening library. 

    Each extension method is paired with an IEnumerator function to invoke the Coroutine with the caller parameter
    as the caller script must be a MonoBehaviour type class in order to start a coroutine. The extension method acts
    as a means of communication between gamescripts and the method that executes the tween by parsing the user's
    input for the intended type of easing function and passing it to the Coroutine. The remaining parameters
    include the target to Lerp to, as well as the tween duration, easing function type, and optional easing
    parameters to allow more complex adjustments to the ease outside of the default values.
*/
public static class ClassicTween {
    public static void DoMove(this Transform transform, MonoBehaviour caller, Vector3 targetPos, float duration, EaseFunc easeType, float vShift = 1f, float stretch = 1f, int repeatTimes = 1) {
        Ease easingFunc = GetEasingFunction(easeType);
        caller.StartCoroutine(Move(transform, targetPos, duration, vShift, stretch, easingFunc, repeatTimes));
    }
    private static IEnumerator Move(Transform transform, Vector3 targetPos, float duration, float vShift, float stretch, Ease easingFunc, int repeatTimes) {
        bool isRepeating = true;

        while (isRepeating) {
            var t = 0f;
            Vector3 startPosition = transform.localPosition;
            
            while (t < duration) {
                transform.localPosition = Vector3.Lerp(startPosition, targetPos, 
                                                    easingFunc(t, vShift, stretch, duration));

                t += Time.deltaTime;
                yield return null;
            }

            transform.localPosition = targetPos;
            
            if(repeatTimes - 1 == 0) {
                isRepeating = false;
            } else if (repeatTimes > 0) {
                repeatTimes--;
            }
        }
    }

    public static void DoMove(this RectTransform rectTransform, MonoBehaviour caller, Vector3 targetPos, float duration, EaseFunc easeType, float vShift = 1f, float stretch = 1f, int repeatTimes = 1) {
        Ease easingFunc = GetEasingFunction(easeType);
        caller.StartCoroutine(Move(rectTransform, targetPos, duration, vShift, stretch, easingFunc, repeatTimes));
    }
    private static IEnumerator Move(RectTransform rectTransform, Vector3 targetPos, float duration, float vShift, float stretch, Ease easingFunc, int repeatTimes) {
        bool isRepeating = true;
        Vector3 startPosition = rectTransform.localPosition;

        while (isRepeating) {
            var t = 0f;
            rectTransform.localPosition = startPosition;
            
            while (t < duration) {
                rectTransform.localPosition = Vector3.Lerp(startPosition, targetPos, 
                                                    easingFunc(t, vShift, stretch, duration));

                t += Time.deltaTime;
                yield return null;
            }

            rectTransform.localPosition = targetPos;
            
            if(repeatTimes - 1 == 0) {
                isRepeating = false;
            } else if (repeatTimes > 0) {
                repeatTimes--;
            }
        }
    }

    public static void DoMove2D(this Transform transform, MonoBehaviour caller, Vector2 targetPos, float duration, EaseFunc easeType, float vShift = 1f, float stretch = 1f) {
        Ease easingFunc = GetEasingFunction(easeType);
        caller.StartCoroutine(Move2D(transform, targetPos, duration, vShift, stretch, easingFunc));
    }
    private static IEnumerator Move2D(Transform transform, Vector2 targetPos, float duration, float vShift, float stretch, Ease easingFunc) {
            var t = 0f;
            Vector2 startPosition = transform.localPosition;
            
            while (t < duration) {
                transform.localPosition = Vector2.Lerp(startPosition, targetPos, 
                                                       easingFunc(t, vShift, stretch, duration));

                t += Time.deltaTime;
                yield return null;
            }

            transform.localPosition = targetPos;
    }

    public static void DoRotate(this Transform transform, MonoBehaviour caller, Quaternion targetRotation, float duration, EaseFunc easeType, float vShift = 1f, float stretch = 1f) {
        Ease easingFunc = GetEasingFunction(easeType);
        caller.StartCoroutine(Rotate(transform, targetRotation, duration, vShift, stretch, easingFunc));
    }
    private static IEnumerator Rotate(Transform transform, Quaternion targetRotation, float duration, float vShift, float stretch, Ease easingFunc) {
            var t = 0f;
            Quaternion startRotation = transform.rotation;
            
            while (t < duration) {
                transform.rotation = Quaternion.Lerp(startRotation, targetRotation, 
                                                     easingFunc(t, vShift, stretch, duration));

                t += Time.deltaTime;
                yield return null;
            }

            transform.rotation = targetRotation;
    }

    public static void DoScale(this Transform transform, MonoBehaviour caller, Vector3 targetScale, float duration, EaseFunc easeType, float vShift = 1f, float stretch = 1f) {
        Ease easingFunc = GetEasingFunction(easeType);
        caller.StartCoroutine(Scale(transform, targetScale, duration, vShift, stretch, easingFunc));
    }
    private static IEnumerator Scale(Transform transform, Vector3 targetScale, float duration, float vShift, float stretch, Ease easingFunc) {
            var t = 0f;
            Vector3 startScale = transform.localScale;
            
            while (t < duration) {
                transform.localScale = Vector3.Lerp(startScale, targetScale, 
                                                    easingFunc(t, vShift, stretch, duration));

                t += Time.deltaTime;
                yield return null;
            }

            transform.localScale = targetScale;
    }

    public static void DoColorChange(this Material material, MonoBehaviour caller, Color targetColor, float duration, EaseFunc easeType, float vShift = 1f, float stretch = 1f) {
        Ease easingFunc = GetEasingFunction(easeType);
        caller.StartCoroutine(ChangeColorMaterial(material, targetColor, duration, vShift, stretch, easingFunc));
    }
    private static IEnumerator ChangeColorMaterial(Material material, Color targetColor, float duration, float vShift, float stretch, Ease easingFunc) {
            var t = 0f;
            Color startColor = material.color;
            
            while (t < duration) {
                material.color = Color.Lerp(startColor, targetColor, 
                                            easingFunc(t, vShift, stretch, duration));

                t += Time.deltaTime;
                yield return null;
            }

            material.color = targetColor;
    }

    public static void DoColorChange(this TMP_Text text, MonoBehaviour caller, Color targetColor, float duration, EaseFunc easeType, float vShift = 1f, float stretch = 1f) {
        Ease easingFunc = GetEasingFunction(easeType);
        caller.StartCoroutine(ChangeColorText(text, targetColor, duration, vShift, stretch, easingFunc));
    }
    private static IEnumerator ChangeColorText(TMP_Text text, Color targetColor, float duration, float vShift, float stretch, Ease easingFunc) {
            var t = 0f;
            Color startColor = text.color;
            
            while (t < duration) {
                text.color = Color.Lerp(startColor, targetColor, 
                                        easingFunc(t, vShift, stretch, duration));

                t += Time.deltaTime;
                yield return null;
            }

            text.color = targetColor;
    }

    public static void DoColorChange(this SpriteRenderer sprite, MonoBehaviour caller, Color targetColor, float duration, EaseFunc easeType, float vShift = 1f, float stretch = 1f) {
        Ease easingFunc = GetEasingFunction(easeType);
        caller.StartCoroutine(ChangeColorSprite(sprite, targetColor, duration, vShift, stretch, easingFunc));
    }
    private static IEnumerator ChangeColorSprite(SpriteRenderer sprite, Color targetColor, float duration, float vShift, float stretch, Ease easingFunc) {
            var t = 0f;
            Color startColor = sprite.color;
            
            while (t < duration) {
                sprite.color = Color.Lerp(startColor, targetColor, 
                                          easingFunc(t, vShift, stretch, duration));

                t += Time.deltaTime;
                yield return null;
            }

            sprite.color = targetColor;
    }
    public static void DoFade(this CanvasRenderer renderer, MonoBehaviour caller, float targetAlpha, float duration, EaseFunc easeType, float vShift = 1f, float stretch = 1f) {
        Ease easingFunc = GetEasingFunction(easeType);
        caller.StartCoroutine(FadeRenderer(renderer, targetAlpha, duration, vShift, stretch, easingFunc));
    }
    private static IEnumerator FadeRenderer(CanvasRenderer renderer, float targetAlpha, float duration, float vShift, float stretch, Ease easingFunc) {
            var t = 0f;
            float startAlpha = renderer.GetAlpha();
            
            while (t < duration) {
                renderer.SetAlpha(Mathf.Lerp(startAlpha, targetAlpha, 
                                             easingFunc(t, vShift, stretch, duration)));

                t += Time.deltaTime;
                yield return null;
            }

            renderer.SetAlpha(targetAlpha);
    }

    public static void DoFade(this CanvasGroup canvas, MonoBehaviour caller, float targetAlpha, float duration, EaseFunc easeType, float vShift = 1f, float stretch = 1f) {
        Ease easingFunc = GetEasingFunction(easeType);
        caller.StartCoroutine(FadeCanvas(canvas, targetAlpha, duration, vShift, stretch, easingFunc));
    }
    private static IEnumerator FadeCanvas(CanvasGroup canvas, float targetAlpha, float duration, float vShift, float stretch, Ease easingFunc) {
            var t = 0f;
            float startAlpha = canvas.alpha;
            
            while (t < duration) {
                canvas.alpha = Mathf.Lerp(startAlpha, targetAlpha, 
                                          easingFunc(t, vShift, stretch, duration));

                t += Time.deltaTime;
                yield return null;
            }

            canvas.alpha = targetAlpha;
    }

    public static void DoFade(this AudioSource audio, MonoBehaviour caller, float targetVolume, float duration, EaseFunc easeType, float vShift = 1f, float stretch = 1f) {
        Ease easingFunc = GetEasingFunction(easeType);
        caller.StartCoroutine(FadeAudio(audio, targetVolume, duration, vShift, stretch, easingFunc));
    }
    private static IEnumerator FadeAudio(AudioSource audio, float targetVolume, float duration, float vShift, float stretch, Ease easingFunc) {
            var t = 0f;
            float startVolume = audio.volume;
            
            while (t < duration) {
                audio.volume = Mathf.Lerp(startVolume, targetVolume, 
                                          easingFunc(t, vShift, stretch, duration));

                t += Time.deltaTime;
                yield return null;
            }

            audio.volume = targetVolume;
    }

    public static Ease GetEasingFunction(EaseFunc easeType) {
        switch(easeType) {
            case EaseFunc.Linear: return EasingFunctions.EaseLinear;

            case EaseFunc.QuadEaseIn : return EasingFunctions.EaseInQuad;
            case EaseFunc.QuadEaseOut : return EasingFunctions.EaseOutQuad;
            case EaseFunc.QuadEaseInOut : return EasingFunctions.EaseInOutQuad;

            case EaseFunc.CubicEaseIn : return EasingFunctions.EaseInCubic;
            case EaseFunc.CubicEaseOut : return EasingFunctions.EaseOutCubic;
            case EaseFunc.CubicEaseInOut : return EasingFunctions.EaseInOutCubic;

            case EaseFunc.QuarticEaseIn : return EasingFunctions.EaseInQuartic;
            case EaseFunc.QuarticEaseOut : return EasingFunctions.EaseOutQuartic;
            case EaseFunc.QuarticEaseInOut : return EasingFunctions.EaseInOutQuartic;
            
            case EaseFunc.QuinticEaseIn : return EasingFunctions.EaseInQuintic;
            case EaseFunc.QuinticEaseOut : return EasingFunctions.EaseOutQuintic;
            case EaseFunc.QuinticEaseInOut : return EasingFunctions.EaseInOutQuintic;
            
            case EaseFunc.SineEaseIn : return EasingFunctions.EaseInSine;
            case EaseFunc.SineEaseOut : return EasingFunctions.EaseOutSine;
            case EaseFunc.SineEaseInOut : return EasingFunctions.EaseInOutSine;
            
            case EaseFunc.ExpoEaseIn : return EasingFunctions.EaseInExponential;
            case EaseFunc.ExpoEaseOut : return EasingFunctions.EaseOutExponential;
            case EaseFunc.ExpoEaseInOut : return EasingFunctions.EaseInOutExponential;
            
            case EaseFunc.CircleEaseIn : return EasingFunctions.EaseInCircular;
            case EaseFunc.CircleEaseOut : return EasingFunctions.EaseOutCircular;
            case EaseFunc.CircleEaseInOut : return EasingFunctions.EaseInOutCicular;
            
            case EaseFunc.BackEaseIn : return EasingFunctions.EaseInBack;
            case EaseFunc.BackEaseOut : return EasingFunctions.EaseOutBack;
            case EaseFunc.BackEaseInOut : return EasingFunctions.EaseInOutBack;
            
            case EaseFunc.BounceEaseIn : return EasingFunctions.EaseInBounce;
            case EaseFunc.BounceEaseOut : return EasingFunctions.EaseOutBounce;
            case EaseFunc.BounceEaseInOut : return EasingFunctions.EaseInOutBounce;
            
            case EaseFunc.ElasticEaseIn : return EasingFunctions.EaseInElastic;
            case EaseFunc.ElasticEaseOut : return EasingFunctions.EaseOutElastic;
            case EaseFunc.ElasticEaseInOut : return EasingFunctions.EaseInOutElastic;
        }

        return null;
    }
}
