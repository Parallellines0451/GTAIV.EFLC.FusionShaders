// Summary: Disabled PC parameters that cause the dirt level in vehicle.ide to affect reflection intensity + console-like ambient reflection intensity + improved shadow filter + restored normal offset bias + improved shadow fadeout
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D DirtSampler;
//   sampler2D EnvironmentSampler;
//   float3 LuminanceConstants;
//   sampler2D SpecSampler;
//   sampler2D TextureSampler;
//   float3 dirtColor;
//   float dirtLevel;
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
//   dirtLevel            c72      1
//   dirtColor            c73      1
//   specMapIntMask       c74      1
//   reflectivePowerED    c75      1
//   LuminanceConstants   c76      1
//   TextureSampler       s0       1
//   DirtSampler          s1       1
//   SpecSampler          s2       1
//   EnvironmentSampler   s4       1
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
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 1.0467699529e-42 // 747
    def c99, 0.1, 0, 0, 0 // normal offset bias magnitude
    def c127, 0.9999999, 1, 0, 0	// LogDepth constants
    def c0, 1.33333337, 9.99999975e-005, 190, 1.5
    def c1, 9.99999975e-006, 0.224999994, 1, 0.5
    def c2, 0.800000012, 0.5, 0.200000003, 0
    def c3, 5, 10, 1.79999995, -0.25
    def c4, 0, 1, -0.5, 0.5
    def c5, 0.0833333358, 4, -0.00999999978, 100
    def c6, 0.212500006, 0.715399981, 0.0720999986, 1.00000001e-007
    def c7, 1, -1, 0, -0
    def c8, -0.321940005, -0.932614982, -0.791558981, -0.597710013
    def c9, 0.507430971, 0.0644249991, 0.896420002, 0.412458003
    def c10, 0.519456029, 0.767022014, 0.185461, -0.893123984
    def c11, 0.962339997, -0.194983006, 0.473434001, -0.480026007
    def c12, -0.69591397, 0.457136989, -0.203345001, 0.620715976
    def c13, -0.326211989, -0.405809999, -0.840143979, -0.0735799968
    def c75, 1, 1, 1, 1 // disable IDE dirt influence
	def c100, 1.6666667, 0, 0, 0	// Reflection intensity multiplier
    dcl vPos.xy
    dcl_texcoord v0.xy
    dcl_texcoord1 v1
    dcl_texcoord3 v2.xyz
    dcl_color v3
    dcl_texcoord2 v4.xyz
    dcl_texcoord7 v5.xy
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s1
    dcl_2d s2
    dcl_2d s4
    dcl_2d s15
    texld r0, v0, s0
    add r1.xyz, c1.x, v1
    nrm r2.xyz, r1
    texld r1, v0, s2
    mul r1.w, r1.w, c75.x
    dp3 r1.x, r1, c74
    mul r1.x, r1.x, c75.x
    mul r1.x, r1.x, c1.y
    add r3.xyz, c1.x, v2
    nrm r4.xyz, r3
    dp3 r1.y, r4, r2
    add r1.y, -r1_abs.y, c1.z
    mul r1.y, r1.y, r1.y
    mul r1.y, r1.y, r1.y
    mad r1.yz, r1.y, c2.xyxw, c2
    add r1.z, r1.z, r1.z
    min r2.w, r1.x, c1.z
    dp3 r1.x, -r4, r2
    add r1.x, r1.x, r1.x
    mad r3.xyz, r2, -r1.x, -r4
    add r4.xyz, r3, c1.x
    nrm r5.xyz, r4
    mov_sat r1.x, r5.z
    add r1.x, r1.x, c1.z
    add r1.x, r1.x, r1.x
    rcp r1.x, r1.x
    mad r4.xy, r5, r1.x, c1.w
    add r4.xy, -r4, c1.z
    mov r4.zw, c2.w
    texldl r4, r4, s4
	mul r4, r4, c100.x
    mul_sat r1.x, r5.z, c3.x
    mul r4.xyz, r4, r1.x
    mul r4.xyz, r1.z, r4
    mul r4.xyz, r4, c3.y
    add r1.x, c39.w, c39.w
    mul r4.xyz, r4, r1.x
    mul r4.xyz, r4, c75.x
    mul r4.xyz, r4, c3.z
    mul r0.xyz, r0, c66
    mul r0, r0, v3
    dp3 r1.x, v3, c76
    mul r1.x, r1.x, c39.z
    mov r3.w, c2.w
    if_lt -c72.x, r3.w
      texld r5, v5, s1
      mul r1.z, r5.x, c72.x
      mov r5.z, c1.z
      mad r6.x, r5.x, -c72.x, r5.z
      lrp r6.yzw, r1.z, c73.xxyz, r0.xxyz
      mad r7, r0.xxyz, c4.xyyy, c4.yxxx
      cmp r5, -r5.x, r7, r6
      mov r0.xyz, r5.yzww
    else
      mov r5.x, c1.z
    endif
    mul r1.z, r2.w, r5.x
    mad_sat r2.w, r2.z, c4.z, c4.w
    mov r5.xyz, c38
    mad r5.xyz, r5, r2.w, c37
    mul r6.xyz, c18.w, c18
    dp3 r2.x, r2, -c17
    mul r20.xyz, r2.y, c61.xyww
    mad r20.xyz, r2.x, c60.xyww, r20
    mad r20.xyz, r2.z, c62.xyww, r20
    add r2.x, r2.x, c3.w
    mul_sat r2.x, r2.x, c0.x
    dp3_sat r2.y, -c17, r3
    add r2.y, r2.y, c0.y
    mad r1.w, r1.w, c0.z, c0.y
    pow r3.x, r2.y, r1.w
    mul r2.yzw, c61.xxyw, v4.y
    mad r2.yzw, v4.x, c60.xxyw, r2
    mad r2.yzw, v4.z, c62.xxyw, r2
    add r2.yzw, r2, c63.xxyw
    mad r2.yzw, r20.xxyz, c99.x, r2 // normal offset bias
    dp3 r1.w, c14, v4
    add r3.yzw, -r1.w, -c54.xxyz
    cmp r7.yzw, r3, c4.y, c4.x
    mov r7.x, c1.z
    mad r21, r7, c110.yyyw, -r7.yzww // shadow cascade mask
    dp4 r8.x, r7, c57
    dp4 r8.y, r7, c58
    dp4 r9.x, r7, c59
    dp4 r9.y, r7, c56
    mad r2.yz, r2, r8.xxyw, r9.xxyw
    add r3.yzw, c15.xxyz, -v4.xxyz
    dp3 r1.w, r3.yzww, r3.yzww
    rsq r1.w, r1.w
    rcp r1.w, r1.w
    rcp r3.y, c53.w
    mul r3.y, r1.w, r3.y
    mul r3.y, r3.y, r3.y // improved shadow fadeout
    mul r3.y, r3.y, r3.y
    mul r3.y, r3.y, c0.w
    /* removed 1.0.6.0 filter
    mov r7.y, c53.y
    mad r3.zw, r7.y, c13.xyxy, r2.xyyz
    texld r8, r3.zwzw, s15
    add r3.z, r2.w, -r8.x
    cmp r3.z, r3.z, c4.y, c4.x
    mad r7.xz, r7.y, c13.zyww, r2.yyzw
    texld r8, r7.xzzw, s15
    add r3.w, r2.w, -r8.x
    cmp r3.w, r3.w, c4.y, c4.x
    add r3.z, r3.z, r3.w
    mad r7.xz, r7.y, c12.xyyw, r2.yyzw
    texld r8, r7.xzzw, s15
    add r3.w, r2.w, -r8.x
    cmp r3.w, r3.w, c4.y, c4.x
    add r3.z, r3.z, r3.w
    mad r7.xz, r7.y, c12.zyww, r2.yyzw
    texld r8, r7.xzzw, s15
    add r3.w, r2.w, -r8.x
    cmp r3.w, r3.w, c4.y, c4.x
    add r3.z, r3.z, r3.w
    mad r7.xz, r7.y, c11.xyyw, r2.yyzw
    texld r8, r7.xzzw, s15
    add r3.w, r2.w, -r8.x
    cmp r3.w, r3.w, c4.y, c4.x
    add r3.z, r3.z, r3.w
    mad r7.xz, r7.y, c11.zyww, r2.yyzw
    texld r8, r7.xzzw, s15
    add r3.w, r2.w, -r8.x
    cmp r3.w, r3.w, c4.y, c4.x
    add r3.z, r3.z, r3.w
    mad r7.xz, r7.y, c10.xyyw, r2.yyzw
    texld r8, r7.xzzw, s15
    add r3.w, r2.w, -r8.x
    cmp r3.w, r3.w, c4.y, c4.x
    add r3.z, r3.z, r3.w
    mad r7.xz, r7.y, c10.zyww, r2.yyzw
    texld r8, r7.xzzw, s15
    add r3.w, r2.w, -r8.x
    cmp r3.w, r3.w, c4.y, c4.x
    add r3.z, r3.z, r3.w
    mad r7.xz, r7.y, c9.xyyw, r2.yyzw
    texld r8, r7.xzzw, s15
    add r3.w, r2.w, -r8.x
    cmp r3.w, r3.w, c4.y, c4.x
    add r3.z, r3.z, r3.w
    mad r7.xz, r7.y, c9.zyww, r2.yyzw
    texld r8, r7.xzzw, s15
    add r3.w, r2.w, -r8.x
    cmp r3.w, r3.w, c4.y, c4.x
    add r3.z, r3.z, r3.w
    mad r7.xz, r7.y, c8.xyyw, r2.yyzw
    texld r8, r7.xzzw, s15
    add r3.w, r2.w, -r8.x
    cmp r3.w, r3.w, c4.y, c4.x
    add r3.z, r3.z, r3.w
    mad r2.yz, r7.y, c8.xzww, r2
    texld r7, r2.yzzw, s15
    add r2.y, r2.w, -r7.x
    cmp r2.y, r2.y, c4.y, c4.x
    add r2.y, r3.z, r2.y
    removed 1.0.6.0 filter */
	// ---------------------------------------------------------- Improved Shadow Filter ------------------------------------------------------------
	add r22, c54.w, -c54
	add r22, c53.w, -r22 // cascade distances
	dp4 r23.x, r21_abs, r22
	dp4 r23.y, r21_abs, r22.xxyz
	add r23.z, r1.w, -r23.y
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
	add r2.w, r2.w, -r24.x // apply per cascade bias
	
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
    mad r23, r23, r20.xyxy, r2.yzyz		// offset * texel size + UV
    mad r21, r21, r20.xyxy, r2.yzyz		// offset * texel size + UV
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
	add r25, r2.w, -r25					// depth bias
	cmp r25, r25, c110.y, c110.w
	dp4 r2.y, r25, -c110.x				// average
	// ----------------------------------------------------------------------------------------------------------------------------------------------
    add r2.y, r2.y, r3.y // mad r2.y, r2.y, c5.x, r3.y 1.0.6.0 filter average
    add r1.w, r1.w, -c53.w
    cmp r2.zw, r1.w, c7.xyxy, c7
    add r1.w, r2.y, r2.w
    cmp_sat r1.w, r1.w, r2.y, r2.z
    mul r2.yzw, r6.xxyz, r3.x
    mul r2.yzw, r1.w, r2
    mul r3.xyz, r6, r2.x
    mul r3.xyz, r1.w, r3
    mul r2.xyz, r2.yzww, c17.w
    mul r2.xyz, r2, c5.y
    mad r3.xyz, r5, r1.x, r3
    mov_sat r1.y, r1.y
    mul r1.y, r1.z, r1.y
    mul r4.xyz, r4, r1.y
    mul r1.xzw, r1.x, r4.xyyz
    mov r3.w, c1.z
    mul r0, r0.wxyz, r3.wxyz
    mul r2.xyz, r2, r1.y
    mul r1.xyz, r1.y, r1.xzww
    mov_sat r0.x, r0.x
    add r1.w, r0.x, c5.z
    rcp r2.w, r0.x
    cmp r1.w, r1.w, r2.w, c5.w
    mad r0.yzw, r2.xxyz, r1.w, r0
    mad r0.yzw, r1.xxyz, r1.w, r0
    mul oC0.w, r0.x, c39.x
    add r0.x, c16.w, -v1.w
    add r1.x, -c16.z, c16.w
    rcp r1.x, r1.x
    mul_sat r0.x, r0.x, r1.x
    add r0.x, -r0.x, c1.z
    mov r1.z, c1.z
    add r1.xy, -r1.z, c16
    mul r1.y, r0.x, r1.y
    mad r0.x, r0.x, r1.x, c1.z
    dp3 r1.x, r0.yzww, c6
    lrp r2.xyz, r0.x, r0.yzww, r1.x
    add r0.x, r1.x, c6.w
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

// approximately 215 instruction slots used (17 texture, 198 arithmetic)
