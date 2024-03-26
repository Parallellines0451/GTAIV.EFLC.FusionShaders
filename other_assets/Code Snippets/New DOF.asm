	def c14, 0.0625, 0.0322581, 0.000926, 0.000617
	def c15, -0.500, -1.500, -1.581, 0.012
	def c16, -0.477, 1.507, 1.286, 0.920
	def c17, 1.272, -0.939, -1.000, -3.000
	def c18, -2.572, -1.839, -3.162, 0.024
	def c19, -2.544, 1.878, -0.954, 3.015
	def c20, 1.000, 3.000, 2.572, 1.839
	def c21, 3.162, -0.024, 2.544, -1.878
	def c22, 0.954, -3.015, -1.500, -4.500
	def c23, -3.201, -3.501, -4.348, -1.896
	def c24, -4.743, 0.036, -4.319, 1.962
	def c25, -3.147, 3.549, -1.432, 4.522
	def c26, 0.532, 4.714, 2.403, 4.090
	def c27, 3.859, 2.759, 4.647, 0.951
	def c28, 4.632, -1.021, 3.816, -2.817
	def c29, 2.340, -4.126, 0.460, -4.721
	
	mov r20, c76.xyxy
	mov r21.xyz, r7 // center
	mul r20, r20, c44.y
	mov r21.w, c14.z
	if_ge r21.w, c44.w // use two rings for 1080p and below, three for above
		mul r20, r20, c14.z
		
		mad r22, r20, c15, v0.xyxy
		texldl r23.xyz, r22.xy, s2
		add r21.xyz, r21, r23
		texldl r23.xyz, r22.zw, s2
		add r21.xyz, r21, r23
		
		mad r22, r20, c16, v0.xyxy
		texldl r23.xyz, r22.xy, s2
		add r21.xyz, r21, r23
		texldl r23.xyz, r22.zw, s2
		add r21.xyz, r21, r23
		
		mad r22, r20, c17, v0.xyxy
		texldl r23.xyz, r22.xy, s2
		add r21.xyz, r21, r23
		texldl r23.xyz, r22.zw, s2
		add r21.xyz, r21, r23
		
		mad r22, r20, c18, v0.xyxy
		texldl r23.xyz, r22.xy, s2
		add r21.xyz, r21, r23
		texldl r23.xyz, r22.zw, s2
		add r21.xyz, r21, r23
		
		mad r22, r20, c19, v0.xyxy
		texldl r23.xyz, r22.xy, s2
		add r21.xyz, r21, r23
		texldl r23.xyz, r22.zw, s2
		add r21.xyz, r21, r23
		
		mad r22, r20, c20, v0.xyxy
		texldl r23.xyz, r22.xy, s2
		add r21.xyz, r21, r23
		texldl r23.xyz, r22.zw, s2
		add r21.xyz, r21, r23
		
		mad r22, r20, c21, v0.xyxy
		texldl r23.xyz, r22.xy, s2
		add r21.xyz, r21, r23
		texldl r23.xyz, r22.zw, s2
		add r21.xyz, r21, r23
		
		mad r22, r20, c22, v0.xyxy
		texldl r23.xyz, r22.xy, s2
		add r21.xyz, r21, r23
		
		mul r3.xyz, r21, c14.x
	else
		mul r20, r20, c14.w
		
		mad r22, r20, c15, v0.xyxy
		texldl r23.xyz, r22.xy, s2
		add r21.xyz, r21, r23
		texldl r23.xyz, r22.zw, s2
		add r21.xyz, r21, r23
		
		mad r22, r20, c16, v0.xyxy
		texldl r23.xyz, r22.xy, s2
		add r21.xyz, r21, r23
		texldl r23.xyz, r22.zw, s2
		add r21.xyz, r21, r23
		
		mad r22, r20, c17, v0.xyxy
		texldl r23.xyz, r22.xy, s2
		add r21.xyz, r21, r23
		texldl r23.xyz, r22.zw, s2
		add r21.xyz, r21, r23
		
		mad r22, r20, c18, v0.xyxy
		texldl r23.xyz, r22.xy, s2
		add r21.xyz, r21, r23
		texldl r23.xyz, r22.zw, s2
		add r21.xyz, r21, r23
		
		mad r22, r20, c19, v0.xyxy
		texldl r23.xyz, r22.xy, s2
		add r21.xyz, r21, r23
		texldl r23.xyz, r22.zw, s2
		add r21.xyz, r21, r23
		
		mad r22, r20, c20, v0.xyxy
		texldl r23.xyz, r22.xy, s2
		add r21.xyz, r21, r23
		texldl r23.xyz, r22.zw, s2
		add r21.xyz, r21, r23
		
		mad r22, r20, c21, v0.xyxy
		texldl r23.xyz, r22.xy, s2
		add r21.xyz, r21, r23
		texldl r23.xyz, r22.zw, s2
		add r21.xyz, r21, r23
		
		mad r22, r20, c22, v0.xyxy
		texldl r23.xyz, r22.xy, s2
		add r21.xyz, r21, r23
		texldl r23.xyz, r22.zw, s2
		add r21.xyz, r21, r23
		
		mad r22, r20, c23, v0.xyxy
		texldl r23.xyz, r22.xy, s2
		add r21.xyz, r21, r23
		texldl r23.xyz, r22.zw, s2
		add r21.xyz, r21, r23
		
		mad r22, r20, c24, v0.xyxy
		texldl r23.xyz, r22.xy, s2
		add r21.xyz, r21, r23
		texldl r23.xyz, r22.zw, s2
		add r21.xyz, r21, r23
		
		mad r22, r20, c25, v0.xyxy
		texldl r23.xyz, r22.xy, s2
		add r21.xyz, r21, r23
		texldl r23.xyz, r22.zw, s2
		add r21.xyz, r21, r23
		
		mad r22, r20, c26, v0.xyxy
		texldl r23.xyz, r22.xy, s2
		add r21.xyz, r21, r23
		texldl r23.xyz, r22.zw, s2
		add r21.xyz, r21, r23
		
		mad r22, r20, c27, v0.xyxy
		texldl r23.xyz, r22.xy, s2
		add r21.xyz, r21, r23
		texldl r23.xyz, r22.zw, s2
		add r21.xyz, r21, r23
		
		mad r22, r20, c28, v0.xyxy
		texldl r23.xyz, r22.xy, s2
		add r21.xyz, r21, r23
		texldl r23.xyz, r22.zw, s2
		add r21.xyz, r21, r23
		
		mad r22, r20, c29, v0.xyxy
		texldl r23.xyz, r22.xy, s2
		add r21.xyz, r21, r23
		texldl r23.xyz, r22.zw, s2
		add r21.xyz, r21, r23
		
		mul r3.xyz, r21, c14.y
	endif
	
	mov r4.xyz, r3
	mov r5.xyz, r3
	mov r6.xyz, r3