	// Improves the look of screen droplets (but doesn't restore refraction, that requires code injection)
	
	def c7, 12, 4, 8, 1
	
    // mul r0.x, r1.x, c18.x
    // mul r0.x, r0.x, c18.w
    // mul r0.x, r0.x, c73.x
    // mad r0.xyz, r0.yzww, c2.y, r0.x
    // add r0.xyz, r1.y, r0
	mov r5, c18
	max r0.x, r5.x, r5.y
	max r0.x, r0.x, r5.z	// directional lighting color value
	mul r0.x, r0.x, c7.x	// directional influence multiplier
	max r0.x, r0.x, c7.y	// minimum intensity
	min r0.x, r0.x, c7.z	// maximum intensity
	mov r0.xyz, r0.x