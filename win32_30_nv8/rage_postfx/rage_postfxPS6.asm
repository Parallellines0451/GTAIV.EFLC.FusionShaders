// Summary: Ported XBOX bloom blur/booster
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D HDRSampler;
//   float4 TexelSize;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   TexelSize    c66      1
//   HDRSampler   s0       1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 1.1336504576e-42 // 809
    def c0, 0.5, -0.5, 1, 0
    dcl_texcoord v0.xy
    dcl_2d s0
    mov r0.xy, c66.xy
    mad r0, r0.xyxy, c0.xyyx, v0.xyxy
    texld r1, r0.zy, s0
    texld r2, r0.xy, s0
    max r1.xyz, r1, r2
    texld r2, r0.zw, s0
    max r1.xyz, r1, r2
    texld r2, r0.xw, s0
    max oC0.xyz, r1, r2
    mov oC0.w, c0.z

// approximately 5 instruction slots used (1 texture, 4 arithmetic)
