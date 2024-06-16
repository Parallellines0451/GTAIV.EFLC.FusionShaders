	// NVIDIA FXAA 3.11 by TIMOTHY LOTTES
	// FXAA Constants
	def c20, 0.25, 0, 0, 0		// Subpix				0.25, 0, 0, 0       
	def c21, 0.125, 0, 0, 0		// EdgeThreshold		0.125, 0, 0, 0      
	def c22, 0, 0, 0, 0			// EdgeThresholdMin		0, 0, 0, 0          	
    def c23, 0.0833333358, 0.5, -2, 3
    def c24, 0.25, 1.5, 4, 12
    def c25, 1, 0, -1, -2
	def c26, 0.298999995, 0.587000012, 0.114, 0
	
	// FXAA Start
	
    // texld r1, v0, s2 HDR texture input
	mov r20, c76 // Copy TexelSize
	
	mul r22, c25.xxyy, v0.xyxx
    texldl r22, r22, s2
										// Luminance calculation, necessary on every texture reading to avoid another pass
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
	
	mov r1, r22 // HDR texture output
	
	// FXAA End