// Summary: removed unnecessary stipple
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   float4 NearFarPlane;
//   sampler2D BumpSampler;
//   samplerCUBE EnvironmentSampler;
//   sampler2D StippleTexture;
//   sampler2D TextureSampler;
//   float bumpiness;
//   float4 globalScalars;
//   float reflectivePower;
//   float4 stencil;
//
//
// Registers:
//
//   Name               Reg   Size
//   ------------------ ----- ----
//   NearFarPlane       c128     1
//   globalScalars      c39      1
//   stencil            c52      1
//   bumpiness          c66      1
//   reflectivePower    c72      1
//   TextureSampler     s0       1
//   BumpSampler        s1       1
//   EnvironmentSampler s2       1
//   StippleTexture     s10      1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 4.1058045005e-43 // 293
    def c127, 1, 0.99, 0, 0 // LogDepth constants
    def c0, -0.5, 9.99999975e-006, 0.5, 0
    def c1, 3.99600005, 4, 0.125, 0.25
    def c2, 0, -1, -0, 1
    def c3, 0, 1, 0.25, 0
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
    dcl_cube s2
    dcl_2d s10
    texld r0, v0, s1
    add r0.z, -r0.w, c2.w
    add r0.z, -r0.x, r0.z
    cmp r0.xy, r0.z, r0.wyzw, r0
    texld r1, v0, s0
    add r0.zw, r0.xyxy, c0.x
    mul r0.zw, r0, c66.x
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
    add r3.xyz, c0.y, v2.xzyw
    dp3 r2.w, r3, r3
    rsq r2.w, r2.w
    mul r3.xyz, r3, r2.w
    dp3 r2.w, -r3.xzyw, r2
    add r2.w, r2.w, r2.w
    mad r2.xyz, r2.xzyw, -r2.w, -r3
    add r2.xyz, r2, c0.y
    dp3 r2.w, r2, r2
    rsq r2.w, r2.w
    mul r2.xyz, r2, r2.w
    texld r2, r2, s2
    mul r1.w, r1.w, v5.w
    mad oC0.xyz, r2, c72.x, r1
    mad r0.xyz, r0, r0.w, c2.w
    mul oC1.xyz, r0, c0.z
    mul r0.x, r1.w, c39.x
    mov oC0.w, r0.x
    mov oC1.w, r0.x
    mad oC2.xyz, v5.x, c3.xxyw, c3.xzxw
    mov oC2.w, r0.x
    mov r0.xw, c2
    mul oC3, r0.wxxx, c52.x
    
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

// approximately 57 instruction slots used (5 texture, 52 arithmetic)
