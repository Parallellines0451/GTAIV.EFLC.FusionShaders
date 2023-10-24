// Restored stippled transparency from 1.0.4.0 + 256 state stipple & changed stipple channel
// Generated by Microsoft (R) HLSL Shader Compiler 9.23.949.2378
//
// Parameters:
//
//   sampler2D StippleTexture;
//   sampler2D TextureSampler;
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   TextureSampler s0       1
//   StippleTexture s10      1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 8.6319985402e-43 // 616
    def c150, 15.996, 16, 0.0625, 0.0625	// 256 state stipple constants
    def c127, 0.9999999, 1, 0, 0	// LogDepth constants
    def c0, -1, -0, 0, 0
    def c1, 3.99600005, 4, 0.125, 0.25
    dcl_texcoord v0.xy
    dcl vPos.xy
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s10
    texld r0, v0, s0
    mov_sat r0.x, r0.w
    mul r0.x, r0.x, c150.x
    frc r0.y, r0.x
    mul r0.z, r0.y, c150.y
    frc r1.x, r0.z
    add r1.x, r0.z, -r1.x
    add r1.y, r0.x, -r0.y
    mul r0.xy, c150.z, vPos
    frc r0.xy, r0_abs
    cmp r0.xy, vPos, r0, -r0
    mul r0.xy, r0, c150.w
    mad r0.xy, r1, c150.w, r0
    texld r1, r0, s10
    cmp r1, -r1.x, c0.x, c0.y
    texkill r1
    mov oC0, r0.w
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

// approximately 17 instruction slots used (2 texture, 15 arithmetic)
