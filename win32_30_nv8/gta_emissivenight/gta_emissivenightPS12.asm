// Summary: removed unnecessary stipple + improved shadow filter + restored normal offset bias + improved shadow fadeout
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D StippleTexture;
//   sampler2D TextureSampler;
//   float4 colorize;
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
//   float4 globalScalars;
//
//
// Registers:
//
//   Name                 Reg   Size
//   -------------------- ----- ----
//   gViewInverse         c12      4
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
//   colorize             c51      1
//   gShadowParam18192021 c53      1
//   gFacetCentre         c54      1
//   gShadowParam14151617 c56      1
//   gShadowParam0123     c57      1
//   gShadowParam4567     c58      1
//   gShadowParam891113   c59      1
//   gShadowMatrix        c60      4
//   gLightPointColG      c64      1
//   gLightPointColB      c65      1
//   gLightDir2X          c67      1
//   gLightDir2Y          c68      1
//   gLightDir2Z          c69      1
//   gLightConeScale2     c70      1
//   gLightConeOffset2    c71      1
//   TextureSampler       s0       1
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
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 2.4943112665e-43 // 178
    def c99, 0.1, 0, 0, 0 // normal offset bias magnitude
    def c127, 0.9999999, 1, 0, 0	// LogDepth constants
    def c0, 9.99999975e-006, -0.5, 0.5, -0.25
    def c1, 1.33333337, 1, 0, 1.5
    def c2, 0.0833333358, -0.100000001, 1.11111116, 3.99600005
    def c3, 4, 0.125, 0, 0
    def c4, 1, -1, 0, -0
    def c5, -0.321940005, -0.932614982, -0.791558981, -0.597710013
    def c6, 0.507430971, 0.0644249991, 0.896420002, 0.412458003
    def c7, 0.519456029, 0.767022014, 0.185461, -0.893123984
    def c8, 0.962339997, -0.194983006, 0.473434001, -0.480026007
    def c9, -0.69591397, 0.457136989, -0.203345001, 0.620715976
    def c10, -0.326211989, -0.405809999, -0.840143979, -0.0735799968
    dcl_texcoord v0.xy
    dcl_texcoord1 v1.xyz
    dcl_color v2
    dcl_texcoord6 v3.xyz
    dcl vPos.xy
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s10
    dcl_2d s15
    texld r0, v0, s0
    add r1.xyz, c0.x, v1
    nrm r2.xyz, r1
    mul r0, r0, c51
    mul r0, r0, v2
    mad_sat r1.x, r2.z, c0.y, c0.z
    mov r3.xyz, c38
    mad r1.xyz, r3, r1.x, c37
    mul r3.xyz, c18.w, c18
    dp3 r1.w, r2, -c17
    mul r20.xyz, r2.y, c61.xyww
    mad r20.xyz, r2.x, c60.xyww, r20
    mad r20.xyz, r2.z, c62.xyww, r20
    add r1.w, r1.w, c0.w
    mul_sat r1.w, r1.w, c1.x
    mul r4.xyz, c61.xyww, v3.y
    mad r4.xyz, v3.x, c60.xyww, r4
    mad r4.xyz, v3.z, c62.xyww, r4
    add r4.xyz, r4, c63.xyww
    mad r4.xyz, r20.xyz, c99.x, r4 // normal offset bias
    dp3 r2.w, c14, v3
    add r5.xyz, -r2.w, -c54
    cmp r5.yzw, r5.xxyz, c1.y, c1.z
    mov r5.x, c1.y
    mad r21, r5, c110.yyyw, -r5.yzww // shadow cascade mask
    dp4 r6.x, r5, c57
    dp4 r6.y, r5, c58
    dp4 r7.x, r5, c59
    dp4 r7.y, r5, c56
    mad r4.xy, r4, r6, r7
    add r5.xyz, c15, -v3
    dp3 r2.w, r5, r5
    rsq r2.w, r2.w
    rcp r2.w, r2.w
    rcp r3.w, c53.w
    mul r3.w, r2.w, r3.w
    mul r3.w, r3.w, r3.w // improved shadow fadeout
    mul r3.w, r3.w, r3.w
    mul r3.w, r3.w, c1.w
    /* removed 1.0.6.0 filter
    mov r5.y, c53.y
    mad r5.xz, r5.y, c10.xyyw, r4.xyyw
    texld r6, r5.xzzw, s15
    add r4.w, r4.z, -r6.x
    cmp r4.w, r4.w, c1.y, c1.z
    mad r5.xz, r5.y, c10.zyww, r4.xyyw
    texld r6, r5.xzzw, s15
    add r5.x, r4.z, -r6.x
    cmp r5.x, r5.x, c1.y, c1.z
    add r4.w, r4.w, r5.x
    mad r5.xz, r5.y, c9.xyyw, r4.xyyw
    texld r6, r5.xzzw, s15
    add r5.x, r4.z, -r6.x
    cmp r5.x, r5.x, c1.y, c1.z
    add r4.w, r4.w, r5.x
    mad r5.xz, r5.y, c9.zyww, r4.xyyw
    texld r6, r5.xzzw, s15
    add r5.x, r4.z, -r6.x
    cmp r5.x, r5.x, c1.y, c1.z
    add r4.w, r4.w, r5.x
    mad r5.xz, r5.y, c8.xyyw, r4.xyyw
    texld r6, r5.xzzw, s15
    add r5.x, r4.z, -r6.x
    cmp r5.x, r5.x, c1.y, c1.z
    add r4.w, r4.w, r5.x
    mad r5.xz, r5.y, c8.zyww, r4.xyyw
    texld r6, r5.xzzw, s15
    add r5.x, r4.z, -r6.x
    cmp r5.x, r5.x, c1.y, c1.z
    add r4.w, r4.w, r5.x
    mad r5.xz, r5.y, c7.xyyw, r4.xyyw
    texld r6, r5.xzzw, s15
    add r5.x, r4.z, -r6.x
    cmp r5.x, r5.x, c1.y, c1.z
    add r4.w, r4.w, r5.x
    mad r5.xz, r5.y, c7.zyww, r4.xyyw
    texld r6, r5.xzzw, s15
    add r5.x, r4.z, -r6.x
    cmp r5.x, r5.x, c1.y, c1.z
    add r4.w, r4.w, r5.x
    mad r5.xz, r5.y, c6.xyyw, r4.xyyw
    texld r6, r5.xzzw, s15
    add r5.x, r4.z, -r6.x
    cmp r5.x, r5.x, c1.y, c1.z
    add r4.w, r4.w, r5.x
    mad r5.xz, r5.y, c6.zyww, r4.xyyw
    texld r6, r5.xzzw, s15
    add r5.x, r4.z, -r6.x
    cmp r5.x, r5.x, c1.y, c1.z
    add r4.w, r4.w, r5.x
    mad r5.xz, r5.y, c5.xyyw, r4.xyyw
    texld r6, r5.xzzw, s15
    add r5.x, r4.z, -r6.x
    cmp r5.x, r5.x, c1.y, c1.z
    add r4.w, r4.w, r5.x
    mad r4.xy, r5.y, c5.zwzw, r4
    texld r5, r4, s15
    add r4.x, r4.z, -r5.x
    cmp r4.x, r4.x, c1.y, c1.z
    add r4.x, r4.w, r4.x
    removed 1.0.6.0 filter */
	// ---------------------------------------------------------- Improved Shadow Filter ------------------------------------------------------------
	add r22, c54.w, -c54
	add r22, c53.w, -r22 // cascade distances
	dp4 r23.x, r21_abs, r22
	dp4 r23.y, r21_abs, r22.xxyz
	add r23.z, r2.w, -r23.y
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
	add r4.z, r4.z, -r20.w // apply per cascade bias
	
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
    mad r23, r23, r20.xyxy, r4.xyxy		// offset * texel size + UV
    mad r21, r21, r20.xyxy, r4.xyxy		// offset * texel size + UV
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
	add r25, r4.z, -r25					// depth bias
	cmp r25, r25, c110.y, c110.w
	dp4 r4.x, r25, -c110.x				// average
	// ----------------------------------------------------------------------------------------------------------------------------------------------
    add r3.w, r4.x, r3.w // mad r3.w, r4.x, c2.x, r3.w 1.0.6.0 filter average
    add r2.w, r2.w, -c53.w
    cmp r4.xy, r2.w, c4, c4.zwzw
    add r2.w, r3.w, r4.y
    cmp_sat r2.w, r2.w, r3.w, r4.x
    mul r3.xyz, r3, r1.w
    mul r3.xyz, r2.w, r3
    mad r1.xyz, r1, c39.z, r3
    add r3, c19, -v3.x
    add r4, c20, -v3.y
    add r5, c21, -v3.z
    mul r6, r3, r3
    mad r6, r4, r4, r6
    mad r6, r5, r5, r6
    add r7, r6, c0.x
    rsq r8.x, r7.x
    rsq r8.y, r7.y
    rsq r8.z, r7.z
    rsq r8.w, r7.w
    mov r7.y, c1.y
    mad r6, r6, -c25, r7.y
    max r9, r6, c1.z
    mul r6, r9, r9
    mad r6, r6, r6, c2.y
    mul r9, r6, c2.z
    cmp r6, r6, r9, c1.z
    mul r9, r2.x, r3
    mad r9, r4, r2.y, r9
    mad r9, r5, r2.z, r9
    mul r6, r6, r9
    mul_sat r6, r8, r6
    mul r3, r3, -c22
    mad r3, r4, -c23, r3
    mad r3, r5, -c24, r3
    mul r3, r8, r3
    mov r4, c26
    mad_sat r3, r3, r4, c27
    mul r3, r6, r3
    dp4 r4.x, c29, r3
    dp4 r4.y, c30, r3
    dp4 r4.z, c31, r3
    add r1.xyz, r1, r4
    add r3, c32, -v3.x
    add r4, c33, -v3.y
    add r5, c34, -v3.z
    mul r6, r3, r3
    mad r6, r4, r4, r6
    mad r6, r5, r5, r6
    add r8, r6, c0.x
    rsq r9.x, r8.x
    rsq r9.y, r8.y
    rsq r9.z, r8.z
    rsq r9.w, r8.w
    mad r6, r6, -c36, r7.y
    max r7, r6, c1.z
    mul r6, r7, r7
    mad r6, r6, r6, c2.y
    mul r7, r6, c2.z
    cmp r6, r6, r7, c1.z
    mul r7, r2.x, r3
    mad r7, r4, r2.y, r7
    mad r2, r5, r2.z, r7
    mul r2, r6, r2
    mul_sat r2, r9, r2
    mul r3, r3, -c67
    mad r3, r4, -c68, r3
    mad r3, r5, -c69, r3
    mul r3, r9, r3
    mov r4, c70
    mad_sat r3, r3, r4, c71
    mul r2, r2, r3
    dp4 r3.x, c35, r2
    dp4 r3.y, c64, r2
    dp4 r3.z, c65, r2
    add r1.xyz, r1, r3
    mov r1.w, c1.y
    mul r0, r0, r1
    mul r0.w, r0.w, c39.x
    /* removed stipple
    mov_sat r1.x, r0.w
    mul r1.x, r1.x, c2.w
    frc r1.y, r1.x
    mul r1.z, r1.y, c3.x
    frc r1.w, r1.z
    add r2.xy, r1.zxzw, -r1.wyzw
    mul r1.xy, c3.y, vPos
    frc r1.xy, r1_abs
    cmp r1.xy, vPos, r1, -r1
    mul r1.xy, r1, -c0.w
    mad r1.xy, r2, -c0.w, r1
    mov r1.zw, c1.z
    texldl r1, r1, s10
    cmp r1, -r1.y, -c1.y, -c1.z
    texkill r1
    removed stipple */
    mov oC0, r0
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

// approximately 190 instruction slots used (15 texture, 175 arithmetic)
