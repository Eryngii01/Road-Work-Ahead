Shader "Unlit/ShiningItem" {
    Properties {
        _MainTex ("Texture", 2D) = "white" {}

        _Color ("FlashingColor", Color) = (1, 1, 1, 1)
        _FlashSpeed ("FlashSpeed", Range(0, 2)) = 1
    }

    SubShader {
        Tags { "RenderType"="Opaque" }
        
        Pass {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            float4 _Color;
            float _FlashSpeed;

            struct MeshData {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
                float3 normals : NORMAL;
            };

            struct Interpolators {
                float4 vertex : SV_POSITION;
                float3 normal : TEXCOORD0;
                float2 uv : TEXCOORD1;
                float3 worldPos : TEXCOORD2;
            };

            sampler2D _MainTex;
            float4 _MainTex_ST;

            Interpolators vert (MeshData v) {
                Interpolators o;
                o.vertex = UnityObjectToClipPos(v.vertex);               
                o.normal = UnityObjectToWorldNormal(v.normals);
                o.worldPos = mul(unity_ObjectToWorld, v.vertex);
                o.uv = v.uv;

                return o;
            }

            fixed4 frag (Interpolators i) : SV_Target {
                fixed4 col = tex2D(_MainTex, i.uv);

                float3 viewVector = normalize(_WorldSpaceCameraPos - i.worldPos);
                float fresnel = (1 - dot(viewVector, i.normal)) * (sin((_Time.y * _FlashSpeed)) * 0.5 + 0.5);

                return col + (fresnel * _Color);
            }
            ENDCG
        }
    }
}
