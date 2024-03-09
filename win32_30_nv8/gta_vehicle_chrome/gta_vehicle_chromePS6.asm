// Summary: Added slope scale depth bias
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 8.9122582331e-43 // 636
    def c0, 1, 0, 0, 6 // w = slope scale bias factor
    dcl_texcoord v0.x
	// sqrt((ddx(v0.x))^2 + (ddy(v0.x))^2) approximation
	dsx r0.x, v0.x
	dsy r0.y, v0.x
	add r0.x, r0_abs.x, r0_abs.y
	mad r0.x, r0.x, -c0.w, v0.x
    mad oC0, r0.x, c0.xxxy, c0.yyyx

// approximately 1 instruction slot used
