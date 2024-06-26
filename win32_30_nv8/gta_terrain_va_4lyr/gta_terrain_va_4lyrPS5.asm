// Summary: simplified transparency code + fixed pop-in/added stippled transparency + stipple mask + reduced specularity
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D TextureSampler_layer0;
//   sampler2D TextureSampler_layer1;
//   sampler2D TextureSampler_layer2;
//   sampler2D TextureSampler_layer3;
//   float4 globalScalars;
//   float4 stencil;
//
//
// Registers:
//
//   Name                  Reg   Size
//   --------------------- ----- ----
//   globalScalars         c39      1
//   stencil               c52      1
//   TextureSampler_layer0 s0       1
//   TextureSampler_layer1 s1       1
//   TextureSampler_layer2 s2       1
//   TextureSampler_layer3 s3       1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 8.5479206324e-43 // 610
    def c152, 0.2, 0.6, 0.8, 0.4 // c152-c153 = new stipple constants
    def c153, 0.5, 2, 1, 0
    def c127, 0.9999999, 1, 0, 0	// LogDepth constants
    def c0, 0.5, 0, 1, 0.25
    def c1, 0.125, 0, 0, 0
    dcl_texcoord v0.xy
    dcl_texcoord3 v1.xy
    dcl_texcoord4 v2.xy
    dcl_texcoord5 v3.xy
    dcl_color v4
    dcl_color1 v5.yzw
    dcl_texcoord2 v6.xyz
    dcl_texcoord9 v9
    dcl vPos.xy
    dcl_2d s0
    dcl_2d s1
    dcl_2d s2
    dcl_2d s3
    dcl_2d s10
    mul r20.xy, vPos.xy, c153.x
    frc r20.xy, r20.xy
    mad r20, r20.xxyy, -c153.y, c153.zwzw
    mul r20, r20.xxyy, r20.zwzw
    dp4 r20.x, r20_abs, c152
    add r20.y, -r20.x, c39.x
    texkill r20.y
    texld r0, v0, s0
    texld r1, v1, s1
    mul r0.w, r1.w, v5.y
    lrp r2.xyz, r0.w, r1, r0
    texld r0, v2, s2
    mul r0.w, r0.w, v5.z
    lrp r1.xyz, r0.w, r0, r2
    texld r0, v3, s3
    mul r0.w, r0.w, v5.w
    lrp r2.xyz, r0.w, r0, r1
    mul oC0.xyz, r2, v4
    mov oC0.w, c39.x
    mad oC1.xyz, v6, c0.x, c0.x
    mov oC1.w, c39.x
    mad r21.xyz, v4.w, c0.yyzw, c0.ywyw
    mul r21.xy, r21.xy, c1.x
    mov oC2.xyz, r21.xyz
    // mov oC2.w, c39.x
    mov r20.x, -c152.z
    add r20.x, r20.x, c39.x
    cmp oC2.w, r20.x, c0.y, c0.z
    mov r0.yz, c0
    mul oC3, r0.zyyy, c52.x
	// ----------------------------------------------------------------- Linear2Log -----------------------------------------------------------------
	if_ne v9.y, c127.y
		rcp r20.z, c128.x
		mul r20.x, v9.w, r20.z
		mul r20.y, c128.y, r20.z
		log r20.x, r20.x
		log r20.y, r20.y
		rcp r20.y, r20.y
	else
		mov r20.x, v9.z
		rcp r20.y, v9.w
	endif
	mul oDepth, r20.x, r20.y
	// ----------------------------------------------------------------------------------------------------------------------------------------------

// approximately 18 instruction slots used (4 texture, 14 arithmetic)
