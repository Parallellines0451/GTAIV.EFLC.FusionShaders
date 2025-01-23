// Summary: improved light volume transparency
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D GBufferTextureSampler3;
//   float gDeferredLightRadius;
//   sampler2D gDeferredLightSampler2;
//   float4 gDeferredProjParams;
//   float4 gooDeferredLightScreenSize;
//   float gDeferredVolumeRadiusScale;
//
//
// Registers:
//
//   Name                       Reg   Size
//   -------------------------- ----- ----
//   gDeferredLightRadius       c66      1
//   gooDeferredLightScreenSize c72      1
//   gDeferredProjParams        c73      1
//   gDeferredVolumeRadiusScale c213     1
//   gDeferredLightSampler2     s0       1
//   GBufferTextureSampler3     s1       1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 3.2229864679e-44 // 23
    def c127, 1, 0.99, 0, 0 // LogDepth constants
    def c0, 0.50999999, 9.99999975e-006, 16, 1
    def c1, 0, 0, 0, 0
    def c2, 0.5, 0.125, 3.14159274, 1.5
    def c3, 0.662, 0.053525835, -2, 3
    dcl_texcoord v0
    dcl_texcoord1 v1.xyz
    dcl_texcoord2 v2.xyz
    dcl vPos.xy
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s1
    add r0.xy, c0.x, vPos
    mul r0.xy, r0, c72.zwzw
    texld r0, r0, s1
    
    // LogDepth Read
    rcp r20.x, c128.x
    mul r20.x, r20.x, c128.y
    pow r20.x, r20.x, r0.x
    mul r0.y, r20.x, c128.x
    
    rcp r0.x, v0.w
    mul_sat r0.x, r0.x, r0.y
    mov r1.xyz, v0
    mad r0.xyz, v1, r0.x, r1
    mul r2.xyz, r1, v1.zxyw
    mad r1.xyz, r1.zxyw, v1, -r2
    mul r2.xyz, r1, v1.zxyw
    mad r1.xyz, v1.yzxw, r1.yzxw, -r2
    add r1.xyz, r1, c0.y
    nrm r2.xyz, r1
    dp3 r0.w, r2, v0
    
    // https://www.desmos.com/calculator/mvwzgj4pvn
    mov r20.x, c0.w
    max r20.x, c66.x, r20.x
    mul r20.y, r20.x, c3.x
    mul r20.y, r20.y, c213.x
    add r20.z, r20.y, -r0.w
    rcp r20.y, r20.y
    mul_sat r20.y, r20.y, r20.z
    
    //mad r20.z, r20.y, c3.z, c3.w
    //mul r20.z, r20.y, r20.z
    //mul r20.y, r20.y, r20.z
    
    mul r20.y, r20.y, r20.x
    mul r20.y, r20.y, r20.x
    mul r20.y, r20.y, c3.y
    
    mul r0.w, r0.w, r0.w
    mul r1.x, c66.x, c66.x
    rcp r1.x, r1.x
    mul r1.x, r1.x, c0.z
    min r2.x, r1.x, c0.z
    mad r0.w, r0.w, r2.x, c0.w
    rsq r0.w, r0.w
    rsq r1.x, r2.x
    rcp r1.x, r1.x
    mul r1.x, r0.w, r1.x
    rcp r0.w, r0.w
    mul r0.xyz, r0, r1.x
    mul r1.xyz, r1.x, v0
    dp3 r1.w, r0, r0
    dp3 r0.x, r0, r1
    dp3 r0.y, r1, r1
    add r0.y, r0.y, c0.y
    rsq r0.y, r0.y
    add r0.z, r1.w, c0.y
    rsq r0.z, r0.z
    mul r0.y, r0.y, r0.z
    mul r0.x, r0.x, r0.y
    mad r0.y, r0.x, c2.x, c2.x
    mov r0.x, c2.y
    texld r1, r0, s0
    mul r0.x, r2.x, r1.x
    //mul r0.y, r2.x, c2.w
    //mul r0.y, r0.w, r0.y
    //rcp r0.y, r0.y
    mul r0.x, r0.x, c2.z
    mul r0.x, r20.y, r0.x
    mul oC0.xyz, r0.x, v2
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

// approximately 51 instruction slots used (2 texture, 49 arithmetic)
