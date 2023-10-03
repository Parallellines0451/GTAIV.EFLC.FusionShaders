//
// Generated by Microsoft (R) HLSL Shader Compiler 9.29.952.3111
//
// Parameters:
//
//   sampler2D DiffuseTexSampler;
//   float HybridAdd;
//
//
// Registers:
//
//   Name              Reg   Size
//   ----------------- ----- ----
//   HybridAdd         c64      1
//   DiffuseTexSampler s0       1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 1.1700842177e-42 // 835
    def c127, 0.9999999, 1, 0, 0	// LogDepth constants
    def c0, 1, 0, 0, 0
    dcl_color v0
    dcl_texcoord v1.xy
    dcl_texcoord3 v2.x
    dcl_texcoord9 v9
    dcl_2d s0
    abs r0.x, c64.x
    add r0.y, c0.x, -v2.x
    texld r1, v1, s0
    mul r1, r1, v0
    mul r2.w, r0.y, r1.w
    mul r2.xyz, r1.w, r1
    cmp oC0, -r0.x, r1, r2
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

// approximately 7 instruction slots used (1 texture, 6 arithmetic)
