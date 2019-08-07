﻿// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

Shader "Unity Shaders Book/Chapter10/Mirror"
{
    Properties
    {
        _MainTex ("Main Tex", 2D) = "White" {}
    }

    SubShader
    {
        Pass
        {
            Tags { "RenderType"="Opaque" }

            CGPROGRAM

            #pragma vertex vert
            #pragma fragment frag

            sampler2D _MainTex;

            struct a2v
            {
                float4 vertex : POSITION;
                float4 texcoord : TEXCOORD0;
            };

            struct v2f
            {
                float4 pos : SV_POSITION;
                float2 uv : TEXCOORD0;
            };

            v2f vert(a2v v)
            {
                v2f o;

                o.pos = UnityObjectToClipPos(v.vertex);
                
                o.uv = v.texcoord;
                o.uv.x = 1 - o.uv.x;

                return o;
            }

            fixed4 frag(v2f i) : SV_TARGET
            {
                return tex2D(_MainTex, i.uv);
            }

            ENDCG
        }
    }
    FallBack "Diffuse"
}
