// Fixed terrain pop-in + 256 state stipple
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D TextureSampler_layer0;
//   sampler2D TextureSampler_layer1;
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
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 8.4218037706e-43 // 601
    def c150, 15.996, 16, 0.0625, 0.0625	// 256 state stipple constants
    def c127, 0.9999999, 1, 0, 0	// LogDepth constants
    def c0, 0.5, 0, 1, 0.25
    dcl_texcoord v0.xy
    dcl_texcoord3 v1.xy
    dcl_color v2
    dcl_color1 v3.y
    dcl_texcoord2 v4.xyz
    dcl_texcoord9 v9
    dcl vPos.xy
    dcl_2d s0
    dcl_2d s1
    dcl_2d s10
    mov_sat r0.x, c39.x
    mul r0.x, r0.x, c150.x
    frc r0.y, r0.x
    mul r0.z, r0.y, c150.y
    frc r0.w, r0.z
    add r1.xy, r0.zxzw, -r0.wyzw
    mul r0.xy, c150.z, vPos
    frc r0.xy, r0_abs
    cmp r0.xy, vPos, r0, -r0
    mul r0.xy, r0, c150.w
    mad r0.xy, r1, c150.w, r0
    mov r0.zw, c0.y
    texldl r0, r0, s10
    cmp r0, -r0.y, -c0.z, c0.y
    texkill r0
    texld r0, v0, s0
    texld r1, v1, s1
    mul r0.w, r1.w, v3.y
    lrp r2.xyz, r0.w, r1, r0
    mul oC0.xyz, r2, v2
    mov oC0.w, c39.x
    mad oC1.xyz, v4, c0.x, c0.x
    mov oC1.w, c39.x
    mad oC2.xyz, v2.w, c0.yyzw, c0.ywyw
    mov oC2.w, c39.x
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

// approximately 12 instruction slots used (2 texture, 10 arithmetic)
