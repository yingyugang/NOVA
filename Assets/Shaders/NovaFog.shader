Shader "Nova/NovaFog" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
	}
	SubShader {
		Tags { "Queue"="Transparent+100" "RenderType"="Transparent" }
		LOD 200
		
		ZTest Always  

		CGPROGRAM
		#pragma surface surf Lambert alpha

		sampler2D _MainTex;

		struct Input {
			float2 uv_MainTex;
		};

		void surf (Input IN, inout SurfaceOutput o) {
			half4 c = tex2D (_MainTex, IN.uv_MainTex);
			o.Albedo = c.rgb;
			//o.Alpha = c.a;
			o.Alpha = 1.0- c.r;
		}
		ENDCG
	} 
	FallBack "Diffuse"
}
