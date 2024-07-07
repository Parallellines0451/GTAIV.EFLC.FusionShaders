// Summary: simplified transparency code + fixed pop-in/added stippled transparency + stipple mask
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   samplerCUBE EnvironmentSampler;
//   sampler2D TextureSampler;
//   float4 globalScalars;
//   float reflectivePower;
//   float4 stencil;
//
//
// Registers:
//
//   Name               Reg   Size
//   ------------------ ----- ----
//   globalScalars      c39      1
//   stencil            c52      1
//   reflectivePower    c66      1
//   TextureSampler     s0       1
//   EnvironmentSampler s1       1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 9.8090892503e-44 // 70
    def c152, 0.125, 0.25, 0.375, 0.5 // c152-c153 = new stipple constants
    def c153, 0.5, 2, 1, 0
    def c127, 0.9999999, 1, 0, 0 // LogDepth constants
    def c0, 0.176470593, -1, -0, 9.99999975e-006
    def c1, 0.5, 0, 1, 0.25
    dcl_texcoord v0.xy
    dcl_texcoord1 v1.xyz
    dcl_texcoord3 v2.xyz
    dcl_color v3.xw
    dcl_texcoord9 v9
    dcl vPos.xy
    dcl_2d s0
    dcl_cube s1
    texld r0, v0, s0
    // mul r0.w, r0.w, v3.w disabled vertex alpha
    mul r1.x, r0.w, c39.x
    mov r2.xyz, c0
    /* removed alpha threshold
    mad r0.w, r0.w, -c39.x, r2.x
    cmp r3, r0.w, c0.y, c0.z
    texkill r3
    removed alpha threshold */
    mul r20.xy, vPos.xy, c153.x
    frc r20.xy, r20.xy
    mad r20, r20.xxyy, -c153.y, c153.zwzw
    mul r20, r20.xxyy, r20.zwzw
    dp4 r20.x, r20_abs, c152.xzwy
    add r20.y, -r20.x, r1.x
    texkill r20.y
    add r1.yzw, c0.w, v1.xxyz
    dp3 r0.w, r1.yzww, r1.yzww
    rsq r0.w, r0.w
    mul r3.xyz, r1.yzww, r0.w
    add r4.xyz, c0.w, v2.xzyw
    dp3 r2.x, r4, r4
    rsq r2.x, r2.x
    mul r4.xyz, r4, r2.x
    dp3 r2.x, -r4.xzyw, r3
    add r2.x, r2.x, r2.x
    mad r3.xyz, r3.xzyw, -r2.x, -r4
    add r3.xyz, r3, c0.w
    dp3 r2.x, r3, r3
    rsq r2.x, r2.x
    mul r3.xyz, r3, r2.x
    texld r3, r3, s1
    mad oC0.xyz, r3, c66.x, r0
    mad r0.xyz, r1.yzww, r0.w, -c0.y
    mul oC1.xyz, r0, c1.x
    mov oC0.w, r1.x
    mov oC1.w, r1.x
    mad oC2.xyz, v3.x, c1.yyzw, c1.ywyw
    // mov oC2.w, r1.x
    add r20.x, -c152.w, r1.x
    cmp oC2.w, r20.x, c0.z, -c0.y
    mul oC3, -r2.yzzz, c52.x
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

// approximately 31 instruction slots used (2 texture, 29 arithmetic)
