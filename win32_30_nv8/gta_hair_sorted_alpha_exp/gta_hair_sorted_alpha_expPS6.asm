// Summary: removed unnecessary stipple
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D BumpSampler;
//   sampler2D StippleTexture;
//   sampler2D TextureSampler;
//   float bumpiness;
//   sampler2D damageTextureSampler;
//   row_major float4x4 gViewInverse;
//   float4 globalScalars;
//   float4 matMaterialColorScale;
//   float4 stencil;
//
//
// Registers:
//
//   Name                  Reg   Size
//   --------------------- ----- ----
//   gViewInverse          c12      4
//   globalScalars         c39      1
//   stencil               c52      1
//   matMaterialColorScale c66      1
//   bumpiness             c72      1
//   TextureSampler        s0       1
//   damageTextureSampler  s1       1
//   BumpSampler           s2       1
//   StippleTexture        s10      1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 3.8675837615e-43 // 276
    def c0, 0.125, 0.25, -0.5, 9.99999975e-006
    def c1, -2, 1, 0, 0.3125
    def c2, 0, 1, 3.99600005, 4
    dcl_texcoord v0.xy
    dcl_texcoord1 v1.xyz
    dcl_texcoord4 v2.xyz
    dcl_texcoord5 v3.xyz
    dcl_color v4.xyw
    dcl_texcoord7 v5.xyz
    dcl_texcoord6 v6.x
    dcl vPos.xy
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s1
    dcl_2d s2
    dcl_2d s10
    texld r0, v0, s0
    if_lt -v6.x, c2.x
      texld r1, v0, s1
      if_lt -r1.w, c2.x
        mad r2.x, r1.w, -v6.x, c2.y
        mul r1.xyz, r1.w, r1
        mul r1.xyz, r1, v6.x
        mad r0.xyz, r0, r2.x, r1
      endif
    endif
    texld r1, v0, s2
    add r1.z, -r1.w, c2.y
    add r1.z, -r1.x, r1.z
    cmp r1.xy, r1.z, r1.wyzw, r1
    add r1.zw, r1.xyxy, c0.z
    mul r1.zw, r1, c72.x
    dp2add r1.x, r1, -r1, c2.y
    rsq r1.x, r1.x
    rcp r1.x, r1.x
    mul r2.xyz, r1.z, v2
    mad r1.xyz, v1, r1.x, r2
    mad r1.xyz, r1.w, v3, r1
    add r1.xyz, r1, c0.w
    dp3 r1.w, r1, r1
    rsq r1.w, r1.w
    mul r0.w, r0.w, v4.w
    mul oC0.xyz, r0, c66.x
    add r0.xyz, -c15, v5
    add r0.xyz, r0, c0.w
    nrm r2.xyz, r0
    mad r0.xyz, r1, r1.w, c0.w
    nrm r3.xyz, r0
    dp3 r0.x, r2, r3
    mad r0.y, r0.x, -c1.x, c1.y
    cmp r0.x, -r0.x, r0.y, c2.y
    mul r0.y, r0.x, v4.y
    cmp r0.x, r0.x, r0.y, c2.x
    mul r0.x, r0.x, r0.x
    mad r1.xyz, r1, r1.w, c2.y
    mul oC1.xyz, r1, -c0.z
    mul oC2.x, r0.x, -c0.z
    mul r0.x, r0.w, c39.x
    mov oC0.w, r0.x
    mov oC1.w, r0.x
    mad oC2.yz, v4.x, c1.xzyw, c1.xwzw
    mov oC2.w, r0.x
    mov r0.xy, c2
    mul oC3, r0.yxxx, c52.x
    
    // LogDepth Write
    mul r19.x, v9.w, c209.x
    log r19.x, r19.x
    mul r19.x, r19.x, c209.y
    rcp r19.y, v9.w
    mul r19.y, r19.y, v9.z
    cmp oDepth, -v9_abs.y, r19.y, r19.x

// approximately 73 instruction slots used (5 texture, 68 arithmetic)
