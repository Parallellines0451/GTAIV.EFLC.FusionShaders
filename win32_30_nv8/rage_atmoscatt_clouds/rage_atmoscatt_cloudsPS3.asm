//
// Generated by Microsoft (R) HLSL Shader Compiler 9.29.952.3111
//
// Parameters:
//
//   sampler2D SkyMapSampler;
//   float4 TexelSize;
//
//
// Registers:
//
//   Name          Reg   Size
//   ------------- ----- ----
//   TexelSize     c64      1
//   SkyMapSampler s0       1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 1.0733946237e-42 // 766
    def c0, -0.5, 0.5, 0.25, 0
    dcl_texcoord v0.xy
    dcl_2d s0
    mov r0.xy, c0
    mad r1, c64.x, r0.xxyx, v0.xyxy
    texld r2, r1, s0
    texld r1, r1.zwzw, s0
    add r1, r1, r2
    mad r0, c64.x, r0.xyyy, v0.xyxy
    texld r2, r0, s0
    texld r0, r0.zwzw, s0
    add r1, r1, r2
    add r0, r0, r1
    mul oC0, r0, c0.z

// approximately 11 instruction slots used (4 texture, 7 arithmetic)
