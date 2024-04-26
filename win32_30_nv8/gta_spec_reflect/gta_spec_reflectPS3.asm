// Summary: simplified transparency code + fixed pop-in/added stippled transparency + dithering mask
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D EnvironmentSampler;
//   sampler2D SpecSampler;
//   sampler2D TextureSampler;
//   float4 globalScalars;
//   float reflectivePower;
//   float3 specMapIntMask;
//   float specularColorFactor;
//   float specularFactor;
//   float4 stencil;
//
//
// Registers:
//
//   Name                Reg   Size
//   ------------------- ----- ----
//   globalScalars       c39      1
//   stencil             c52      1
//   specularFactor      c66      1
//   specularColorFactor c72      1
//   specMapIntMask      c73      1
//   reflectivePower     c74      1
//   TextureSampler      s0       1
//   SpecSampler         s1       1
//   EnvironmentSampler  s2       1
//

    ps_3_0
    def c151, 0.9999, 0.012156862745098, 0, 0 // Dithering Mask constants
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 8.1135181084e-43 // 579
    def c152, 0.2, 0.6, 0.8, 0.4 // c152-c153 = new stipple constants
    def c153, 0.5, 2, 1, 0
    def c127, 0.9999999, 1, 0, 0	// LogDepth constants
    def c0, 0.176470593, -1, -0, 9.99999975e-006
    def c1, -0.5, 0.5, 0.001953125, 0
    dcl_texcoord v0.xy
    dcl_texcoord1 v1.xyz
    dcl_texcoord3 v2.xyz
    dcl_color v3.xw
    dcl_texcoord9 v9
    dcl vPos.xy
    dcl_2d s0
    dcl_2d s1
    dcl_2d s2
    texld r0, v0, s0
    // mul r0.w, r0.w, v3.w disabled vertex alpha
    mul r1.x, r0.w, c39.x
    mov r2.xyz, c0
    /* removed alpha threshold
    mad r0.w, r0.w, -c39.x, r2.x
    cmp r3, r0.w, c0.y, c0.z
    texkill r3
    removed alpha threshold */
    mul r20.xy, vPos.xy, c153.x
    frc r20.xy, r20.xy
    mad r20, r20.xxyy, -c153.y, c153.zwzw
    mul r20, r20.xxyy, r20.zwzw
    dp4 r20.x, r20_abs, c152
    add r20.y, -r20.x, r1.x
    texkill r20.y
    add r1.yzw, c0.w, v1.xxyz
    dp3 r0.w, r1.yzww, r1.yzww
    rsq r0.w, r0.w
    mul r3.xyz, r1.yzww, r0.w
    texld r4, v0, s1
    mul r2.x, r4.w, c66.x
    dp3 r2.w, r4, c73
    mul r2.w, r2.w, c72.x
    add r4.xyz, c0.w, v2
    nrm r5.xyz, r4
    dp3 r3.w, -r5, r3
    add r3.w, r3.w, r3.w
    mad r3.xyz, r3, -r3.w, -r5
    add r3.xyz, r3, c0.w
    dp3 r3.y, r3, r3
    rsq r3.y, r3.y
    mad r3.xy, r3.xzzw, r3.y, -c0.y
    mul r3.xy, r3, c1.x
    texld r3, r3, s2
    mul r3.xyz, r2.w, r3
    mad oC0.xyz, r3, c74.x, r0
    mad r0.xyz, r1.yzww, r0.w, -c0.y
    mul oC1.xyz, r0, c1.y
    mul oC2.x, r2.w, c1.y
    mul r0.x, r2.x, c1.z
    rsq r0.x, r0.x
    rcp oC2.y, r0.x
    mov oC0.w, r1.x
    mov r20.w, r1.x
    mov oC1.w, r1.x
    mov oC2.z, v3.x
    mov oC2.w, r1.x
    mul oC3, -r2.yzzz, c52.x
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

// approximately 41 instruction slots used (3 texture, 38 arithmetic)
