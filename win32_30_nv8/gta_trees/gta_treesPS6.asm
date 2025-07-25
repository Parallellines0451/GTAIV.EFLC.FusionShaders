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
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 8.6319985402e-43 // 616
    def c0, -0.125, -0, -1, 0
    dcl_texcoord v0.xy
    dcl_texcoord9 v9
    dcl_2d s0
    texld r0, v0, s0
    add r0.x, r0.w, c0.x
    cmp r1, r0.x, c0.y, c0.z
    texkill r1
    add oC0, r0.w, r0.w
    
    // LogDepth Write
    mul r19.x, v9.w, c209.x
    log r19.x, r19.x
    mul r19.x, r19.x, c209.y
    rcp r19.y, v9.w
    mul r19.y, r19.y, v9.z
    cmp oDepth, -v9_abs.y, r19.y, r19.x

// approximately 5 instruction slots used (1 texture, 4 arithmetic)
