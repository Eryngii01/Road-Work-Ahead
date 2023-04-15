Shader "Unlit/BetaTestBar" {
    Properties {
        [HideInInspector] _MainTex ("Texture", 2D) = "white" {}

        _BetaStatus ("BetaTestCompletion", Range(0, 1)) = 1
        _DiagonalStretch ("DiagonalStretch", Range(0, 0.2)) = 0.1
        _BarFrequency ("Frequency", Float) = 14
        _AnimationSpeed ("Speed", Range(0, 0.2)) = 0.05

        _BackgroundColor ("BackgroundColor", Color) = (1, 1, 1, 1)
        _UnlitColor ("UnlitColor", Color) = (1, 1, 1, 1)
        _BarColor ("BarColor", Color) = (1, 0, 0, 1)
        _GradientColorA ("GradientColorA", Color) = (1, 1, 1, 1)
        _GradientColorB ("GradientColorB", Color) = (1, 1, 1, 1)
    }

    SubShader {
        Tags { "RenderType"="Opaque" }

        Pass {

            Tags { "Queue"="Transparent" }
            ZWrite On

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            float4 _BackgroundColor;

            struct MeshData {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct Interpolators {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            sampler2D _MainTex;
            float4 _MainTex_ST;

            Interpolators vert (MeshData v) {
                Interpolators o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                return o;
            }

            fixed4 frag (Interpolators i) : SV_Target {
                return _BackgroundColor;
            }
            ENDCG
        }

        Pass {

            Tags { "Queue"="Transparent" }
            ZWrite Off
            Blend One One

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            #define TAU 6.28318530718

            float4 _BarColor, _BackgroundColor;
            float _BetaStatus;
            float _StartThreshold, _EndThreshold, _DiagonalStretch, _BarFrequency, _AnimationSpeed;

            struct MeshData {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct Interpolators {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            sampler2D _MainTex;
            float4 _MainTex_ST;

            sampler2D _Texture;

            Interpolators vert (MeshData v) {
                Interpolators o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                return o;
            }

            fixed4 frag (Interpolators i) : SV_Target {
                float betaBarMask = _BetaStatus > i.uv.x;

                float4 spinEffect = cos(((i.uv.x - (i.uv.y * _DiagonalStretch)) - _Time.y * _AnimationSpeed) * TAU * _BarFrequency);

                float3 outputColor = lerp(_BackgroundColor, spinEffect * _BarColor, betaBarMask);
                return float4(outputColor, 1);
            }
            ENDCG
        }

        Pass {

            Tags { "RenderType"="Transparent"
                   "Queue"="Transparent" 
            }

            ZWrite On
            Blend DstColor Zero

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            float4 _UnlitColor, _GradientColorA, _GradientColorB;
            float _BetaStatus;
            float _StartThreshold, _EndThreshold;

            struct MeshData {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct Interpolators {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            sampler2D _MainTex;
            float4 _MainTex_ST;

            Interpolators vert (MeshData v) {
                Interpolators o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                return o;
            }

            fixed4 frag (Interpolators i) : SV_Target {
                float betaBarMask = _BetaStatus > i.uv.x;

                float4 betaBarColor = lerp(_GradientColorA, _GradientColorB, i.uv.y);
                float3 backgroundColor = _UnlitColor;

                float3 outputColor = lerp(backgroundColor, betaBarColor, betaBarMask);
                return float4(outputColor, 1);
            }
            ENDCG
        }
    }
}
