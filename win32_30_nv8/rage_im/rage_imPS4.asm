//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D TextureSampler;
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   TextureSampler s0       1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 1.1196374730e-42 // 799
    dcl_texcoord v0.xy
    dcl_2d s0
    texld oC0, v0, s0

// approximately 1 instruction slot used (1 texture, 0 arithmetic)
