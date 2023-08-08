    def c110, -0.25, 1, -1, 0
    def c111, 0.159154937, 0.5, 6.28318548, -3.14159274
    def c112, 3, 7.13800001, 2.4, 0
    def c113, 0.75, -0.5, 0.5, 0

	mov r1.xy, c53.yy
	mul r1.xy, r1.xy, c112.z			// *2.4 instead of *3 because CSM resolutions are multiples of 256 instead of 320
	
    mov r2.xy, c112.xy
    mul r2.xy, r2.xy, c44.xy			// r2.xy * screen dimensions
    dp2add r2.y, v0, r2, c3.y			// v0.x * r2.x + v0.y * r2.y
    mad r2.y, r2.y, c111.x, c111.y
    frc r2.y, r2.y
    mad r2.y, r2.y, c111.z, c111.w		// r2.y * 2pi - pi
    sincos r3.xy, r2.y					// sine & cosine of r2.y
    mul r4, r3.yxxy, c110.xxyz
    mul r3, r3.yxxy, c113.xxyz
	
    mad r5.xy, r4.xy, r1.xy, r0.zw		// offset * texel size + UV
    texld r5, r5, s15					// sample #1
    mov r6.x, r5.x						// copy to r6
	
    mad r5.xy, r4.zw, r1.xy, r0.zw		// offset * texel size + UV
    texld r5, r5, s15					// sample #2
    mov r6.y, r5.x						// copy to r6
	
    mad r5.xy, r3.xy, r1.xy, r0.zw		// offset * texel size + UV
    texld r5, r5, s15					// sample #3
    mov r6.z, r5.x						// copy to r6
	
    mad r5.xy, r3.zw, r1.xy, r0.zw		// offset * texel size + UV
    texld r5, r5, s15					// sample #4
    mov r6.w, r5.x						// copy to r6

	add r6, r1.z, -r6
	cmp r6, r6, c3.x, c3.y				// depth bias
	dp4 r0.z, r6, c3.x					// sum