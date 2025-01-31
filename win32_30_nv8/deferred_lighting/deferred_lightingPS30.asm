//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   float4 NearFarPlane;
//   sampler2D GBufferTextureSampler1;
//   sampler2D GBufferTextureSampler3;
//   float4 gDeferredLightColourAndIntensity;
//   float gDeferredLightConeOffset;
//   float3 gDeferredLightDirection;
//   float3 gDeferredLightTangent;
//   float4 gDeferredProjParams;
//   row_major float4x4 gViewInverse;
//   float4 globalScalars2;
//   float4 gooDeferredLightScreenSize;
//
//
// Registers:
//
//   Name                             Reg   Size
//   -------------------------------- ----- ----
//   NearFarPlane                     c128     1
//   gViewInverse                     c12      4
//   globalScalars2                   c40      1
//   gDeferredLightDirection          c66      1
//   gDeferredLightTangent            c72      1
//   gDeferredLightConeOffset         c73      1
//   gDeferredLightColourAndIntensity c74      1
//   gooDeferredLightScreenSize       c75      1
//   gDeferredProjParams              c76      1
//   GBufferTextureSampler1           s0       1
//   GBufferTextureSampler3           s1       1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 4.9045446251e-44 // 35
    def c127, 1, 0.99, 0, 0 // LogDepth constants
    def c0, 0.50999999, 2, -0.999989986, 9.99999975e-006
    def c1, 0.5, 1, 4, 0
    dcl_texcoord v0
    dcl vPos.xy
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s1
    mov r0.xyz, c72
    add r1.xyz, r0, c66
    mad r2.xyz, r1, -c1.x, r0
    dp3 r0.w, r2, r2
    rsq r0.w, r0.w
    rcp r0.w, r0.w
    add r0.w, r0.w, c73.x
    rcp r0.w, r0.w
    mul r0.w, r0.w, c73.x
    add r2.xy, c0.x, vPos
    mul r2.xy, r2, c75.zwzw
    texld r3, r2, s1
    texld r2, r2, s0
    mad r2.xyz, r2, c0.y, c0.z
    nrm r4.xyz, r2
    
    // LogDepth Read
    rcp r20.x, c128.x
    mul r20.x, r20.x, c128.y
    pow r20.x, r20.x, r3.x
    mul r3.y, r20.x, c128.x
    
    rcp r1.w, v0.w
    mul r1.w, r1.w, r3.y
    mad r2.xyz, v0, -r1.w, c15
    mad r1.xyz, r1, -c1.x, r2
    add r0.xyz, r0, -c66
    add r0.xyz, r0, c0.w
    nrm r2.xyz, r0
    dp3 r0.x, r1, r2
    mad r0.x, r0.x, r0.w, -r0.x
    mad r0.xyz, r2, r0.x, r1
    dp3 r0.w, r4, -r0
    dp3 r0.x, -r0, -r0
    rsq r0.x, r0.x
    mul_sat r0.y, r4.z, c1.z
    mul_sat r0.z, r0.w, r0.x
    rcp r0.x, r0.x
    mul r0.z, r0.z, r0.z
    rcp r0.w, c73.x
    mad_sat r0.x, r0.x, -r0.w, c1.y
    mul r0.x, r0.z, r0.x
    mul r0.x, r0.x, c74.w
    mul r0.x, r0.y, r0.x
    mul oC0.w, r0.x, c40.z
    mov oC0.xyz, c1.w
    
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

// approximately 44 instruction slots used (2 texture, 42 arithmetic)
