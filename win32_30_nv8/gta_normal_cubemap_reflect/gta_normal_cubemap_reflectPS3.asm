// Summary: Restored stippled transparency from 1.0.4.0 + 256 state stipple & changed stipple channel + dithering mask
// Generated by Microsoft (R) HLSL Shader Compiler 9.23.949.2378
//
// Parameters:
//
//   sampler2D BumpSampler;
//   samplerCUBE EnvironmentSampler;
//   sampler2D StippleTexture;
//   sampler2D TextureSampler;
//   float bumpiness;
//   float4 globalScalars;
//   float reflectivePower;
//   float4 stencil;
//
//
// Registers:
//
//   Name               Reg   Size
//   ------------------ ----- ----
//   globalScalars      c39      1
//   stencil            c52      1
//   bumpiness          c66      1
//   reflectivePower    c72      1
//   TextureSampler     s0       1
//   BumpSampler        s1       1
//   EnvironmentSampler s2       1
//   StippleTexture     s10      1
//

    ps_3_0
    def c151, 0.9999, 0.012156862745098, 0, 0 // Dithering Mask constants
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 4.0917915158e-43 // 292
    def c150, 15.996, 16, 0.0625, 0.0625	// 256 state stipple constants
    def c127, 0.9999999, 1, 0, 0	// LogDepth constants
    def c0, -0.5, 9.99999975e-006, 0.5, 0
    def c1, 3.99600005, 4, 0.125, 0.25
    def c2, -1, -0, 1, 0
    def c3, 0, 1, 0.25, 0
    dcl_texcoord v0.xy
    dcl_texcoord1 v1.xyz
    dcl_texcoord3 v2.xyz
    dcl_texcoord4 v3.xyz
    dcl_texcoord5 v4.xyz
    dcl_color v5.xw
    dcl vPos.xy
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s1
    dcl_cube s2
    dcl_2d s10
    texld r0, v0, s0
    //mul r0.w, r0.w, v5.w	// disabled vertex alpha
    mul r0.w, r0.w, c39.x
    mov_sat r1.x, r0.w
    mul r1.x, r1.x, c150.x
    frc r1.y, r1.x
    mul r1.z, r1.y, c150.y
    frc r1.w, r1.z
    add r2.xy, r1.zxzw, -r1.wyzw
    mul r1.xy, c150.z, vPos
    frc r1.xy, r1_abs
    cmp r1.xy, vPos, r1, -r1
    mul r1.xy, r1, c150.w
    mad r1.xy, r2, c150.w, r1
    texld r1, r1, s10
    cmp r1, -r1.x, c2.x, c2.y
    texkill r1
    texld r1, v0, s1
    add r1.z, -r1.w, c2.z
    add r1.z, -r1.x, r1.z
    cmp r1.z, r1.z, c2.w, c2.z
    lrp r2.xy, r1.z, r1, r1.wyzw
    add r1.xy, r2, c0.x
    mul r1.xy, r1, c66.x
    dp2add r1.z, r2, -r2, c2.z
    rsq r1.z, r1.z
    rcp r1.z, r1.z
    mul r2.xyz, r1.x, v3
    mad r1.xzw, v1.xyyz, r1.z, r2.xyyz
    mad r1.xyz, r1.y, v4, r1.xzww
    add r1.xyz, r1, c0.y
    dp3 r1.w, r1, r1
    rsq r1.w, r1.w
    mul r2.xyz, r1, r1.w
    add r3.xyz, c0.y, v2.xzyw
    dp3 r2.w, r3, r3
    rsq r2.w, r2.w
    mul r3.xyz, r3, r2.w
    dp3 r2.w, -r3.xzyw, r2
    add r2.w, r2.w, r2.w
    mad r2.xyz, r2.xzyw, -r2.w, -r3
    add r2.xyz, r2, c0.y
    dp3 r2.w, r2, r2
    rsq r2.w, r2.w
    mul r2.xyz, r2, r2.w
    texld r2, r2, s2
    mad oC0.xyz, r2, c72.x, r0
    mad r0.xyz, r1, r1.w, c2.z
    mul oC1.xyz, r0, c0.z
    mov oC0.w, r0.w
    mov r20.w, r0.w
    mov oC1.w, r0.w
    mad oC2.xyz, v5.x, c3.xxyw, c3.xzxw
    mov oC2.w, r0.w
    mov r0.zw, c2
    mul oC3, r0.zwww, c52.x
	// -------------------------------------------------------------- Dithering Mask ----------------------------------------------------------------
	if_lt r20.w, c151.x
		mov r20.z, c52.x
		add oC3.x, r20.z, c151.y
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

// approximately 56 instruction slots used (4 texture, 52 arithmetic)
