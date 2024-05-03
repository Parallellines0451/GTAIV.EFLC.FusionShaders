// Summary: simplified transparency code
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D StippleTexture;
//   sampler2D TextureSampler;
//   float emissiveMultiplier;
//   float4 globalFogColor;
//   float4 globalFogParams;
//   float4 globalScalars;
//
//
// Registers:
//
//   Name               Reg   Size
//   ------------------ ----- ----
//   globalScalars      c39      1
//   globalFogParams    c41      1
//   globalFogColor     c42      1
//   emissiveMultiplier c66      1
//   TextureSampler     s0       1
//   StippleTexture     s10      1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 2.6064151436e-43 // 186
    def c152, 0.2, 0.6, 0.8, 0.4 // c152-c153 = new stipple constants
    def c153, 0.5, 2, 1, 0
    def c127, 0.9999999, 1, 0, 0	// LogDepth constants
    def c0, 3.99600005, 4, 0.125, 0.25
    def c1, 0, -1, -0, 0
    dcl_texcoord v0.xy
    dcl_texcoord1 v1.w
    dcl_color v2
    dcl vPos.xy
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s10
    texld r0, v0, s0
    mul r0.w, r0.w, v2.w
    mul r0.w, r0.w, c39.x
    /* removed stipple
    mov_sat r1.x, r0.w
    mul r1.x, r1.x, c0.x
    frc r1.y, r1.x
    mul r1.z, r1.y, c0.y
    frc r1.w, r1.z
    add r2.xy, r1.zxzw, -r1.wyzw
    mul r1.xy, c0.z, vPos
    frc r1.xy, r1_abs
    cmp r1.xy, vPos, r1, -r1
    mul r1.xy, r1, c0.w
    mad r1.xy, r2, c0.w, r1
    mov r1.zw, c1.x
    texldl r1, r1, s10
    cmp r1, -r1.y, c1.y, c1.z
    texkill r1
    removed stipple */
    mul r20.xy, vPos.xy, c153.x
    frc r20.xy, r20.xy
    mad r20, r20.xxyy, -c153.y, c153.zwzw
    mul r20, r20.xxyy, r20.zwzw
    dp4 r20.x, r20_abs, c152
    add r20.y, -r20.x, r0.w
    texkill r20.y
    mul r0.xyz, r0, v2
    mul r1.xyz, r0, c66.x
    add r1.w, -c41.x, v1.w
    add r2.x, -c41.x, c41.y
    rcp r2.x, r2.x
    mul_sat r1.w, r1.w, r2.x
    mov r2.x, c66.x
    mad r0.xyz, r0, -r2.x, c42
    mad oC0.xyz, r1.w, r0, r1
    mov oC0.w, r0.w
	// ----------------------------------------------------------------- Linear2Log -----------------------------------------------------------------
	if_ne v9.y, c127.y
		rcp r20.z, c128.x
		min r20.w, v9.w, c128.y
		mul r20.x, r20.w, r20.z
		mul r20.y, c128.y, r20.z
		log r20.x, r20.x
		log r20.y, r20.y
		rcp r20.y, r20.y
		mad r20.z, r20.x, r20.y, -v9.x
	else
		mov r20.x, v9.z
		rcp r20.y, v9.w
		mul r20.z, r20.x, r20.y
	endif
	mov oDepth, r20.z
	// ----------------------------------------------------------------------------------------------------------------------------------------------

// approximately 29 instruction slots used (3 texture, 26 arithmetic)
