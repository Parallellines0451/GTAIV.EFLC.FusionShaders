//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D TextureGrassSampler;
//   float4 globalScalars;
//
//
// Registers:
//
//   Name                Reg   Size
//   ------------------- ----- ----
//   globalScalars       c39      1
//   TextureGrassSampler s0       1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 3.7694928690e-43 // 269
    dcl_color v0
    dcl_texcoord v1.w
    dcl_texcoord1 v2.w
    dcl_texcoord9 v9
    dcl_2d s0
    mov r0.x, v1.w
    mov r0.y, v2.w
    texld r0, r0, s0
    mul r0, r0, v0
    mul oC0.xyz, r0, c39.y
    mov oC0.w, r0.w
    
    // LogDepth Write
    mul r19.x, v9.w, c209.x
    log r19.x, r19.x
    mul r19.x, r19.x, c209.y
    rcp r19.y, v9.w
    mul r19.y, r19.y, v9.z
    cmp oDepth, -v9_abs.y, r19.y, r19.x

// approximately 6 instruction slots used (1 texture, 5 arithmetic)
