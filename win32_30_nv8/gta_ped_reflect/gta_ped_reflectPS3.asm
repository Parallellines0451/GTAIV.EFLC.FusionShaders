// Summary: removed unnecessary stipple + console-like ambient reflection intensity + improved shadow filter + restored normal offset bias + improved shadow fadeout
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D BumpSampler;
//   sampler2D EnvironmentSampler;
//   sampler2D SpecSampler;
//   sampler2D StippleTexture;
//   sampler2D TextureSampler;
//   float bumpiness;
//   sampler2D damageSpecTextureSampler;
//   sampler2D damageTextureSampler;
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
//   float4 matMaterialColorScale;
//   float reflectivePower;
//   float3 specMapIntMask;
//   float specularColorFactor;
//   float specularFactor;
//
//
// Registers:
//
//   Name                     Reg   Size
//   ------------------------ ----- ----
//   gViewInverse             c12      4
//   gDepthFxParams           c16      1
//   gDirectionalLight        c17      1
//   gDirectionalColour       c18      1
//   gLightAmbient0           c37      1
//   gLightAmbient1           c38      1
//   globalScalars            c39      1
//   globalFogParams          c41      1
//   globalFogColor           c42      1
//   globalFogColorN          c43      1
//   gShadowParam18192021     c53      1
//   gFacetCentre             c54      1
//   gShadowParam14151617     c56      1
//   gShadowParam0123         c57      1
//   gShadowParam4567         c58      1
//   gShadowParam891113       c59      1
//   gShadowMatrix            c60      4
//   matMaterialColorScale    c66      1
//   reflectivePower          c72      1
//   specularFactor           c73      1
//   specularColorFactor      c74      1
//   specMapIntMask           c75      1
//   bumpiness                c76      1
//   TextureSampler           s0       1
//   EnvironmentSampler       s1       1
//   damageTextureSampler     s2       1
//   damageSpecTextureSampler s4       1
//   BumpSampler              s5       1
//   SpecSampler              s6       1
//   StippleTexture           s10      1
//   gShadowZSamplerDir       s15      1
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
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 6.6281417363e-43 // 473
    def c99, 0.1, 0, 0, 0 // normal offset bias magnitude
    def c127, 0.9999999, 1, 0, 0	// LogDepth constants
    def c0, 9.99999975e-006, -0.5, 0.5, 1.33333337
    def c1, 4, 0.125, 0.25, -0.5
    def c2, 0, 1, 0.333333343, 3.99600005
    def c3, 9.99999975e-005, 1.5, -0.326211989, -0.405809999
    def c4, -0.791558981, -0.597710013, 0.0833333358, 1.00000001e-007
    def c5, 0.212500006, 0.715399981, 0.0720999986, 0
    def c6, 1, -1, 0, -0
    def c7, 0.896420002, 0.412458003, -0.321940005, -0.932614982
    def c8, 0.185461, -0.893123984, 0.507430971, 0.0644249991
    def c9, 0.473434001, -0.480026007, 0.519456029, 0.767022014
    def c10, -0.203345001, 0.620715976, 0.962339997, -0.194983006
    def c11, -0.840143979, -0.0735799968, -0.69591397, 0.457136989
	def c100, 1.6666667, 0, 0, 0	// Reflection intensity multiplier
    dcl_texcoord v0.xy
    dcl_texcoord1 v1
    dcl_texcoord3 v2.xyz
    dcl_texcoord4 v3.xyz
    dcl_texcoord5 v4.xyz
    dcl_color v5.xw
    dcl_texcoord6 v6.x
    dcl_texcoord2 v7.xyz
    dcl vPos.xy
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s1
    dcl_2d s2
    dcl_2d s4
    dcl_2d s5
    dcl_2d s6
    dcl_2d s10
    dcl_2d s15
    texld r0, v0, s0
    texld r1, v0, s6
    mul r1.w, r1.w, c73.x
    dp3 r1.x, r1, c75
    mul r1.x, r1.x, c74.x
    if_lt -v6.x, c2.x
      texld r2, v0, s2
      if_lt -r2.w, c2.x
        texld r3, v0, s4
        add r1.y, c2.y, -v6.x
        mul r1.z, r3.w, c73.x
        lrp r3.w, v6.x, r1.z, r1.w
        add r1.z, r3.y, r3.x
        add r1.z, r3.z, r1.z
        mul r1.z, r1.z, v6.x
        mul r1.z, r1.z, c74.x
        mul r1.z, r1.z, c2.z
        mad r1.y, r1.y, r1.x, r1.z
        mad r1.z, r2.w, -v6.x, c2.y
        mul r2.xyz, r2.w, r2
        mul r2.xyz, r2, v6.x
        mad r0.xyz, r0, r1.z, r2
        mov r1.w, r3.w
      else
        mov r1.yw, r1.xxzw
      endif
    else
      mov r1.yw, r1.xxzw
    endif
    /* removed stipple
    mov_sat r1.z, c39.x
    mul r1.z, r1.z, c2.w
    frc r2.x, r1.z
    mul r2.y, r2.x, c1.x
    frc r2.z, r2.y
    add r3.x, r2.y, -r2.z
    add r3.y, r1.z, -r2.x
    mul r2.xy, c1.y, vPos
    frc r2.xy, r2_abs
    cmp r2.xy, vPos, r2, -r2
    mul r2.xy, r2, c1.z
    mad r2.xy, r3, c1.z, r2
    mov r2.zw, c2.x
    texldl r2, r2, s10
    cmp r2, -r2.y, -c2.y, -c2.x
    texkill r2
    removed stipple */
    texld r2, v0, s5
    add r1.z, -r2.w, c2.y
    add r1.z, -r2.x, r1.z
    cmp r2.xy, r1.z, r2.wyzw, r2
    add r2.zw, r2.xyxy, c1.w
    mul r2.zw, r2, c76.x
    dp2add r1.z, r2, -r2, c2.y
    rsq r1.z, r1.z
    rcp r1.z, r1.z
    mul r2.xyz, r2.z, v3
    mad r2.xyz, v1, r1.z, r2
    mad r2.xyz, r2.w, v4, r2
    add r2.xyz, r2, c0.x
    nrm r3.xyz, r2
    add r2.xyz, c0.x, v2
    nrm r4.xyz, r2
    dp3 r1.z, -r4, r3
    add r1.z, r1.z, r1.z
    mad r2.xyz, r3, -r1.z, -r4
    add r4.xyz, r2, c0.x
    dp3 r1.z, r4, r4
    rsq r1.z, r1.z
    mad r4.xy, r4.xzzw, r1.z, c2.y
    mul r4.xy, r4, c1.w
    texld r4, r4, s1
	mul r4, r4, c100.x
    texld r5, v0, s1
    mul r4.xyz, r4, r5.w
    mul r4.xyz, r1.x, r4
    mul r5.w, r0.w, v5.w
    mad r5.xyz, r4, c72.x, r0
    mad_sat r0.x, r3.z, c0.y, c0.z
    mov r4.xyz, c38
    mad r0.xyz, r4, r0.x, c37
    mul r4.xyz, c18.w, c18
    dp3 r0.w, r3, -c17
    mul r20.xyz, r3.y, c61.xyww
    mad r20.xyz, r3.x, c60.xyww, r20
    mad r20.xyz, r3.z, c62.xyww, r20
    add r0.w, r0.w, -c1.z
    mul_sat r0.w, r0.w, c0.w
    dp3_sat r1.x, -c17, r2
    add r1.x, r1.x, c3.x
    add r1.z, r1.w, c3.x
    pow r2.x, r1.x, r1.z
    mul r1.xzw, c61.xyyw, v7.y
    mad r1.xzw, v7.x, c60.xyyw, r1
    mad r1.xzw, v7.z, c62.xyyw, r1
    add r1.xzw, r1, c63.xyyw
    mad r1.xzw, r20.xxyz, c99.x, r1 // normal offset bias
    dp3 r2.y, c14, v7
    add r2.yzw, -r2.y, -c54.xxyz
    cmp r3.yzw, r2, c2.y, c2.x
    mov r3.x, c2.y
    mad r21, r3, c110.yyyw, -r3.yzww // shadow cascade mask
    dp4 r6.x, r3, c57
    dp4 r6.y, r3, c58
    dp4 r7.x, r3, c59
    dp4 r7.y, r3, c56
    mad r1.xz, r1, r6.xyyw, r7.xyyw
    add r2.yzw, c15.xxyz, -v7.xxyz
    dp3 r2.y, r2.yzww, r2.yzww
    rsq r2.y, r2.y
    rcp r2.y, r2.y
    rcp r2.z, c53.w
    mul r2.z, r2.y, r2.z
    mul r2.z, r2.z, r2.z // improved shadow fadeout
    mul r2.z, r2.z, r2.z
    mul r2.z, r2.z, c3.y
    /* removed 1.0.6.0 filter
    mov r3.y, c53.y
    mad r3.xz, r3.y, c3.zyww, r1
    texld r6, r3.xzzw, s15
    add r2.w, r1.w, -r6.x
    cmp r2.w, r2.w, c2.y, c2.x
    mad r3.xz, r3.y, c11.xyyw, r1
    texld r6, r3.xzzw, s15
    add r3.x, r1.w, -r6.x
    cmp r3.x, r3.x, c2.y, c2.x
    add r2.w, r2.w, r3.x
    mad r3.xz, r3.y, c11.zyww, r1
    texld r6, r3.xzzw, s15
    add r3.x, r1.w, -r6.x
    cmp r3.x, r3.x, c2.y, c2.x
    add r2.w, r2.w, r3.x
    mad r3.xz, r3.y, c10.xyyw, r1
    texld r6, r3.xzzw, s15
    add r3.x, r1.w, -r6.x
    cmp r3.x, r3.x, c2.y, c2.x
    add r2.w, r2.w, r3.x
    mad r3.xz, r3.y, c10.zyww, r1
    texld r6, r3.xzzw, s15
    add r3.x, r1.w, -r6.x
    cmp r3.x, r3.x, c2.y, c2.x
    add r2.w, r2.w, r3.x
    mad r3.xz, r3.y, c9.xyyw, r1
    texld r6, r3.xzzw, s15
    add r3.x, r1.w, -r6.x
    cmp r3.x, r3.x, c2.y, c2.x
    add r2.w, r2.w, r3.x
    mad r3.xz, r3.y, c9.zyww, r1
    texld r6, r3.xzzw, s15
    add r3.x, r1.w, -r6.x
    cmp r3.x, r3.x, c2.y, c2.x
    add r2.w, r2.w, r3.x
    mad r3.xz, r3.y, c8.xyyw, r1
    texld r6, r3.xzzw, s15
    add r3.x, r1.w, -r6.x
    cmp r3.x, r3.x, c2.y, c2.x
    add r2.w, r2.w, r3.x
    mad r3.xz, r3.y, c8.zyww, r1
    texld r6, r3.xzzw, s15
    add r3.x, r1.w, -r6.x
    cmp r3.x, r3.x, c2.y, c2.x
    add r2.w, r2.w, r3.x
    mad r3.xz, r3.y, c7.xyyw, r1
    texld r6, r3.xzzw, s15
    add r3.x, r1.w, -r6.x
    cmp r3.x, r3.x, c2.y, c2.x
    add r2.w, r2.w, r3.x
    mad r3.xz, r3.y, c7.zyww, r1
    texld r6, r3.xzzw, s15
    add r3.x, r1.w, -r6.x
    cmp r3.x, r3.x, c2.y, c2.x
    add r2.w, r2.w, r3.x
    mad r1.xz, r3.y, c4.xyyw, r1
    texld r3, r1.xzzw, s15
    add r1.x, r1.w, -r3.x
    cmp r1.x, r1.x, c2.y, c2.x
    add r1.x, r2.w, r1.x
    removed 1.0.6.0 filter */
	// ---------------------------------------------------------- Improved Shadow Filter ------------------------------------------------------------
	add r22, c54.w, -c54
	add r22, c53.w, -r22 // cascade distances
	dp4 r23.x, r21_abs, r22
	dp4 r23.y, r21_abs, r22.xxyz
	add r23.z, r2.y, -r23.y
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
	add r1.w, r1.w, -r20.w // apply per cascade bias
	
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
	
    mad r23, r23, r20.xyxy, r1.xzxz		// offset * texel size + UV
    mad r21, r21, r20.xyxy, r1.xzxz		// offset * texel size + UV
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
	add r25, r1.w, -r25					// depth bias
	cmp r25, r25, c110.y, c110.w
	dp4 r26.x, r25, -c110.x				// average
	
    mul r23, r22.yxxy, c114.xxyz		// offsets for 5th and 8th samples, respectively
    mul r21, r22.yxxy, c115.xxyz        // offsets for 7th and 6th samples, respectively
	
    mad r23, r23, r20.xyxy, r1.xzxz		// offset * texel size + UV
    mad r21, r21, r20.xyxy, r1.xzxz		// offset * texel size + UV
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
	add r25, r1.w, -r25					// depth bias
	cmp r25, r25, c110.y, c110.w
	dp4 r26.y, r25, -c110.x				// average
	
    mul r23, r22.yxxy, c116.xxyz		// offsets for 9th and 12th samples, respectively
    mul r21, r22.yxxy, c117.xxyz        // offsets for 11th and 10th samples, respectively
	
    mad r23, r23, r20.xyxy, r1.xzxz		// offset * texel size + UV
    mad r21, r21, r20.xyxy, r1.xzxz		// offset * texel size + UV
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
	add r25, r1.w, -r25					// depth bias
	cmp r25, r25, c110.y, c110.w
	dp4 r26.z, r25, -c110.x				// average
	
	dp3 r1.x, r26, c112.z
	// ----------------------------------------------------------------------------------------------------------------------------------------------
    add r1.x, r1.x, r2.z // mad r1.x, r1.x, c4.z, r2.z 1.0.6.0 filter average
    add r1.z, r2.y, -c53.w
    cmp r1.zw, r1.z, c6.xyxy, c6
    add r1.w, r1.x, r1.w
    cmp_sat r1.x, r1.w, r1.x, r1.z
    mul r2.xyz, r4, r2.x
    mul r2.xyz, r1.x, r2
    mul r3.xyz, r4, r0.w
    mul r1.xzw, r1.x, r3.xyyz
    mul r2.xyz, r2, c17.w
    mad r0.xyz, r0, v5.x, r1.xzww
    mov r0.w, c2.y
    mul r0, r5, r0
    mad r0.xyz, r1.y, r2, r0
    mul oC0.w, r0.w, c39.x
    add r0.w, c16.w, -v1.w
    add r1.x, -c16.z, c16.w
    rcp r1.x, r1.x
    mul_sat r0.w, r0.w, r1.x
    add r0.w, -r0.w, c2.y
    mov r1.y, c2.y
    add r1.xy, -r1.y, c16
    mul r1.y, r0.w, r1.y
    mad r0.w, r0.w, r1.x, c2.y
    dp3 r1.x, r0, c5
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
    mad r0.xyz, r0.w, r1, r0
    mul oC0.xyz, r0, c66.x
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

// approximately 224 instruction slots used (21 texture, 203 arithmetic)
