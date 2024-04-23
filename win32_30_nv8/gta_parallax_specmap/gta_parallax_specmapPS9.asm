// Summary: removed unnecessary stipple + improved shadow filter + restored normal offset bias + improved shadow fadeout
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D BumpSampler;
//   sampler2D SpecSampler;
//   sampler2D StippleTexture;
//   sampler2D TextureSampler;
//   float bumpiness;
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
//   float parallaxScaleBias;
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
//   parallaxScaleBias    c66      1
//   specularFactor       c72      1
//   specularColorFactor  c73      1
//   specMapIntMask       c74      1
//   bumpiness            c75      1
//   TextureSampler       s0       1
//   BumpSampler          s1       1
//   SpecSampler          s2       1
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
	def c123, 0.16, 0.08, 0.04, 0 // 1/blend_distance
	
	def c124, 0, 0.25, 0.5, 0.75
	def c125, 0.2499, 0.4999, 0.7499, 1
	// ----------------------------------------------------------------------------------------------------------------------------------------------
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 6.2357781662e-43 // 445
    def c99, 0.1, 0, 0, 0 // normal offset bias magnitude
    def c127, 0.9999999, 1, 0, 0	// LogDepth constants
    def c0, 0.5, -0.5, -0.00200000009, 1.33333337
    def c1, 0, -1, -0, 9.99999975e-006
    def c2, 9.99999975e-005, 1.5, -0.326211989, -0.405809999
    def c3, -0.791558981, -0.597710013, 0.0833333358, 1.00000001e-007
    def c4, 3.99600005, 4, 0.125, 0.25
    def c5, 0.212500006, 0.715399981, 0.0720999986, 0
    def c6, 1, -1, 0, -0
    def c7, 0.896420002, 0.412458003, -0.321940005, -0.932614982
    def c8, 0.185461, -0.893123984, 0.507430971, 0.0644249991
    def c9, 0.473434001, -0.480026007, 0.519456029, 0.767022014
    def c10, -0.203345001, 0.620715976, 0.962339997, -0.194983006
    def c11, -0.840143979, -0.0735799968, -0.69591397, 0.457136989
    dcl_texcoord v0.xy
    dcl_texcoord1 v1
    dcl_texcoord3 v2.xyz
    dcl_texcoord4 v3.xyz
    dcl_texcoord5 v4.xyz
    dcl_color v5.xw
    dcl_texcoord6 v6.xyz
    dcl_texcoord7 v7.xyz
    dcl vPos.xy
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s1
    dcl_2d s2
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
    mov r0.zw, c1.x
    texldl r0, r0, s10
    cmp r0, -r0.y, c1.y, c1.z
    texkill r0
    removed stipple */
    texld r0, v0, s1
    add r0.xyz, c1.w, v7
    dp3 r0.z, r0, r0
    rsq r0.z, r0.z
    mul r0.xy, r0, r0.z
    mov r1.x, c0.x
    mul r0.z, r1.x, c66.x
    mad r0.z, r0.w, c66.x, -r0.z
    mad r0.xy, r0.z, r0, v0
    texld r1, r0, s1
    texld r0, r0, s0
    add r1.zw, r1.xyxy, c0.y
    mul r1.zw, r1, c75.x
    dp2add r2.x, r1, -r1, -c1.y
    rsq r2.x, r2.x
    rcp r2.x, r2.x
    mul r2.yzw, r1.z, v3.xxyz
    mad r2.xyz, v1, r2.x, r2.yzww
    mad r2.xyz, r1.w, v4, r2
    add r2.xyz, r2, c1.w
    nrm r3.xyz, r2
    texld r2, v0, s2
    dp3 r1.z, r2, c74
    mul r1.z, r1.z, c73.x
    dp2add r1.x, r1, r1, c0.z
    cmp r1.x, r1.x, -c1.y, -c1.z
    mul r4.xyz, r0, r1.x
    mul r0.x, r1.x, v5.x
    mul r0.y, r1.z, r1.x
    mul r4.w, r0.w, v5.w
    add r1.xyz, c1.w, v2
    nrm r2.xyz, r1
    mad_sat r0.z, r3.z, c0.y, c0.x
    mov r1.xyz, c38
    mad r1.xyz, r1, r0.z, c37
    dp3 r0.z, -r2, r3
    add r0.z, r0.z, r0.z
    mad r2.xyz, r3, -r0.z, -r2
    mul r5.xyz, c18.w, c18
    dp3 r0.z, r3, -c17
    mul r20.xyz, r3.y, c61.xyww
    mad r20.xyz, r3.x, c60.xyww, r20
    mad r20.xyz, r3.z, c62.xyww, r20
    add r0.z, r0.z, -c4.w
    mul_sat r0.z, r0.z, c0.w
    dp3_sat r0.w, -c17, r2
    add r0.w, r0.w, c2.x
    mov r3.xzw, c2
    mad r1.w, r2.w, c72.x, r3.x
    pow r2.x, r0.w, r1.w
    mul r2.yzw, c61.xxyw, v6.y
    mad r2.yzw, v6.x, c60.xxyw, r2
    mad r2.yzw, v6.z, c62.xxyw, r2
    add r2.yzw, r2, c63.xxyw
    mad r2.yzw, r20.xxyz, c99.x, r2 // normal offset bias
    dp3 r0.w, c14, v6
    add r6.xyz, -r0.w, -c54
    cmp r6.yzw, r6.xxyz, -c1.y, -c1.z
    mov r6.x, -c1.y
    mad r21, r6, c110.yyyw, -r6.yzww // shadow cascade mask
    dp4 r3.x, r6, c57
    dp4 r3.y, r6, c58
    dp4 r7.x, r6, c59
    dp4 r7.y, r6, c56
    mad r2.yz, r2, r3.xxyw, r7.xxyw
    add r6.xyz, c15, -v6
    dp3 r0.w, r6, r6
    rsq r0.w, r0.w
    rcp r0.w, r0.w
    rcp r1.w, c53.w
    mul r1.w, r0.w, r1.w
    mul r1.w, r1.w, r1.w // improved shadow fadeout
    mul r1.w, r1.w, r1.w
    mul r1.w, r1.w, c2.y
    /* removed 1.0.6.0 filter
    mad r3.xy, c53.y, r3.zwzw, r2.yzzw
    texld r3, r3, s15
    add r3.x, r2.w, -r3.x
    cmp r3.x, r3.x, -c1.y, -c1.z
    mov r3.y, c53.y
    mad r3.zw, r3.y, c11.xyxy, r2.xyyz
    texld r6, r3.zwzw, s15
    add r3.z, r2.w, -r6.x
    cmp r3.z, r3.z, -c1.y, -c1.z
    add r3.x, r3.x, r3.z
    mad r3.zw, r3.y, c11, r2.xyyz
    texld r6, r3.zwzw, s15
    add r3.z, r2.w, -r6.x
    cmp r3.z, r3.z, -c1.y, -c1.z
    add r3.x, r3.x, r3.z
    mad r3.zw, r3.y, c10.xyxy, r2.xyyz
    texld r6, r3.zwzw, s15
    add r3.z, r2.w, -r6.x
    cmp r3.z, r3.z, -c1.y, -c1.z
    add r3.x, r3.x, r3.z
    mad r3.zw, r3.y, c10, r2.xyyz
    texld r6, r3.zwzw, s15
    add r3.z, r2.w, -r6.x
    cmp r3.z, r3.z, -c1.y, -c1.z
    add r3.x, r3.x, r3.z
    mad r3.zw, r3.y, c9.xyxy, r2.xyyz
    texld r6, r3.zwzw, s15
    add r3.z, r2.w, -r6.x
    cmp r3.z, r3.z, -c1.y, -c1.z
    add r3.x, r3.x, r3.z
    mad r3.zw, r3.y, c9, r2.xyyz
    texld r6, r3.zwzw, s15
    add r3.z, r2.w, -r6.x
    cmp r3.z, r3.z, -c1.y, -c1.z
    add r3.x, r3.x, r3.z
    mad r3.zw, r3.y, c8.xyxy, r2.xyyz
    texld r6, r3.zwzw, s15
    add r3.z, r2.w, -r6.x
    cmp r3.z, r3.z, -c1.y, -c1.z
    add r3.x, r3.x, r3.z
    mad r3.zw, r3.y, c8, r2.xyyz
    texld r6, r3.zwzw, s15
    add r3.z, r2.w, -r6.x
    cmp r3.z, r3.z, -c1.y, -c1.z
    add r3.x, r3.x, r3.z
    mad r3.zw, r3.y, c7.xyxy, r2.xyyz
    texld r6, r3.zwzw, s15
    add r3.z, r2.w, -r6.x
    cmp r3.z, r3.z, -c1.y, -c1.z
    add r3.x, r3.x, r3.z
    mad r3.zw, r3.y, c7, r2.xyyz
    texld r6, r3.zwzw, s15
    add r3.z, r2.w, -r6.x
    cmp r3.z, r3.z, -c1.y, -c1.z
    add r3.x, r3.x, r3.z
    mad r2.yz, r3.y, c3.xxyw, r2
    texld r6, r2.yzzw, s15
    add r2.y, r2.w, -r6.x
    cmp r2.y, r2.y, -c1.y, -c1.z
    add r2.y, r3.x, r2.y
    removed 1.0.6.0 filter */
	// ---------------------------------------------------------- Improved Shadow Filter ------------------------------------------------------------
	add r22, c54.w, -c54
	add r22, c53.w, -r22 // cascade distances
	dp4 r23.x, r21_abs, r22
	dp4 r23.y, r21_abs, r22.xxyz
	add r23.z, r0.w, -r23.y
	dp4 r23.w, r21_abs, c123.xxyz
	mul_sat r23.z, r23.z, r23.w
	rcp r23.x, r23.x
	mul r23.y, r23.x, r23.y
	lrp r20.z, r23.z, c110.y, r23.y
	mul r20.xy, c53.xy, r20.z // apply pseudo cascade blending
	
	mov r24, c122
	add r24, r24, -c221.y
	add_sat r24, c110.y, -r24_abs
	m4x4 r25, r21_abs, c118
	dp4 r20.w, r25, r24
	add r2.w, r2.w, -r20.w // apply per cascade bias
	
	dp4 r20.z, r21_abs, c124 // UV clamp
	dp4 r20.w, r21_abs, c125
	
    mov r21.xy, c112.xy
    dp2add r21.y, vPos, r21, c110.w		// v0.x * r21.x + v0.y * r21.y
    mad r21.y, r21.y, c111.x, c111.y
    frc r21.y, r21.y
    mad r21.y, r21.y, c111.z, c111.w	// r21.y * 2pi - pi
    sincos r22.xy, r21.y				// cosine & sine of r21.y
    mul r23, r22.yxxy, c110.xxyz		// offsets for 1st and 4th samples, respectively
    mul r21, r22.yxxy, c113.xxyz        // offsets for 3rd and 2nd samples, respectively
	
    mad r23, r23, r20.xyxy, r2.yzyz		// offset * texel size + UV
    mad r21, r21, r20.xyxy, r2.yzyz		// offset * texel size + UV
	max r23.xz, r23, r20.z				// fix pixels leaking from one cascade to the other
	min r23.xz, r23, r20.w
	max r21.xz, r21, r20.z
	min r21.xz, r21, r20.w
    texld r24, r23.xy, s15				// 1st sample
    mov r25.x, r24.x					// copy to r25
    texld r24, r21.zw, s15				// 2nd sample
    mov r25.y, r24.x					// copy to r25
    texld r24, r21.xy, s15				// 3rd sample
    mov r25.z, r24.x					// copy to r25
    texld r24, r23.zw, s15				// 4th sample
    mov r25.w, r24.x					// copy to r25
	add r25, r2.w, -r25					// depth bias
	cmp r25, r25, c110.y, c110.w
	dp4 r26.x, r25, -c110.x				// average
	
    mul r23, r22.yxxy, c114.xxyz		// offsets for 5th and 8th samples, respectively
    mul r21, r22.yxxy, c115.xxyz        // offsets for 7th and 6th samples, respectively
	
    mad r23, r23, r20.xyxy, r2.yzyz		// offset * texel size + UV
    mad r21, r21, r20.xyxy, r2.yzyz		// offset * texel size + UV
	max r23.xz, r23, r20.z				// fix pixels leaking from one cascade to the other
	min r23.xz, r23, r20.w
	max r21.xz, r21, r20.z
	min r21.xz, r21, r20.w
    texld r24, r23.xy, s15				// 5th sample
    mov r25.x, r24.x					// copy to r25
    texld r24, r21.zw, s15				// 6th sample
    mov r25.y, r24.x					// copy to r25
    texld r24, r21.xy, s15				// 7th sample
    mov r25.z, r24.x					// copy to r25
    texld r24, r23.zw, s15				// 8th sample
    mov r25.w, r24.x					// copy to r25
	add r25, r2.w, -r25					// depth bias
	cmp r25, r25, c110.y, c110.w
	dp4 r26.y, r25, -c110.x				// average
	
    mul r23, r22.yxxy, c116.xxyz		// offsets for 9th and 12th samples, respectively
    mul r21, r22.yxxy, c117.xxyz        // offsets for 11th and 10th samples, respectively
	
    mad r23, r23, r20.xyxy, r2.yzyz		// offset * texel size + UV
    mad r21, r21, r20.xyxy, r2.yzyz		// offset * texel size + UV
	max r23.xz, r23, r20.z				// fix pixels leaking from one cascade to the other
	min r23.xz, r23, r20.w
	max r21.xz, r21, r20.z
	min r21.xz, r21, r20.w
    texld r24, r23.xy, s15				// 9th sample
    mov r25.x, r24.x					// copy to r25
    texld r24, r21.zw, s15				// 10th sample
    mov r25.y, r24.x					// copy to r25
    texld r24, r21.xy, s15				// 11th sample
    mov r25.z, r24.x					// copy to r25
    texld r24, r23.zw, s15				// 12th sample
    mov r25.w, r24.x					// copy to r25
	add r25, r2.w, -r25					// depth bias
	cmp r25, r25, c110.y, c110.w
	dp4 r26.z, r25, -c110.x				// average
	
	dp3 r2.y, r26, c112.z
	// ----------------------------------------------------------------------------------------------------------------------------------------------
    add r1.w, r2.y, r1.w // mad r1.w, r2.y, c3.z, r1.w 1.0.6.0 filter average
    add r0.w, r0.w, -c53.w
    cmp r2.yz, r0.w, c6.xxyw, c6.xzww
    add r0.w, r1.w, r2.z
    cmp_sat r0.w, r0.w, r1.w, r2.y
    mul r2.xyz, r5, r2.x
    mul r2.xyz, r0.w, r2
    mul r3.xyz, r5, r0.z
    mul r3.xyz, r0.w, r3
    mul r2.xyz, r2, c17.w
    mad r1.xyz, r1, r0.x, r3
    mov r1.w, -c1.y
    mul r1, r4, r1
    mad r0.xyz, r0.y, r2, r1
    mul oC0.w, r1.w, c39.x
    add r0.w, c16.w, -v1.w
    add r1.x, -c16.z, c16.w
    rcp r1.x, r1.x
    mul_sat r0.w, r0.w, r1.x
    add r0.w, -r0.w, -c1.y
    mov r1.y, c1.y
    add r1.xy, r1.y, c16
    mul r1.y, r0.w, r1.y
    mad r0.w, r0.w, r1.x, -c1.y
    dp3 r1.x, r0, c5
    lrp r2.xyz, r0.w, r0, r1.x
    add r0.x, r1.x, c3.w
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

// approximately 196 instruction slots used (18 texture, 178 arithmetic)
