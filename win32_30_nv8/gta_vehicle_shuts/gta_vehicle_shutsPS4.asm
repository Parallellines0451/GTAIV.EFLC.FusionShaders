// Summary: Disabled PC parameters that cause the dirt level in vehicle.ide to affect reflection intensity + improved shadow filter + restored normal offset bias + improved shadow fadeout
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D BumpSampler;
//   float3 LuminanceConstants;
//   sampler2D SpecSampler;
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
//   float4 gLightConeScale;
//   float4 gLightDirX;
//   float4 gLightDirY;
//   float4 gLightDirZ;
//   float4 gLightFallOff;
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
//   float3 matDiffuseColor;
//   float reflectivePowerED;
//   float3 specMapIntMask;
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
//   matDiffuseColor      c66      1
//   specMapIntMask       c72      1
//   reflectivePowerED    c73      1
//   LuminanceConstants   c74      1
//   TextureSampler       s0       1
//   BumpSampler          s1       1
//   SpecSampler          s2       1
//   gShadowZSamplerDir   s15      1
//

    ps_3_0
	// ----------------------------------------------------- Improved Shadow Filter Constants -------------------------------------------------------
    def c110, -0.25, 1, -1, 0
    def c111, 0.159154937, 0.5, 6.28318548, -3.14159274
    def c112, 3, 7.13800001, 0, 0
    def c113, 0.75, -0.5, 0.5, 0
	
    def c114, 0.1, 0.22, 0.5, 0.8 // c114-c117 = biases for each cascade of each quality setting
    def c115, 0.22, 0.42, 1.07, 1.22
    def c116, 0.28, 0.53, 0.98, 1.08
    def c117, 0.5, 0.8, 1.35, 1.5
	
	def c118, 4, 3, 2, 1 // quality ID's
	def c119, 0.16, 0.08, 0.04, 0 // 1/blend_distance
	
	def c120, 0, 0.25, 0.5, 0.75
	def c121, 0.2499, 0.4999, 0.7499, 1
	
	def c122, -17, 6, 0.045, 0 // PCSS constants
    defi i1, 6, 0, 0, 0
	// ----------------------------------------------------------------------------------------------------------------------------------------------
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 1.0285530728e-42 // 734
    def c99, 0.1, 0, 0, 0 // normal offset bias magnitude
    def c127, 0.9999999, 1, 0, 0	// LogDepth constants
    def c0, 1, -0.5, 5, 9.99999975e-006
    def c1, -0.25, 1.33333337, 9.99999975e-005, 190
    def c2, 47.5, 0.150000006, -0.5, 0.5
    def c3, 1, 0, 1.5, 0.0833333358
    def c4, -0.100000001, 1.11111116, 1.00000001e-007, 0
    def c5, 0.212500006, 0.715399981, 0.0720999986, 0
    def c6, 1, -1, 0, -0
    def c7, -0.321940005, -0.932614982, -0.791558981, -0.597710013
    def c8, 0.507430971, 0.0644249991, 0.896420002, 0.412458003
    def c9, 0.519456029, 0.767022014, 0.185461, -0.893123984
    def c10, 0.962339997, -0.194983006, 0.473434001, -0.480026007
    def c11, -0.69591397, 0.457136989, -0.203345001, 0.620715976
    def c12, -0.326211989, -0.405809999, -0.840143979, -0.0735799968
    def c73, 1, 1, 1, 1 // disable IDE dirt influence
    dcl vPos.xy
    dcl_texcoord v0.xy
    dcl_texcoord1 v1
    dcl_texcoord3 v2.xyz
    dcl_texcoord4 v3.xyz
    dcl_texcoord5 v4.xyz
    dcl_color v5
    dcl_texcoord2 v6.xyz
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s1
    dcl_2d s2
    dcl_2d s15
    texld r1, v0, s1
    add r0.y, -r1.w, c0.x
    add r0.y, -r1.x, r0.y
    cmp r0.yz, r0.y, r1.xwyw, r1.xxyw
    dp2add r0.w, r0.yzzw, -r0.yzzw, c0.x
    add r0.yz, r0, c0.y
    mul r0.yz, r0, c0.z
    rsq r0.w, r0.w
    rcp r0.w, r0.w
    mul r1.xyz, r0.y, v3
    mad r1.xyz, v1, r0.w, r1
    mad r0.yzw, r0.z, v4.xxyz, r1.xxyz
    add r0.yzw, r0, c0.w
    nrm r31.xyz, r0.yzww
    dp3 r0.x, c14, v6
    add r0.xyz, -r0.x, -c54
    cmp r0.yzw, r0.xxyz, c3.x, c3.y
    mov r0.x, c0.x
    mad r21, r0, c110.yyyw, -r0.yzww // shadow cascade mask
    dp4 r1.x, r0, c57
    dp4 r1.y, r0, c58
    dp4 r2.x, r0, c59
    dp4 r2.y, r0, c56
    mul r0.xyz, c61.xyww, v6.y
    mad r0.xyz, v6.x, c60.xyww, r0
    mad r0.xyz, v6.z, c62.xyww, r0
    add r0.xyz, r0, c63.xyww
    mul r20.xyz, r31.y, c61.xyww
    mad r20.xyz, r31.x, c60.xyww, r20
    mad r20.xyz, r31.z, c62.xyww, r20
    mad r0.xyz, r20, c99.x, r0 // normal offset bias
    mad r0.xy, r0, r1, r2
    /* removed 1.0.6.0 filter
    mov r1.y, c53.y
    mad r1.xz, r1.y, c12.xyyw, r0.xyyw
    texld r2, r1.xzzw, s15
    add r0.w, r0.z, -r2.x
    cmp r0.w, r0.w, c3.x, c3.y
    mad r1.xz, r1.y, c12.zyww, r0.xyyw
    texld r2, r1.xzzw, s15
    add r1.x, r0.z, -r2.x
    cmp r1.x, r1.x, c3.x, c3.y
    add r0.w, r0.w, r1.x
    mad r1.xz, r1.y, c11.xyyw, r0.xyyw
    texld r2, r1.xzzw, s15
    add r1.x, r0.z, -r2.x
    cmp r1.x, r1.x, c3.x, c3.y
    add r0.w, r0.w, r1.x
    mad r1.xz, r1.y, c11.zyww, r0.xyyw
    texld r2, r1.xzzw, s15
    add r1.x, r0.z, -r2.x
    cmp r1.x, r1.x, c3.x, c3.y
    add r0.w, r0.w, r1.x
    mad r1.xz, r1.y, c10.xyyw, r0.xyyw
    texld r2, r1.xzzw, s15
    add r1.x, r0.z, -r2.x
    cmp r1.x, r1.x, c3.x, c3.y
    add r0.w, r0.w, r1.x
    mad r1.xz, r1.y, c10.zyww, r0.xyyw
    texld r2, r1.xzzw, s15
    add r1.x, r0.z, -r2.x
    cmp r1.x, r1.x, c3.x, c3.y
    add r0.w, r0.w, r1.x
    mad r1.xz, r1.y, c9.xyyw, r0.xyyw
    texld r2, r1.xzzw, s15
    add r1.x, r0.z, -r2.x
    cmp r1.x, r1.x, c3.x, c3.y
    add r0.w, r0.w, r1.x
    mad r1.xz, r1.y, c9.zyww, r0.xyyw
    texld r2, r1.xzzw, s15
    add r1.x, r0.z, -r2.x
    cmp r1.x, r1.x, c3.x, c3.y
    add r0.w, r0.w, r1.x
    mad r1.xz, r1.y, c8.xyyw, r0.xyyw
    texld r2, r1.xzzw, s15
    add r1.x, r0.z, -r2.x
    cmp r1.x, r1.x, c3.x, c3.y
    add r0.w, r0.w, r1.x
    mad r1.xz, r1.y, c8.zyww, r0.xyyw
    texld r2, r1.xzzw, s15
    add r1.x, r0.z, -r2.x
    cmp r1.x, r1.x, c3.x, c3.y
    add r0.w, r0.w, r1.x
    mad r1.xz, r1.y, c7.xyyw, r0.xyyw
    mad r0.xy, r1.y, c7.zwzw, r0
    texld r2, r0, s15
    add r0.x, r0.z, -r2.x
    cmp r0.x, r0.x, c3.x, c3.y
    texld r1, r1.xzzw, s15
    add r0.y, r0.z, -r1.x
    cmp r0.y, r0.y, c3.x, c3.y
    add r0.y, r0.w, r0.y
    add r0.x, r0.x, r0.y
    removed 1.0.6.0 filter */
	// ---------------------------------------------------------- Improved Shadow Filter ------------------------------------------------------------
	add r22, c54.w, -c54
	add r22, c53.w, -r22 // cascade distances
	dp4 r23.x, r21_abs, r22
	dp4 r23.y, r21_abs, r22.xxyz
	add r23.z, r0.y, -r23.y
	dp4 r23.w, r21_abs, c119.xxyz
	mul_sat r22.y, r23.z, r23.w
	rcp r23.w, r23.x
	mul r22.z, r23.w, r23.y
	lrp r23.y, r22.y, c110.y, r22.z
	mul r20.xy, c53.xy, r23.y // apply pseudo cascade blending
	
	mov r24, c118
	add r24, r24, -c221.y
	add_sat r24, c110.y, -r24_abs
	m4x4 r25, r21_abs, c114
	dp4 r24.x, r25, r24
	add r0.z, r0.z, -r24.x // apply per cascade bias
	
	dp4 r20.z, r21_abs, c120 // UV clamp
	dp4 r20.w, r21_abs, c121
	
    mov r21.xy, c112.xy
    dp2add r21.y, vPos, r21, c110.w		// v0.x * r21.x + v0.y * r21.y
    mad r21.y, r21.y, c111.x, c111.y
    frc r21.y, r21.y
    mad r21.y, r21.y, c111.z, c111.w	// r21.y * 2pi - pi
    sincos r22.xy, r21.y				// cosine & sine of r21.y
    mul r23, r22.yxxy, c110.xxyz		// offsets for 1st and 4th samples, respectively
    mul r21, r22.yxxy, c113.xxyz        // offsets for 3rd and 2nd samples, respectively
	mul r20.xy, r20.xy, c112.x			// blur factor
    mad r23, r23, r20.xyxy, r0.xyxy		// offset * texel size + UV
    mad r21, r21, r20.xyxy, r0.xyxy		// offset * texel size + UV
	max r23.xz, r23, r20.z				// fix pixels leaking from one cascade to the other
	min r23.xz, r23, r20.w
	max r21.xz, r21, r20.z
	min r21.xz, r21, r20.w
    texld r25, r23.xy, s15				// 1st sample
    texld r24, r21.zw, s15				// 2nd sample
    mov r25.y, r24.x					// copy to r25
    texld r24, r21.xy, s15				// 3rd sample
    mov r25.z, r24.x					// copy to r25
    texld r24, r23.zw, s15				// 4th sample
    mov r25.w, r24.x					// copy to r25
	add r25, r0.z, -r25					// depth bias
	cmp r25, r25, c110.y, c110.w
	dp4 r0.x, r25, -c110.x				// average
	// ----------------------------------------------------------------------------------------------------------------------------------------------
    add r0.yzw, c15.xxyz, -v6.xxyz
    dp3 r0.y, r0.yzww, r0.yzww
    rsq r0.y, r0.y
    rcp r0.y, r0.y
    rcp r0.z, c53.w
    mul r0.z, r0.y, r0.z
    mul r0.z, r0.z, r0.z // improved shadow fadeout
    add r0.y, r0.y, -c53.w
    cmp r0.yw, r0.y, c6.xxzy, c6.xzzw
    mul r0.z, r0.z, r0.z
    mul r0.z, r0.z, c3.z
    add r0.x, r0.x, r0.z // mad r0.x, r0.x, c3.w, r0.z 1.0.6.0 filter average
    add r0.z, r0.w, r0.x
    cmp_sat r0.x, r0.z, r0.x, r0.y
    /* move normal
    texld r1, v0, s1
    add r0.y, -r1.w, c0.x
    add r0.y, -r1.x, r0.y
    cmp r0.yz, r0.y, r1.xwyw, r1.xxyw
    dp2add r0.w, r0.yzzw, -r0.yzzw, c0.x
    add r0.yz, r0, c0.y
    mul r0.yz, r0, c0.z
    rsq r0.w, r0.w
    rcp r0.w, r0.w
    mul r1.xyz, r0.y, v3
    mad r1.xyz, v1, r0.w, r1
    mad r0.yzw, r0.z, v4.xxyz, r1.xxyz
    add r0.yzw, r0, c0.w
    nrm r1.xyz, r0.yzww
    move normal */
    mov r1.xyz, r31.xyz
    dp3 r0.y, r1, -c17
    add r0.y, r0.y, c1.x
    mul_sat r0.y, r0.y, c1.y
    mul r2.xyz, c18.w, c18
    mul r0.yzw, r0.y, r2.xxyz
    mul r0.yzw, r0.x, r0
    dp3 r1.w, v5, c74
    mul r1.w, r1.w, c39.z
    mad_sat r2.w, r1.z, c2.z, c2.w
    mov r3.xyz, c38
    mad r3.xyz, r3, r2.w, c37
    mad r0.yzw, r3.xxyz, r1.w, r0
    add r3, c19, -v6.x
    mul r4, r1.x, r3
    add r5, c20, -v6.y
    mad r4, r5, r1.y, r4
    add r6, c21, -v6.z
    mad r4, r6, r1.z, r4
    mul r7, r3, r3
    mad r7, r5, r5, r7
    mad r7, r6, r6, r7
    mov r8.x, c0.x
    mad r9, r7, -c25, r8.x
    add r7, r7, c0.w
    max r10, r9, c3.y
    mul r9, r10, r10
    mad r9, r9, r9, c4.x
    mul r10, r9, c4.y
    cmp r9, r9, r10, c3.y
    mul r4, r4, r9
    rsq r9.x, r7.x
    rsq r9.y, r7.y
    rsq r9.z, r7.z
    rsq r9.w, r7.w
    mul_sat r4, r4, r9
    mul r7, r3, -c22
    mad r7, r5, -c23, r7
    mad r7, r6, -c24, r7
    mul r7, r9, r7
    mov r10, c26
    mad_sat r7, r7, r10, c27
    mul r4, r4, r7
    dp4 r7.x, c29, r4
    dp4 r7.y, c30, r4
    dp4 r7.z, c31, r4
    add r7.xyz, r0.yzww, r7
    texld r10, v0, s0
    mul r10.xyz, r10, c66
    mul r10, r10, v5
    mov r7.w, c0.x
    mul r7, r7, r10
    mul oC0.w, r7.w, c39.x
    add r0.yzw, c0.w, v2.xxyz
    nrm r10.xyz, r0.yzww
    dp3 r0.y, -r10, r1
    add r0.y, r0.y, r0.y
    mad r0.yzw, r1.xxyz, -r0.y, -r10.xxyz
    dp3 r1.x, r10, r1
    add r1.x, -r1_abs.x, c0.x
    mul r1.x, r1.x, r1.x
    mul r1.x, r1.x, r1.x
    mad_sat r1.x, r1.x, -c0.y, -c0.y
    mul r3, r3, r0.y
    mad r3, r0.z, r5, r3
    mad r3, r0.w, r6, r3
    dp3_sat r0.y, -c17, r0.yzww
    add r0.y, r0.y, c1.z
    mul r3, r9, r3
    log r5.x, r3_abs.x
    log r5.y, r3_abs.y
    log r5.z, r3_abs.z
    log r5.w, r3_abs.w
    texld r3, v0, s2
    mul r0.z, r3.w, c73.x
    dp3 r0.w, r3, c72
    mul r0.w, r0.w, c73.x
    mul r0.w, r0.w, c2.y
    mul r0.w, r1.x, r0.w
    mul r1.x, r0.z, c2.x
    mad r0.z, r0.z, c1.w, c1.z
    pow r1.y, r0.y, r0.z
    mul r1.yzw, r2.xxyz, r1.y
    mul r0.xyz, r0.x, r1.yzww
    mul r1, r5, r1.x
    exp r2.x, r1.x
    exp r2.y, r1.y
    exp r2.z, r1.z
    exp r2.w, r1.w
    mul r1, r4, r2
    dp4 r2.x, c29, r1
    dp4 r2.y, c30, r1
    dp4 r2.z, c31, r1
    mad r0.xyz, r0, c17.w, r2
    mad r0.xyz, r0.w, r0, r7
    dp3 r0.w, r0, c5
    add r1.x, -c16.z, c16.w
    rcp r1.x, r1.x
    add r1.y, c16.w, -v1.w
    mul_sat r1.x, r1.x, r1.y
    add r1.x, -r1.x, c0.x
    add r1.yz, -r8.x, c16.xxyw
    mad r1.y, r1.x, r1.y, c0.x
    mul r1.x, r1.x, r1.z
    lrp r2.xyz, r1.y, r0, r0.w
    add r0.x, r0.w, c4.z
    pow r2.w, r0_abs.x, r1.x
    mul r0.xyz, r2, r2.w
    add r0.w, -c41.x, c41.y
    rcp r0.w, r0.w
    add r1.x, -c41.x, v1.w
    mul_sat r0.w, r0.w, r1.x
    mov r1.xyz, c43
    add r1.xyz, -r1, c42
    mad r1.xyz, r0.w, r1, c43
    mad r1.xyz, r2, -r2.w, r1
    rcp r1.w, c41.x
    mul_sat r1.w, r1.w, v1.w
    lrp r2.x, c41.w, r1.w, r0.w
    add r0.w, r2.x, c41.z
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

// approximately 229 instruction slots used (15 texture, 214 arithmetic)
