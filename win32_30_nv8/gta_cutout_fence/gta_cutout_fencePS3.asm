// Summary: Restored stippled transparency from 1.0.4.0 + 256 state stipple & changed stipple channel + increased alpha + dithering mask + alpha cutout toggle
// Generated by Microsoft (R) HLSL Shader Compiler 9.23.949.2378
//
// Parameters:
//
//   sampler2D StippleTexture;
//   sampler2D TextureSampler;
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
//   TextureSampler s0       1
//   StippleTexture s10      1
//

    ps_3_0
    def c151, 0.9999, 255, 3, 0.00390625 // Dithering Mask constants
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 1.1350517561e-43 // 81
    def c150, 15.996, 16, 0.0625, 0.0625	// 256 state stipple constants
    def c127, 0.9999999, 1, 0, 0	// LogDepth constants
    def c0, -1, -0, 9.99999975e-006, 1
    def c1, 3.99600005, 4, 0.125, 0.25
    def c2, 0.5, 0, 1, 0.25
	def c3, 1.22, 2, 0, 0 // x = alpha multiplier
    dcl_texcoord v0.xy
    dcl_texcoord1 v1.xyz
    dcl_color v2.xw
    dcl vPos.xy
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s10
    texld r0, v0, s0
	mov r22.x, c223.z
	if_eq r22.x, c3.y
		add r1.x, -r0.w, c1.w
		cmp r1.x, r1.x, c0.x, c0.y
		add r0.w, r1.x, -c0.x
		texkill r1.x
	else
		mul_sat r0.w, r0.w, c3.x
	endif
    //mul r0.w, r0.w, v2.w	// disabled vertex alpha
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
    cmp r1, -r1.x, c0.x, c0.y
    texkill r1
    add r1.xyz, c0.z, v1
    dp3 r1.w, r1, r1
    rsq r1.w, r1.w
    mad r1.xyz, r1, r1.w, c0.w
    mul oC1.xyz, r1, c2.x
    mov oC0, r0
    mov r20.w, r0
    mov oC1.w, r0.w
    mad oC2.xyz, v2.x, c2.yyzw, c2.ywyw
    mov oC2.w, r0.w
    mov r0.xy, c0
    mul oC3, -r0.xyyy, c52.x
	add r22.x, r22.x, -c3.y
	cmp r20.w, -r22_abs.x, c39.x, r20.w
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

// approximately 28 instruction slots used (2 texture, 26 arithmetic)
