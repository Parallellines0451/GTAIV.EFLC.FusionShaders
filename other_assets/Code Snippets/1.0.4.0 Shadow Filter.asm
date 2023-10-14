	// Shadow filter ported from 1.0.4.0

    def c110, -0.25, 1, -1, 0
    def c111, 0.159154937, 0.5, 6.28318548, -3.14159274
    def c112, 3, 7.13800001, 3, 0
    def c113, 0.75, -0.5, 0.5, 0
	
    mov r21.xy, c112.xy
    mul r21.xy, r21.xy, c44.xy			// r21.xy * screen dimensions
    dp2add r21.y, v0, r21, c110.w		// v0.x * r21.x + v0.y * r21.y
    mad r21.y, r21.y, c111.x, c111.y
    frc r21.y, r21.y
    mad r21.y, r21.y, c111.z, c111.w	// r21.y * 2pi - pi
    sincos r22.xy, r21.y				// sine & cosine of r21.y
    mul r23, r22.yxxy, c110.xxyz		// offsets for 1st and 4th samples, respectively
    mul r22, r22.yxxy, c113.xxyz        // offsets for 3rd and 2nd samples, respectively
	mov r20.xy, c53.xy					// copy texel size
	mul r20.xy, r20.xy, c112.z			// blur factor
	
    mad r24.xy, r23.xy, r20.xy, r0.zw	// offset * texel size + UV
    texld r24, r24, s15					// 1st sample
    mov r25.x, r24.x					// copy to r25
    mad r24.xy, r22.zw, r20.xy, r0.zw	// offset * texel size + UV
    texld r24, r24, s15					// 2nd sample
    mov r25.y, r24.x					// copy to r25
    mad r24.xy, r22.xy, r20.xy, r0.zw	// offset * texel size + UV
    texld r24, r24, s15					// 3rd sample
    mov r25.z, r24.x					// copy to r25
    mad r24.xy, r23.zw, r20.xy, r0.zw	// offset * texel size + UV
    texld r24, r24, s15					// 4th sample
    mov r25.w, r24.x					// copy to r25

	add r25, r1.z, -r25					// depth bias
	cmp r25, r25, c110.y, c110.w
	dp4 r0.z, r25, -c110.x				// average