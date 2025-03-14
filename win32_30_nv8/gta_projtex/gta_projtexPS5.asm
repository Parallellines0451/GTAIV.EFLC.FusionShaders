// Summary: simplified transparency code
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D StippleTexture;
//   sampler2D TextureSampler;
//   float4 globalScalars;
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   globalScalars  c39      1
//   TextureSampler s0       1
//   StippleTexture s10      1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 7.0905702295e-43 // 506
    def c0, 3.99600005, 4, 0.125, 0.25
    def c1, 0, -1, -0, 0
    def c118, 0.06711056, 0.00583715, 52.9829189, 0
    def c150, 0.992217898, 0.00389105058, 0, 0
    dcl_texcoord v0.xyz
    dcl vPos.xy
    dcl_2d s0
    dcl_2d s10
    texld r0, v0.yzzw, s0
    mul r0.x, r0.w, c39.x
    dp2add r20.x, vPos.xy, c118.xy, c118.w
    frc r20.x, r20.x
    mul r20.x, r20.x, c118.z
    frc r20.x, r20.x
    mad r20.y, r20.x, c150.x, c150.y
    add r20.y, -r20.y, r0.x
    texkill r20.y
    mov oC0.xyz, v0.x
    mov oC0.w, r0.x

// approximately 21 instruction slots used (3 texture, 18 arithmetic)
