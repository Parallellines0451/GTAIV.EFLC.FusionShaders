//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D gDeferredLightSampler;
//
//
// Registers:
//
//   Name                  Reg   Size
//   --------------------- ----- ----
//   gDeferredLightSampler s0       1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 4.0637655465e-44 // 29
    def c0, 1, 0, 0, 0
    dcl_texcoord v0.xy
    dcl_texcoord1 v1.xyz
    dcl_texcoord9 v9
    dcl_2d s0
    texld r0, v0, s0
    mul oC0.xyz, r0, v1
    mov oC0.w, c0.x
    
    // LogDepth Write
    mul r19.x, v9.w, c209.x
    log r19.x, r19.x
    mul r19.x, r19.x, c209.y
    rcp r19.y, v9.w
    mul r19.y, r19.y, v9.z
    cmp oDepth, -v9_abs.y, r19.y, r19.x

// approximately 3 instruction slots used (1 texture, 2 arithmetic)
