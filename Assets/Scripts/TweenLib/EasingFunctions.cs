using System.Collections;
using System.Collections.Generic;
using UnityEngine;

/*
A static class that holds numerous easing functions for easy access among the game scripts. The easing
function formulas were primarily retrieved from http://gizma.com/easing/ and
https://github.com/lordofduct/spacepuppy-unity-framework/blob/master/SpacepuppyBase/Tween/Easing.cs
with some adjustments modified https://spicyyoghurt.com/tools/easing-functions.

Visualizations of the various easing functions can be found at https://easings.net/.
*/
public class EasingFunctions {
    public static float EaseLinear(float t, float b, float c, float d) {
        return c * t / d + b;
    }
    
    public static float EaseInQuad(float t, float b, float c, float d) {
        t /= d;
        return c * t * t + b;
    }

    public static float EaseOutQuad(float t, float b, float c, float d) {
        t /= d;
        return -c * t * (t - 2) + b;
    }

    public static float EaseInOutQuad(float t, float b, float c, float d) {
        t /= d / 2;

        return (t < 1)
        ? c / 2 * t * t + b
        : -c / 2 * ((t--) * (t - 2) - 1) + b;
    }

    public static float EaseInCubic(float t, float b, float c, float d) {
        t /= d;
        return c * t * t * t + b;
    }

    public static float EaseOutCubic(float t, float b, float c, float d) {
        t = t / d - 1;
        return c * (t * t * t + 1) + b;
    }

    public static float EaseInOutCubic(float t, float b, float c, float d) {
        t /= d / 2;

        return (t < 1)
        ? c / 2 * t * t * t + b
        : c / 2 * ((t -= 2) * t * t + 2) + b;
    }

    public static float EaseInQuartic(float t, float b, float c, float d) {
        t /= d;
        return c * t * t * t * t + b;
    }

    public static float EaseOutQuartic(float t, float b, float c, float d) {
        t = t / d - 1;
        return -c * (t * t * t * t - 1) + b;
    }

    public static float EaseInOutQuartic(float t, float b, float c, float d) {
        t /= d / 2;

        return (t < 1)
        ? c / 2 * t * t * t * t + b
        : -c / 2 * ((t -= 2) * t * t * t - 2) + b;
    }

    public static float EaseInQuintic(float t, float b, float c, float d) {
        t /= d;
        return c * t * t * t * t * t + b;
    }

    public static float EaseOutQuintic(float t, float b, float c, float d) {
        t = t / d - 1;
        return c * (t * t * t * t * t + 1) + b;
    }

    public static float EaseInOutQuintic(float t, float b, float c, float d) {
        t /= d / 2;

        return (t < 1)
        ? c / 2 * t * t * t * t * t + b
        : c / 2 * ((t -= 2) * t * t * t * t + 2) + b;
    }

    public static float EaseInSine(float t, float b, float c, float d) {
        return -c * Mathf.Cos(t / d * (Mathf.PI / 2)) + c + b;
    }

    public static float EaseOutSine(float t, float b, float c, float d) {
        return c * Mathf.Sin(t / d * (Mathf.PI / 2)) + b;
    }

    public static float EaseInOutSine(float t, float b, float c, float d) {
        return -c / 2 * (Mathf.Cos(Mathf.PI * t / d) - 1) + b;           
    }

    public static float EaseInExponential(float t, float b, float c, float d) {
        return (t == 0) 
        ? b 
        : c * Mathf.Pow(2, 10 * (t / d - 1)) + b;
    }

    public static float EaseOutExponential(float t, float b, float c, float d) {
        return (t == d) 
        ? b + c 
        : c * (-Mathf.Pow(2, -10 * t / d) + 1) + b;
    }

    public static float EaseInOutExponential(float t, float b, float c, float d) {
        if (t == 0) return b;
        if (t == d) return b + c;

        t /= d / 2;
        return (t < 1) 
        ? c / 2 * Mathf.Pow(2, 10 * (t - 1)) + b
        : c / 2 * ( -Mathf.Pow(2, -10 * (t--)) + 2) + b;
    }

    public static float EaseInCircular(float t, float b, float c, float d) {
        t /= d;
        return -c * (Mathf.Sqrt(1 - t * t) - 1) + b;
    }

    public static float EaseOutCircular(float t, float b, float c, float d) {
        t = t / d - 1;
        return c * Mathf.Sqrt(1 - t * t) + b;
    }

    public static float EaseInOutCicular(float t, float b, float c, float d) {
        t /= d / 2;

        return (t < 1) 
        ? -c / 2 * (Mathf.Sqrt(1 - t * t) - 1) + b
        : c / 2 * (Mathf.Sqrt(1 - (t -= 2) * t) + 1) + b;
    }

    public static float EaseInBack(float t, float b, float c, float d) {
        float s = 1.70158f;

        t /= d;
        return c * t * t * ((s + 1) * t - s) + b;
    }

    public static float EaseOutBack(float t, float b, float c, float d) {
        float s = 1.70158f;

        t = t / d - 1;
        return c * (t * t * ((s + 1) * t + s) + 1) + b;
    }

    public static float EaseInOutBack(float t, float b, float c, float d) {
        float s = 1.70158f;
        t /= d / 2;

        return (t < 1) 
        ? c / 2 * (t * t * (((s *= 1.525f) + 1) * t - s)) + b
        : c / 2 * ((t -= 2) * t * (((s *= 1.525f) + 1) * t + s) + 2) + b;
    }

    public static float EaseInBounce(float t, float b, float c, float d) {
        return c - EaseOutBounce(d - t, 0, c, d) + b;
    }

    public static float EaseOutBounce(float t, float b, float c, float d) {
        t /= d;

        if (t < 1 / 2.75f) {
            return c * (7.5625f * t * t) + b;
        } else if (t < 2 / 2.75) {
            return c * (7.5625f * (t -= 1.5f / 2.75f) * t + 0.75f) + b;
        } else if (t < 2.5f / 2.75f) {
            return c * (7.5625f * (t -= 2.25f / 2.75f) * t + 0.9375f) + b;
        } else {
            return c * (7.5625f * (t -= 2.625f / 2.75f) * t + 0.984375f) + b;
        }
    }

    public static float EaseInOutBounce(float t, float b, float c, float d) {
        return (t < d / 2) 
        ? EaseInBounce(t * 2, 0, c, d) * 0.5f + b 
        : EaseOutBounce(t * 2 - d, 0, c, d) * 0.5f + c * 0.5f + b;
    }

    public static float EaseInElastic(float t, float b, float c, float d) {
        float a = c, p = 0f, s;
        
        if (t == 0f) return b; 
        if ((t /= d) == 1) return b + c;

        if (p == 0f) p = d * 0.3f;
        if (a < Mathf.Abs(c)) { 
            a = c; 
            s = p / 4; 
        } else s = p / (2 * Mathf.PI) * Mathf.Asin(c / a);

        return -(a * Mathf.Pow(2, 10 * (t -= 1)) * Mathf.Sin((t * d - s) * (2 * Mathf.PI) / p)) + b;
    }

    public static float EaseOutElastic(float t, float b, float c, float d) {
        float a = c, p = 0f, s;

        if (t == 0f) return b;
        if ((t /= d) == 1) return b + c;
        if (p == 0f) p = d * 0.3f;
        if (a < Mathf.Abs(c)) { 
            a = c; 
            s = p / 4; 
        } else s = p / (2 * Mathf.PI) * Mathf.Asin(c / a);
        return (a * Mathf.Pow(2, -10 * t) * Mathf.Sin((t * d - s) * (2 * Mathf.PI) / p) + c + b);
    }

    public static float EaseInOutElastic(float t, float b, float c, float d) {
        float a = c, p = 0f, s;

        if (t == 0f) return b; 
        if ((t /= d / 2) == 2) return b + c;
        if (p == 0f) p = d * (0.3f * 1.5f);
        if (a < Mathf.Abs(c)) { 
            a = c; 
            s = p / 4; 
        } else s = p / (2 * Mathf.PI) * Mathf.Asin(c / a);

        return (t < 1) 
        ? -0.5f * (a * Mathf.Pow(2, 10 * (t -= 1)) * Mathf.Sin((t * d - s) * (2 * Mathf.PI) / p)) + b
        : a * Mathf.Pow(2, -10 * (t -= 1)) * Mathf.Sin((t * d - s) * (2 * Mathf.PI) / p) * 0.5f + c + b;
    }
}