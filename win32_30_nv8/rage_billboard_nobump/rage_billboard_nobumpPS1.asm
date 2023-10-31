// Summary: Restored stippled transparency from 1.0.4.0 + 256 state stipple & changed stipple channel + dithering mask
// Generated by Microsoft (R) HLSL Shader Compiler 9.23.949.2378
//
// Parameters:
//
//   sampler2D StippleTexture;
//   sampler2D imposterSampler;
//   float3 normTable[16];
//
//
// Registers:
//
//   Name            Reg   Size
//   --------------- ----- ----
//   normTable       c72     16
//   imposterSampler s0       1
//   StippleTexture  s10      1
//

    ps_3_0
    def c151, 0.9999, 0.012156862745098, 0, 0 // Dithering Mask constants
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 1.0846050114e-42 // 774
    def c150, 15.996, 16, 0.0625, 0.0625	// 256 state stipple constants
    def c127, 0.9999999, 1, 0, 0	// LogDepth constants
    def c0, -1, -0, 0.9921875, 0.0078125
    def c1, 15.9377499, 16, 255.003998, 0.0625
    def c2, -0, -1, -2, -3
    def c3, -4, -5, -6, -7
    def c4, -8, -9, -10, -11
    def c5, -12, -13, -14, -15
    def c6, 9.99999975e-006, 0.5, 0, 0.0117647058823529
    def c7, 3.99600005, 4, 0.125, 0.25
    dcl_color v0.w
    dcl_texcoord v1
    dcl_texcoord1 v2
    dcl_texcoord2 v3
    dcl_texcoord3 v4
    dcl_texcoord4 v5
    dcl_texcoord5 v6.xyz
    dcl_texcoord6 v7.xyz
    dcl_texcoord7 v8.xyz
    dcl vPos.xy
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s10
    texld r0, v1, s0
    mul r1, r0, c1.x
    frc r1, r1
    mul r1, r1, c1.y
    mad r0, r0, c1.z, -r1
    mul r0, r0, c1.w
    dp4 r2.x, r1, v2
    dp4 r2.y, r0, v3
    add r2.x, r2.x, r2.y
    dp4 r1.x, r1, v4
    dp4 r0.x, r0, v5
    add r0.x, r1.x, r0.x
    mov_sat r0.y, r2.x
    mov_sat r0.z, r0.x
    mul r0.z, r0.z, v1.w
    mad r0.y, r0.y, v1.z, r0.z
    //mul r0.y, r0.y, v0.w	// disabled vertex alpha
    mov_sat r0.z, r0.y
    mul r0.z, r0.z, c150.x
    frc r0.w, r0.z
    mul r1.x, r0.w, c150.y
    frc r1.y, r1.x
    add r1.x, r1.x, -r1.y
    add r1.y, r0.z, -r0.w
    mul r0.zw, c150.z, vPos.xyxy
    frc r0.zw, r0_abs
    cmp r0.zw, vPos.xyxy, r0, -r0
    mul r0.zw, r0, c150.w
    mad r0.zw, r1.xyxy, c150.w, r0
    texld r1, r0.zwzw, s10
    cmp r1, -r1.x, c0.x, c0.y
    texkill r1
    texld r1, c0.zwzw, s0
    frc r0.z, r2.x
    add r0.z, r2.x, -r0.z
    add r2, r0.z, c2
    add r3, r0.z, c3
    add r4, r0.z, c4
    add r5, r0.z, c5
    mov r6.y, c0.y
    cmp r6.xzw, -r2_abs.x, c72.xyyz, -r6.y
    cmp r6.xzw, -r2_abs.y, c73.xyyz, r6
    cmp r2.xyz, -r2_abs.z, c74, r6.xzww
    cmp r2.xyz, -r2_abs.w, c75, r2
    cmp r2.xyz, -r3_abs.x, c76, r2
    cmp r2.xyz, -r3_abs.y, c77, r2
    cmp r2.xyz, -r3_abs.z, c78, r2
    cmp r2.xyz, -r3_abs.w, c79, r2
    cmp r2.xyz, -r4_abs.x, c80, r2
    cmp r2.xyz, -r4_abs.y, c81, r2
    cmp r2.xyz, -r4_abs.z, c82, r2
    cmp r2.xyz, -r4_abs.w, c83, r2
    cmp r2.xyz, -r5_abs.x, c84, r2
    cmp r2.xyz, -r5_abs.y, c85, r2
    cmp r2.xyz, -r5_abs.z, c86, r2
    cmp r2.xyz, -r5_abs.w, c87, r2
    frc r0.z, r0.x
    add r0.x, r0.x, -r0.z
    add r3, r0.x, c2
    add r4, r0.x, c3
    add r5, r0.x, c4
    add r7, r0.x, c5
    cmp r0.xzw, -r3_abs.x, c72.xyyz, -r6.y
    cmp r0.xzw, -r3_abs.y, c73.xyyz, r0
    cmp r0.xzw, -r3_abs.z, c74.xyyz, r0
    cmp r0.xzw, -r3_abs.w, c75.xyyz, r0
    cmp r0.xzw, -r4_abs.x, c76.xyyz, r0
    cmp r0.xzw, -r4_abs.y, c77.xyyz, r0
    cmp r0.xzw, -r4_abs.z, c78.xyyz, r0
    cmp r0.xzw, -r4_abs.w, c79.xyyz, r0
    cmp r0.xzw, -r5_abs.x, c80.xyyz, r0
    cmp r0.xzw, -r5_abs.y, c81.xyyz, r0
    cmp r0.xzw, -r5_abs.z, c82.xyyz, r0
    cmp r0.xzw, -r5_abs.w, c83.xyyz, r0
    cmp r0.xzw, -r7_abs.x, c84.xyyz, r0
    cmp r0.xzw, -r7_abs.y, c85.xyyz, r0
    cmp r0.xzw, -r7_abs.z, c86.xyyz, r0
    cmp r0.xzw, -r7_abs.w, c87.xyyz, r0
    mul r0.xzw, r0, v1.w
    mad r0.xzw, r2.xyyz, v1.z, r0
    add r0.xzw, r0, c6.x
    nrm r2.xyz, r0.xzww
    mul r0.xzw, r2.y, v7.xyyz
    mad r0.xzw, v6.xyyz, r2.x, r0
    mad r0.xzw, v8.xyyz, r2.z, r0
    mad oC1.xyz, r0.xzww, c6.y, c6.y
    mov oC0.xyz, r1
    mov oC0.w, r0.y
    mov r20.w, r0.y
    mov oC1.w, -c0.y
    mov oC2, c6.zyyz
    mov oC3, -c0.y
	// -------------------------------------------------------------- Dithering Mask ----------------------------------------------------------------
	if_lt r20.w, c151.x
		mov oC3.x, c6.w
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

// approximately 93 instruction slots used (3 texture, 90 arithmetic)
