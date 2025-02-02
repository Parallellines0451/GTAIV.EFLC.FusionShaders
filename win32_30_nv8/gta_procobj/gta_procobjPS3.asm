// Summary: fixed pop-in/added stippled transparency + stipple mask + alpha toggle + sped up fading
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   float4 NearFarPlane;
//   sampler2D BumpSampler;
//   sampler2D EnvironmentSampler;
//   sampler2D SpecSampler;
//   sampler2D TextureSampler;
//   float bumpiness;
//   float4 globalScalars;
//   float reflectivePower;
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
//   specularFactor      c66      1
//   specularColorFactor c72      1
//   specMapIntMask      c73      1
//   bumpiness           c74      1
//   reflectivePower     c75      1
//   TextureSampler      s0       1
//   BumpSampler         s1       1
//   SpecSampler         s2       1
//   EnvironmentSampler  s4       1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 1.2107218732e-42 // 864
    def c152, 0.2, 0.4, 0.6, 0.8 // c152-c154 = new stipple constants
    def c153, 0.5, 2, 1, 0
    def c154, 1.6, 0, 0, 0
    def c127, 1, 0.99, 0, 0 // LogDepth constants
    def c0, -0.5, 9.99999975e-006, 0.5, 0.001953125
    def c1, 0.176470593, -1, -0, 1
    def c2, 0.3125, 12, 9, 0
    dcl_texcoord v0.xy
    dcl_texcoord1 v1.xyz
    dcl_texcoord3 v2.xyz
    dcl_texcoord4 v3.xyz
    dcl_texcoord5 v4.xyz
    dcl_color v5.xw
    dcl_texcoord9 v9
    dcl vPos.xy
    dcl_2d s0
    dcl_2d s1
    dcl_2d s2
    dcl_2d s4
    texld r0, v0, s0
    mul_sat r0.w, r0.w, c154.x
    // mul r0.w, r0.w, v5.w disabled vertex alpha
    add r20.x, r0.w, -c2.x
    cmp r20.x, r20.x, c1.w, c1.z
    cmp r0.w, -c223_abs.z, r0.w, r20.x
    mov r20.x, c39.x
    mad_sat r20.x, r20.x, c2.y, -c2.z
    mul r1.x, r0.w, r20.x
    mov r2.xyz, c1
    mul r20.xy, vPos.xy, c153.x
    frc r20.xy, r20.xy
    mad r20, r20.xxyy, -c153.y, c153.zwzw
    mul r20, r20.xxyy, r20.zwzw
    dp4 r20.x, r20_abs, c152.xzwy
    add r20.y, -r20.x, r1.x
    texkill r20.y
    texld r3, v0, s1
    add r0.w, -r3.w, c1.w
    add r0.w, -r3.x, r0.w
    cmp r1.yz, r0.w, r3.xwyw, r3.xxyw
    add r2.xw, r1.yyzz, c0.x
    mul r2.xw, r2, c74.x
    dp2add r0.w, r1.yzzw, -r1.yzzw, c1.w
    rsq r0.w, r0.w
    rcp r0.w, r0.w
    mul r1.yzw, r2.x, v3.xxyz
    mad r1.yzw, v1.xxyz, r0.w, r1
    mad r1.yzw, r2.w, v4.xxyz, r1
    add r1.yzw, r1, c0.y
    dp3 r0.w, r1.yzww, r1.yzww
    rsq r0.w, r0.w
    mul r3.xyz, r1.yzww, r0.w
    texld r4, v0, s2
    mul r2.x, r4.w, c66.x
    dp3 r2.w, r4, c73
    mul r2.w, r2.w, c72.x
    add r4.xyz, c0.y, v2
    nrm r5.xyz, r4
    dp3 r3.w, -r5, r3
    add r3.w, r3.w, r3.w
    mad r3.xyz, r3, -r3.w, -r5
    add r3.xyz, r3, c0.y
    dp3 r3.y, r3, r3
    rsq r3.y, r3.y
    mad r3.xy, r3.xzzw, r3.y, c1.w
    mul r3.xy, r3, c0.x
    texld r3, r3, s4
    mul r3.xyz, r2.w, r3
    mad oC0.xyz, r3, c75.x, r0
    mad r0.xyz, r1.yzww, r0.w, c1.w
    mul oC1.xyz, r0, c0.z
    mul oC2.x, r2.w, c0.z
    mul r0.x, r2.x, c0.w
    rsq r0.x, r0.x
    rcp oC2.y, r0.x
    mov oC0.w, r1.x
    mov oC1.w, r1.x
    mov oC2.z, v5.x
    // mov oC2.w, r1.x
    add r20.x, -c152.w, r1.x
    cmp oC2.w, r20.x, c1.z, -c1.y
    mul oC3, -r2.yzzz, c52.x
    
    // LogDepth Write
    if_ne v9.y, c127.x
      rcp r20.x, c128.x
      mul r20.y, r20.x, v9.w
      mul r20.x, r20.x, c128.y
      log r20.x, r20.x
      log r20.y, r20.y
      rcp r20.x, r20.x
      mul r20.x, r20.x, r20.y
    else
      rcp r20.x, v9.w
      mul r20.x, r20.x, v9.z
    endif
    mov oDepth, r20.x

// approximately 54 instruction slots used (4 texture, 50 arithmetic)
