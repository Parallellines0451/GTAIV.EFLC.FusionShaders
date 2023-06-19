	def c10, 1.3333333, 0.0013889, 720, 1440	// Gamma & resolution scaling constants
	def c11, 0.125, 0.0416666, 0.0208333, 0		// DOF averages (1/8, 1/24 & 1/48)
	def c12, 1.5, 1, 0.67, 0					// DOF radii multipliers
	
	// Circular Kernel from GPU Zen 'Practical Gather-based Bokeh Depth of Field' by Wojciech Sterna
	// first ring
	def c100, 1.000000, 0.000000, 0.707107, 0.707107
	def c101, -0.000000, 1.000000, -0.707107, 0.707107
	def c102, -1.000000, -0.000000, -0.707106, -0.707107
	def c103, 0.000000, -1.000000, 0.707107, -0.707107
	// second ring
	def c104, 2.000000, 0.000000, 1.847760, 0.765366
	def c105, 1.414214, 1.414214, 0.765366, 1.847760
	def c106, -0.000000, 2.000000, -0.765368, 1.847758
	def c107, -1.414214, 1.414214, -1.847760, 0.765366
	def c108, -2.000000, -0.000000, -1.847758, -0.765368
	def c109, -1.414212, -1.414214, -0.765366, -1.847760
	def c110, 0.000000, -2.000000, 0.765368, -1.847758
	def c111, 1.414214, -1.414214, 1.847760, -0.765366
	// third ring
	def c112, 3.000000, 0.000000, 2.897778, 0.776457
	def c113, 2.598075, 1.500000, 2.121321, 2.121321
	def c114, 1.500000, 2.598078, 0.776457, 2.897778
	def c115, -0.000000, 3.000000, -0.776457, 2.897778
	def c116, -1.500000, 2.598075, -2.121321, 2.121321
	def c117, -2.598078, 1.500000, -2.897778, 0.776457
	def c118, -3.000000, -0.000000, -2.897778, -0.776460
	def c119, -2.598075, -1.500000, -2.121318, -2.121321
	def c120, -1.499997, -2.598078, -0.776457, -2.897778
	def c121, 0.000000, -3.000000, 0.776457, -2.897778
	def c122, 1.500000, -2.598075, 2.121321, -2.121321
	def c123, 2.598078, -1.499997, 2.897778, -0.776454
	
	// DOF Start
	// Uses different sample counts depending on the resolution & executes no instructions if definition is enabled to improve performance.
	
	if_eq r0.w, c100.y		// if (r0.w = 0) DOF = on, else off
		mov r20, c10
		mov r21, c100.y		// sum = 0
		mov r22, c76		// copy texel size
		mul r22, r22, c44.y // multiply by resolution height
		mul r22, r22, c10.y // divide by 720
		mov r23.w, c100.y
		
		if_le c44.y, r20.z // 720p
		
			mul r22, r22, c12.x	// radius multiplier
			
			mad r23.xy, r22, c100.xy, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c100.zw, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c101.xy, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c101.zw, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c102.xy, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c102.zw, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c103.xy, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c103.zw, v0
			texldl r23, r23, s2
			add r21, r21, r23
			
			mul r21, r21, c11.x // average
			
		else if_le c44.y, r20.w // 1440p
		
			mul r22, r22, c12.y	// radius multiplier
			
			mad r23.xy, r22, c100.xy, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c100.zw, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c101.xy, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c101.zw, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c102.xy, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c102.zw, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c103.xy, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c103.zw, v0
			texldl r23, r23, s2
			add r21, r21, r23
			
			mad r23.xy, r22, c104.xy, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c104.zw, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c105.xy, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c105.zw, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c106.xy, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c106.zw, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c107.xy, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c107.zw, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c108.xy, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c108.zw, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c109.xy, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c109.zw, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c110.xy, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c110.zw, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c111.xy, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c111.zw, v0
			texldl r23, r23, s2
			add r21, r21, r23
			
			mul r21, r21, c11.y // average
			
		else // 2160p
		
			mul r22, r22, c12.z	// radius multiplier
			
			mad r23.xy, r22, c100.xy, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c100.zw, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c101.xy, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c101.zw, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c102.xy, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c102.zw, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c103.xy, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c103.zw, v0
			texldl r23, r23, s2
			add r21, r21, r23
			
			mad r23.xy, r22, c104.xy, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c104.zw, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c105.xy, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c105.zw, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c106.xy, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c106.zw, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c107.xy, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c107.zw, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c108.xy, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c108.zw, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c109.xy, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c109.zw, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c110.xy, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c110.zw, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c111.xy, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c111.zw, v0
			texldl r23, r23, s2
			add r21, r21, r23
			
			mad r23.xy, r22, c112.xy, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c112.zw, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c113.xy, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c113.zw, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c114.xy, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c114.zw, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c115.xy, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c115.zw, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c116.xy, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c116.zw, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c117.xy, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c117.zw, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c118.xy, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c118.zw, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c119.xy, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c119.zw, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c120.xy, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c120.zw, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c121.xy, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c121.zw, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c122.xy, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c122.zw, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c123.xy, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c123.zw, v0
			texldl r23, r23, s2
			add r21, r21, r23
			
			mul r21, r21, c11.z // average
		endif
		endif
		mov r4, r21 // final result (DOF on)
	else
		mov r4, r1 // final result (DOF off)
	endif
	mov r5, r4
	mov r6, r4
	mov r7, r4
	
	// DOF End