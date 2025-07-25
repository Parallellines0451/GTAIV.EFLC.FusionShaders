// Summary: adjusted normal encoding
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D GBufferTextureSampler0;
//   sampler2D GBufferTextureSampler1;
//   sampler2D GBufferTextureSampler2;
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
//   GBufferTextureSampler2           s2       1
//   GBufferTextureSampler3           s4       1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 1.5414283108e-44 // 11
    def c0, 0.50999999, 512, 0.25, 256
    def c1, 0.998046875, 7.984375, 63.875, -127.999992
    def c2, 0.5, 9.99999975e-006, 1, -0.100000001
    def c3, 1.11111116, 0, 0, 0.125
    dcl_texcoord v0
    dcl vPos.xy
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s1
    dcl_2d s2
    dcl_2d s4
    add r0.xy, c0.x, vPos
    mul r0.xy, r0, c77.zwzw
    texld r1, r0, s1
    mul r2.xyz, r1.w, c1
    frc r2.xyz, r2
    mad r2.xy, r2.yzzw, -c3.w, r2
    mad r1.xyz, r1, c0.w, r2
    add r1.xyz, r1, c1.w
    nrm r2.xyz, r1
    texld r1, r0, s4
    
    // LogDepth Read
    pow r19.x, c209_abs.z, r1.x
    mul r1.y, r19.x, c209.w
    
    rcp r0.z, v0.w
    mul r0.z, r0.z, r1.y
    mad r1.xyz, v0, -r0.z, c2.y
    mad r3.xyz, v0, -r0.z, c15
    add r3.xyz, -r3, c66
    nrm r4.xyz, r1
    dp3 r0.z, r4, r2
    add r0.z, r0.z, r0.z
    mad r1.xyz, r2, -r0.z, r4
    add r4.xyz, r3, c2.y
    dp3 r0.z, r3, r3
    mov r3.z, c2.z
    mad_sat r0.z, r0.z, -c73.x, r3.z
    mul r0.z, r0.z, r0.z
    mad r0.z, r0.z, r0.z, c2.w
    nrm r3.xyz, r4
    dp3_sat r0.w, r3, r1
    texld r1, r0, s2
    texld r4, r0, s0
    mul r0.x, r1.y, r1.y
    mul r0.x, r0.x, c0.y
    pow r1.y, r0.w, r0.x
    mul r0.x, r0.z, c3.x
    dp3 r0.y, r3, -c72
    dp3_sat r0.w, r3, r2
    add r0.y, r0.y, -c74.x
    mul_sat r0.y, r0.y, c75.x
    mul r0.x, r0.x, r0.y
    mul r2.xyz, c76.w, c76
    mul r2.xyz, r0.x, r2
    cmp r0.xyz, r0.z, r2, c3.y
    mul r2.xyz, r1.y, r0
    mul r0.xyz, r0.w, r0
    mul r0.xyz, r4, r0
    add r0.w, r1.x, r1.x
    mad_sat r1.x, r1.z, r1.z, c2.x
    mad r0.xyz, r0.w, r2, r0
    mov r0.w, c2.z
    mul oC0, r1.x, r0
    
    // LogDepth Write
    mul r19.x, v9.w, c209.x
    log r19.x, r19.x
    mul r19.x, r19.x, c209.y
    rcp r19.y, v9.w
    mul r19.y, r19.y, v9.z
    cmp oDepth, -v9_abs.y, r19.y, r19.x

// approximately 59 instruction slots used (4 texture, 55 arithmetic)
