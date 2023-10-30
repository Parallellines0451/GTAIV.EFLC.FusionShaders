// Summary: Restored stippled transparency from 1.0.4.0 + 256 state stipple & changed stipple channel + increased alpha + new stencil + enabled vertex AO + dithering mask + alpha cutout toggle
// Custom registers: c223
// Generated by Microsoft (R) HLSL Shader Compiler 9.23.949.2378
//
// Parameters:
//
//   sampler2D StippleTexture;
//   sampler2D TextureSampler;
//   float4 globalScalars;
//   float4 shadowmap_res;
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   globalScalars  c39      1
//   shadowmap_res  c207     1 // model identifier
//   TextureSampler s0       1
//   StippleTexture s10      1
//

    ps_3_0
    def c151, 0.9999, 255, 3, 0.00390625 // Dithering Mask constants
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 8.5619336170e-43 // 611
    def c150, 15.996, 16, 0.0625, 0.0625	// 256 state stipple constants
    def c127, 0.9999999, 1, 0, 0	// LogDepth constants
    def c0, 3.99600005, 4, 0.125, 0.25
    def c1, -1, -0, 0.5, 0
	def c2, 0.0234375, 0.02734375, 0, 0	// stencil
	def c3, 0.25, 0.5, 1280, 2
    dcl_texcoord v0.xy
    dcl_texcoord1 v1.xyz
    dcl vPos.xy
	dcl_texcoord2 v2 // Unused vertex AO
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s10
    texld r0, v0, s0
	mov r22.x, c223.z
	mov r1.x, c3.z
	add r1.x, r1.x, -c207.x
	cmp r22.x, -r1_abs.x, r22.x, c3.w
	cmp r1.y, -r1_abs.x, c3.x, c3.y
	if_eq r22.x, c3.w
		add r1.x, -r0.w, r1.y
		cmp r1.x, r1.x, c1.x, c1.y
		add r0.w, r1.x, -c1.x
		texkill r1.x
	else
		mul_sat r0.w, r0.w, c3.w
	endif
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
    cmp r1, -r1.x, c1.x, c1.y
    texkill r1
    mov oC0, r0
    mov r20.w, r0
    mad oC1, v1.xyzx, c1.zzzw, c1.zzzw
    mov oC2, c1.wzzw
	mov r1.x, -c1.x
	add r1.x, c223.x, -r1.x
	cmp oC2.z, -r1_abs.x, v2.x, c1.z // Vertex AO toggle
    mov oC3, c2.xwww
	add r22.x, r22.x, -c3.w
	cmp r20.w, -r22_abs.x, c39.x, r20.w
	// -------------------------------------------------------------- Dithering Mask ----------------------------------------------------------------
	if_lt r20.w, c151.x
		mov oC3.x, c2.y
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

// approximately 20 instruction slots used (2 texture, 18 arithmetic)
