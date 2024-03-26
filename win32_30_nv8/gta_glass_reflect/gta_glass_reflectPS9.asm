// Summary: removed unnecessary stipple + console-like ambient reflection intensity + improved shadow filter + added PCSS thanks to robi29 + improved shadow fadeout
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D EnvironmentSampler;
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
//   float reflectivePower;
//   float specularColorFactor;
//   float specularFactor;
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
//   specularFactor       c66      1
//   specularColorFactor  c72      1
//   reflectivePower      c73      1
//   TextureSampler       s0       1
//   EnvironmentSampler   s1       1
//   StippleTexture       s10      1
//   gShadowZSamplerDir   s15      1
//

    ps_3_0
	// ----------------------------------------------------- Improved Shadow Filter Constants -------------------------------------------------------
    def c110, -0.25, 1, -1, 0
    def c111, 0.159154937, 0.5, 6.28318548, -3.14159274
    def c112, 3, 7.13800001, 0.3333333, 0
    def c113, 0.75, -0.5, 0.5, 0
	def c114, -1.25, 2, -2, 0 // c114-c117 = offsets for extra samples
	def c115, 1.75, -1.5, 1.5, 0
	def c116, -2.25, 3, -3, 0
	def c117, 2.75, -2.5, 2.5, 0
	
    def c118, 0.1, 0.22, 0.5, 0.8 // c118-c121 = biases for each cascade of each quality setting
    def c119, 0.22, 0.42, 1.07, 1.22
    def c120, 0.28, 0.53, 0.98, 1.08
    def c121, 0.5, 0.8, 1.35, 1.5
	
	def c122, 4, 3, 2, 1 // quality ID's
	def c123, 0.15, 0, 0, 0 // end bias
	
	def c124, -17, 6, 0.045, 0 // PCSS constants
    defi i1, 6, 0, 0, 0
	// ----------------------------------------------------------------------------------------------------------------------------------------------
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 3.4191682530e-43 // 244
    def c127, 0.9999999, 1, 0, 0	// LogDepth constants
    def c0, 0, -1, -0, 9.99999975e-006
    def c1, -0.5, -0.00999999978, 100, 0.5
    def c2, 1.33333337, 9.99999975e-005, 1.5, 0.0833333358
    def c3, 3.99600005, 4, 0.125, 0.25
    def c4, 0.212500006, 0.715399981, 0.0720999986, 1.00000001e-007
    def c5, 1, -1, 0, -0
    def c6, -0.321940005, -0.932614982, -0.791558981, -0.597710013
    def c7, 0.507430971, 0.0644249991, 0.896420002, 0.412458003
    def c8, 0.519456029, 0.767022014, 0.185461, -0.893123984
    def c9, 0.962339997, -0.194983006, 0.473434001, -0.480026007
    def c10, -0.69591397, 0.457136989, -0.203345001, 0.620715976
    def c11, -0.326211989, -0.405809999, -0.840143979, -0.0735799968
	def c100, 1.6666667, 0, 0, 0	// Reflection intensity multiplier
    dcl_texcoord v0.xy
    dcl_texcoord1 v1
    dcl_texcoord3 v2.xyz
    dcl_color v3.xw
    dcl_texcoord6 v4.xyz
    dcl vPos.xy
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s1
    dcl_2d s10
    dcl_2d s15
    /* removed stipple
    mov_sat r0.x, c39.x
    mul r0.x, r0.x, c3.x
    frc r0.y, r0.x
    mul r0.z, r0.y, c3.y
    frc r0.w, r0.z
    add r1.xy, r0.zxzw, -r0.wyzw
    mul r0.xy, c3.z, vPos
    frc r0.xy, r0_abs
    cmp r0.xy, vPos, r0, -r0
    mul r0.xy, r0, c3.w
    mad r0.xy, r1, c3.w, r0
    mov r0.zw, c0.x
    texldl r0, r0, s10
    cmp r0, -r0.y, c0.y, c0.z
    texkill r0
    removed stipple */
    texld r0, v0, s0
    add r1.xyz, c0.w, v1
    nrm r2.xyz, r1
    add r1.xyz, c0.w, v2
    nrm r3.xyz, r1
    dp3 r1.x, -r3, r2
    add r1.x, r1.x, r1.x
    mad r1.xyz, r2, -r1.x, -r3
    add r3.xyz, r1, c0.w
    dp3 r1.w, r3, r3
    rsq r1.w, r1.w
    mad r3.xy, r3.xzzw, r1.w, -c0.y
    mul r3.xy, r3, c1.x
    texld r3, r3, s1
	mul r3, r3, c100.x
    mul r3.xyz, r3, c72.x
    mul r3.xyz, r3, c73.x
    mul r4.w, r0.w, v3.w
    mad r0.w, r0.w, v3.w, c1.y
    rcp r1.w, r4.w
    cmp r0.w, r0.w, r1.w, c1.z
    mad r4.xyz, r3, r0.w, r0
    mad_sat r0.x, r2.z, c1.x, c1.w
    mov r3.xyz, c38
    mad r0.xyz, r3, r0.x, c37
    mul r3.xyz, c18.w, c18
    dp3 r0.w, r2, -c17
    add r0.w, r0.w, -c3.w
    mul_sat r0.w, r0.w, c2.x
    dp3_sat r1.x, -c17, r1
    add r1.x, r1.x, c2.y
    mov r1.y, c2.y
    add r1.y, r1.y, c66.x
    pow r2.x, r1.x, r1.y
    mul r1.xyz, c61.xyww, v4.y
    mad r1.xyz, v4.x, c60.xyww, r1
    mad r1.xyz, v4.z, c62.xyww, r1
    add r1.xyz, r1, c63.xyww
    dp3 r1.w, c14, v4
    add r2.yzw, -r1.w, -c54.xxyz
    cmp r5.yzw, r2, -c0.y, -c0.z
    mov r5.x, -c0.y
    mad r21, r5, c110.yyyw, -r5.yzww // shadow cascade mask
    dp4 r6.x, r5, c57
    dp4 r6.y, r5, c58
    dp4 r7.x, r5, c59
    dp4 r7.y, r5, c56
    mad r1.xy, r1, r6, r7
    add r2.yzw, c15.xxyz, -v4.xxyz
    dp3 r1.w, r2.yzww, r2.yzww
    rsq r1.w, r1.w
    rcp r1.w, r1.w
    rcp r2.y, c53.w
    mul r2.y, r1.w, r2.y
    mul r2.y, r2.y, r2.y // improved shadow fadeout
    mul r2.y, r2.y, r2.y
    mul r2.y, r2.y, c2.z
    /* removed 1.0.6.0 filter
    mov r5.y, c53.y
    mad r2.zw, r5.y, c11.xyxy, r1.xyxy
    texld r6, r2.zwzw, s15
    add r2.z, r1.z, -r6.x
    cmp r2.z, r2.z, -c0.y, -c0.z
    mad r5.xz, r5.y, c11.zyww, r1.xyyw
    texld r6, r5.xzzw, s15
    add r2.w, r1.z, -r6.x
    cmp r2.w, r2.w, -c0.y, -c0.z
    add r2.z, r2.z, r2.w
    mad r5.xz, r5.y, c10.xyyw, r1.xyyw
    texld r6, r5.xzzw, s15
    add r2.w, r1.z, -r6.x
    cmp r2.w, r2.w, -c0.y, -c0.z
    add r2.z, r2.z, r2.w
    mad r5.xz, r5.y, c10.zyww, r1.xyyw
    texld r6, r5.xzzw, s15
    add r2.w, r1.z, -r6.x
    cmp r2.w, r2.w, -c0.y, -c0.z
    add r2.z, r2.z, r2.w
    mad r5.xz, r5.y, c9.xyyw, r1.xyyw
    texld r6, r5.xzzw, s15
    add r2.w, r1.z, -r6.x
    cmp r2.w, r2.w, -c0.y, -c0.z
    add r2.z, r2.z, r2.w
    mad r5.xz, r5.y, c9.zyww, r1.xyyw
    texld r6, r5.xzzw, s15
    add r2.w, r1.z, -r6.x
    cmp r2.w, r2.w, -c0.y, -c0.z
    add r2.z, r2.z, r2.w
    mad r5.xz, r5.y, c8.xyyw, r1.xyyw
    texld r6, r5.xzzw, s15
    add r2.w, r1.z, -r6.x
    cmp r2.w, r2.w, -c0.y, -c0.z
    add r2.z, r2.z, r2.w
    mad r5.xz, r5.y, c8.zyww, r1.xyyw
    texld r6, r5.xzzw, s15
    add r2.w, r1.z, -r6.x
    cmp r2.w, r2.w, -c0.y, -c0.z
    add r2.z, r2.z, r2.w
    mad r5.xz, r5.y, c7.xyyw, r1.xyyw
    texld r6, r5.xzzw, s15
    add r2.w, r1.z, -r6.x
    cmp r2.w, r2.w, -c0.y, -c0.z
    add r2.z, r2.z, r2.w
    mad r5.xz, r5.y, c7.zyww, r1.xyyw
    texld r6, r5.xzzw, s15
    add r2.w, r1.z, -r6.x
    cmp r2.w, r2.w, -c0.y, -c0.z
    add r2.z, r2.z, r2.w
    mad r5.xz, r5.y, c6.xyyw, r1.xyyw
    texld r6, r5.xzzw, s15
    add r2.w, r1.z, -r6.x
    cmp r2.w, r2.w, -c0.y, -c0.z
    add r2.z, r2.z, r2.w
    mad r1.xy, r5.y, c6.zwzw, r1
    texld r5, r1, s15
    add r1.x, r1.z, -r5.x
    cmp r1.x, r1.x, -c0.y, -c0.z
    add r1.x, r2.z, r1.x
    removed 1.0.6.0 filter */
	// ---------------------------------------------------------- Improved Shadow Filter ------------------------------------------------------------
	add r22, c54.w, -c54
	add r22, c53.w, -r22 // cascade distances
	rcp r23.x, r22.x
	dp4 r23.y, r22, r21_abs
	rcp r23.y, r23.y
	mul r20.z, r23.y, r22.x
	mul r20.xy, c53.xy, r20.z // apply per cascade blur
	mov r24, c122
	add r24, r24, -c221.y
	add_sat r24, c110.y, -r24_abs
	m4x4 r25, r21_abs, c118
	dp4 r20.w, r25, r24
	mov r24, c110.ywww
	add r1.z, r1.z, -r20.w // apply per cascade bias
	if_ne r24.z, c223.y // PCSS
		mov r24.xyw, c110.w // sum
		mul r25.xy, r20.z, c124.xy // pcss texel step
		mov r25.zw, r25.x // x - inner loop index, y - outer loop index
		rep i1
			mul r24.z, r25.w, c124.z
			rep i1
				mad r26.xy, c53.xy, r25.zw, r1.xy
				texldl r27, r26.xy, s15
				add r26.x, r27.x, -r1.z
				if_gt r26.x, r24.z
					min r26.x, r26.x, -c124.x
					add r24.x, r24.x, r26.x
					add r24.w, r24.w, c110.y // blockers
				endif
				add r25.z, r25.z, r25.y // j++
			endrep
			add r25.w, r25.w, r25.y // i++
			mov r25.z, r25.x // j = -33
		endrep
		if_gt r24.w, c110.w // avg if any blockers
			rcp r24.w, r24.w
			mul r24.x, r24.x, r24.w
			rsq r24.x, r24.x
			rcp r24.x, r24.x
			max r24.x, r24.x, c111.y // minimum factor
		else
			mov r24.x, c110.y
		endif
	endif
	add r22.x, r1.w, -r22.x
	add r22.y, c54.z, -c54.x
	rcp r22.y, r22.y
	mul_sat r22.x, r22.x, r22.y
	mul r22.x, r22.x, r22.x
	mul r22.y, r23.x, c53.w
	mov r22.z, c123.x
	lrp r23.xy, r22.x, r22.yz, r24.xy
	mul r20.xy, r20.xy, r23.x // apply depth based blur
	add r1.z, r1.z, r23.y // apply depth based bias
	
    mov r21.xy, c112.xy
    dp2add r21.y, vPos, r21, c110.w		// v0.x * r21.x + v0.y * r21.y
    mad r21.y, r21.y, c111.x, c111.y
    frc r21.y, r21.y
    mad r21.y, r21.y, c111.z, c111.w	// r21.y * 2pi - pi
    sincos r22.xy, r21.y				// cosine & sine of r21.y
    mul r23, r22.yxxy, c110.xxyz		// offsets for 1st and 4th samples, respectively
    mul r21, r22.yxxy, c113.xxyz        // offsets for 3rd and 2nd samples, respectively
	mul r20.xy, r20.xy, c221.w			// compensate for FixCascadedShadowMapResolution
	
    mad r23, r23, r20.xyxy, r1.xyxy		// offset * texel size + UV
    mad r21, r21, r20.xyxy, r1.xyxy		// offset * texel size + UV
    texld r24, r23.xy, s15				// 1st sample
    mov r25.x, r24.x					// copy to r25
    texld r24, r21.zw, s15				// 2nd sample
    mov r25.y, r24.x					// copy to r25
    texld r24, r21.xy, s15				// 3rd sample
    mov r25.z, r24.x					// copy to r25
    texld r24, r23.zw, s15				// 4th sample
    mov r25.w, r24.x					// copy to r25
	add r25, r1.z, -r25					// depth bias
	cmp r25, r25, c110.y, c110.w
	dp4 r26.x, r25, -c110.x				// average
	
    mul r23, r22.yxxy, c114.xxyz		// offsets for 5th and 8th samples, respectively
    mul r21, r22.yxxy, c115.xxyz        // offsets for 7th and 6th samples, respectively
	
    mad r23, r23, r20.xyxy, r1.xyxy		// offset * texel size + UV
    mad r21, r21, r20.xyxy, r1.xyxy		// offset * texel size + UV
    texld r24, r23.xy, s15				// 5th sample
    mov r25.x, r24.x					// copy to r25
    texld r24, r21.zw, s15				// 6th sample
    mov r25.y, r24.x					// copy to r25
    texld r24, r21.xy, s15				// 7th sample
    mov r25.z, r24.x					// copy to r25
    texld r24, r23.zw, s15				// 8th sample
    mov r25.w, r24.x					// copy to r25
	add r25, r1.z, -r25					// depth bias
	cmp r25, r25, c110.y, c110.w
	dp4 r26.y, r25, -c110.x				// average
	
    mul r23, r22.yxxy, c116.xxyz		// offsets for 9th and 12th samples, respectively
    mul r21, r22.yxxy, c117.xxyz        // offsets for 11th and 10th samples, respectively
	
    mad r23, r23, r20.xyxy, r1.xyxy		// offset * texel size + UV
    mad r21, r21, r20.xyxy, r1.xyxy		// offset * texel size + UV
    texld r24, r23.xy, s15				// 9th sample
    mov r25.x, r24.x					// copy to r25
    texld r24, r21.zw, s15				// 10th sample
    mov r25.y, r24.x					// copy to r25
    texld r24, r21.xy, s15				// 11th sample
    mov r25.z, r24.x					// copy to r25
    texld r24, r23.zw, s15				// 12th sample
    mov r25.w, r24.x					// copy to r25
	add r25, r1.z, -r25					// depth bias
	cmp r25, r25, c110.y, c110.w
	dp4 r26.z, r25, -c110.x				// average
	
	dp3 r1.x, r26, c112.z
	// ----------------------------------------------------------------------------------------------------------------------------------------------
    add r1.x, r1.x, r2.y // mad r1.x, r1.x, c2.w, r2.y 1.0.6.0 filter average
    add r1.y, r1.w, -c53.w
    cmp r1.yz, r1.y, c5.xxyw, c5.xzww
    add r1.z, r1.x, r1.z
    cmp_sat r1.x, r1.z, r1.x, r1.y
    mul r1.yzw, r3.xxyz, r2.x
    mul r1.yzw, r1.x, r1
    mul r2.xyz, r3, r0.w
    mul r2.xyz, r1.x, r2
    mul r1.xyz, r1.yzww, c17.w
    mad r0.xyz, r0, v3.x, r2
    mov r0.w, -c0.y
    mul r0, r4, r0
    mad r0.xyz, c72.x, r1, r0
    mul oC0.w, r0.w, c39.x
    add r0.w, c16.w, -v1.w
    add r1.x, -c16.z, c16.w
    rcp r1.x, r1.x
    mul_sat r0.w, r0.w, r1.x
    add r0.w, -r0.w, -c0.y
    mov r1.y, c0.y
    add r1.xy, r1.y, c16
    mul r1.y, r0.w, r1.y
    mad r0.w, r0.w, r1.x, -c0.y
    dp3 r1.x, r0, c4
    lrp r2.xyz, r0.w, r0, r1.x
    add r0.x, r1.x, c4.w
    pow r2.w, r0_abs.x, r1.y
    mul r0.xyz, r2, r2.w
    rcp r0.w, c41.x
    mul_sat r0.w, r0.w, v1.w
    add r1.x, -c41.x, v1.w
    add r1.y, -c41.x, c41.y
    rcp r1.y, r1.y
    mul_sat r1.x, r1.x, r1.y
    lrp r3.x, c41.w, r0.w, r1.x
    add r0.w, r3.x, c41.z
    mov r3.xyz, c43
    add r1.yzw, -r3.xxyz, c42.xxyz
    mad r1.xyz, r1.x, r1.yzww, c43
    mad r1.xyz, r2, -r2.w, r1
    mad oC0.xyz, r0.w, r1, r0
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

// approximately 180 instruction slots used (16 texture, 164 arithmetic)
