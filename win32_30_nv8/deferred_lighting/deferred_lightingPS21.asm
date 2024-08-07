//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D GBufferTextureSampler3;
//   float gDeferredLightRadius;
//   float4 gDeferredProjParams;
//   float4 gooDeferredLightScreenSize;
//
//
// Registers:
//
//   Name                       Reg   Size
//   -------------------------- ----- ----
//   gDeferredLightRadius       c66      1
//   gooDeferredLightScreenSize c72      1
//   gDeferredProjParams        c73      1
//   GBufferTextureSampler3     s0       1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 3.6433760072e-44 // 26
    def c127, 0.9999999, 1, 0, 0 // LogDepth constants
    def c0, 0.50999999, 9.99999975e-006, 0.660000026, 0.333330005
    def c1, 0, 1, 0, 0
    dcl_texcoord v0
    dcl_texcoord1 v1.xyz
    dcl_texcoord2 v2.xyz
    dcl vPos.xy
    dcl_texcoord9 v9
    dcl_2d s0
    add r0.xy, c0.x, vPos
    mul r0.xy, r0, c72.zwzw
    texld r0, r0, s0
    // ----------------------------------------------------------------- Log2Linear -----------------------------------------------------------------
    if_ne r0.x, c127.y
      rcp r20.x, c128.x
      mul r20.x, r20.x, c128.y
      pow r20.x, r20.x, r0.x
      mul r20.x, r20.x, c128.x // W_clip
      
      add r20.y, r20.x, -c128.x
      add r20.z, c128.y, -c128.x
      mul r20.y, r20.y, c128.y
      mul r20.z, r20.z, r20.x
      rcp r20.z, r20.z
      mul r20.w, r20.y, r20.z // Linear depth
      
      min r0, r20.w, c127.x // FP error hack
    endif
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    mad r0.x, r0.x, -c73.z, c73.w
    mul r0.x, r0.x, v0.w
    rcp r0.x, r0.x
    mov_sat r0.x, -r0.x
    add r0.yzw, c0.y, v1.xxyz
    nrm r1.xyz, r0.yzww
    dp3 r0.y, r1, v1
    dp3 r0.z, r1, v0
    mad r0.x, r0.y, r0.x, r0.z
    mov r1.xyz, v1
    mul r2.xyz, r1.zxyw, v0
    mad r1.xyz, v0.zxyw, r1, -r2
    mul r2.xyz, r1, v1.zxyw
    mad r1.xyz, v1.yzxw, r1.yzxw, -r2
    add r1.xyz, r1, c0.y
    nrm r2.xyz, r1
    dp3 r0.y, r2, v0
    mov r1.z, c0.z
    mad r0.w, c66.x, -r1.z, r0.y
    cmp r0.w, r0.w, c1.x, c1.y
    mul r1.x, r1.z, c66.x
    mul r1.x, r1.x, r1.x
    mad r0.y, r0.y, -r0.y, r1.x
    rcp r1.x, r1.x
    rsq r0.y, r0.y
    rcp r0.y, r0.y
    mul r0.y, r0.w, r0.y
    max r1.y, r0.x, -r0.y
    min r2.x, r0.y, r1.y
    max r1.y, r0.z, -r0.y
    min r2.y, r0.y, r1.y
    add r0.x, r2.x, -r2.y
    mul r0.x, r0.x, r0.x
    mul r0.x, r0.x, c0.w
    mul r0.x, r1.x, r0.x
    mul oC0.xyz, -r0.x, v2
    mov oC0.w, c1.x
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

// approximately 44 instruction slots used (1 texture, 43 arithmetic)
