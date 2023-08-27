// Added FXAA, fixed blurry screen, improved Definition setting behavior (doesn't affect stipple smoothing and DOF, only motion blur), console-like gamma
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D AdapLumSampler;
//   float4 ColorCorrect;
//   float4 ColorShift;
//   float Exposure;
//   sampler2D GBufferTextureSampler2;
//   sampler2D GBufferTextureSampler3;
//   sampler2D HDRSampler;
//   sampler2D JitterSampler;
//   float PLAYER_MASK;
//   sampler2D StencilCopySampler;
//   float4 TexelSize;
//   float4 ToneMapParams;
//   float4 deSatContrastGamma;
//   float4 dofBlur;
//   float4 dofProj;
//   float gDirectionalMotionBlurLength;
//   float4 globalScreenSize;
//   row_major float4x4 motionBlurMatrix;
//
//
// Registers:
//
//   Name                         Reg   Size
//   ---------------------------- ----- ----
//   globalScreenSize             c44      1
//   Exposure                     c66      1
//   motionBlurMatrix             c72      4
//   TexelSize                    c76      1
//   dofProj                      c77      1
//   dofBlur                      c78      1
//   gDirectionalMotionBlurLength c79      1
//   ToneMapParams                c80      1
//   deSatContrastGamma           c81      1
//   ColorCorrect                 c82      1
//   ColorShift                   c83      1
//   PLAYER_MASK                  c84      1
//   GBufferTextureSampler2       s0       1
//   GBufferTextureSampler3       s1       1
//   HDRSampler                   s2       1
//   AdapLumSampler               s3       1
//   JitterSampler                s4       1
//   StencilCopySampler           s5       1
//

    ps_3_0
	// --------------------------------------------------------------- Quick Toggles ----------------------------------------------------------------
	def c27, 1, 0, 88, 99		// FXAA Toggle
	def c28, 0, 0, 88, 99		// Console Gamma Toggle
	// ----------------------------------------------------------------------------------------------------------------------------------------------
    def c127, 0.9999999, 1, 0, 0
    def c0, 58.1640015, 47.1300011, 0, 0
    def c1, 0, 0.212500006, 0.715399981, 0.0720999986
    def c2, 0.25, 256, 1, 0
    def c3, 0, 2, 4, 8
    def c4, -0.5, -1.5, 1.5, 0.5
    def c5, 2, -1, 0.125, 0
    def c6, 256, 2, 4, 8
    def c7, 0, 0.25, 0.5, 1
	def c10, 1.3333333, 1.0526316, 1.05577, 0.0762		// Gamma Constants
	// --------------------------------------------------------------- FXAA Constants ---------------------------------------------------------------
	// NVIDIA FXAA 3.11 by Timothy Lottes
	def c20, 0.25, 0, 0, 0		// Subpix				0.25, 0, 0, 0       
	def c21, 0.125, 0, 0, 0		// EdgeThreshold		0.125, 0, 0, 0      
	def c22, 0, 0, 0, 0			// EdgeThresholdMin		0, 0, 0, 0          	
    def c23, 0.0833333358, 0.5, -2, 3
    def c24, 0.25, 1.5, 4, 12
    def c25, 1, 0, -1, -2
	def c26, 0.298999995, 0.587000012, 0.114, 0
	// ----------------------------------------------------------------------------------------------------------------------------------------------
    defi i0, 7, 0, 0, 0
    dcl_texcoord v0.xy
    dcl_2d s0
    dcl_2d s1
    dcl_2d s2
    dcl_2d s3
    dcl_2d s4
    dcl_2d s5
    texld r0, v0, s1
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
    add r0.y, -c77.x, c77.y
    rcp r0.y, r0.y
    mul r0.z, r0.y, c77.y
    mul r0.z, r0.z, -c77.x
    mad r0.x, c77.y, -r0.y, r0.x
    rcp r0.x, r0.x
    mul r0.x, r0.z, r0.x
	// -------------------------------------------------------------------- FXAA --------------------------------------------------------------------
	if_ne c27.x, c27.y
		mov r20, c76
		mul r22, c25.xxyy, v0.xyxx
		texldl r22, r22, s2
		mul r21.xyz, r22, r22
		dp3 r22.w, r21, c26
		rsq r22.w, r22.w
		rcp r22.w, r22.w
		mov r23.xyz, c25
		mad r24.xyz, r20.yxyw, r23.xxyw, v0.yxyw
		mul r25.xzw, c25.xyyy, v0.x
		mov r25.y, r24.x
		texldl r25, r25, s2
		mul r21.xyz, r25, r25
		dp3 r25.w, r21, c26
		rsq r25.w, r25.w
		rcp r25.w, r25.w
		mul r24, r24.yzyy, c25.xxyy
		texldl r24, r24, s2
		mul r21.xyz, r24, r24
		dp3 r24.w, r21, c26
		rsq r24.w, r24.w
		rcp r24.w, r24.w
		mad r24.xyz, r20.yxyw, r23.zzyw, v0.yxyw
		mul r26.xzw, c25.xyyy, v0.x
		mov r26.y, r24.x
		texldl r26, r26, s2
		mul r21.xyz, r26, r26
		dp3 r26.w, r21, c26
		rsq r26.w, r26.w
		rcp r26.w, r26.w
		mul r27, r24.yzyy, c25.xxyy
		texldl r27, r27, s2
		mul r21.xyz, r27, r27
		dp3 r27.w, r21, c26
		rsq r27.w, r27.w
		rcp r27.w, r27.w
		max r23.w, r25.w, r22.w
		min r24.x, r22.w, r25.w
		max r25.x, r24.w, r23.w
		min r23.w, r24.x, r24.w
		max r24.x, r26.w, r27.w
		min r24.y, r27.w, r26.w
		max r26.x, r24.x, r25.x
		min r25.x, r23.w, r24.y
		mul r23.w, r26.x, c21.x
		add r24.x, -r25.x, r26.x
		max r24.y, c22.x, r23.w
		if_lt r24.x, r24.y
		else
		add r28.xy, -r20, v0
		mov r28.zw, c25.y
		texldl r28, r28, s2
		mul r21.xyz, r28, r28
		dp3 r28.w, r21, c26
		rsq r28.w, r28.w
		rcp r28.w, r28.w
		add r29.xy, r20, v0
		mov r29.zw, c25.y
		texldl r29, r29, s2
		mul r21.xyz, r29, r29
		dp3 r29.w, r21, c26
		rsq r29.w, r29.w
		rcp r29.w, r29.w
		mad r30, r20.xyxy, r23.xzzx, v0.xyxy
		mul r31, r30.xyxx, c25.xxyy
		texldl r31, r31, s2
		mul r21.xyz, r31, r31
		dp3 r31.w, r21, c26
		rsq r31.w, r31.w
		rcp r31.w, r31.w
		mul r30, r30.zwxx, c25.xxyy
		texldl r30, r30, s2
		mul r21.xyz, r30, r30
		dp3 r30.w, r21, c26
		rsq r30.w, r30.w
		rcp r30.w, r30.w
		add r23.x, r25.w, r26.w
		add r23.z, r24.w, r27.w
		rcp r23.w, r24.x
		add r24.x, r23.z, r23.x
		mad r23.x, r22.w, c25.w, r23.x
		mad r23.z, r22.w, c25.w, r23.z
		add r24.y, r29.w, r31.w
		add r24.z, r28.w, r31.w
		mad r25.x, r24.w, c25.w, r24.y
		mad r24.z, r26.w, c25.w, r24.z
		add r25.y, r28.w, r30.w
		add r25.z, r29.w, r30.w
		mad r23.x, r23_abs.x, -c25.w, r25_abs.x
		mad r23.z, r23_abs.z, -c25.w, r24_abs.z
		mad r24.z, r27.w, c25.w, r25.y
		mad r25.x, r25.w, c25.w, r25.z
		add r23.x, r23.x, r24_abs.z
		add r23.z, r23.z, r25_abs.x
		add r24.y, r24.y, r25.y
		add r23.x, -r23.z, r23.x
		mad r23.z, r24.x, -c25.w, r24.y
		cmp r24.x, r23.x, r26.w, r27.w
		cmp r24.y, r23.x, r25.w, r24.w
		cmp r24.z, r23.x, r20.y, r20.x
		mad r23.z, r23.z, c23.x, -r22.w
		add r24.w, -r22.w, r24.x
		add r25.x, -r22.w, r24.y
		add r24.xy, r22.w, r24
		add r25.y, r24_abs.w, -r25_abs.x
		max r26.x, r24_abs.w, r25_abs.x
		cmp r24.z, r25.y, -r24.z, r24.z
		mul_sat r23.z, r23.w, r23_abs.z
		cmp r23.w, r23.x, r20.x, r23.y
		cmp r23.y, r23.x, r23.y, r20.y
		mad r25.xz, r24.z, c23.y, v0.xyyw
		cmp r24.w, r23.x, v0.x, r25.x
		cmp r25.x, r23.x, r25.z, v0.y
		add r27.x, -r23.w, r24.w
		add r27.y, -r23.y, r25.x
		add r28.x, r23.w, r24.w
		add r28.y, r23.y, r25.x
		mad r24.w, r23.z, c23.z, c23.w
		mov r27.zw, c25.y
		texldl r29, r27, s2
		mul r21.xyz, r29, r29
		dp3 r29.w, r21, c26
		rsq r29.w, r29.w
		rcp r29.w, r29.w
		mul r23.z, r23.z, r23.z
		mov r28.zw, c25.y
		texldl r30, r28, s2
		mul r21.xyz, r30, r30
		dp3 r30.w, r21, c26
		rsq r30.w, r30.w
		rcp r30.w, r30.w
		cmp r24.x, r25.y, r24.x, r24.y
		mul r24.y, r26.x, c24.x
		mad r25.x, r24.x, -c23.y, r22.w
		mul r23.z, r23.z, r24.w
		mad r25.y, r24.x, -c23.y, r29.w
		mad r25.z, r24.x, -c23.y, r30.w
		mad r26.yz, r26.x, -c24.x, r25_abs
		mad r24.w, r23.w, -c24.y, r27.x
		cmp r29.x, r26.y, r27.x, r24.w
		mad r24.w, r23.y, -c24.y, r27.y
		cmp r29.y, r26.y, r27.y, r24.w
		cmp r27.xy, r26.yzzw, c25.y, c25.x
		add r24.w, r27.y, r27.x
		mad r25.w, r23.w, c24.y, r28.x
		cmp r27.x, r26.z, r28.x, r25.w
		mad r25.w, r23.y, c24.y, r28.y
		cmp r27.y, r26.z, r28.y, r25.w
		if_lt -r24.w, c25.y
			if_ge r25_abs.y, r24.y
			else
			mov r29.zw, c25.y
			texldl r28, r29, s2
			mul r21.xyz, r28, r28
			dp3 r28.w, r21, c26
			rsq r28.w, r28.w
			rcp r28.w, r28.w
			mov r25.y, r28.w
			endif
			if_ge r25_abs.z, r24.y
			else
			mov r27.zw, c25.y
			texldl r28, r27, s2
			mul r21.xyz, r28, r28
			dp3 r28.w, r21, c26
			rsq r28.w, r28.w
			rcp r28.w, r28.w
			mov r25.z, r28.w
			endif
			mad r24.w, r24.x, -c23.y, r25.y
			cmp r25.y, r26.y, r25.y, r24.w
			mad r24.w, r24.x, -c23.y, r25.z
			cmp r25.z, r26.z, r25.z, r24.w
			mad r26.yz, r26.x, -c24.x, r25_abs
			mad r24.w, r23.w, c25.w, r29.x
			cmp r29.x, r26.y, r29.x, r24.w
			mad r24.w, r23.y, c25.w, r29.y
			cmp r29.y, r26.y, r29.y, r24.w
			cmp r28.xy, r26.yzzw, c25.y, c25.x
			add r24.w, r28.y, r28.x
			mad r25.w, r23.w, -c25.w, r27.x
			cmp r27.x, r26.z, r27.x, r25.w
			mad r25.w, r23.y, -c25.w, r27.y
			cmp r27.y, r26.z, r27.y, r25.w
			if_lt -r24.w, c25.y
			if_ge r25_abs.y, r24.y
			else
				mov r29.zw, c25.y
				texldl r28, r29, s2
				mul r21.xyz, r28, r28
				dp3 r28.w, r21, c26
				rsq r28.w, r28.w
				rcp r28.w, r28.w
				mov r25.y, r28.w
			endif
			if_ge r25_abs.z, r24.y
			else
				mov r27.zw, c25.y
				texldl r28, r27, s2
				mul r21.xyz, r28, r28
				dp3 r28.w, r21, c26
				rsq r28.w, r28.w
				rcp r28.w, r28.w
				mov r25.z, r28.w
			endif
			mad r24.w, r24.x, -c23.y, r25.y
			cmp r25.y, r26.y, r25.y, r24.w
			mad r24.w, r24.x, -c23.y, r25.z
			cmp r25.z, r26.z, r25.z, r24.w
			mad r26.yz, r26.x, -c24.x, r25_abs
			mad r24.w, r23.w, c25.w, r29.x
			cmp r29.x, r26.y, r29.x, r24.w
			mad r24.w, r23.y, c25.w, r29.y
			cmp r29.y, r26.y, r29.y, r24.w
			cmp r28.xy, r26.yzzw, c25.y, c25.x
			add r24.w, r28.y, r28.x
			mad r25.w, r23.w, -c25.w, r27.x
			cmp r27.x, r26.z, r27.x, r25.w
			mad r25.w, r23.y, -c25.w, r27.y
			cmp r27.y, r26.z, r27.y, r25.w
			if_lt -r24.w, c25.y
				if_ge r25_abs.y, r24.y
				else
				mov r29.zw, c25.y
				texldl r28, r29, s2
				mul r21.xyz, r28, r28
				dp3 r28.w, r21, c26
				rsq r28.w, r28.w
				rcp r28.w, r28.w
				mov r25.y, r28.w
				endif
				if_ge r25_abs.z, r24.y
				else
				mov r27.zw, c25.y
				texldl r28, r27, s2
				mul r21.xyz, r28, r28
				dp3 r28.w, r21, c26
				rsq r28.w, r28.w
				rcp r28.w, r28.w
				mov r25.z, r28.w
				endif
				mad r24.w, r24.x, -c23.y, r25.y
				cmp r25.y, r26.y, r25.y, r24.w
				mad r24.w, r24.x, -c23.y, r25.z
				cmp r25.z, r26.z, r25.z, r24.w
				mad r26.yz, r26.x, -c24.x, r25_abs
				mad r24.w, r23.w, c25.w, r29.x
				cmp r29.x, r26.y, r29.x, r24.w
				mad r24.w, r23.y, c25.w, r29.y
				cmp r29.y, r26.y, r29.y, r24.w
				cmp r28.xy, r26.yzzw, c25.y, c25.x
				add r24.w, r28.y, r28.x
				mad r25.w, r23.w, -c25.w, r27.x
				cmp r27.x, r26.z, r27.x, r25.w
				mad r25.w, r23.y, -c25.w, r27.y
				cmp r27.y, r26.z, r27.y, r25.w
				if_lt -r24.w, c25.y
				if_ge r25_abs.y, r24.y
				else
					mov r29.zw, c25.y
					texldl r28, r29, s2
					mul r21.xyz, r28, r28
					dp3 r28.w, r21, c26
					rsq r28.w, r28.w
					rcp r28.w, r28.w
					mov r25.y, r28.w
				endif
				if_ge r25_abs.z, r24.y
				else
					mov r27.zw, c25.y
					texldl r28, r27, s2
					mul r21.xyz, r28, r28
					dp3 r28.w, r21, c26
					rsq r28.w, r28.w
					rcp r28.w, r28.w
					mov r25.z, r28.w
				endif
				mad r24.w, r24.x, -c23.y, r25.y
				cmp r25.y, r26.y, r25.y, r24.w
				mad r24.w, r24.x, -c23.y, r25.z
				cmp r25.z, r26.z, r25.z, r24.w
				mad r26.yz, r26.x, -c24.x, r25_abs
				mad r24.w, r23.w, c25.w, r29.x
				cmp r29.x, r26.y, r29.x, r24.w
				mad r24.w, r23.y, c25.w, r29.y
				cmp r29.y, r26.y, r29.y, r24.w
				cmp r28.xy, r26.yzzw, c25.y, c25.x
				add r24.w, r28.y, r28.x
				mad r25.w, r23.w, -c25.w, r27.x
				cmp r27.x, r26.z, r27.x, r25.w
				mad r25.w, r23.y, -c25.w, r27.y
				cmp r27.y, r26.z, r27.y, r25.w
				if_lt -r24.w, c25.y
					if_ge r25_abs.y, r24.y
					else
					mov r29.zw, c25.y
					texldl r28, r29, s2
					mul r21.xyz, r28, r28
					dp3 r28.w, r21, c26
					rsq r28.w, r28.w
					rcp r28.w, r28.w
					mov r25.y, r28.w
					endif
					if_ge r25_abs.z, r24.y
					else
					mov r27.zw, c25.y
					texldl r28, r27, s2
					mul r21.xyz, r28, r28
					dp3 r28.w, r21, c26
					rsq r28.w, r28.w
					rcp r28.w, r28.w
					mov r25.z, r28.w
					endif
					mad r24.w, r24.x, -c23.y, r25.y
					cmp r25.y, r26.y, r25.y, r24.w
					mad r24.w, r24.x, -c23.y, r25.z
					cmp r25.z, r26.z, r25.z, r24.w
					mad r26.yz, r26.x, -c24.x, r25_abs
					mad r24.w, r23.w, -c24.z, r29.x
					cmp r29.x, r26.y, r29.x, r24.w
					mad r24.w, r23.y, -c24.z, r29.y
					cmp r29.y, r26.y, r29.y, r24.w
					cmp r28.xy, r26.yzzw, c25.y, c25.x
					add r24.w, r28.y, r28.x
					mad r25.w, r23.w, c24.z, r27.x
					cmp r27.x, r26.z, r27.x, r25.w
					mad r25.w, r23.y, c24.z, r27.y
					cmp r27.y, r26.z, r27.y, r25.w
					if_lt -r24.w, c25.y
					if_ge r25_abs.y, r24.y
					else
						mov r29.zw, c25.y
						texldl r28, r29, s2
						mul r21.xyz, r28, r28
						dp3 r28.w, r21, c26
						rsq r28.w, r28.w
						rcp r28.w, r28.w
						mov r25.y, r28.w
					endif
					if_ge r25_abs.z, r24.y
					else
						mov r27.zw, c25.y
						texldl r28, r27, s2
						mul r21.xyz, r28, r28
						dp3 r28.w, r21, c26
						rsq r28.w, r28.w
						rcp r28.w, r28.w
						mov r25.z, r28.w
					endif
					mad r24.y, r24.x, -c23.y, r25.y
					mad r24.x, r24.x, -c23.y, r25.z
					cmp r25.yz, r26, r25, r24.xyxw
					mad r24.xy, r26.x, -c24.x, r25_abs.yzzw
					mad r24.w, r23.w, -c24.w, r29.x
					cmp r29.x, r24.x, r29.x, r24.w
					mad r24.w, r23.y, -c24.w, r29.y
					cmp r29.y, r24.x, r29.y, r24.w
					mad r23.w, r23.w, c24.w, r27.x
					mad r23.y, r23.y, c24.w, r27.y
					cmp r27.xy, r24.y, r27, r23.wyzw
					endif
				endif
				endif
			endif
			endif
		endif
		add r23.y, -r29.x, v0.x
		add r23.w, r27.x, -v0.x
		add r24.x, -r29.y, v0.y
		cmp r23.y, r23.x, r23.y, r24.x
		add r24.x, r27.y, -v0.y
		cmp r23.w, r23.x, r23.w, r24.x
		cmp r24.xy, r25.yzzw, c25.y, c25.x
		cmp r24.w, r25.x, -c25.y, -c25.x
		add r24.xy, r24.w, r24
		add r24.w, r23.y, r23.w
		rcp r24.w, r24.w
		add r25.x, -r23.w, r23.y
		min r25.y, r23.w, r23.y
		cmp r23.y, r25.x, r24_abs.y, r24_abs.x
		mul r23.z, r23.z, r23.z
		mad r23.w, r25.y, -r24.w, c23.y
		mul r23.z, r23.z, c20.x
		cmp r23.y, -r23.y, c25.y, r23.w
		max r24.x, r23.y, r23.z
		mad r23.yz, r24.x, r24.z, v0.xxyw
		cmp r24.x, r23.x, v0.x, r23.y
		cmp r24.y, r23.x, r23.z, v0.y
		mov r24.zw, c25.y
		texldl r23, r24, s2
		mul r21.xyz, r23, r23
		dp3 r23.w, r21, c26
		rsq r23.w, r23.w
		rcp r23.w, r23.w
		mov r22.xyz, r23
		endif
		mov r1, r22
	else
		texld r1, v0, s2
	endif
	// ----------------------------------------------------------------------------------------------------------------------------------------------
    abs r0.y, c78.w
    mov r2, c4
    mad r0.zw, c76.xyxy, r2.xyxy, v0.xyxy
    texld r3, r0.zwzw, s2
    mad r0.zw, c76.xyxy, r2.xyzx, v0.xyxy
    texld r4, r0.zwzw, s2
    mad r0.zw, c76.xyxy, r2.xywz, v0.xyxy
    texld r5, r0.zwzw, s2
    mad r0.zw, c76.xyxy, r2.xyyw, v0.xyxy
    texld r2, r0.zwzw, s2
    dp3 r0.z, r3, r3
    rcp r0.z, r0.z
    cmp r3.xyz, -r0_abs.z, c1.x, r3
    dp3 r0.z, r4, r4
    rcp r0.z, r0.z
    cmp r4.xyz, -r0_abs.z, c1.x, r4
    dp3 r0.z, r5, r5
    rcp r0.z, r0.z
    cmp r5.xyz, -r0_abs.z, c1.x, r5
    dp3 r0.z, r2, r2
    rcp r0.z, r0.z
    cmp r2.xyz, -r0_abs.z, c1.x, r2
    dp3 r0.z, r1, r1
    rcp r0.z, r0.z
    cmp r6.xyz, -r0_abs.z, c1.x, r1
    dp3 r0.z, r6, c1.yzww
    dp3 r7.x, r3, c1.yzww
    dp3 r7.y, r4, c1.yzww
    dp3 r7.z, r5, c1.yzww
    dp3 r7.w, r2, c1.yzww
    dp4 r0.w, r7, c2.x
    add r7, r7, -r0.w
    dp4 r1.w, r7, r7
    add r0.z, r0.z, -r0.w
    mad r0.z, r0.z, r0.z, -r1.w
    texld r7, v0, s0
    mov r7.yz, c2
    mad r8, r7.w, -r7.y, c3
    cmp r8, r8, c2.z, c2.w
    mad r9, r7.w, -c6.x, c6.yzwx
    cmp r9, r9, -c2.z, -c2.w
    add r8, r8, r9
    mul r8, r8, c1.x // disable static PC blur
    dp4 r0.w, r8, c2.z
    add r0.w, r0.w, c4.w
    rcp r0.w, r0.w
    mul r7.xyw, r3.xyzz, r8.x
    mad r6.xyz, r6, c4.w, r7.xyww
    mad r6.xyz, r4, r8.y, r6
    mad r6.xyz, r5, r8.z, r6
    mad r6.xyz, r2, r8.w, r6
    mul r6.xyz, r0.w, r6
    cmp r7.xyw, r0.z, c7.xyzz, c7.wxzw
    mul r3.xyz, r3, r7.y
    mad r3.xyz, r6, r7.x, r3
    mad r3.xyz, r4, r7.y, r3
    mad r3.xyz, r5, r7.y, r3
    mad r2.xyz, r2, r7.y, r3
    mad r3.xyz, v0.yxyw, c5.x, c5.y
    mul r0.z, r3.y, c77.z
    mul r0.z, r0.x, r0.z
    mul r0.w, -r3.x, c77.w
    mul r0.w, r0.x, r0.w
    mul r4.xyz, r0.w, c73
    mad r4.xyz, r0.z, c72, r4
    mad r0.xzw, -r0.x, c74.xyyz, r4.xyyz
    add r0.xzw, r0, c75.xyyz
    mul r1.w, -r0.w, c77.z
    rcp r1.w, r1.w
    mul r4.x, r0.x, r1.w
    mul r0.x, r0.w, c77.w
    rcp r0.x, r0.x
    mul r4.y, r0.z, r0.x
    add r0.xz, -r3.yyzw, r4.xyyw
    mul r0.xz, r0, c79.x
    mul r3.xy, r0.xzzw, c5.z
    texld r4, v0, s5
    add r0.w, r4.x, -c84.x
    mul r3.zw, r2.xyxy, c3.w
    mad r3.zw, v0.xyxy, c0.xyxy, r3
    texld r4, r3.zwzw, s4
    add r1.w, r4.x, c4.x
    mad r3.zw, r3.xyxy, r1.w, v0.xyxy
    mov r4.xyz, r2
    mov r1.w, c2.z
    mov r2.w, c2.z
	// ---------------------------------------------------------- Motion Blur Optimization ----------------------------------------------------------
	if_ne r0.y, c1.x	// don't run if Definition = OFF
		rep i0
		mad r5.xy, r3, r2.w, r3.zwzw
		texldl r6, r5, s5
		add r4.w, r6.x, -c84.x
		cmp r4.w, r4.w, c2.w, c2.z
		texldl r5, r5, s2
		mad r4.xyz, r5, r4.w, r4
		add r1.w, r1.w, r4.w
		add r2.w, r2.w, c2.z
		endrep
	endif
	// ----------------------------------------------------------------------------------------------------------------------------------------------
    rcp r1.w, r1.w
    mul r0.xz, r0, c44.xyyw
    dp2add r0.x, r0.xzzw, r0.xzzw, c1.x
    rsq r0.x, r0.x
    rcp r0.x, r0.x
    mul r0.x, r0.x, c4.w
    mul_sat r0.x, r7.w, r0.x
    mad r3.xyz, r4, r1.w, -r2
    mad r3.xyz, r0.x, r3, r2
    cmp r0.xzw, r0.w, r2.xyyz, r3.xyyz
    mov r0.xyz, r0.xzww	// Disable vanilla Definition behavior
    mul r0.xyz, r0, c66.x
    texld r1, c1.x, s3
    rcp r0.w, r1.x
    mul r0.w, r0.w, c80.y
    mul r1.xyz, r0, r0.w
    dp3 r1.x, r1, c1.yzww
    mad r0.xyz, r0, r0.w, -r1.x
    mad r0.xyz, c81.x, r0, r1.x
    mul r0.w, r1.x, c83.w
    mul r1.yzw, r0.w, c83.xxyz
    mov_sat r2.x, r0.w
    mad r0.xyz, c83, -r0.w, r0
    mad r0.xyz, r2.x, r0, r1.yzww
    mul r0.xyz, r0, c82
    add r0.xyz, r0, r0
    mov_sat r1.x, r1.x
    add r0.w, -r7.z, c81.z
    pow r2.x, r1.x, r0.w
	mul r12, r0, r2.x
	// ------------------------------------------------------------- Console-like Gamma -------------------------------------------------------------
	// Piecewise function to approximate Xbox gamma correction
	max r12, r12, c1.x
	if_ne c28.x, c28.y
		mov r20, c10						// copy c10
		add r21, r12, -c5.z					// r21 = r12 - 0.125
		cmp r22, r21, c2.w, c2.z			// r22 = r12 >= 0.125 ? 1 : 0
		lrp r23, r22, r20.x, r20.y			// mix(1.3333333, 1.0526316, r22(r12 >= 0.125))
		pow r24.x, r12.x, r23.x				// if r12 >= 0.125 ? 1.3333333 : 1.0526316
		pow r24.y, r12.y, r23.y				// if r12 >= 0.125 ? 1.3333333 : 1.0526316
		pow r24.z, r12.z, r23.z				// if r12 >= 0.125 ? 1.3333333 : 1.0526316
		add r25, r24, -c5.z					// if r12 >= 0.125
		mad r25, r25, r20.z, r20.w			// if r12 >= 0.125
		lrp r12.xyz, r22, r24, r25			// mix(r24, r25, r22(r12 >= 0.125))
	endif
	// ----------------------------------------------------------------------------------------------------------------------------------------------
    mov oC0.xyz, r12
    mov oC0.w, c2.z

// approximately 142 instruction slots used (12 texture, 130 arithmetic)
