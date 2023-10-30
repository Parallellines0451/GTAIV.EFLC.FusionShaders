// Summary: 256 state stipple & changed stipple channel + dithering mask
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D BumpSampler;
//   sampler2D StippleTexture;
//   float bumpiness;
//   float4 globalScalars;
//   float4 stencil;
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   globalScalars  c39      1
//   stencil        c52      1
//   bumpiness      c66      1
//   BumpSampler    s0       1
//   StippleTexture s10      1
//

    ps_3_0
    def c151, 0.9999, 255, 3, 0.00390625 // Dithering Mask constants
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 1.7936620343e-43 // 128
    def c150, 15.996, 16, 0.0625, 0.0625	// 256 state stipple constants
    def c127, 0.9999999, 1, 0, 0	// LogDepth constants
    def c0, -0.5, 9.99999975e-006, 0.5, 0
    def c1, 3.99600005, 4, 0.125, 0.25
    def c2, 0, -1, -0, 1
    dcl_texcoord v0.xy
    dcl_texcoord1 v1.xyz
    dcl_texcoord4 v2.xyz
    dcl_texcoord5 v3.xyz
    dcl vPos.xy
    dcl_texcoord9 v9
    dcl_2d s0
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
    mov r0.zw, c2.x
    texldl r0, r0, s10
    cmp r0, -r0.x, c2.y, c2.z
    texkill r0
    texld r0, v0, s0
    add r1.x, -r0.w, c2.w
    add r1.x, -r0.x, r1.x
    cmp r0.xy, r1.x, r0.wyzw, r0
    add r1.xy, r0, c0.x
    mul r1.xy, r1, c66.x
    dp2add r0.x, r0, -r0, c2.w
    rsq r0.x, r0.x
    rcp r0.x, r0.x
    mul r1.xzw, r1.x, v2.xyyz
    mad r0.xyw, v1.xyzz, r0.x, r1.xzzw
    mad r0.xyw, r1.y, v3.xyzz, r0
    add r0.xyw, r0, c0.y
    nrm r1.xyz, r0.xyww
    mad oC1.xyz, r1, c0.z, c0.z
    mul oC1.w, r0.z, c39.x
    mov r0.xw, c2
    mul oC3, r0.wxxx, c52.x
    mov oC0, c2.x
    mov r20.w, c2.x
    mov oC2, c2.x
	// -------------------------------------------------------------- Dithering Mask ----------------------------------------------------------------
	if_lt r20.w, c151.x
		mov r20.z, c52.x
		mul r20.z, r20.z, c151.y
		add r20.z, r20.z, c151.z
		mul oC3.x, r20.z, c151.w
	endif
	// ----------------------------------------------------------------------------------------------------------------------------------------------
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

// approximately 39 instruction slots used (3 texture, 36 arithmetic)
