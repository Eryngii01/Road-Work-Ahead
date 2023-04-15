Shader "Unlit/Outline" {
    Properties {
        _MainTex ("Texture", 2D) = "white" {}

        _OutlineColor ("BorderColor", Color) = (1, 1, 1, 1)
        _OutlineWidth ("BorderWidth", Range(0, 0.2)) = 0.1

        [MaterialToggle] _IsOutlined ("IsOutlined", Float) = 0
    }

    SubShader {
        Tags { "RenderType"="Transparent" }

        Pass {
            Tags { "RenderType"="Transparent"
                   "Queue"="Transparent" 
            }

            ZWrite Off
            Blend DstColor Zero

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            float4 _OutlineColor;
            float _OutlineWidth, _OutlineFade, _IsOutlined;

            float4 outline(float4 vertexPos, float outlineWidth) {
                float4x4 scale = float4x4 (
                    1 + outlineWidth, 0, 0, 0,
                    0, 1 + outlineWidth, 0, 0,
                    0, 0, 1 + outlineWidth, 0,
                    0, 0, 0, 1
                );

                return mul(scale, vertexPos);
            }

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
                float4 vertexPos = outline(v.vertex, _OutlineWidth);
                o.vertex = UnityObjectToClipPos(vertexPos);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                return o;
            }

            fixed4 frag (Interpolators i) : SV_Target {
                if (_IsOutlined) {
                    return _OutlineColor;
                } else {
                    return float4(1, 1, 1, 0);
                }
                
            }

            ENDCG
        }

        Pass {

            Tags { "RenderType"="Transparent"
                   "Queue"="Transparent" 
            }

            Blend One One
            ZWrite On

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

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
                fixed4 col = tex2D(_MainTex, i.uv);
                return col;
            }
            ENDCG
        }
    }
}
