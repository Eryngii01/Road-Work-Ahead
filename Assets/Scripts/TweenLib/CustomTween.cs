using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public static class CustomTween {

    public static void DoFadeInOut(this CanvasGroup canvas, MonoBehaviour caller, float duration, EaseFunc easeType, float vShift = 1f, float stretch = 1f, int repeatTimes = 1, float waitTime = 0) {
        Ease easingFunc = ClassicTween.GetEasingFunction(easeType);
        caller.StartCoroutine(FadeCanvas(canvas, duration, vShift, stretch, easingFunc, repeatTimes, waitTime));
    }
    private static IEnumerator FadeCanvas(CanvasGroup canvas, float duration, float vShift, float stretch, Ease easingFunc, int repeatTimes, float waitTime) {
        bool isRepeating = true;

        while (isRepeating) {
            var t = 0f;
            float startAlpha = 0;
            
            // Begin with fade in
            while (t < duration) {
                canvas.alpha = Mathf.Lerp(startAlpha, 1, 
                                            easingFunc(t, vShift, stretch, duration));

                t += Time.deltaTime;
                yield return null;
            }

            canvas.alpha = 1;

            yield return new WaitForSeconds(waitTime);

            t = 0f;
            startAlpha = canvas.alpha;
            
            // Now fade out
            while (t < duration) {
                canvas.alpha = Mathf.Lerp(startAlpha, 0, 
                                            easingFunc(t, vShift, stretch, duration));

                t += Time.deltaTime;
                yield return null;
            }

            canvas.alpha = 0;
            
            if(repeatTimes - 1 == 0) {
                isRepeating = false;
            } else if (repeatTimes > 0) {
                repeatTimes--;
            }

            yield return new WaitForSeconds(waitTime);
        }
    }

}
