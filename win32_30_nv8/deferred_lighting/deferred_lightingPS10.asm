//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D GBufferTextureSampler0;
//   sampler2D GBufferTextureSampler1;
//   sampler2D GBufferTextureSampler3;
//   float4 gDeferredLightColourAndIntensity;
//   float gDeferredLightConeOffset;
//   float gDeferredLightConeScale;
//   float3 gDeferredLightDirection;
//   float gDeferredLightInvSqrRadius;
//   float3 gDeferredLightPosition;
//   float4 gDeferredProjParams;
//   row_major float4x4 gViewInverse;
//   float4 gooDeferredLightScreenSize;
//
//
// Registers:
//
//   Name                             Reg   Size
//   -------------------------------- ----- ----
//   gViewInverse                     c12      4
//   gDeferredLightPosition           c66      1
//   gDeferredLightDirection          c72      1
//   gDeferredLightInvSqrRadius       c73      1
//   gDeferredLightConeOffset         c74      1
//   gDeferredLightConeScale          c75      1
//   gDeferredLightColourAndIntensity c76      1
//   gooDeferredLightScreenSize       c77      1
//   gDeferredProjParams              c78      1
//   GBufferTextureSampler0           s0       1
//   GBufferTextureSampler1           s1       1
//   GBufferTextureSampler3           s2       1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 2.1019476965e-44 // 15
    def c127, 1, 0.99, 0, 0 // LogDepth constants
    def c0, 0.50999999, 2, -0.999989986, 9.99999975e-006
    def c1, 1, -0.333333343, 1.5, -0.200000003
    def c2, 1.25, 0, 0, 0
    dcl_texcoord v0
    dcl vPos.xy
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s1
    dcl_2d s2
    add r0.xy, c0.x, vPos
    mul r0.xy, r0, c77.zwzw
    texld r1, r0, s2
    
    // LogDepth Read
    rcp r20.x, c128.x
    mul r20.x, r20.x, c128.y
    pow r20.x, r20.x, r1.x
    mul r1.y, r20.x, c128.x
    
    rcp r0.z, v0.w
    mul r0.z, r0.z, r1.y
    mad r1.xyz, v0, -r0.z, c15
    add r1.xyz, -r1, c66
    add r2.xyz, r1, c0.w
    dp3 r0.z, r1, r1
    mov r1.x, c1.x
    mad_sat r0.z, r0.z, -c73.x, r1.x
    mad r0.z, r0.z, r0.z, c1.y
    nrm r1.xyz, r2
    texld r2, r0, s1
    texld r3, r0, s0
    mad r0.xyw, r2.xyzz, c0.y, c0.z
    nrm r2.xyz, r0.xyww
    dp3 r0.x, r2, r1
    dp3 r0.y, r1, -c72
    add r0.y, r0.y, -c74.x
    mul_sat r0.y, r0.y, c75.x
    add r0.x, r0.x, c1.w
    mul_sat r0.x, r0.x, c2.x
    mul r0.w, r0.z, c1.z
    mul r0.y, r0.y, r0.w
    mul r0.x, r0.x, r0.y
    mul r1.xyz, c76.w, c76
    mul r0.xyw, r0.x, r1.xyzz
    mul r0.xyw, r3.xyzz, r0
    cmp oC0.xyz, r0.z, r0.xyww, c2.y
    mov oC0.w, c1.x
    
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

// approximately 36 instruction slots used (3 texture, 33 arithmetic)
