// Disabled PC parameters that cause the dirt level in vehicle.ide to affect reflection intensity + improved shadow filter
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D DirtSampler;
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
//   float3 matDiffuseColor;
//   float reflectivePowerED;
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
//   matDiffuseColor      c66      1
//   gLightDir2X          c67      1
//   gLightDir2Y          c68      1
//   gLightDir2Z          c69      1
//   gLightConeScale2     c70      1
//   gLightConeOffset2    c71      1
//   dirtLevel            c72      1
//   dirtColor            c73      1
//   specularFactor       c74      1
//   specularColorFactor  c75      1
//   specMapIntMask       c76      1
//   reflectivePowerED    c77      1
//   LuminanceConstants   c78      1
//   TextureSampler       s0       1
//   DirtSampler          s1       1
//   SpecSampler          s2       1
//   gShadowZSamplerDir   s15      1
//

    ps_3_0
	// ------------------------------------------------------ 1.0.4.0 Shadow Filter Constants -------------------------------------------------------
    def c110, -0.25, 1, -1, 0
    def c111, 0.159154937, 0.5, 6.28318548, -3.14159274
    def c112, 3, 7.13800001, 3, 0.25
    def c113, 0.75, -0.5, 0.5, 0
	defi i1, 4, 0, 0, 0
	// ----------------------------------------------------------------------------------------------------------------------------------------------
	// --------------------------------------------------------- Filter Utilities Constants ---------------------------------------------------------
	def c120, 0.25, 0.5, 0.75, 0 // cascade identifiers
	
    def c121, 1, 0.475, 0, 0.12 // x,y = 1st & 2nd cascade blur | z,w = 1st & 2nd cascade bias
	def c122, 0.19, 0.0542857, 0.28, 0.55 // x,y = 3rd & 4th cascade blur | z,w = 3rd & 4th cascade bias
	
	def c130, 9.5, 0.0246914, 9.210526, 1 // smooth distance blur | x = start, y = 1/(end - start), z = maximum blur, w = minimum
	def c131, 0.0001220703125, 0.00048828125, 0, 0 // x,y = static texel size
	
	def c132, 0, 1, 2, 3 // filter ID's
	def c133, 0.5, 1, 1.5, 2 // blur multipliers
	
	// PCSS constants
    def c140, 49, 0.2333333, 0.5, 0.045
    def c141, -33, 6, 0, 1
    defi i2, 12, 0, 0, 0
	// ----------------------------------------------------------------------------------------------------------------------------------------------
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 1.0173426851e-42 // 726
    def c127, 0.9999999, 1, 0, 0	// LogDepth constants
    def c0, 9.99999975e-006, 0, 1, -0.25
    def c1, -0.5, 0.5, 1.33333337, 9.99999975e-005
    def c2, 1.5, -0.326211989, -0.405809999, 1
    def c3, -0.791558981, -0.597710013, -0.100000001, 1.11111116
    def c4, 0.212500006, 0.715399981, 0.0720999986, 1.00000001e-007
    def c5, 1, -1, 0, -0
    def c6, 0.896420002, 0.412458003, -0.321940005, -0.932614982
    def c7, 0.185461, -0.893123984, 0.507430971, 0.0644249991
    def c8, 0.473434001, -0.480026007, 0.519456029, 0.767022014
    def c9, -0.203345001, 0.620715976, 0.962339997, -0.194983006
    def c10, -0.840143979, -0.0735799968, -0.69591397, 0.457136989
    dcl_texcoord v0.xy
    dcl_texcoord1 v1
    dcl_texcoord3 v2.xyz
    dcl_color v3
    dcl_texcoord2 v4.xyz
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s1
    dcl_2d s2
    dcl_2d s15
    texld r0, v0, s0
    add r1.xyz, c0.x, v1
    nrm r2.xyz, r1
    texld r1, v0, s2
    mul r1.w, r1.w, c74.x
    mul r2.w, r1.w, c0.z
    dp3 r1.x, r1, c76
    mul r1.x, r1.x, c75.x
    mul r1.x, r1.x, c0.z
    mul r0.xyz, r0, c66
    mul r0, r0, v3
    dp3 r1.y, v3, c78
    mul r1.y, r1.y, c39.z
    mov r3.yz, c0
    if_lt -c72.x, r3.y
      texld r4, v0, s1
      mul r1.z, r4.x, c72.x
      mad r5.x, r4.x, -c72.x, r3.z
      lrp r5.yzw, r1.z, c73.xxyz, r0.xxyz
      mad r6, r0.xxyz, c0.yzzz, c0.zyyy
      cmp r4, -r4.x, r6, r5
      mov r0.xyz, r4.yzww
    else
      mov r4.x, c0.z
    endif
    mul r1.x, r1.x, r4.x
    add r3.xyw, c0.x, v2.xyzz
    nrm r4.xyz, r3.xyww
    mad_sat r1.z, r2.z, c1.x, c1.y
    mov r5.xyz, c38
    mad r3.xyw, r5.xyzz, r1.z, c37.xyzz
    dp3 r1.z, -r4, r2
    add r1.z, r1.z, r1.z
    mad r5.xyz, r2, -r1.z, -r4
    mul r6.xyz, c18.w, c18
    dp3 r1.z, r2, -c17
    add r1.z, r1.z, c0.w
    mul_sat r1.z, r1.z, c1.z
    dp3_sat r4.w, -c17, r5
    add r4.w, r4.w, c1.w
    mov r5.w, c1.w
    mad r1.w, r1.w, c0.z, r5.w
    pow r5.w, r4.w, r1.w
    mul r7.xyz, c61.xyww, v4.y
    mad r7.xyz, v4.x, c60.xyww, r7
    mad r7.xyz, v4.z, c62.xyww, r7
    add r7.xyz, r7, c63.xyww
    dp3 r1.w, c14, v4
    add r8.xyz, -r1.w, -c54
    cmp r8.yzw, r8.xxyz, c0.z, c0.y
    mov r8.x, c0.z
    dp4 r9.x, r8, c57
    dp4 r9.y, r8, c58
    dp4 r10.x, r8, c59
    dp4 r10.y, r8, c56
    mad r7.xy, r7, r9, r10
    add r8.xyz, c15, -v4
    dp3 r1.w, r8, r8
    rsq r1.w, r1.w
    rcp r1.w, r1.w
    rcp r4.w, c53.w
    mul r4.w, r1.w, r4.w
    mul r4.w, r4.w, r4.w
    mul r4.w, r4.w, c2.x
    /* removed 1.0.6.0 filter
    mov r8.y, c53.y
    mad r8.xz, r8.y, c2.yyzw, r7.xyyw
    texld r9, r8.xzzw, s15
    add r6.w, r7.z, -r9.x
    cmp r6.w, r6.w, c0.z, c0.y
    mad r8.xz, r8.y, c10.xyyw, r7.xyyw
    texld r9, r8.xzzw, s15
    add r7.w, r7.z, -r9.x
    cmp r7.w, r7.w, c0.z, c0.y
    add r6.w, r6.w, r7.w
    mad r8.xz, r8.y, c10.zyww, r7.xyyw
    texld r9, r8.xzzw, s15
    add r7.w, r7.z, -r9.x
    cmp r7.w, r7.w, c0.z, c0.y
    add r6.w, r6.w, r7.w
    mad r8.xz, r8.y, c9.xyyw, r7.xyyw
    texld r9, r8.xzzw, s15
    add r7.w, r7.z, -r9.x
    cmp r7.w, r7.w, c0.z, c0.y
    add r6.w, r6.w, r7.w
    mad r8.xz, r8.y, c9.zyww, r7.xyyw
    texld r9, r8.xzzw, s15
    add r7.w, r7.z, -r9.x
    cmp r7.w, r7.w, c0.z, c0.y
    add r6.w, r6.w, r7.w
    mad r8.xz, r8.y, c8.xyyw, r7.xyyw
    texld r9, r8.xzzw, s15
    add r7.w, r7.z, -r9.x
    cmp r7.w, r7.w, c0.z, c0.y
    add r6.w, r6.w, r7.w
    mad r8.xz, r8.y, c8.zyww, r7.xyyw
    texld r9, r8.xzzw, s15
    add r7.w, r7.z, -r9.x
    cmp r7.w, r7.w, c0.z, c0.y
    add r6.w, r6.w, r7.w
    mad r8.xz, r8.y, c7.xyyw, r7.xyyw
    texld r9, r8.xzzw, s15
    add r7.w, r7.z, -r9.x
    cmp r7.w, r7.w, c0.z, c0.y
    add r6.w, r6.w, r7.w
    mad r8.xz, r8.y, c7.zyww, r7.xyyw
    texld r9, r8.xzzw, s15
    add r7.w, r7.z, -r9.x
    cmp r7.w, r7.w, c0.z, c0.y
    add r6.w, r6.w, r7.w
    mad r8.xz, r8.y, c6.xyyw, r7.xyyw
    texld r9, r8.xzzw, s15
    add r7.w, r7.z, -r9.x
    cmp r7.w, r7.w, c0.z, c0.y
    add r6.w, r6.w, r7.w
    mad r8.xz, r8.y, c6.zyww, r7.xyyw
    texld r9, r8.xzzw, s15
    add r7.w, r7.z, -r9.x
    cmp r7.w, r7.w, c0.z, c0.y
    add r6.w, r6.w, r7.w
    mad r7.xy, r8.y, c3, r7
    texld r8, r7, s15
    add r7.x, r7.z, -r8.x
    cmp r7.x, r7.x, c0.z, c0.y
    add r6.w, r6.w, r7.x
    removed 1.0.6.0 filter */
	// ------------------------------------------------------------- Per Cascade Tweaks -------------------------------------------------------------
    add r21.xyz, r7.x, -c120.xyz
    cmp r22.xy, r21.x, c121.yw, c121.xz
    cmp r22.xy, r21.y, c122.xz, r22.xy
    cmp r22.xy, r21.z, c122.yw, r22.xy	// r22.x = per cascade blur, r22.y = per cascade bias
	
    mul r20.xy, c131.xy, r22.x			// copy texel size and reduce cascade blur disparity
	add r7.z, r7.z, -r22.y				// improve depth bias for 2nd, 3rd and 4th cascade
	// ----------------------------------------------------------------------------------------------------------------------------------------------
	// -------------------------------------------------------------- Filter Selection --------------------------------------------------------------
	mov r20.z, c223.y
    add r21.xyz, r20.z, -c132.yzw
    cmp r20.w, r21.x, c133.y, c133.x
    cmp r20.w, r21.y, c133.z, r20.w
    cmp r20.w, r21.z, c133.w, r20.w // "Sharp", "Soft", "Softer" & "Softest"
	
	if_gt r20.z, c132.w // "PCSS"
		mov r21.y, c141.z // blockers
	
		mul r22.xy, r22.xx, c141.xy // pcss texel step
	
		mov r23.xy, r22.xx // x - inner loop index, y - outer loop index
		mov r24.x, c141.z // sum
	
		rep i2
			mul r21.w, r23.y, c140.w
	
			rep i2
				mad r25.xy, c53.xy, r23.xy, r7.xy
				texldl r26, r25.xy, s15
	
				add r25.x, r26.x, -r7.z
	
				if_gt r25.x, r21.w
					min r25.x, r25.x, c140.x // < 49
					add r24.x, r24.x, r25.x
					add r21.y, r21.y, c141.w
				endif
	
				add r23.x, r23.x, r22.y // j++
			endrep
			add r23.y, r23.y, r22.y // i++
			mov r23.x, r22.x // j = -33
		endrep
	
		// avg if any blockers
		if_gt r21.y, c141.z
			rcp r21.y, r21.y
			mul r24.x, r24.x, r21.y
			mul r24.x, r24.x, c140.y // maximum intensity
		else
			mov r24.x, c141.z
		endif
	
		max r20.w, r24.x, c140.z // minimum intensity
	endif
	// ----------------------------------------------------------------------------------------------------------------------------------------------
	// ------------------------------------------------------------ Smooth Distance Blur ------------------------------------------------------------
	add r20.z, r1.w, -c130.x
	mul_sat r20.z, r20.z, c130.y
	mul r20.z, r20.z, r20.z
	lrp r21.x, r20.z, c130.z, r20.w
	mul r20.xy, r20.xy, r21.x
	// ----------------------------------------------------------------------------------------------------------------------------------------------
	// ----------------------------------------------------------- 1.0.4.0 Shadow Filter ------------------------------------------------------------
    mov r21.xy, c112.xy
    mul r21.xy, r21.xy, c44.xy			// r21.xy * screen dimensions
    dp2add r21.y, v0, r21, c110.w		// v0.x * r21.x + v0.y * r21.y
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
		
		mad r24.xy, r23.xy, r20.xy, r7.xy	// offset * texel size + UV
		texld r24, r24, s15					// 1st sample
		mov r25.x, r24.x					// copy to r25
		mad r24.xy, r21.zw, r20.xy, r7.xy	// offset * texel size + UV
		texld r24, r24, s15					// 2nd sample
		mov r25.y, r24.x					// copy to r25
		mad r24.xy, r21.xy, r20.xy, r7.xy	// offset * texel size + UV
		texld r24, r24, s15					// 3rd sample
		mov r25.z, r24.x					// copy to r25
		mad r24.xy, r23.zw, r20.xy, r7.xy	// offset * texel size + UV
		texld r24, r24, s15					// 4th sample
		mov r25.w, r24.x					// copy to r25
	
		add r25, r7.z, -r25					// depth bias
		cmp r25, r25, c110.y, c110.w
		dp4 r20.w, r25, -c110.x				// average samples of current iteration
		add r20.z, r20.z, r20.w
		
		add r26, r26, c110.zzyz				// add (-1, -1, 1, -1)
		add r27, r27, -c110.zzyz			// add (1, 1, -1, 1)
	endrep
	
	mul r6.w, r20.z, c112.w					// average all iterations
	// ----------------------------------------------------------------------------------------------------------------------------------------------
    mad r4.w, r6.w, c2.w, r4.w
    add r1.w, r1.w, -c53.w
    cmp r7.xy, r1.w, c5, c5.zwzw
    add r1.w, r4.w, r7.y
    cmp_sat r1.w, r1.w, r4.w, r7.x
    mul r7.xyz, r6, r5.w
    mul r7.xyz, r1.w, r7
    mul r6.xyz, r6, r1.z
    mul r6.xyz, r1.w, r6
    mad r1.yzw, r3.xxyw, r1.y, r6.xxyz
    mul r2.w, r2.w, -c0.w
    add r6, c19, -v4.x
    add r8, c20, -v4.y
    add r9, c21, -v4.z
    mul r10, r6, r6
    mad r10, r8, r8, r10
    mad r10, r9, r9, r10
    add r11, r10, c0.x
    rsq r12.x, r11.x
    rsq r12.y, r11.y
    rsq r12.z, r11.z
    rsq r12.w, r11.w
    mad r10, r10, -c25, r3.z
    max r11, r10, c0.y
    mul r10, r11, r11
    mad r10, r10, r10, c3.z
    mul r11, r10, c3.w
    cmp r10, r10, r11, c0.y
    mul r11, r2.x, r6
    mad r11, r8, r2.y, r11
    mad r11, r9, r2.z, r11
    mul r10, r10, r11
    mul_sat r10, r12, r10
    mul r11, r6, -c22
    mad r11, r8, -c23, r11
    mad r11, r9, -c24, r11
    mul r11, r12, r11
    mov r13, c26
    mad_sat r11, r11, r13, c27
    mul r10, r10, r11
    mul r6, r5.x, r6
    mad r6, r5.y, r8, r6
    mad r6, r5.z, r9, r6
    mul r6, r12, r6
    log r8.x, r6_abs.x
    log r8.y, r6_abs.y
    log r8.z, r6_abs.z
    log r8.w, r6_abs.w
    mul r6, r2.w, r8
    exp r8.x, r6.x
    exp r8.y, r6.y
    exp r8.z, r6.z
    exp r8.w, r6.w
    mul r6, r10, r8
    dp4 r8.x, c29, r10
    dp4 r8.y, c30, r10
    dp4 r8.z, c31, r10
    dp4 r9.x, c29, r6
    dp4 r9.y, c30, r6
    dp4 r9.z, c31, r6
    add r1.yzw, r1, r8.xxyz
    mad r3.xyw, r7.xyzz, c17.w, r9.xyzz
    add r6, c32, -v4.x
    add r7, c33, -v4.y
    add r8, c34, -v4.z
    mul r9, r6, r6
    mad r9, r7, r7, r9
    mad r9, r8, r8, r9
    add r10, r9, c0.x
    rsq r11.x, r10.x
    rsq r11.y, r10.y
    rsq r11.z, r10.z
    rsq r11.w, r10.w
    mad r9, r9, -c36, r3.z
    max r10, r9, c0.y
    mul r9, r10, r10
    mad r9, r9, r9, c3.z
    mul r10, r9, c3.w
    cmp r9, r9, r10, c0.y
    mul r10, r2.x, r6
    mad r10, r7, r2.y, r10
    mad r10, r8, r2.z, r10
    mul r9, r9, r10
    mul_sat r9, r11, r9
    mul r10, r6, -c67
    mad r10, r7, -c68, r10
    mad r10, r8, -c69, r10
    mul r10, r11, r10
    mov r12, c70
    mad_sat r10, r10, r12, c71
    mul r9, r9, r10
    mul r6, r5.x, r6
    mad r6, r5.y, r7, r6
    mad r5, r5.z, r8, r6
    mul r5, r11, r5
    log r6.x, r5_abs.x
    log r6.y, r5_abs.y
    log r6.z, r5_abs.z
    log r6.w, r5_abs.w
    mul r5, r2.w, r6
    exp r6.x, r5.x
    exp r6.y, r5.y
    exp r6.z, r5.z
    exp r6.w, r5.w
    mul r5, r9, r6
    dp4 r6.x, c35, r9
    dp4 r6.y, c64, r9
    dp4 r6.z, c65, r9
    dp4 r7.x, c35, r5
    dp4 r7.y, c64, r5
    dp4 r7.z, c65, r5
    add r5.xyz, r1.yzww, r6
    add r1.yzw, r3.xxyw, r7.xxyz
    dp3 r2.x, r4, r2
    add r2.x, -r2_abs.x, c0.z
    mul r2.x, r2.x, r2.x
    mul r2.x, r2.x, r2.x
    mad_sat r2.x, r2.x, c1.y, c1.y
    mul r1.x, r1.x, r2.x
    mov r5.w, c0.z
    mul r0, r0, r5
    mad r0.xyz, r1.x, r1.yzww, r0
    mul oC0.w, r0.w, c39.x
    add r0.w, c16.w, -v1.w
    add r1.x, -c16.z, c16.w
    rcp r1.x, r1.x
    mul_sat r0.w, r0.w, r1.x
    add r0.w, -r0.w, c0.z
    add r1.xy, -r3.z, c16
    mul r1.y, r0.w, r1.y
    mad r0.w, r0.w, r1.x, c0.z
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

// approximately 283 instruction slots used (15 texture, 268 arithmetic)
