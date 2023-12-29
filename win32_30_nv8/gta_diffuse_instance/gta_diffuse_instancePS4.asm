// Summary: 256 state stipple & changed stipple channel + improved shadow filter + added PCSS thanks to robi29 + improved shadow fadeout
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D StippleTexture;
//   sampler2D TextureSampler;
//   float4 gDepthFxParams;
//   float4 gDirectionalColour;
//   float4 gDirectionalLight;
//   float4 gFacetCentre;
//   float4 gLightAmbient0;
//   float4 gLightAmbient1;
//   row_major float4x4 gShadowMatrix;
//   float4 gShadowParam0123;
//   float4 gShadowParam14151617;
//   float4 gShadowParam18192021;
//   float4 gShadowParam4567;
//   float4 gShadowParam891113;
//   sampler2D gShadowZSamplerDir;
//   row_major float4x4 gViewInverse;
//   float4 globalFogColor;
//   float4 globalFogColorN;
//   float4 globalFogParams;
//   float4 globalScalars;
//
//
// Registers:
//
//   Name                 Reg   Size
//   -------------------- ----- ----
//   gViewInverse         c12      4
//   gDepthFxParams       c16      1
//   gDirectionalLight    c17      1
//   gDirectionalColour   c18      1
//   gLightAmbient0       c37      1
//   gLightAmbient1       c38      1
//   globalScalars        c39      1
//   globalFogParams      c41      1
//   globalFogColor       c42      1
//   globalFogColorN      c43      1
//   gShadowParam18192021 c53      1
//   gFacetCentre         c54      1
//   gShadowParam14151617 c56      1
//   gShadowParam0123     c57      1
//   gShadowParam4567     c58      1
//   gShadowParam891113   c59      1
//   gShadowMatrix        c60      4
//   TextureSampler       s0       1
//   StippleTexture       s10      1
//   gShadowZSamplerDir   s15      1
//

    ps_3_0
	// ------------------------------------------------------ 1.0.4.0 Shadow Filter Constants -------------------------------------------------------
    def c110, -0.25, 1, -1, 0
    def c111, 0.159154937, 0.5, 6.28318548, -3.14159274
    def c112, 3, 7.13800001, 3, 0.3333333
    def c113, 0.75, -0.5, 0.5, 0
	defi i1, 3, 0, 0, 0
	// ----------------------------------------------------------------------------------------------------------------------------------------------
	// --------------------------------------------------------------- PCSS Constants ---------------------------------------------------------------
    def c114, 49, 1, 0.5, 0.045
    def c115, -33, 6, 0, 0
    defi i2, 12, 0, 0, 0
	// ----------------------------------------------------------------------------------------------------------------------------------------------
	// --------------------------------------------------------- Filter Utilities Constants ---------------------------------------------------------
	def c116, 0.25, 0.5, 0.75, 0 // cascade identifiers
	def c117, 0, 1, 2, 3 // filter ID's
	def c118, 0.5, 1, 1.5, 2 // blur multipliers
	def c119, 0.0001220703125, 0.00048828125, 0.00006103515625, 0.000244140625 // static texel size
	
	// Very High
    def c130, 1, 0.475, 0.1, 0.22 // x,y = 1st & 2nd cascade blur | z,w = 1st & 2nd cascade bias
	def c131, 0.19, 0.0542857, 0.5, 0.8 // x,y = 3rd & 4th cascade blur | z,w = 3rd & 4th cascade bias
	def c132, 9.5, 0.0246914, 9.2105263, 0.15 // depth based blur | x = start, y = 1/(end - start), z = maximum blur, w = maximum bias
	
	// High
	def c133, 1, 0.4, 0.22, 0.42
	def c134, 0.1538462, 0.0571429, 1.07, 1.22
	def c135, 10, 0.0181818, 8.75, 0.15
	
	// Medium
	def c136, 2, 0.7878788, 0.28, 0.53
	def c137, 0.2888888, 0.1485714, 0.98, 1.08
	def c138, 13, 0.0129870, 6.7307692, 0.15
	
	// Low
	def c139, 2, 0.8888888, 0.5, 0.8
	def c140, 0.4444444, 0.2285714, 1.35, 1.5
	def c141, 20, 0.0142857, 4.375, 0.15
	// ----------------------------------------------------------------------------------------------------------------------------------------------
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 2.2841164968e-43 // 163
    def c150, 15.996, 16, 0.0625, 0.0625	// 256 state stipple constants
    def c127, 0.9999999, 1, 0, 0	// LogDepth constants
    def c0, -0.5, 0.5, -0.25, 1.33333337
    def c1, 1, 0, 1.5, 1
    def c2, 1, -1, 0, -0
    def c3, 3.99600005, 4, 0.125, 1.00000001e-007
    def c4, 0.212500006, 0.715399981, 0.0720999986, 0
    def c5, -0.321940005, -0.932614982, -0.791558981, -0.597710013
    def c6, 0.507430971, 0.0644249991, 0.896420002, 0.412458003
    def c7, 0.519456029, 0.767022014, 0.185461, -0.893123984
    def c8, 0.962339997, -0.194983006, 0.473434001, -0.480026007
    def c9, -0.69591397, 0.457136989, -0.203345001, 0.620715976
    def c10, -0.326211989, -0.405809999, -0.840143979, -0.0735799968
    dcl_color v0.xw
    dcl_texcoord v1.xy
    dcl_texcoord1 v2.xyz
    dcl_texcoord2 v3
    dcl vPos.xy
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s10
    dcl_2d s15
    texld r0, v1, s0
    mul r0.w, r0.w, v0.w
    mad_sat r1.x, v3.z, c0.x, c0.y
    mov r2.xyz, c38
    mad r1.xyz, r2, r1.x, c37
    mul r2.xyz, c18.w, c18
    dp3 r1.w, v3, -c17
    add r1.w, r1.w, c0.z
    mul_sat r1.w, r1.w, c0.w
    mul r3.xyz, c61.xyww, v2.y
    mad r3.xyz, v2.x, c60.xyww, r3
    mad r3.xyz, v2.z, c62.xyww, r3
    add r3.xyz, r3, c63.xyww
    dp3 r2.w, c14, v2
    add r4.xyz, -r2.w, -c54
    cmp r4.yzw, r4.xxyz, c1.x, c1.y
    mov r4.x, c1.x
    dp4 r5.x, r4, c57
    dp4 r5.y, r4, c58
    dp4 r6.x, r4, c59
    dp4 r6.y, r4, c56
    mad r3.xy, r3, r5, r6
    add r4.xyz, c15, -v2
    dp3 r2.w, r4, r4
    rsq r2.w, r2.w
    rcp r2.w, r2.w
    rcp r3.w, c53.w
    mul r3.w, r2.w, r3.w
    mul r3.w, r3.w, r3.w // improved shadow fadeout
    mul r3.w, r3.w, r3.w
    mul r3.w, r3.w, c1.z
    /* removed 1.0.6.0 filter
    mov r4.y, c53.y
    mad r4.xz, r4.y, c10.xyyw, r3.xyyw
    texld r5, r4.xzzw, s15
    add r4.x, r3.z, -r5.x
    cmp r4.x, r4.x, c1.x, c1.y
    mad r4.zw, r4.y, c10, r3.xyxy
    texld r5, r4.zwzw, s15
    add r4.z, r3.z, -r5.x
    cmp r4.z, r4.z, c1.x, c1.y
    add r4.x, r4.x, r4.z
    mad r4.zw, r4.y, c9.xyxy, r3.xyxy
    texld r5, r4.zwzw, s15
    add r4.z, r3.z, -r5.x
    cmp r4.z, r4.z, c1.x, c1.y
    add r4.x, r4.x, r4.z
    mad r4.zw, r4.y, c9, r3.xyxy
    texld r5, r4.zwzw, s15
    add r4.z, r3.z, -r5.x
    cmp r4.z, r4.z, c1.x, c1.y
    add r4.x, r4.x, r4.z
    mad r4.zw, r4.y, c8.xyxy, r3.xyxy
    texld r5, r4.zwzw, s15
    add r4.z, r3.z, -r5.x
    cmp r4.z, r4.z, c1.x, c1.y
    add r4.x, r4.x, r4.z
    mad r4.zw, r4.y, c8, r3.xyxy
    texld r5, r4.zwzw, s15
    add r4.z, r3.z, -r5.x
    cmp r4.z, r4.z, c1.x, c1.y
    add r4.x, r4.x, r4.z
    mad r4.zw, r4.y, c7.xyxy, r3.xyxy
    texld r5, r4.zwzw, s15
    add r4.z, r3.z, -r5.x
    cmp r4.z, r4.z, c1.x, c1.y
    add r4.x, r4.x, r4.z
    mad r4.zw, r4.y, c7, r3.xyxy
    texld r5, r4.zwzw, s15
    add r4.z, r3.z, -r5.x
    cmp r4.z, r4.z, c1.x, c1.y
    add r4.x, r4.x, r4.z
    mad r4.zw, r4.y, c6.xyxy, r3.xyxy
    texld r5, r4.zwzw, s15
    add r4.z, r3.z, -r5.x
    cmp r4.z, r4.z, c1.x, c1.y
    add r4.x, r4.x, r4.z
    mad r4.zw, r4.y, c6, r3.xyxy
    texld r5, r4.zwzw, s15
    add r4.z, r3.z, -r5.x
    cmp r4.z, r4.z, c1.x, c1.y
    add r4.x, r4.x, r4.z
    mad r4.zw, r4.y, c5.xyxy, r3.xyxy
    texld r5, r4.zwzw, s15
    add r4.z, r3.z, -r5.x
    cmp r4.z, r4.z, c1.x, c1.y
    add r4.x, r4.x, r4.z
    mad r3.xy, r4.y, c5.zwzw, r3
    texld r5, r3, s15
    add r3.x, r3.z, -r5.x
    cmp r3.x, r3.x, c1.x, c1.y
    add r3.x, r4.x, r3.x
    removed 1.0.6.0 filter */
	// ------------------------------------------------------------- Per Setting Tweaks -------------------------------------------------------------
	mov r20.x, c221.y
	if_eq r20.x, c117.w // High
		mov r23, c133
		mov r24, c134
		mov r27, c135
	else
	if_eq r20.x, c117.z // Medium
		mov r23, c136
		mov r24, c137
		mov r27, c138
	else
	if_eq r20.x, c117.y // Low
		mov r23, c139
		mov r24, c140
		mov r27, c141
	else                // Very High
		mov r23, c130
		mov r24, c131
		mov r27, c132
	endif
	endif
	endif
	// ----------------------------------------------------------------------------------------------------------------------------------------------
	// ------------------------------------------------------------- Per Cascade Tweaks -------------------------------------------------------------
    add r21.xyz, r3.x, -c116.xyz
    cmp r22.xy, r21.x, r23.yw, r23.xz
    cmp r22.xy, r21.y, r24.xz, r22.xy
    cmp r22.xy, r21.z, r24.yw, r22.xy	// r22.x = per cascade blur, r22.y = per cascade bias
	
	mov r20.xy, c119.xy					// static texel size instead of c53.xy
    mul r20.xy, r20.xy, r22.x			// reduce cascade blur disparity
	add r3.z, r3.z, -r22.y				// improve depth bias for 2nd, 3rd and 4th cascade
	// ----------------------------------------------------------------------------------------------------------------------------------------------
	// -------------------------------------------------------------- Filter Selection --------------------------------------------------------------
	mov r20.z, c223.y
    add r21.xyz, r20.z, -c117.yzw
    cmp r20.w, r21.x, c118.y, c118.x
    cmp r20.w, r21.y, c118.z, r20.w
    cmp r20.w, r21.z, c118.w, r20.w // "Sharp", "Soft", "Softer" & "Softest"
	
	if_gt r20.z, c117.w // "PCSS"
		mov r21.y, c110.w // blockers
	
		mul r22.xy, r22.xx, c115.xy // pcss texel step
	
		mov r23.xy, r22.xx // x - inner loop index, y - outer loop index
		mov r24.x, c110.w // sum
	
		rep i2
			mul r21.w, r23.y, c114.w
	
			rep i2
				mad r25.xy, c119.zw, r23.xy, r3.xy
				texldl r26, r25.xy, s15
	
				add r25.x, r26.x, -r3.z
	
				if_gt r25.x, r21.w
					min r25.x, r25.x, c114.x // < 49
					add r24.x, r24.x, r25.x
					add r21.y, r21.y, c110.y
				endif
	
				add r23.x, r23.x, r22.y // j++
			endrep
			add r23.y, r23.y, r22.y // i++
			mov r23.x, r22.x // j = -33
		endrep
	
		// avg if any blockers
		if_gt r21.y, c110.w
			rcp r21.y, r21.y
			mul r24.x, r24.x, r21.y
			rsq r24.x, r24.x
			rcp r24.x, r24.x
			max r20.w, r24.x, c114.z // minimum factor
		else
			mov r20.w, c114.z
		endif
	endif
	// ----------------------------------------------------------------------------------------------------------------------------------------------
	// ------------------------------------------------------------ Depth Based Blur ------------------------------------------------------------
	mov r20.z, c110.w
	add r21.x, r2.w, -r27.x
	mul_sat r21.x, r21.x, r27.y
	mul r21.x, r21.x, r21.x
	lrp r22.xy, r21.x, r27.zw, r20.wz // r22.x = blur factor, r22.y = bias factor
	
	mul r20.xy, r20.xy, r22.x
	add r3.z, r3.z, r22.y
	// ----------------------------------------------------------------------------------------------------------------------------------------------
	// ----------------------------------------------------------- 1.0.4.0 Shadow Filter ------------------------------------------------------------
    mov r21.xy, c112.xy
    dp2add r21.y, vPos, r21, c110.w		// v0.x * r21.x + v0.y * r21.y
    mad r21.y, r21.y, c111.x, c111.y
    frc r21.y, r21.y
    mad r21.y, r21.y, c111.z, c111.w	// r21.y * 2pi - pi
    sincos r22.xy, r21.y				// sine & cosine of r21.y

	mul r20.xy, r20.xy, c112.z			// blur factor
	mul r20.xy, r20.xy, c112.w			// compensate blur for extra iterations
	
	mov r20.zw, c110.w
	
	mov r26, c110.xxyz					// copy offsets for 1st and 4th samples, respectively
	mov r27, c113.xxyz					// copy offsets for 3rd and 2nd samples, respectively
	
	rep i1
		mul r23, r22.yxxy, r26
		mul r21, r22.yxxy, r27
		
		mad r24.xy, r23.xy, r20.xy, r3.xy	// offset * texel size + UV
		texld r24, r24, s15					// 1st sample
		mov r25.x, r24.x					// copy to r25
		mad r24.xy, r21.zw, r20.xy, r3.xy	// offset * texel size + UV
		texld r24, r24, s15					// 2nd sample
		mov r25.y, r24.x					// copy to r25
		mad r24.xy, r21.xy, r20.xy, r3.xy	// offset * texel size + UV
		texld r24, r24, s15					// 3rd sample
		mov r25.z, r24.x					// copy to r25
		mad r24.xy, r23.zw, r20.xy, r3.xy	// offset * texel size + UV
		texld r24, r24, s15					// 4th sample
		mov r25.w, r24.x					// copy to r25
	
		add r25, r3.z, -r25					// depth bias
		cmp r25, r25, c110.y, c110.w
		dp4 r20.w, r25, -c110.x				// average samples of current iteration
		add r20.z, r20.z, r20.w
		
		add r26, r26, c110.zzyz				// add (-1, -1, 1, -1)
		add r27, r27, -c110.zzyz			// add (1, 1, -1, 1)
	endrep
	
	mul r3.x, r20.z, c112.w					// average all iterations
	// ----------------------------------------------------------------------------------------------------------------------------------------------
    mad r3.x, r3.x, c1.w, r3.w
    add r2.w, r2.w, -c53.w
    cmp r3.yz, r2.w, c2.xxyw, c2.xzww
    add r2.w, r3.x, r3.z
    cmp_sat r2.w, r2.w, r3.x, r3.y
    mul r2.xyz, r2, r1.w
    mul r2.xyz, r2.w, r2
    mad r1.xyz, r1, v0.x, r2
    mov r1.w, c1.x
    mul r2, r0, r1
    mul r0.w, r2.w, c39.x
    mov_sat r1.w, r0.w
    mul r1.w, r1.w, c150.x
    frc r2.w, r1.w
    mul r3.x, r2.w, c150.y
    frc r3.y, r3.x
    add r3.x, r3.x, -r3.y
    add r3.y, r1.w, -r2.w
    mul r3.zw, c150.z, vPos.xyxy
    frc r3.zw, r3_abs
    cmp r3.zw, vPos.xyxy, r3, -r3
    mul r3.zw, r3, c150.w
    mad r3.xy, r3, c150.w, r3.zwzw
    mov r3.zw, c1.y
    texldl r3, r3, s10
    cmp r3, -r3.x, -c1.x, -c1.y
    texkill r3
    add r1.w, c16.w, -v3.w
    add r2.w, -c16.z, c16.w
    rcp r2.w, r2.w
    mul_sat r1.w, r1.w, r2.w
    add r1.w, -r1.w, c1.x
    mov r3.x, c1.x
    add r3.xy, -r3.x, c16
    mul r2.w, r1.w, r3.y
    mad r1.w, r1.w, r3.x, c1.x
    dp3 r2.x, r2, c4
    mad r0.xyz, r0, r1, -r2.x
    mad r0.xyz, r1.w, r0, r2.x
    add r1.x, r2.x, c3.w
    pow r3.x, r1_abs.x, r2.w
    mul r1.xyz, r0, r3.x
    rcp r1.w, c41.x
    mul_sat r1.w, r1.w, v3.w
    add r2.x, -c41.x, v3.w
    add r2.y, -c41.x, c41.y
    rcp r2.y, r2.y
    mul_sat r2.x, r2.x, r2.y
    lrp r3.y, c41.w, r1.w, r2.x
    add r1.w, r3.y, c41.z
    mov r4.xyz, c43
    add r2.yzw, -r4.xxyz, c42.xxyz
    mad r2.xyz, r2.x, r2.yzww, c43
    mad r0.xyz, r0, -r3.x, r2
    mad oC0.xyz, r1.w, r0, r1
    mov oC0.w, r0.w
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

// approximately 149 instruction slots used (15 texture, 134 arithmetic)
