// Summary: simplified transparency code + stipple mask + added vertex AO toggle
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   float4 NearFarPlane;
//   sampler2D BumpSampler;
//   sampler2D EnvironmentSampler;
//   sampler2D SpecSampler;
//   sampler2D StippleTexture;
//   sampler2D TextureSampler;
//   float bumpiness;
//   float4 colorize;
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
//   colorize            c51      1
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
//   StippleTexture      s10      1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 5.5071029648e-43 // 393
    def c152, 0.2, 0.4, 0.6, 0.8 // c152-c154 = new stipple constants
    def c153, 0.5, 2, 1, 0
    def c154, 1.6, 0, 0, 0
    def c127, 1, 0.99, 0, 0 // LogDepth constants
    def c0, -0.5, 9.99999975e-006, 0.5, 0.001953125
    def c1, 3.99600005, 4, 0.125, 0.25
    def c2, 0, -1, -0, 1
    dcl_texcoord v0.xy
    dcl_texcoord1 v1.xyz
    dcl_texcoord3 v2.xyz
    dcl_texcoord4 v3.xyz
    dcl_texcoord5 v4.xyz
    dcl_color v5.xw
    dcl vPos.xy
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s1
    dcl_2d s2
    dcl_2d s4
    dcl_2d s10
    mul r20.xy, vPos.xy, c153.x
    frc r20.xy, r20.xy
    mad r20, r20.xxyy, -c153.y, c153.zwzw
    mul r20, r20.xxyy, r20.zwzw
    dp4 r20.x, r20_abs, c152.xzwy
    add r20.y, -r20.x, c39.x
    texkill r20.y
    texld r0, v0, s1
    add r0.z, -r0.w, c2.w
    add r0.z, -r0.x, r0.z
    cmp r0.xy, r0.z, r0.wyzw, r0
    texld r1, v0, s0
    add r0.zw, r0.xyxy, c0.x
    mul r0.zw, r0, c74.x
    dp2add r0.x, r0, -r0, c2.w
    rsq r0.x, r0.x
    rcp r0.x, r0.x
    mul r2.xyz, r0.z, v3
    mad r0.xyz, v1, r0.x, r2
    mad r0.xyz, r0.w, v4, r0
    add r0.xyz, r0, c0.y
    dp3 r0.w, r0, r0
    rsq r0.w, r0.w
    mul r2.xyz, r0, r0.w
    texld r3, v0, s2
    mul r2.w, r3.w, c66.x
    dp3 r3.x, r3, c73
    mul r3.x, r3.x, c72.x
    add r3.yzw, c0.y, v2.xxyz
    nrm r4.xyz, r3.yzww
    dp3 r3.y, -r4, r2
    add r3.y, r3.y, r3.y
    mad r2.xyz, r2, -r3.y, -r4
    add r2.xyz, r2, c0.y
    dp3 r2.y, r2, r2
    rsq r2.y, r2.y
    mad r2.xy, r2.xzzw, r2.y, c2.w
    mul r2.xy, r2, c0.x
    texld r4, r2, s4
    mul r2.xyz, r3.x, r4
    mul r1, r1, c51
    mul r1.w, r1.w, v5.w
    mad oC0.xyz, r2, c75.x, r1
    mad r0.xyz, r0, r0.w, c2.w
    mul oC1.xyz, r0, c0.z
    mul oC2.x, r3.x, c0.z
    mul r0.x, r2.w, c0.w
    rsq r0.x, r0.x
    rcp oC2.y, r0.x
    mul r0.x, r1.w, c39.x
    mov oC0.w, r0.x
    mov oC1.w, r0.x
    // mov oC2.z, c39.z
    mov r1.x, c2.w
    dp4 r1.x, c51, r1.x
    add r1.x, r1.x, -c1.y
    cmp oC2.z, -r1_abs.x, v5.x, c39.z // apply vertex AO if emissivity == 0, makes this shader useful for excluding objects from casting night shadows
    // mov oC2.w, r0.x
    mov r20.x, -c152.w
    add r20.x, r20.x, c39.x
    cmp oC2.w, r20.x, c2.z, -c2.y
    mov r0.xw, c2
    mul oC3, r0.wxxx, c52.x
    
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

// approximately 68 instruction slots used (6 texture, 62 arithmetic)
