// Summary: Ported XBOX shader
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D HDRSampler;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   HDRSampler   s0       1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 1.1266439653e-42 // 804
    def c0, 0, 1, 0, 0
    dcl_texcoord v0.xy
    dcl_2d s0
    texld oC0.xyz, v0, s0
    mov oC0.w, c0.y

// approximately 5 instruction slots used (1 texture, 4 arithmetic)
