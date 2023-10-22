// Improved shadow filtering + console-like ambient reflection intensity + console tree lighting + dithering mask + fixed trees' orange glow
// Custom registers: c223
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D GBufferStencilTextureSampler;
//   sampler2D GBufferTextureSampler0;
//   sampler2D GBufferTextureSampler1;
//   sampler2D GBufferTextureSampler2;
//   sampler2D GBufferTextureSampler3;
//   sampler2D ParabSampler;
//   float4 dReflectionParams;
//   float4 gDeferredProjParams;
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
//   float4 globalScalars;
//
//
// Registers:
//
//   Name                         Reg   Size
//   ---------------------------- ----- ----
//   gViewInverse                 c12      4
//   gDirectionalLight            c17      1
//   gDirectionalColour           c18      1
//   gLightAmbient0               c37      1
//   gLightAmbient1               c38      1
//   globalScalars                c39      1
//   gShadowParam18192021         c53      1
//   gFacetCentre                 c54      1
//   gShadowParam14151617         c56      1
//   gShadowParam0123             c57      1
//   gShadowParam4567             c58      1
//   gShadowParam891113           c59      1
//   gShadowMatrix                c60      4
//   gDeferredProjParams          c66      1
//   dReflectionParams            c72      1
//   GBufferTextureSampler0       s0       1
//   GBufferTextureSampler1       s1       1
//   GBufferTextureSampler2       s2       1
//   GBufferTextureSampler3       s4       1
//   GBufferStencilTextureSampler s5       1
//   ParabSampler                 s6       1
//   gShadowZSamplerDir           s15      1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 9.8090892503e-45 // 7
    def c127, 0.9999999, 1, 0, 0	// LogDepth constants
    def c0, 0, 512, 4096, 0.00200000009
    def c1, 0.99609375, 7.96875, 63.75, 0.25
    def c2, 256, -127.999992, 0.000392156857, 4
    def c3, 2, 0.5, 1, 9.99999975e-006
    def c4, 1.33333337, 9.99999975e-005, 1, 0
    def c5, 1.5, -0.326211989, -0.405809999, 1
    def c6, -0.791558981, -0.597710013, -0.5, 0.5
    def c7, 0.0199999996, 0.00999999978, 0.75, 0.25
    def c8, 5, 10, 0, 0
    def c9, 1, -1, 0, -0
    def c10, 0.896420002, 0.412458003, -0.321940005, -0.932614982
    def c11, 0.185461, -0.893123984, 0.507430971, 0.0644249991
    def c12, 0.473434001, -0.480026007, 0.519456029, 0.767022014
    def c13, -0.203345001, 0.620715976, 0.962339997, -0.194983006
    def c16, -0.840143979, -0.0735799968, -0.69591397, 0.457136989
	def c20, 1.6666667, 0, 0, 0	// Reflection intensity multiplier
	def c21, 3, 2, 1, 0	// Console tree lighting constants
	def c22, 0.01171875, 0.01953125, 0.0234375, 0
	def c23, 0.35, 0.5, 0.3333333, 0
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
    dcl_texcoord v0.xy
    dcl_texcoord1 v1
    dcl_2d s0
    dcl_2d s1
    dcl_2d s2
    dcl_2d s4
    dcl_2d s5
    dcl_2d s6
    dcl_2d s15
    texld r0, v0, s4
	// ----------------------------------------------------------------- Log2Linear -----------------------------------------------------------------
	if_ne r0.x, c127.y
		rcp r20.x, c128.x
		mul r20.x, r20.x, c128.y
		pow r20.x, r20.x, r0.x
		mul r20.x, r20.x, c128.x	// W_clip
		
		add r20.y, r20.x, -c128.x
		add r20.z, c128.y, -c128.x
		mul r20.y, r20.y, c128.y
		mul r20.z, r20.z, r20.x
		rcp r20.z, r20.z
		mul r20.w, r20.y, r20.z		// Linear depth
		
		min r0, r20.w, c127.x		// FP error hack
	endif
	// ----------------------------------------------------------------------------------------------------------------------------------------------
    mad r0.x, r0.x, c66.z, -c66.w
    mul r0.x, r0.x, v1.w
    rcp r0.x, r0.x
    mad r0.yzw, v1.xxyz, -r0.x, c15.xxyz
    dp3 r1.x, c14, r0.yzww
    add r1.xyz, -r1.x, -c54
    cmp r1.yzw, r1.xxyz, c4.z, c4.w
    mov r1.x, c3.z
    dp4 r2.x, r1, c57
    dp4 r2.y, r1, c58
    dp4 r3.x, r1, c59
    dp4 r3.y, r1, c56
    mul r1.xyz, r0.z, c61.xyww
    mad r1.xyz, r0.y, c60.xyww, r1
    mad r1.xyz, r0.w, c62.xyww, r1
    add r0.yzw, -r0, c15.xxyz
    dp3 r0.y, r0.yzww, r0.yzww
    rsq r0.y, r0.y
    rcp r0.y, r0.y
    add r1.xyz, r1, c63.xyww
    mad r0.zw, r1.xyxy, r2.xyxy, r3.xyxy
    /* removed 1.0.6.0 filter
    mov r1.y, c53.y
    mad r1.xw, r1.y, c5.yyzz, r0.zyzw
    texld r2, r1.xwzw, s15
    add r1.x, r1.z, -r2.x
    cmp r1.x, r1.x, c4.z, c4.w
    mad r2.xy, r1.y, c16, r0.zwzw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c4.z, c4.w
    add r1.x, r1.x, r1.w
    mad r2.xy, r1.y, c16.zwzw, r0.zwzw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c4.z, c4.w
    add r1.x, r1.x, r1.w
    mad r2.xy, r1.y, c13, r0.zwzw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c4.z, c4.w
    add r1.x, r1.x, r1.w
    mad r2.xy, r1.y, c13.zwzw, r0.zwzw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c4.z, c4.w
    add r1.x, r1.x, r1.w
    mad r2.xy, r1.y, c12, r0.zwzw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c4.z, c4.w
    add r1.x, r1.x, r1.w
    mad r2.xy, r1.y, c12.zwzw, r0.zwzw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c4.z, c4.w
    add r1.x, r1.x, r1.w
    mad r2.xy, r1.y, c11, r0.zwzw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c4.z, c4.w
    add r1.x, r1.x, r1.w
    mad r2.xy, r1.y, c11.zwzw, r0.zwzw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c4.z, c4.w
    add r1.x, r1.x, r1.w
    mad r2.xy, r1.y, c10, r0.zwzw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c4.z, c4.w
    add r1.x, r1.x, r1.w
    mad r2.xy, r1.y, c10.zwzw, r0.zwzw
    mad r0.zw, r1.y, c6.xyxy, r0
    texld r3, r0.zwzw, s15
    add r0.z, r1.z, -r3.x
    cmp r0.z, r0.z, c4.z, c4.w
    texld r2, r2, s15
    add r0.w, r1.z, -r2.x
    cmp r0.w, r0.w, c4.z, c4.w
    add r0.w, r1.x, r0.w
    add r0.z, r0.z, r0.w
	removed 1.0.6.0 filter */
	// ------------------------------------------------------------- Per Cascade Tweaks -------------------------------------------------------------
    add r21.xyz, r0.z, -c120.xyz
    cmp r22.xy, r21.x, c121.yw, c121.xz
    cmp r22.xy, r21.y, c122.xz, r22.xy
    cmp r22.xy, r21.z, c122.yw, r22.xy	// r22.x = per cascade blur, r22.y = per cascade bias
	
    mul r20.xy, c131.xy, r22.x			// copy texel size and reduce cascade blur disparity
	add r1.z, r1.z, -r22.y				// improve depth bias for 2nd, 3rd and 4th cascade
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
				mad r25.xy, c53.xy, r23.xy, r0.zw
				texldl r26, r25.xy, s15
	
				add r25.x, r26.x, -r1.z
	
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
	add r20.z, r0.y, -c130.x
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
		
		mad r24.xy, r23.xy, r20.xy, r0.zw	// offset * texel size + UV
		texld r24, r24, s15					// 1st sample
		mov r25.x, r24.x					// copy to r25
		mad r24.xy, r21.zw, r20.xy, r0.zw	// offset * texel size + UV
		texld r24, r24, s15					// 2nd sample
		mov r25.y, r24.x					// copy to r25
		mad r24.xy, r21.xy, r20.xy, r0.zw	// offset * texel size + UV
		texld r24, r24, s15					// 3rd sample
		mov r25.z, r24.x					// copy to r25
		mad r24.xy, r23.zw, r20.xy, r0.zw	// offset * texel size + UV
		texld r24, r24, s15					// 4th sample
		mov r25.w, r24.x					// copy to r25
	
		add r25, r1.z, -r25					// depth bias
		cmp r25, r25, c110.y, c110.w
		dp4 r20.w, r25, -c110.x				// average samples of current iteration
		add r20.z, r20.z, r20.w
		
		add r26, r26, c110.zzyz				// add (-1, -1, 1, -1)
		add r27, r27, -c110.zzyz			// add (1, 1, -1, 1)
	endrep
	
	mul r0.z, r20.z, c112.w					// average all iterations
	// ----------------------------------------------------------------------------------------------------------------------------------------------
    rcp r0.w, c53.w
    mul r0.w, r0.y, r0.w
    add r0.y, r0.y, -c53.w
    cmp r1.xy, r0.y, c9, c9.zwzw
    mul r0.y, r0.w, r0.w
	mul r0.y, r0.y, r0.y	// improved fadeout
    mul r0.y, r0.y, c5.x
    mad r0.y, r0.z, c5.w, r0.y
    add r0.z, r1.y, r0.y
	// ----------------------------------------------------------- Console Tree Lighting ------------------------------------------------------------
	texld r21, v0, s5
	add r21.yz, r21.x, -c22
	cmp r21.yz, -r21_abs, c4.z, c4.w
	add_sat r21.x, r21.y, r21.z // masks 5 and 6
	mov r21.y, c223.x
	add r21.y, r21.y, -c21.y
	cmp r21.y, -r21_abs.y, r21.x, c4.w	// Console tree lighting toggle
	if_eq r21.y, c4.w
		cmp_sat r0.y, r0.z, r0.y, r1.x
		texld r1, v0, s1
		mul r2.xyz, r1.w, c1
		frc r2.xyz, r2
		add r3.xyz, r2, r2
		mad r3.xy, r2.yzzw, -c1.w, r3
		mad r1.xyz, r1, c2.x, r3
		add r1.xyz, r1, c2.y
		nrm r2.xyz, r1
		mad r1.xyz, v1, -r0.x, c3.w
		mul r0.xzw, r0.x, v1.xyyz
		nrm r3.xyz, r1
		dp3 r1.x, r3, r2
		add r1.y, r1.x, r1.x
		add r1.x, -r1_abs.x, c3.z
		mul r1.x, r1.x, r1.x
		mul r1.x, r1.x, r1.x
		mad r1.x, r1.x, c7.z, c7.w
		mad r1.yzw, r2.xxyz, -r1.y, r3.xxyz
		dp3_sat r2.w, -c17, r1.yzww
		add r2.w, r2.w, c4.y
		mul r3.w, r2.z, c2.w
		mov_sat r3.w, r3.w
		mul r3.w, r3.w, c72.y
		texld r4, v0, s5
		add r20.xy, r4.x, -c22.xw
		cmp r20.xy, -r20_abs.xy, c4.z, c4.w
		add_sat r20.x, r20.x, r20.y
		add r4.x, r20.x, -c4.z // change wetness mask to include stencil 3 alongside 0 (since 3 is now used for the dithering mask)
		cmp r3.w, r4.x, r3.w, c0.x
		texld r4, v0, s2
		mul r4.y, r4.y, r4.y
		mul r5.xy, r4.y, c0.yzzw
		min r4.w, r5.y, c2.x
		mad r4.y, r4.y, -c0.y, r4.w
		mad r4.y, r3.w, r4.y, r5.x
		max r6.x, r5.x, r4.y
		add r4.y, r6.x, c4.y
		pow r5.x, r2.w, r4.y
		mul r5.yzw, c18.w, c18.xxyz
		mul r6.yzw, r5.x, r5
		mul r6.yzw, r0.y, r6
		dp3 r0.x, r3, -r0.xzww
		mul_sat r0.xz, r0.x, c7.xyyw
		add r0.z, -r0.z, c3.z
		mad r1.yzw, r3.xxyz, r0.x, r1
		add r1.yzw, r1, c3.w
		nrm r3.xyz, r1.yzww
		mul_sat r0.x, r3.z, c8.x
		mov_sat r0.w, r3.z
		add r0.w, r0.w, c3.z
		add r0.w, r0.w, r0.w
		rcp r0.w, r0.w
		mad r1.yz, r3.xxyw, r0.w, c3.y
		add r7.xy, -r1.yzzw, c3.z
		mul_sat r0.w, r6.x, c72.x
		mul r1.y, r6.x, c0.w
		min r2.w, r1.y, c1.w
		mad r1.y, r4.x, -c3.x, r2.w
		mad r7.w, r0.w, -c2.w, c2.w
		mov r7.z, c0.x
		texldl r7, r7, s6
		mul r7, r7, c20.x	// reflection intensity tweak
		mul r3.xyz, r0.x, r7
		mul r0.xzw, r0.z, r3.xyyz
		mul r0.xzw, r4.z, r0
		mul r0.xzw, r0, c39.w
		mul r0.xzw, r1.x, r0
		mul r0.xzw, r0, c8.y
		add r1.x, c17.w, c17.w
		mad r0.xzw, r6.yyzw, r1.x, r0
		add r1.x, r4.x, r4.x
		mad r1.y, r3.w, r1.y, r1.x
		mad r1.z, r3.w, -c3.y, c3.z
		max r2.w, r1.x, r1.y
		mul r0.xzw, r0, r2.w
		dp3 r1.x, r2, -c17
		mad_sat r1.y, r2.z, c6.z, c6.w
		mov r10, c38
		mov r11, c37
		if_ne -r21_abs.x, c4.w // Tree orange glow fix
			dp3 r12.x, r10, c23.z
			dp3 r12.y, r11, c23.z
			lrp r10, c23.x, r10, r12.x
			lrp r11, c23.y, r11, r12.y
		endif
		mov r2.xyz, r10
		mad r2.xyz, r2, r1.y, r11
		mul r2.xyz, r4.z, r2
		add r1.x, r1.x, -c1.w
		mul_sat r1.x, r1.x, c4.x
		mul r1.xyw, r5.yzzw, r1.x
		mad r1.xyw, r1, r0.y, r2.xyzz
		texld r2, v0, s0
		mul r2.xyz, r1.z, r2
		mad oC0.xyz, r2, r1.xyww, r0.xzww
		mov oC0.w, c3.z
	else
		cmp_sat r8.x, r0.z, r0.y, r1.x
		
		texld r1, v0, s1
		mul r2.xyz, r1.w, c1
		frc r2.xyz, r2
		add r3.xyz, r2, r2
		mad r3.xy, r2.yzzw, -c1.w, r3
		mad r1.xyz, r1, c2.x, r3
		add r1.xyz, r1, c2.y
		nrm r2.xyz, r1
		
		mad r1.xyz, v1, -r0.x, c3.w
		nrm r3.xyz, r1
		
		//dot(viewDir, normal)
		dp3 r4.y, r3.xyz, r2.xyz
		//saturate(viewDir.z)
		mov_sat r4.x, r3.z
		//                 (3, 2, 1)
		add r0.xyz, r4.yxy, c21.xyz
		
		add r1.y, r0.y, r4.x
		rcp r1.y, r1.y
		//                        0.5
		mad r1.yz, r3.yxyx, r1.y, c3.yy
		//                    1
		add r1.yz, -r1.yzyz, c3.z
		
		mov r1.xy, r1.zy
		//0
		mov r1.z, c4.w
		//4
		mov r1.w, c2.w
		texldl r4.xyz, r1, s6
		
		//viewDir.z * -0.5 + 0.5
		mad_sat r1.y, r3.z, c6.z, c6.w
		
		mul r6.xyz, c18.xyz, c18.w
		//dot(normal, -dirLight) * dirLightColor
		dp3_sat r0.w, r2.xyz, -c17.xyz
		mul r5.xyz, r6, r0.w
		
		//saturate(viewDir.z * 2)
		add_sat r0.w, r3.z, r3.z
		
		//remappedViewDir.z * ambient1 + ambient0
		mov r8.yzw, c38.xxyz
		mad r1.yzw, r1.y, r8.yyzw, c37.xxyz
		
		//paraboloid - ambient
		add r4.xyz, -r1.yzw, r4.xyz
		
		//        0.25
		mul r2.w, c1.w, r0.x
		
		//parabAmbient * saturate(viewDir.z * 2) + ambient
		mad r4.xyz, r4.xyz, r0.w, r1.yzw
		
		max r1.yzw, r4.xxyz, r1.yyzw
		//        0.25
		mul r0.w, c1.w, r0.z
		
		mul r0.xyz, r2.w, r1.yzw
		//diffuseLight * shadow + r0
		mad r0.xyz, r5.xyz, r8.x, r0.xyz
		
		//diffuse * r0
		texld r2.xyz, v0, s0
		mul r0.xyz, r0.xyz, r2.xyz
		
		mul r0.w, r0.w, r0.w
		
		mad oC0.xyz, r0.w, r1.yzw, r0.xyz
		mov oC0.w, c4.z
	endif
	// ----------------------------------------------------------------------------------------------------------------------------------------------

// approximately 184 instruction slots used (19 texture, 165 arithmetic)
