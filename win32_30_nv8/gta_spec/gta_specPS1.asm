// Summary: removed unnecessary stipple + improved shadow filter + added PCSS thanks to robi29 + improved shadow fadeout
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D SpecSampler;
//   sampler2D StippleTexture;
//   sampler2D TextureSampler;
//   float4 gDepthFxParams;
//   float4 gDirectionalColour;
//   float4 gDirectionalLight;
//   float4 gFacetCentre;
//   float4 gLightAmbient0;
//   float4 gLightAmbient1;
//   float4 gLightColB;
//   float4 gLightColG;
//   float4 gLightColR;
//   float4 gLightConeOffset;
//   float4 gLightConeOffset2;
//   float4 gLightConeScale;
//   float4 gLightConeScale2;
//   float4 gLightDir2X;
//   float4 gLightDir2Y;
//   float4 gLightDir2Z;
//   float4 gLightDirX;
//   float4 gLightDirY;
//   float4 gLightDirZ;
//   float4 gLightFallOff;
//   float4 gLightPointColB;
//   float4 gLightPointColG;
//   float4 gLightPointColR;
//   float4 gLightPointFallOff;
//   float4 gLightPointPosX;
//   float4 gLightPointPosY;
//   float4 gLightPointPosZ;
//   float4 gLightPosX;
//   float4 gLightPosY;
//   float4 gLightPosZ;
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
//   float3 specMapIntMask;
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
//   gLightPosX           c19      1
//   gLightPosY           c20      1
//   gLightPosZ           c21      1
//   gLightDirX           c22      1
//   gLightDirY           c23      1
//   gLightDirZ           c24      1
//   gLightFallOff        c25      1
//   gLightConeScale      c26      1
//   gLightConeOffset     c27      1
//   gLightColR           c29      1
//   gLightColG           c30      1
//   gLightColB           c31      1
//   gLightPointPosX      c32      1
//   gLightPointPosY      c33      1
//   gLightPointPosZ      c34      1
//   gLightPointColR      c35      1
//   gLightPointFallOff   c36      1
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
//   gLightPointColG      c64      1
//   gLightPointColB      c65      1
//   specularFactor       c66      1
//   gLightDir2X          c67      1
//   gLightDir2Y          c68      1
//   gLightDir2Z          c69      1
//   gLightConeScale2     c70      1
//   gLightConeOffset2    c71      1
//   specularColorFactor  c72      1
//   specMapIntMask       c73      1
//   TextureSampler       s0       1
//   SpecSampler          s1       1
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
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 8.2396349702e-43 // 588
    def c127, 0.9999999, 1, 0, 0	// LogDepth constants
    def c0, -0.5, 0.5, 1.33333337, 9.99999975e-005
    def c1, 1.5, -0.326211989, -0.405809999, 0.0833333358
    def c2, 0, -1, -0, 9.99999975e-006
    def c3, -0.791558981, -0.597710013, -0.100000001, 1.11111116
    def c4, 3.99600005, 4, 0.125, 0.25
    def c5, 0.212500006, 0.715399981, 0.0720999986, 1.00000001e-007
    def c6, 1, -1, 0, -0
    def c7, 0.896420002, 0.412458003, -0.321940005, -0.932614982
    def c8, 0.185461, -0.893123984, 0.507430971, 0.0644249991
    def c9, 0.473434001, -0.480026007, 0.519456029, 0.767022014
    def c10, -0.203345001, 0.620715976, 0.962339997, -0.194983006
    def c11, -0.840143979, -0.0735799968, -0.69591397, 0.457136989
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
    mul r0.x, r0.x, c4.x
    frc r0.y, r0.x
    mul r0.z, r0.y, c4.y
    frc r0.w, r0.z
    add r1.xy, r0.zxzw, -r0.wyzw
    mul r0.xy, c4.z, vPos
    frc r0.xy, r0_abs
    cmp r0.xy, vPos, r0, -r0
    mul r0.xy, r0, c4.w
    mad r0.xy, r1, c4.w, r0
    mov r0.zw, c2.x
    texldl r0, r0, s10
    cmp r0, -r0.y, c2.y, c2.z
    texkill r0
    removed stipple */
    texld r0, v0, s0
    add r1.xyz, c2.w, v1
    nrm r2.xyz, r1
    texld r1, v0, s1
    mul r2.w, r1.w, c66.x
    dp3 r1.x, r1, c73
    mul r1.x, r1.x, c72.x
    mul r0.w, r0.w, v3.w
    add r3.xyz, c2.w, v2
    nrm r4.xyz, r3
    mad_sat r1.y, r2.z, c0.x, c0.y
    mov r3.xyz, c38
    mad r3.xyz, r3, r1.y, c37
    dp3 r1.y, -r4, r2
    add r1.y, r1.y, r1.y
    mad r4.xyz, r2, -r1.y, -r4
    mul r5.xyz, c18.w, c18
    dp3 r1.y, r2, -c17
    add r1.y, r1.y, -c4.w
    mul_sat r1.y, r1.y, c0.z
    dp3_sat r1.z, -c17, r4
    add r1.z, r1.z, c0.w
    mov r3.w, c0.w
    mad r1.w, r1.w, c66.x, r3.w
    pow r3.w, r1.z, r1.w
    mul r6.xyz, c61.xyww, v4.y
    mad r6.xyz, v4.x, c60.xyww, r6
    mad r6.xyz, v4.z, c62.xyww, r6
    add r6.xyz, r6, c63.xyww
    dp3 r1.z, c14, v4
    add r7.xyz, -r1.z, -c54
    cmp r7.yzw, r7.xxyz, -c2.y, -c2.z
    mov r7.x, -c2.y
    mad r21, r7, c110.yyyw, -r7.yzww // shadow cascade mask
    dp4 r8.x, r7, c57
    dp4 r8.y, r7, c58
    dp4 r9.x, r7, c59
    dp4 r9.y, r7, c56
    mad r1.zw, r6.xyxy, r8.xyxy, r9.xyxy
    add r6.xyw, c15.xyzz, -v4.xyzz
    dp3 r4.w, r6.xyww, r6.xyww
    rsq r4.w, r4.w
    rcp r4.w, r4.w
    rcp r5.w, c53.w
    mul r5.w, r4.w, r5.w
    mul r5.w, r5.w, r5.w // improved shadow fadeout
    mul r5.w, r5.w, r5.w
    mul r5.w, r5.w, c1.x
    /* removed 1.0.6.0 filter
    mov r6.y, c53.y
    mad r6.xw, r6.y, c1.yyzz, r1.zyzw
    texld r7, r6.xwzw, s15
    add r6.x, r6.z, -r7.x
    cmp r6.x, r6.x, -c2.y, -c2.z
    mad r7.xy, r6.y, c11, r1.zwzw
    texld r7, r7, s15
    add r6.w, r6.z, -r7.x
    cmp r6.w, r6.w, -c2.y, -c2.z
    add r6.x, r6.x, r6.w
    mad r7.xy, r6.y, c11.zwzw, r1.zwzw
    texld r7, r7, s15
    add r6.w, r6.z, -r7.x
    cmp r6.w, r6.w, -c2.y, -c2.z
    add r6.x, r6.x, r6.w
    mad r7.xy, r6.y, c10, r1.zwzw
    texld r7, r7, s15
    add r6.w, r6.z, -r7.x
    cmp r6.w, r6.w, -c2.y, -c2.z
    add r6.x, r6.x, r6.w
    mad r7.xy, r6.y, c10.zwzw, r1.zwzw
    texld r7, r7, s15
    add r6.w, r6.z, -r7.x
    cmp r6.w, r6.w, -c2.y, -c2.z
    add r6.x, r6.x, r6.w
    mad r7.xy, r6.y, c9, r1.zwzw
    texld r7, r7, s15
    add r6.w, r6.z, -r7.x
    cmp r6.w, r6.w, -c2.y, -c2.z
    add r6.x, r6.x, r6.w
    mad r7.xy, r6.y, c9.zwzw, r1.zwzw
    texld r7, r7, s15
    add r6.w, r6.z, -r7.x
    cmp r6.w, r6.w, -c2.y, -c2.z
    add r6.x, r6.x, r6.w
    mad r7.xy, r6.y, c8, r1.zwzw
    texld r7, r7, s15
    add r6.w, r6.z, -r7.x
    cmp r6.w, r6.w, -c2.y, -c2.z
    add r6.x, r6.x, r6.w
    mad r7.xy, r6.y, c8.zwzw, r1.zwzw
    texld r7, r7, s15
    add r6.w, r6.z, -r7.x
    cmp r6.w, r6.w, -c2.y, -c2.z
    add r6.x, r6.x, r6.w
    mad r7.xy, r6.y, c7, r1.zwzw
    texld r7, r7, s15
    add r6.w, r6.z, -r7.x
    cmp r6.w, r6.w, -c2.y, -c2.z
    add r6.x, r6.x, r6.w
    mad r7.xy, r6.y, c7.zwzw, r1.zwzw
    texld r7, r7, s15
    add r6.w, r6.z, -r7.x
    cmp r6.w, r6.w, -c2.y, -c2.z
    add r6.x, r6.x, r6.w
    mad r1.zw, r6.y, c3.xyxy, r1
    texld r7, r1.zwzw, s15
    add r1.z, r6.z, -r7.x
    cmp r1.z, r1.z, -c2.y, -c2.z
    add r1.z, r6.x, r1.z
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
	add r6.z, r6.z, -r20.w // apply per cascade bias
	if_ne r24.z, c223.y // PCSS
		mov r24.xyw, c110.w // sum
		mul r25.xy, r20.z, c124.xy // pcss texel step
		mov r25.zw, r25.x // x - inner loop index, y - outer loop index
		rep i1
			mul r24.z, r25.w, c124.z
			rep i1
				mad r26.xy, c53.xy, r25.zw, r1.zw
				texldl r27, r26.xy, s15
				add r26.x, r27.x, -r6.z
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
	add r22.x, r4.w, -r22.x
	add r22.y, c54.z, -c54.x
	rcp r22.y, r22.y
	mul_sat r22.x, r22.x, r22.y
	mul r22.x, r22.x, r22.x
	mul r22.y, r23.x, c53.w
	mov r22.z, c123.x
	lrp r23.xy, r22.x, r22.yz, r24.xy
	mul r20.xy, r20.xy, r23.x // apply depth based blur
	add r6.z, r6.z, r23.y // apply depth based bias
	
    mov r21.xy, c112.xy
    dp2add r21.y, vPos, r21, c110.w		// v0.x * r21.x + v0.y * r21.y
    mad r21.y, r21.y, c111.x, c111.y
    frc r21.y, r21.y
    mad r21.y, r21.y, c111.z, c111.w	// r21.y * 2pi - pi
    sincos r22.xy, r21.y				// cosine & sine of r21.y
    mul r23, r22.yxxy, c110.xxyz		// offsets for 1st and 4th samples, respectively
    mul r21, r22.yxxy, c113.xxyz        // offsets for 3rd and 2nd samples, respectively
	mul r20.xy, r20.xy, c221.w			// compensate for FixCascadedShadowMapResolution
	
    mad r23, r23, r20.xyxy, r1.zwzw		// offset * texel size + UV
    mad r21, r21, r20.xyxy, r1.zwzw		// offset * texel size + UV
    texld r24, r23.xy, s15				// 1st sample
    mov r25.x, r24.x					// copy to r25
    texld r24, r21.zw, s15				// 2nd sample
    mov r25.y, r24.x					// copy to r25
    texld r24, r21.xy, s15				// 3rd sample
    mov r25.z, r24.x					// copy to r25
    texld r24, r23.zw, s15				// 4th sample
    mov r25.w, r24.x					// copy to r25
	add r25, r6.z, -r25					// depth bias
	cmp r25, r25, c110.y, c110.w
	dp4 r26.x, r25, -c110.x				// average
	
    mul r23, r22.yxxy, c114.xxyz		// offsets for 5th and 8th samples, respectively
    mul r21, r22.yxxy, c115.xxyz        // offsets for 7th and 6th samples, respectively
	
    mad r23, r23, r20.xyxy, r1.zwzw		// offset * texel size + UV
    mad r21, r21, r20.xyxy, r1.zwzw		// offset * texel size + UV
    texld r24, r23.xy, s15				// 5th sample
    mov r25.x, r24.x					// copy to r25
    texld r24, r21.zw, s15				// 6th sample
    mov r25.y, r24.x					// copy to r25
    texld r24, r21.xy, s15				// 7th sample
    mov r25.z, r24.x					// copy to r25
    texld r24, r23.zw, s15				// 8th sample
    mov r25.w, r24.x					// copy to r25
	add r25, r6.z, -r25					// depth bias
	cmp r25, r25, c110.y, c110.w
	dp4 r26.y, r25, -c110.x				// average
	
    mul r23, r22.yxxy, c116.xxyz		// offsets for 9th and 12th samples, respectively
    mul r21, r22.yxxy, c117.xxyz        // offsets for 11th and 10th samples, respectively
	
    mad r23, r23, r20.xyxy, r1.zwzw		// offset * texel size + UV
    mad r21, r21, r20.xyxy, r1.zwzw		// offset * texel size + UV
    texld r24, r23.xy, s15				// 9th sample
    mov r25.x, r24.x					// copy to r25
    texld r24, r21.zw, s15				// 10th sample
    mov r25.y, r24.x					// copy to r25
    texld r24, r21.xy, s15				// 11th sample
    mov r25.z, r24.x					// copy to r25
    texld r24, r23.zw, s15				// 12th sample
    mov r25.w, r24.x					// copy to r25
	add r25, r6.z, -r25					// depth bias
	cmp r25, r25, c110.y, c110.w
	dp4 r26.z, r25, -c110.x				// average
	
	dp3 r1.z, r26, c112.z
	// ----------------------------------------------------------------------------------------------------------------------------------------------
    add r1.z, r1.z, r5.w // mad r1.z, r1.z, c1.w, r5.w 1.0.6.0 filter average
    add r1.w, r4.w, -c53.w
    cmp r6.xy, r1.w, c6, c6.zwzw
    add r1.w, r1.z, r6.y
    cmp_sat r1.z, r1.w, r1.z, r6.x
    mul r6.xyz, r5, r3.w
    mul r6.xyz, r1.z, r6
    mul r5.xyz, r5, r1.y
    mul r1.yzw, r1.z, r5.xxyz
    mad r1.yzw, r3.xxyz, v3.x, r1
    mul r2.w, r2.w, c4.w
    add r3, c19, -v4.x
    add r5, c20, -v4.y
    add r7, c21, -v4.z
    mul r8, r3, r3
    mad r8, r5, r5, r8
    mad r8, r7, r7, r8
    add r9, r8, c2.w
    rsq r10.x, r9.x
    rsq r10.y, r9.y
    rsq r10.z, r9.z
    rsq r10.w, r9.w
    mov r9.y, c2.y
    mad r8, r8, -c25, -r9.y
    max r11, r8, c2.x
    mul r8, r11, r11
    mad r8, r8, r8, c3.z
    mul r11, r8, c3.w
    cmp r8, r8, r11, c2.x
    mul r11, r2.x, r3
    mad r11, r5, r2.y, r11
    mad r11, r7, r2.z, r11
    mul r8, r8, r11
    mul_sat r8, r10, r8
    mul r11, r3, -c22
    mad r11, r5, -c23, r11
    mad r11, r7, -c24, r11
    mul r11, r10, r11
    mov r12, c26
    mad_sat r11, r11, r12, c27
    mul r8, r8, r11
    mul r3, r4.x, r3
    mad r3, r4.y, r5, r3
    mad r3, r4.z, r7, r3
    mul r3, r10, r3
    log r5.x, r3_abs.x
    log r5.y, r3_abs.y
    log r5.z, r3_abs.z
    log r5.w, r3_abs.w
    mul r3, r2.w, r5
    exp r5.x, r3.x
    exp r5.y, r3.y
    exp r5.z, r3.z
    exp r5.w, r3.w
    mul r3, r8, r5
    dp4 r5.x, c29, r8
    dp4 r5.y, c30, r8
    dp4 r5.z, c31, r8
    dp4 r7.x, c29, r3
    dp4 r7.y, c30, r3
    dp4 r7.z, c31, r3
    add r1.yzw, r1, r5.xxyz
    mad r3.xyz, r6, c17.w, r7
    add r5, c32, -v4.x
    add r6, c33, -v4.y
    add r7, c34, -v4.z
    mul r8, r5, r5
    mad r8, r6, r6, r8
    mad r8, r7, r7, r8
    add r10, r8, c2.w
    rsq r11.x, r10.x
    rsq r11.y, r10.y
    rsq r11.z, r10.z
    rsq r11.w, r10.w
    mad r8, r8, -c36, -r9.y
    max r10, r8, c2.x
    mul r8, r10, r10
    mad r8, r8, r8, c3.z
    mul r10, r8, c3.w
    cmp r8, r8, r10, c2.x
    mul r10, r2.x, r5
    mad r10, r6, r2.y, r10
    mad r10, r7, r2.z, r10
    mul r8, r8, r10
    mul_sat r8, r11, r8
    mul r10, r5, -c67
    mad r10, r6, -c68, r10
    mad r10, r7, -c69, r10
    mul r10, r11, r10
    mov r12, c70
    mad_sat r10, r10, r12, c71
    mul r8, r8, r10
    mul r5, r4.x, r5
    mad r5, r4.y, r6, r5
    mad r4, r4.z, r7, r5
    mul r4, r11, r4
    log r5.x, r4_abs.x
    log r5.y, r4_abs.y
    log r5.z, r4_abs.z
    log r5.w, r4_abs.w
    mul r2, r2.w, r5
    exp r4.x, r2.x
    exp r4.y, r2.y
    exp r4.z, r2.z
    exp r4.w, r2.w
    mul r2, r8, r4
    dp4 r4.x, c35, r8
    dp4 r4.y, c64, r8
    dp4 r4.z, c65, r8
    dp4 r5.x, c35, r2
    dp4 r5.y, c64, r2
    dp4 r5.z, c65, r2
    add r2.xyz, r1.yzww, r4
    add r1.yzw, r3.xxyz, r5.xxyz
    mov r2.w, -c2.y
    mul r0, r0, r2
    mad r0.xyz, r1.x, r1.yzww, r0
    mul oC0.w, r0.w, c39.x
    add r0.w, c16.w, -v1.w
    add r1.x, -c16.z, c16.w
    rcp r1.x, r1.x
    mul_sat r0.w, r0.w, r1.x
    add r0.w, -r0.w, -c2.y
    add r1.xy, r9.y, c16
    mul r1.y, r0.w, r1.y
    mad r0.w, r0.w, r1.x, -c2.y
    dp3 r1.x, r0, c5
    lrp r2.xyz, r0.w, r0, r1.x
    add r0.x, r1.x, c5.w
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

// approximately 274 instruction slots used (16 texture, 258 arithmetic)
