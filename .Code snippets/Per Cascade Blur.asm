	// Control blur intensity of each shadow cascade

    def c120, 0.25, 0.5, 0.75, 0
    def c121, 1, 0.5, 0.25, 0.125		// cascade blur multipliers
    
    add r7.xyz, r0.z, -c120.xyz
    cmp r7.w, r7.x, c121.y, c121.x		// cascade 2
    cmp r7.w, r7.y, c121.z, r7.w		// cascade 3
    cmp r7.w, r7.z, c121.w, r7.w		// cascade 4
    mul r1.xy, c53.xy, r7.w				// texel size multiplier