// Summary: removed unnecessary stipple + console-like ambient reflection intensity + improved shadow filter + restored normal offset bias + improved shadow fadeout
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
//   reflectivePower      c66      1
//   TextureSampler       s0       1
//   EnvironmentSampler   s1       1
//   StippleTexture       s10      1
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
	// ----------------------------------------------------------------------------------------------------------------------------------------------
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 7.3147779838e-43 // 522
    def c99, 0.1, 0, 0, 0 // normal offset bias magnitude
    def c127, 0.9999999, 1, 0, 0	// LogDepth constants
    def c0, 0, -1, -0, 9.99999975e-006
    def c1, -0.5, -0.00999999978, 100, 0.5
    def c2, 1.33333337, 1.5, -0.326211989, -0.405809999
    def c3, -0.791558981, -0.597710013, 0.0833333358, 1.00000001e-007
    def c4, 3.99600005, 4, 0.125, 0.25
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
    add r1.xyz, r1, c0.w
    dp3 r1.y, r1, r1
    rsq r1.y, r1.y
    mad r1.xy, r1.xzzw, r1.y, -c0.y
    mul r1.xy, r1, c1.x
    texld r1, r1, s1
	mul r1, r1, c100.x
    mul r1.xyz, r1, c66.x
    mul r3.w, r0.w, v3.w
    mad r0.w, r0.w, v3.w, c1.y
    rcp r1.w, r3.w
    cmp r0.w, r0.w, r1.w, c1.z
    mad r3.xyz, r1, r0.w, r0
    mad_sat r0.x, r2.z, c1.x, c1.w
    mov r1.xyz, c38
    mad r0.xyz, r1, r0.x, c37
    mul r1.xyz, c18.w, c18
    dp3 r0.w, r2, -c17
    mul r20.xyz, r2.y, c61.xyww
    mad r20.xyz, r2.x, c60.xyww, r20
    mad r20.xyz, r2.z, c62.xyww, r20
    add r0.w, r0.w, -c4.w
    mul_sat r0.w, r0.w, c2.x
    mul r2.xyz, c61.xyww, v4.y
    mad r2.xyz, v4.x, c60.xyww, r2
    mad r2.xyz, v4.z, c62.xyww, r2
    add r2.xyz, r2, c63.xyww
    mad r2.xyz, r20.xyz, c99.x, r2 // normal offset bias
    dp3 r1.w, c14, v4
    add r4.xyz, -r1.w, -c54
    cmp r4.yzw, r4.xxyz, -c0.y, -c0.z
    mov r4.x, -c0.y
    mad r21, r4, c110.yyyw, -r4.yzww // shadow cascade mask
    dp4 r5.x, r4, c57
    dp4 r5.y, r4, c58
    dp4 r6.x, r4, c59
    dp4 r6.y, r4, c56
    mad r2.xy, r2, r5, r6
    add r4.xyz, c15, -v4
    dp3 r1.w, r4, r4
    rsq r1.w, r1.w
    rcp r1.w, r1.w
    rcp r2.w, c53.w
    mul r2.w, r1.w, r2.w
    mul r2.w, r2.w, r2.w // improved shadow fadeout
    mul r2.w, r2.w, r2.w
    mul r2.w, r2.w, c2.y
    /* removed 1.0.6.0 filter
    mov r4.y, c53.y
    mad r4.xz, r4.y, c2.zyww, r2.xyyw
    texld r5, r4.xzzw, s15
    add r4.x, r2.z, -r5.x
    cmp r4.x, r4.x, -c0.y, -c0.z
    mad r4.zw, r4.y, c11.xyxy, r2.xyxy
    texld r5, r4.zwzw, s15
    add r4.z, r2.z, -r5.x
    cmp r4.z, r4.z, -c0.y, -c0.z
    add r4.x, r4.x, r4.z
    mad r4.zw, r4.y, c11, r2.xyxy
    texld r5, r4.zwzw, s15
    add r4.z, r2.z, -r5.x
    cmp r4.z, r4.z, -c0.y, -c0.z
    add r4.x, r4.x, r4.z
    mad r4.zw, r4.y, c10.xyxy, r2.xyxy
    texld r5, r4.zwzw, s15
    add r4.z, r2.z, -r5.x
    cmp r4.z, r4.z, -c0.y, -c0.z
    add r4.x, r4.x, r4.z
    mad r4.zw, r4.y, c10, r2.xyxy
    texld r5, r4.zwzw, s15
    add r4.z, r2.z, -r5.x
    cmp r4.z, r4.z, -c0.y, -c0.z
    add r4.x, r4.x, r4.z
    mad r4.zw, r4.y, c9.xyxy, r2.xyxy
    texld r5, r4.zwzw, s15
    add r4.z, r2.z, -r5.x
    cmp r4.z, r4.z, -c0.y, -c0.z
    add r4.x, r4.x, r4.z
    mad r4.zw, r4.y, c9, r2.xyxy
    texld r5, r4.zwzw, s15
    add r4.z, r2.z, -r5.x
    cmp r4.z, r4.z, -c0.y, -c0.z
    add r4.x, r4.x, r4.z
    mad r4.zw, r4.y, c8.xyxy, r2.xyxy
    texld r5, r4.zwzw, s15
    add r4.z, r2.z, -r5.x
    cmp r4.z, r4.z, -c0.y, -c0.z
    add r4.x, r4.x, r4.z
    mad r4.zw, r4.y, c8, r2.xyxy
    texld r5, r4.zwzw, s15
    add r4.z, r2.z, -r5.x
    cmp r4.z, r4.z, -c0.y, -c0.z
    add r4.x, r4.x, r4.z
    mad r4.zw, r4.y, c7.xyxy, r2.xyxy
    texld r5, r4.zwzw, s15
    add r4.z, r2.z, -r5.x
    cmp r4.z, r4.z, -c0.y, -c0.z
    add r4.x, r4.x, r4.z
    mad r4.zw, r4.y, c7, r2.xyxy
    texld r5, r4.zwzw, s15
    add r4.z, r2.z, -r5.x
    cmp r4.z, r4.z, -c0.y, -c0.z
    add r4.x, r4.x, r4.z
    mad r2.xy, r4.y, c3, r2
    texld r5, r2, s15
    add r2.x, r2.z, -r5.x
    cmp r2.x, r2.x, -c0.y, -c0.z
    add r2.x, r4.x, r2.x
    removed 1.0.6.0 filter */
	// ---------------------------------------------------------- Improved Shadow Filter ------------------------------------------------------------
	add r22, c54.w, -c54
	add r22, c53.w, -r22 // cascade distances
	dp4 r23.x, r21_abs, r22
	dp4 r23.y, r21_abs, r22.xxyz
	add r23.z, r1.w, -r23.y
	dp4 r23.w, r21_abs, c119.xxyz
	mul_sat r23.z, r23.z, r23.w
	rcp r23.x, r23.x
	mul r23.y, r23.x, r23.y
	lrp r20.z, r23.z, c110.y, r23.y
	mul r20.xy, c53.xy, r20.z // apply pseudo cascade blending
	
	mov r24, c118
	add r24, r24, -c221.y
	add_sat r24, c110.y, -r24_abs
	m4x4 r25, r21_abs, c114
	dp4 r20.w, r25, r24
	add r2.z, r2.z, -r20.w // apply per cascade bias
	
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
    mad r23, r23, r20.xyxy, r2.xyxy		// offset * texel size + UV
    mad r21, r21, r20.xyxy, r2.xyxy		// offset * texel size + UV
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
	add r25, r2.z, -r25					// depth bias
	cmp r25, r25, c110.y, c110.w
	dp4 r2.x, r25, -c110.x				// average
	// ----------------------------------------------------------------------------------------------------------------------------------------------
    add r2.x, r2.x, r2.w // mad r2.x, r2.x, c3.z, r2.w 1.0.6.0 filter average
    add r1.w, r1.w, -c53.w
    cmp r2.yz, r1.w, c6.xxyw, c6.xzww
    add r1.w, r2.x, r2.z
    cmp_sat r1.w, r1.w, r2.x, r2.y
    mul r1.xyz, r1, r0.w
    mul r1.xyz, r1.w, r1
    mad r0.xyz, r0, v3.x, r1
    mov r0.w, -c0.y
    mul r1, r3, r0
    mul oC0.w, r1.w, c39.x
    add r0.w, c16.w, -v1.w
    add r1.w, -c16.z, c16.w
    rcp r1.w, r1.w
    mul_sat r0.w, r0.w, r1.w
    add r0.w, -r0.w, -c0.y
    mov r2.y, c0.y
    add r2.xy, r2.y, c16
    mul r1.w, r0.w, r2.y
    mad r0.w, r0.w, r2.x, -c0.y
    dp3 r1.x, r1, c5
    mad r0.xyz, r3, r0, -r1.x
    mad r0.xyz, r0.w, r0, r1.x
    add r0.w, r1.x, c3.w
    pow r2.x, r0_abs.w, r1.w
    mul r1.xyz, r0, r2.x
    rcp r0.w, c41.x
    mul_sat r0.w, r0.w, v1.w
    add r1.w, -c41.x, v1.w
    add r2.y, -c41.x, c41.y
    rcp r2.y, r2.y
    mul_sat r1.w, r1.w, r2.y
    lrp r2.y, c41.w, r0.w, r1.w
    add r0.w, r2.y, c41.z
    mov r3.xyz, c43
    add r2.yzw, -r3.xxyz, c42.xxyz
    mad r2.yzw, r1.w, r2, c43.xxyz
    mad r0.xyz, r0, -r2.x, r2.yzww
    mad oC0.xyz, r0.w, r0, r1
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

// approximately 169 instruction slots used (16 texture, 153 arithmetic)
