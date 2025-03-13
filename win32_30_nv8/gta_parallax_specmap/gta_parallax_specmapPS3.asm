// Summary: fixed pop-in/added stippled transparency + stipple mask
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   float4 NearFarPlane;
//   sampler2D BumpSampler;
//   sampler2D SpecSampler;
//   sampler2D TextureSampler;
//   float bumpiness;
//   float4 globalScalars;
//   float parallaxScaleBias;
//   float3 specMapIntMask;
//   float specularColorFactor;
//   float specularFactor;
//   float4 stencil;
//
//
// Registers:
//
//   Name                Reg   Size
//   ------------------- ----- ----
//   NearFarPlane        c128     1
//   globalScalars       c39      1
//   stencil             c52      1
//   parallaxScaleBias   c66      1
//   specularFactor      c72      1
//   specularColorFactor c73      1
//   specMapIntMask      c74      1
//   bumpiness           c75      1
//   TextureSampler      s0       1
//   BumpSampler         s1       1
//   SpecSampler         s2       1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 6.1517002584e-43 // 439
    def c152, 0.2, 0.4, 0.6, 0.8 // c152-c154 = new stipple constants
    def c153, 0.5, 2, 1, 0
    def c154, 1.6, 0, 0, 0
    def c127, 1, 0.99, 0, 0 // LogDepth constants
    def c0, 9.99999975e-006, 0.5, 0.176470593, -0.5
    def c1, 0.001953125, 0, 0, 0
    def c2, -1, -0, 1, -0.00200000009
    dcl_texcoord v0.xy
    dcl_texcoord1 v1.xyz
    dcl_texcoord4 v2.xyz
    dcl_texcoord5 v3.xyz
    dcl_color v4.xw
    dcl_texcoord7 v5.xyz
    dcl_texcoord9 v9
    dcl vPos.xy
    dcl_2d s0
    dcl_2d s1
    dcl_2d s2
    texld r0, v0, s1
    add r0.xyz, c0.x, v5
    dp3 r0.z, r0, r0
    rsq r0.z, r0.z
    mul r0.xy, r0, r0.z
    mov r1.yz, c0
    mul r0.z, r1.y, c66.x
    mad r0.z, r0.w, c66.x, -r0.z
    mad r0.xy, r0.z, r0, v0
    texld r2, r0, s0
    mul_sat r2.w, r2.w, c154.x
    // mul r0.z, r2.w, v4.w disabled vertex alpha
    // mul r0.w, r0.z, c39.x
    mul r0.w, r2.w, c39.x
    mul r20.xy, vPos.xy, c153.x
    frc r20.xy, r20.xy
    mad r20, r20.xxyy, -c153.y, c153.zwzw
    mul r20, r20.xxyy, r20.zwzw
    dp4 r20.x, r20_abs, c152.xzwy
    add r20.y, -r20.x, r0.w
    texkill r20.y
    texld r1, r0, s1
    add r0.xy, r1, c0.w
    mul r0.xy, r0, c75.x
    dp2add r0.z, r1, -r1, c2.z
    rsq r0.z, r0.z
    rcp r0.z, r0.z
    mul r3.xyz, r0.x, v2
    mad r3.xyz, v1, r0.z, r3
    mad r0.xyz, r0.y, v3, r3
    add r0.xyz, r0, c0.x
    dp3 r1.z, r0, r0
    rsq r1.z, r1.z
    texld r3, v0, s2
    mul r1.w, r3.w, c72.x
    dp3 r2.w, r3, c74
    mul r2.w, r2.w, c73.x
    dp2add r1.x, r1, r1, c2.w
    cmp r1.x, r1.x, -c2.x, -c2.y
    mul oC0.xyz, r2, r1.x
    mul oC2.z, r1.x, v4.x
    mul r1.x, r2.w, r1.x
    mad r0.xyz, r0, r1.z, c2.z
    mul oC1.xyz, r0, c0.y
    mul oC2.x, r1.x, c0.y
    mul r0.x, r1.w, c1.x
    rsq r0.x, r0.x
    rcp oC2.y, r0.x
    mov oC0.w, r0.w
    mov oC1.w, r0.w
    // mov oC2.w, r0.w
    add r20.x, -c152.w, r0.w
    cmp oC2.w, r20.x, c2.y, -c2.x
    mov r0.xy, c2
    mul oC3, -r0.xyyy, c52.x
    
    // LogDepth Write
    if_ne v9.y, c127.x
      rcp r20.x, c209.x
      mul r20.y, r20.x, v9.w
      mul r20.x, r20.x, c209.y
      log r20.x, r20.x
      log r20.y, r20.y
      rcp r20.x, r20.x
      mul r20.x, r20.x, r20.y
    else
      rcp r20.x, v9.w
      mul r20.x, r20.x, v9.z
    endif
    mov oDepth, r20.x

// approximately 49 instruction slots used (4 texture, 45 arithmetic)
