Shader "Unlit/Lines" {
    Properties {
        _FadeOffset ("FadeOffset", Range(0.1, 8)) = 3

        _BaseColor ("Color", Color) = (1, 1, 1, 1)
        _ColorA ("Color", Color) = (1, 1, 1, 1)
        _ColorB ("Color", Color) = (0, 0, 1, 1)
        _AnimationSpeed ("AnimationSpeed", Float) = 0.5
    }

    SubShader {
        Tags { "RenderType"="Transparent" 
               "Queue"="Transparent"
        }

        // Pass {

        //     Cull Off
        //     ZWrite Off
        //     Blend DstColor Zero

        //     CGPROGRAM
        //     #pragma vertex vert
        //     #pragma fragment frag

        //     #include "UnityCG.cginc"

        //     float4 _BaseColor;
        //     float _FadeOffset;

        //     struct MeshData {
        //         float4 vertex : POSITION;
        //         float2 uv : TEXCOORD0;
        //         float3 normals : NORMAL;
        //     };

        //     struct Interpolators {
        //         float4 vertex : SV_POSITION;
        //         float3 normal : TEXCOORD0;
        //         float2 uv : TEXCOORD1;
        //     };

        //     Interpolators vert (MeshData v) {
        //         Interpolators o;
        //         o.vertex = UnityObjectToClipPos(v.vertex);               
        //         o.normal = v.normals;
        //         o.uv = v.uv;
        //         return o;
        //     }

        //     fixed4 frag (Interpolators i) : SV_Target {
        //         return _BaseColor * (i.uv.y) * _FadeOffset;
        //     }
        //     ENDCG
        // }

        Pass {

            Cull Off
            ZWrite Off
            Blend One One

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            #define TAU 6.28318530718

            float4 _ColorA;
            float4 _ColorB;
            float _AnimationSpeed;

            struct MeshData {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
                float3 normals : NORMAL;
            };

            struct Interpolators {
                float4 vertex : SV_POSITION;
                float3 normal : TEXCOORD0;
                float2 uv : TEXCOORD1;
            };

            Interpolators vert (MeshData v) {
                Interpolators o;
                o.vertex = UnityObjectToClipPos(v.vertex);               
                o.normal = v.normals;
                o.uv = v.uv;
                return o;
            }

            fixed4 frag (Interpolators i) : SV_Target {
                float waves = cos(((1 - i.uv.y) + _Time.y * _AnimationSpeed) * TAU * 6);
                waves *= (1 - i.uv.y) * 2;
                waves *= (abs(i.normal.y) < 0.999f);

                float4 gradient = lerp(_ColorA, _ColorB, i.uv.y);
                return gradient * waves;
            }
            ENDCG
        }
    }
}
