// Summary: Fixed water tiling + robi29 & _CP_ water shadow stretching fix + improved shadow filter + added PCSS thanks to robi29 + improved shadow fadeout
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D DepthBufferSampler;
//   sampler2D ReflectTextureSampler;
//   sampler2D SurfaceTextureSampler;
//   float4 bottomSkyColour;
//   float2 currentResolution;
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
//   float4 globalScalars;
//   float4 viewProj;
//   float4 waterColour;
//   float waterReflectionScale;
//
//
// Registers:
//
//   Name                  Reg   Size
//   --------------------- ----- ----
//   gViewInverse          c12      4
//   gDirectionalLight     c17      1
//   gDirectionalColour    c18      1
//   gLightAmbient0        c37      1
//   gLightAmbient1        c38      1
//   globalScalars         c39      1
//   globalFogColor        c42      1
//   gShadowParam18192021  c53      1
//   gFacetCentre          c54      1
//   gShadowParam14151617  c56      1
//   gShadowParam0123      c57      1
//   gShadowParam4567      c58      1
//   gShadowParam891113    c59      1
//   gShadowMatrix         c60      4
//   currentResolution     c66      1
//   waterColour           c72      1
//   bottomSkyColour       c73      1
//   waterReflectionScale  c74      1
//   viewProj              c75      1
//   SurfaceTextureSampler s0       1
//   ReflectTextureSampler s1       1
//   DepthBufferSampler    s2       1
//   gShadowZSamplerDir    s15      1
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
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 1.1953075901e-42 // 853
    def c127, 0.9999999, 1, 0, 0	// LogDepth constants
    def c0, 0.125, 0.00200000009, 0.0511999987, 9.99999975e-006
    def c1, 0.00039999999, 0.00111111114, 1, 0
    def c2, 0.00999999978, 0.0454545468, 0.256000012, 1.02400005
    def c3, -0.5, 0.5, 1, 0.25
    def c4, 0.116363637, 0.465454549, 1.125, 0.0199999996
    def c5, 0.0500000007, 9.99999975e-006, 1.00001001, 0.0299999993
    def c6, 1, -1, 0.00499999989, 1.33333337
    def c7, -500, 0.25, 1000, 0.5
    def c8, 9.99999975e-005, -511, 512.000122, 1.5
    def c9, 0.0833333358, 9, 10, 3
    def c10, -0.500005007, 0.5, 0.600000024, 0.200000003
    def c11, 1, 0, 9.99999975e-006, -2
    def c12, 1, -1, 0, -0
    def c13, -0.321940005, -0.932614982, -0.791558981, -0.597710013
    def c16, 0.507430971, 0.0644249991, 0.896420002, 0.412458003
    def c19, 0.519456029, 0.767022014, 0.185461, -0.893123984
    def c20, 0.962339997, -0.194983006, 0.473434001, -0.480026007
    def c21, -0.69591397, 0.457136989, -0.203345001, 0.620715976
    def c22, -0.326211989, -0.405809999, -0.840143979, -0.0735799968
    dcl_texcoord v0
    dcl_texcoord1 v1
    dcl_texcoord2 v2
    dcl_texcoord3 v3
    dcl_texcoord4 v4.xyw
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s1
    dcl_2d s2
    dcl_2d s15
    mov r0.xy, v2
    mov r1, v2
    add r1.xyz, r1, -v3
    dp3 r0.w, r1, r1
    add r1.xyz, r1, c0.w
    nrm r2.xyz, r1
    mad r1.xy, r0.w, -c1, c1.z
    max r0.w, r1.x, c1.w
    mul r0.z, r0.w, v2.z
    dp3 r1.x, c14, r0
    add r3.xyz, -r0, c15
    dp3 r0.x, r3, r3
    rsq r0.x, r0.x
    rcp r0.x, r0.x
    add r3.xyz, -r1.x, -c54
    cmp r3.yzw, r3.xxyz, c1.z, c1.w
    mov r3.x, c3.z
    mad r21, r3, c110.yyyw, -r3.yzww // shadow cascade mask
    dp4 r4.x, r3, c57
    dp4 r4.y, r3, c58
    dp4 r5.x, r3, c59
    dp4 r5.y, r3, c56
    mul r3.xyz, c61.xyww, v2.y
    mad r3.xyz, v2.x, c60.xyww, r3
	// --------------------------------------------------------- Water shadow stretching fix ----------------------------------------------------------
	add r20.z, v2.z, -c1.z
    mad r3.xyz, r20.z, c62.xyww, r3
	// ------------------------------------------------------------------------------------------------------------------------------------------------
    add r3.xyz, r3, c63.xyww
    mad r0.yz, r3.xxyw, r4.xxyw, r5.xxyw
    /* removed 1.0.6.0 filter
    mov r3.y, c53.y
    mad r1.xz, r3.y, c22.xyyw, r0.yyzw
    texld r4, r1.xzzw, s15
    add r1.x, r3.z, -r4.x
    cmp r1.x, r1.x, c1.z, c1.w
    mad r3.xw, r3.y, c22.zyzw, r0.yyzz
    texld r4, r3.xwzw, s15
    add r1.z, r3.z, -r4.x
    cmp r1.z, r1.z, c1.z, c1.w
    add r1.x, r1.x, r1.z
    mad r3.xw, r3.y, c21.xyzy, r0.yyzz
    texld r4, r3.xwzw, s15
    add r1.z, r3.z, -r4.x
    cmp r1.z, r1.z, c1.z, c1.w
    add r1.x, r1.x, r1.z
    mad r3.xw, r3.y, c21.zyzw, r0.yyzz
    texld r4, r3.xwzw, s15
    add r1.z, r3.z, -r4.x
    cmp r1.z, r1.z, c1.z, c1.w
    add r1.x, r1.x, r1.z
    mad r3.xw, r3.y, c20.xyzy, r0.yyzz
    texld r4, r3.xwzw, s15
    add r1.z, r3.z, -r4.x
    cmp r1.z, r1.z, c1.z, c1.w
    add r1.x, r1.x, r1.z
    mad r3.xw, r3.y, c20.zyzw, r0.yyzz
    texld r4, r3.xwzw, s15
    add r1.z, r3.z, -r4.x
    cmp r1.z, r1.z, c1.z, c1.w
    add r1.x, r1.x, r1.z
    mad r3.xw, r3.y, c19.xyzy, r0.yyzz
    texld r4, r3.xwzw, s15
    add r1.z, r3.z, -r4.x
    cmp r1.z, r1.z, c1.z, c1.w
    add r1.x, r1.x, r1.z
    mad r3.xw, r3.y, c19.zyzw, r0.yyzz
    texld r4, r3.xwzw, s15
    add r1.z, r3.z, -r4.x
    cmp r1.z, r1.z, c1.z, c1.w
    add r1.x, r1.x, r1.z
    mad r3.xw, r3.y, c16.xyzy, r0.yyzz
    texld r4, r3.xwzw, s15
    add r1.z, r3.z, -r4.x
    cmp r1.z, r1.z, c1.z, c1.w
    add r1.x, r1.x, r1.z
    mad r3.xw, r3.y, c16.zyzw, r0.yyzz
    texld r4, r3.xwzw, s15
    add r1.z, r3.z, -r4.x
    cmp r1.z, r1.z, c1.z, c1.w
    add r1.x, r1.x, r1.z
    mad r3.xw, r3.y, c13.xyzy, r0.yyzz
    mad r0.yz, r3.y, c13.xzww, r0
    texld r4, r0.yzzw, s15
    add r0.y, r3.z, -r4.x
    cmp r0.y, r0.y, c1.z, c1.w
    texld r4, r3.xwzw, s15
    add r0.z, r3.z, -r4.x
    cmp r0.z, r0.z, c1.z, c1.w
    add r0.z, r1.x, r0.z
    add r0.y, r0.y, r0.z
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
	add r3.z, r3.z, -r20.w // apply per cascade bias
	if_ne r24.z, c223.y // PCSS
		mov r24.xyw, c110.w // sum
		mul r25.xy, r20.z, c124.xy // pcss texel step
		mov r25.zw, r25.x // x - inner loop index, y - outer loop index
		rep i1
			mul r24.z, r25.w, c124.z
			rep i1
				mad r26.xy, c53.xy, r25.zw, r0.yz
				texldl r27, r26.xy, s15
				add r26.x, r27.x, -r3.z
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
	add r22.x, r0.x, -r22.x
	add r22.y, c54.z, -c54.x
	rcp r22.y, r22.y
	mul_sat r22.x, r22.x, r22.y
	mul r22.x, r22.x, r22.x
	mul r22.y, r23.x, c53.w
	mov r22.z, c123.x
	lrp r23.xy, r22.x, r22.yz, r24.xy
	mul r20.xy, r20.xy, r23.x // apply depth based blur
	add r3.z, r3.z, r23.y // apply depth based bias
	
    mov r21.xy, c112.xy
    mul r21.xy, r21.xy, c44.xy			// r21.xy * screen dimensions
	add r22.xy, v0.xy, c44.zw
	rcp r22.z, v0.z
	mul r22.xy, r22.xy, r22.z
    dp2add r21.y, r22, r21, c110.w		// v0.x * r21.x + v0.y * r21.y
    mad r21.y, r21.y, c111.x, c111.y
    frc r21.y, r21.y
    mad r21.y, r21.y, c111.z, c111.w	// r21.y * 2pi - pi
    sincos r22.xy, r21.y				// cosine & sine of r21.y
    mul r23, r22.yxxy, c110.xxyz		// offsets for 1st and 4th samples, respectively
    mul r21, r22.yxxy, c113.xxyz        // offsets for 3rd and 2nd samples, respectively
	mul r20.xy, r20.xy, c221.w			// compensate for FixCascadedShadowMapResolution
	
    mad r23, r23, r20.xyxy, r0.yzyz		// offset * texel size + UV
    mad r21, r21, r20.xyxy, r0.yzyz		// offset * texel size + UV
    texld r24, r23.xy, s15				// 1st sample
    mov r25.x, r24.x					// copy to r25
    texld r24, r21.zw, s15				// 2nd sample
    mov r25.y, r24.x					// copy to r25
    texld r24, r21.xy, s15				// 3rd sample
    mov r25.z, r24.x					// copy to r25
    texld r24, r23.zw, s15				// 4th sample
    mov r25.w, r24.x					// copy to r25
	add r25, r3.z, -r25					// depth bias
	cmp r25, r25, c110.y, c110.w
	dp4 r26.x, r25, -c110.x				// average
	
    mul r23, r22.yxxy, c114.xxyz		// offsets for 5th and 8th samples, respectively
    mul r21, r22.yxxy, c115.xxyz        // offsets for 7th and 6th samples, respectively
	
    mad r23, r23, r20.xyxy, r0.yzyz		// offset * texel size + UV
    mad r21, r21, r20.xyxy, r0.yzyz		// offset * texel size + UV
    texld r24, r23.xy, s15				// 5th sample
    mov r25.x, r24.x					// copy to r25
    texld r24, r21.zw, s15				// 6th sample
    mov r25.y, r24.x					// copy to r25
    texld r24, r21.xy, s15				// 7th sample
    mov r25.z, r24.x					// copy to r25
    texld r24, r23.zw, s15				// 8th sample
    mov r25.w, r24.x					// copy to r25
	add r25, r3.z, -r25					// depth bias
	cmp r25, r25, c110.y, c110.w
	dp4 r26.y, r25, -c110.x				// average
	
    mul r23, r22.yxxy, c116.xxyz		// offsets for 9th and 12th samples, respectively
    mul r21, r22.yxxy, c117.xxyz        // offsets for 11th and 10th samples, respectively
	
    mad r23, r23, r20.xyxy, r0.yzyz		// offset * texel size + UV
    mad r21, r21, r20.xyxy, r0.yzyz		// offset * texel size + UV
    texld r24, r23.xy, s15				// 9th sample
    mov r25.x, r24.x					// copy to r25
    texld r24, r21.zw, s15				// 10th sample
    mov r25.y, r24.x					// copy to r25
    texld r24, r21.xy, s15				// 11th sample
    mov r25.z, r24.x					// copy to r25
    texld r24, r23.zw, s15				// 12th sample
    mov r25.w, r24.x					// copy to r25
	add r25, r3.z, -r25					// depth bias
	cmp r25, r25, c110.y, c110.w
	dp4 r26.z, r25, -c110.x				// average
	
	dp3 r0.y, r26, c112.z
	// ----------------------------------------------------------------------------------------------------------------------------------------------
    rcp r0.z, c53.w
    mul r0.z, r0.x, r0.z
    mul r0.z, r0.z, r0.z // improved shadow fadeout
    add r0.x, r0.x, -c53.w
    cmp r1.xz, r0.x, c12.xyyw, c12.zyww
    mul r0.x, r0.z, r0.z
    mul r0.x, r0.x, c8.w
    add r0.x, r0.y, r0.x // mad r0.x, r0.y, c9.x, r0.x 1.0.6.0 filter average
    add r0.y, r1.z, r0.x
    cmp_sat r0.x, r0.y, r0.x, r1.x
    mul r0.yz, c0.y, v2.xxyw
    texld r3, r0.yzzw, s0
    add r3, r3.zwzw, c3.x
    mul r3, r3, c0.z
    add r0.y, -r0.w, c3.z
    mul r3, r3, r0.y
    rcp r0.y, v1.z
    mul r0.y, r0.w, r0.y
    mad r3, v1.xyxy, r0.y, r3
    mul r0.yz, c2.x, v2.xxyw
	mul r0.yz, r0, c221.x // Low, Medium, High, Very High = 2, 1, 0.5, 0.25
    texld r4, r0.yzzw, s0
    add r4, r4.zwzw, c3.x
    mad r3, r4, c2.zzww, r3
    mul r0.yz, c2.y, v2.xxyw
	mul r0.yz, r0, c221.x
    texld r4, r0.yzzw, s0
    add r4, r4.zwzw, c3.x
    mul r4, r0.w, r4
    mul r0.y, r0.w, c5.x
    mad r3, r4, c4.xxyy, r3
    add r0.z, r1.w, -v4.w
    mad r1.xz, v1.w, c7.xyyw, c7.zyww
    mul_sat r0.z, r0.z, r1.x
    add r0.z, -r0.z, c3.z
    mul r0.z, r1.y, r0.z
    mul r0.z, r0.z, v1.w
    cmp r0.z, r1.y, r0.z, c1.w
    lrp r1.xy, r0.z, v4, r3.zwzw
    add r4.xy, r1, c0.w
    mov r4.z, c5.z
    dp3 r0.w, r4, r4
    rsq r0.w, r0.w
    mul r1.xyw, r4.xyzz, r0.w
    mad r0.w, r0.w, c10.x, c10.y
    mov r4.xyz, c38
    mad r4.xyz, r4, r0.w, c37
    dp3 r0.w, r2, r1.xyww
    add r0.w, r0.w, r0.w
    mad r5.xyz, r1.xyww, -r0.w, r2
    dp3 r0.w, r1.xyww, -c17
    add r0.w, r0.w, -c3.w
    mul_sat r0.w, r0.w, c6.w
    dp3_sat r1.x, -c17, r5
    add r1.x, r1.x, c8.x
    pow r1.y, r0_abs.z, c3.w
    mad r1.w, r1.y, c8.y, c8.z
    mad r1.y, r1.y, -c9.y, c9.z
    pow r2.w, r1.x, r1.w
    mul r5.xyz, c18.w, c18
    mul r6.xyz, r2.w, r5
    mul r5.xyz, r0.w, r5
    mul r5.xyz, r0.x, r5
    mul r6.xyz, r0.x, r6
    mul r6.xyz, r6, c17.w
    rcp r0.x, c66.y
    mov r7.y, -r0.x
    rcp r7.xz, c66.x
    add r7.xyz, r7, v0.xyxw
    rcp r0.x, v0.z
    mul r7.xyz, r7, r0.x
    mad r7.xyz, r7, c3.xxyw, c3.y
    texld r8, r7.zyzw, s2
	// ----------------------------------------------------------------- Log2Linear -----------------------------------------------------------------
	if_ne r8.x, c127.y
		rcp r20.x, c128.x
		mul r20.x, r20.x, c128.y
		pow r20.x, r20.x, r8.x
		mul r20.x, r20.x, c128.x	// W_clip
		
		add r20.y, r20.x, -c128.x
		add r20.z, c128.y, -c128.x
		mul r20.y, r20.y, c128.y
		mul r20.z, r20.z, r20.x
		rcp r20.z, r20.z
		mul r20.w, r20.y, r20.z		// Linear depth
		
		min r8, r20.w, c127.x		// FP error hack
	endif
	// ----------------------------------------------------------------------------------------------------------------------------------------------
    add r0.x, -c75.x, c75.y
    rcp r0.x, r0.x
    mad r0.w, c75.y, -r0.x, r8.x
    mul r0.x, r0.x, c75.y
    mul r0.x, r0.x, c75.x
    rcp r0.w, r0.w
    mad r0.x, -r0.x, r0.w, -v0.z
    pow r0.w, v0_abs.z, c4.z
    mul_sat r0.w, r0.w, c4.w
    add r0.w, r0.w, c5.x
    rcp r0.w, r0.w
    mul_sat r0.w, r0.x, r0.w
    cmp r0.x, r0.x, r0.x, c3.z
    mul r0.x, r0.x, c72.w
    mul r0.x, r0.x, c3.w
    pow r1.x, r0_abs.x, c3.w
    add_sat r0.x, r1.x, c0.x
    add r0.w, -r0.w, c3.z
    mul r0.w, r0.w, r0.w
    mul r8.xyz, r2, r0.w
    mad r3.xy, r8, c3.x, r3
    mul r3.z, r8.z, c3.x
    add r3.xyz, r3, c5.yyzw
    nrm r8.xyz, r3
    mad r3.xyz, r2, c11.xxyw, c11.z
    dp3 r0.w, r2, r8
    dp3 r1.x, r3, r3
    rsq r1.x, r1.x
    mul r2.xy, r3, r1.x
    mov r2.zw, c6.xyxy
    mul r3, r8.xyyx, r2.yyxz
    mad r1.xw, r3.zyzw, r2.wyzx, r3.xyzy
    mul r2.x, c5.w, v0.z
    rcp r2.x, r2.x
    mul r2.x, r2.x, c3.y
    max r3.x, c11.w, -r2.x
    mad r2.xy, r1.xwzw, r3.x, r7
    add r1.x, c3.z, v3.w
    mad r0.y, r1.x, c3.y, r0.y
    add r0.y, r0.y, c6.z
    add r1.x, r2.y, -r0.y
    cmp r2.z, r1.x, r2.y, r0.y
    mov r2.w, c1.w
    texldl r2, r2.xzww, s1
    mul r3.xyz, r2, c74.x
    mov r1.x, c74.x
    mad r2.xyz, r2, -r1.x, c42
    mad r2.xyz, v0.w, r2, r3
    mad r1.xyw, r6.xyzz, r1.y, r2.xyzz
    rcp r0.y, r0.x
    mul r1.xyw, r1, r0.y
    mul r2.xyz, r5, c5.x
    mov r0.y, c3.y
    mul r0.y, r0.y, c73.w
    mad r2.xyz, c72, r0.y, r2
    add r0.y, r0.w, c3.z
    cmp r0.y, -r0.w, r0.y, c3.z
    mul r0.w, r0_abs.y, r0_abs.y
    mul r0.w, r0.w, r0.w
    mul r0.y, r0_abs.y, r0.w
    mad r0.y, r0.y, c10.z, c10.w
    mul r0.y, r0.x, r0.y
    mov oC0.w, r0.x
    mul r0.x, r0.y, c3.y
    mad r0.xyw, r0.x, r1, r2.xyzz
    mul r1.xy, c5.x, v2
    texld r2, r1, s0
    mad r1.xy, r2, r1.z, c3.w
    mul r1.xzw, r5.xyyz, r1.x
    mul r2.xyz, r4, r1.y
    mul r2.xyz, r2, c9.w
    mad r1.xyz, r1.xzww, c9.w, r2
    lrp r2.xyz, r0.z, r1, r0.xyww
    mul oC0.xyz, r2, c39.y
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

// approximately 243 instruction slots used (19 texture, 224 arithmetic)
