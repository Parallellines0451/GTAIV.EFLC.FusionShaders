// Summary: removed unnecessary stipple
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   float4 NearFarPlane;
//   sampler2D BumpSampler;
//   sampler2D StippleTexture;
//   sampler2D TextureSampler;
//   float bumpiness;
//   float4 globalScalars;
//   float parallaxScaleBias;
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
//   bumpiness           c74      1
//   TextureSampler      s0       1
//   BumpSampler         s1       1
//   StippleTexture      s10      1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 7.0765572448e-43 // 505
    def c127, 1, 0.99, 0, 0 // LogDepth constants
    def c0, 0.5, -0.5, -0.00200000009, 0.001953125
    def c1, 0, -1, -0, 9.99999975e-006
    def c2, 3.99600005, 4, 0.125, 0.25
    dcl_texcoord v0.xy
    dcl_texcoord1 v1.xyz
    dcl_texcoord4 v2.xyz
    dcl_texcoord5 v3.xyz
    dcl_color v4.xw
    dcl_texcoord7 v5.xyz
    dcl vPos.xy
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s1
    dcl_2d s10
    /* removed stipple
    mov_sat r0.x, c39.x
    mul r0.x, r0.x, c2.x
    frc r0.y, r0.x
    mul r0.z, r0.y, c2.y
    frc r0.w, r0.z
    add r1.xy, r0.zxzw, -r0.wyzw
    mul r0.xy, c2.z, vPos
    frc r0.xy, r0_abs
    cmp r0.xy, vPos, r0, -r0
    mul r0.xy, r0, c2.w
    mad r0.xy, r1, c2.w, r0
    mov r0.zw, c1.x
    texldl r0, r0, s10
    cmp r0, -r0.y, c1.y, c1.z
    texkill r0
    removed stipple */
    texld r0, v0, s1
    add r0.xyz, c1.w, v5
    dp3 r0.z, r0, r0
    rsq r0.z, r0.z
    mul r0.xy, r0, r0.z
    mov r1.xw, c0
    mul r0.z, r1.x, c66.x
    mad r0.z, r0.w, c66.x, -r0.z
    mad_sat r0.xy, r0.z, r0, v0
    texld r2, r0, s1
    texld r0, r0, s0
    add r1.xy, r2, c0.y
    mul r1.xy, r1, c74.x
    dp2add r1.z, r2, -r2, -c1.y
    rsq r1.z, r1.z
    rcp r1.z, r1.z
    mul r3.xyz, r1.x, v2
    mad r3.xyz, v1, r1.z, r3
    mad r1.xyz, r1.y, v3, r3
    add r1.xyz, r1, c1.w
    dp3 r2.w, r1, r1
    rsq r2.w, r2.w
    dp2add r2.x, r2, r2, c0.z
    cmp r2.x, r2.x, -c1.y, -c1.z
    mul oC0.xyz, r0, r2.x
    mul oC2.z, r2.x, v4.x
    mul r0.x, r2.x, c73.x
    mul r0.y, r0.w, v4.w
    mad r1.xyz, r1, r2.w, -c1.y
    mul oC1.xyz, r1, c0.x
    mul oC2.x, r0.x, c0.x
    mul r0.x, r1.w, c72.x
    rsq r0.x, r0.x
    rcp oC2.y, r0.x
    mul r0.x, r0.y, c39.x
    mul r0.y, r2.z, r0.y
    mul oC1.w, r0.y, c39.x
    mov oC0.w, r0.x
    mov oC2.w, r0.x
    mov r0.yz, c1
    mul oC3, -r0.yzzz, c52.x
    
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

// approximately 59 instruction slots used (5 texture, 54 arithmetic)
