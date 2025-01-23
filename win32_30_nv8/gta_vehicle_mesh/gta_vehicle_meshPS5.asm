// Summary: stipple mask + added dirt toggle
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D BumpSampler;
//   sampler2D DirtSampler;
//   float3 LuminanceConstants;
//   sampler2D SpecSampler;
//   sampler2D TextureSampler;
//   float3 dirtColor;
//   float dirtLevel;
//   float4 globalScalars;
//   float3 matDiffuseColor;
//   float4 matDiffuseColor2;
//   float reflectivePowerED;
//   float3 specMapIntMask;
//   float4 stencil;
//
//
// Registers:
//
//   Name               Reg   Size
//   ------------------ ----- ----
//   globalScalars      c39      1
//   stencil            c52      1
//   matDiffuseColor    c66      1
//   matDiffuseColor2   c72      1
//   dirtLevel          c73      1
//   dirtColor          c74      1
//   specMapIntMask     c75      1
//   reflectivePowerED  c76      1
//   LuminanceConstants c77      1
//   TextureSampler     s0       1
//   DirtSampler        s1       1
//   BumpSampler        s2       1
//   SpecSampler        s4       1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 9.5428425421e-43 // 681
    def c127, 1, 0.99, 0, 0 // LogDepth constants
    def c0, 1, -0.5, 9.99999975e-006, 0
    def c1, 0.09765625, 0, 0, 0
    def c100, 10, 1, 0, 0
    // def c76, 1, 1, 1, 1 // disable IDE dirt influence
    dcl_texcoord v0.xy
    dcl_texcoord1 v1.xyz
    dcl_texcoord4 v2.xyz
    dcl_texcoord5 v3.xyz
    dcl_color v4
    dcl_texcoord7 v5.xy
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s1
    dcl_2d s2
    dcl_2d s4
    mov r21.xyz, c74
    mov r21.w, c73.x
    mov r22.x, c100.y
    mul_sat r22.y, r21.w, c100.x
    cmp r21, -c221_abs.y, r21, r22.xxxy
    texld r0, v0, s2
    add r0.z, -r0.w, c0.x
    add r0.z, -r0.x, r0.z
    cmp r0.xy, r0.z, r0.wyzw, r0
    texld r1, v0, s0
    add r0.zw, r0.xyxy, c0.y
    dp2add r0.x, r0, -r0, c0.x
    rsq r0.x, r0.x
    rcp r0.x, r0.x
    mul r2.xyz, r0.z, v2
    mad r0.xyz, v1, r0.x, r2
    mad r0.xyz, r0.w, v3, r0
    add r0.xyz, r0, c0.z
    dp3 r0.w, r0, r0
    rsq r0.w, r0.w
    texld r2, v0, s4
    mul r2.w, r2.w, c76.x
    mul r2.w, r2.w, c72.w
    dp3 r2.x, r2, c75
    mul r2.x, r2.x, c76.x
    mul r1.xyz, r1, c66
    mul r1, r1, v4
    dp3 r2.y, v4, c77
    mul oC2.z, r2.y, c39.z
    mov r3.xw, c0
    if_lt -c73.x, r3.w
      texld r4, v5, s1
      mul r2.y, r4.x, r21.w
      mad r5.x, r4.x, -r21.w, r3.x
      lrp r5.yzw, r2.y, r21.xxyz, r1.xxyz
      mad r6, r1.xxyz, c0.wxxx, c0.xwww
      cmp r4, -r4.x, r6, r5
      mov r1.xyz, r4.yzww
    else
      mov r4.x, c0.x
    endif
    mul r2.x, r2.x, r4.x
    mul r2.x, r2.x, c72.w
    mad r0.xyz, r0, r0.w, c0.x
    mul oC1.xyz, r0, -c0.y
    mul oC2.x, r2.x, -c0.y
    mul r0.x, r2.w, c1.x
    rsq r0.x, r0.x
    rcp oC2.y, r0.x
    mul r1.w, r1.w, c39.x
    mov oC0, r1
    mov oC1.w, r1.w
    // mov oC2.w, r1.w
    mov oC2.w, c0.w
    mul oC3, r3.xwww, c52.x
    
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

// approximately 52 instruction slots used (4 texture, 48 arithmetic)
