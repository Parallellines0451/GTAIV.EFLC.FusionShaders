// Summary: added volumetric fog
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   float4 NearFarPlane;
//   sampler2D GBufferTextureSampler3;
//   sampler2D HDRSampler;
//   float4 dofProj;
//   float4 gDepthFxParams;
//   float4 globalFogColor;
//   float4 globalFogColorN;
//   float4 globalFogParams;
//
//
// Registers:
//
//   Name                   Reg   Size
//   ---------------------- ----- ----
//   NearFarPlane           c128     1
//   gDepthFxParams         c16      1
//   globalFogParams        c41      1
//   globalFogColor         c42      1
//   globalFogColorN        c43      1
//   dofProj                c66      1
//   GBufferTextureSampler3 s0       1
//   HDRSampler             s1       1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 1.1532686361e-42 // 823
    def c0, 0.212500006, 0.715399981, 0.0720999986, 0
    def c1, -1, 1, 0, 1.00000001e-007
    def c140, 1e-6, 0.5, -0.0625, 0.9375
    def c141, 0.6, 4, 1, 30
    def c142, 1000, 0, 0, 0
    
    // 07:00 SUNNY, assuming that SunSize.x = 1.0 and HDRExposureClamp.xyz = 30.0
    // def c212, 0.384, 0.812, 0.871, 1.86              // AzimuthColor.xyz, AzimuthHeight.x
    // def c213, 1, 0.894, 0.698, 0.203                 // AzimuthColorEast.xyz, AzimuthStrength.x
    // def c214, 0.678, 0.839, 1, 36.337498             // SkyColor.xyz, HDRExposure.x
    // def c215, 0.953, 0.761, 0.761, 0.35              // SunColor.xyz, HDRSunExposure.x
    // def c216, 0.974928, 0.209101, 0.076107, 0        // SunDirection.x, -SunDirection.z, SunDirection.y
    
    dcl_texcoord v0.xy
    dcl_texcoord1 v1.xyz
    dcl_2d s0
    dcl_2d s1
    add r0.x, -c16.z, c16.w
    rcp r0.x, r0.x
    texld r1, v0, s0
    add r0.w, r1.x, c1.x
    
    // LogDepth Read
    rcp r20.x, c128.x
    mul r20.x, r20.x, c128.y
    pow r20.x, r20.x, r1.x
    mul r0.y, r20.x, c128.x
    
    add r1.x, -r0.y, c16.w
    mul_sat r0.x, r0.x, r1.x
    add r0.x, -r0.x, c1.y
    cmp r1.x, r0.w, c1.z, c1.y
    mov r2.xz, c1
    cmp r0.w, r0.w, c41.w, r2.z
    mul r0.x, r0.x, r1.x
    add r1.yz, r2.x, c16.xxyw
    mad r1.y, r0.x, r1.y, c1.y
    mul r0.x, r0.x, r1.z
    texld r2, v0, s1
    dp3 r1.z, r2, c0
    lrp r3.xyz, r1.y, r2, r1.z
    add r1.y, r1.z, c1.w
    pow r2.x, r1_abs.y, r0.x
    mul r1.yzw, r3.xxyz, r2.x
    mad r2.xyz, r3, -r2.x, c43
    mad r1.yzw, r0.w, r2.xxyz, r1
    mov r20.x, c142.x
    add r20.x, c41.x, -r20.x
    mul r20.x, r20.x, c210.y
    if_ge r20.x, r20_abs.x // check vanilla fog start value and volumetric fog toggle
      add r0.x, r0.y, -c41.x
      add r0.z, -c41.x, c41.y
      rcp r0.z, r0.z
      mul_sat r0.x, r0.x, r0.z
      mov r2.xyz, c43
      add r2.xyz, -r2, c42
      mad r2.xyz, r0.x, r2, c43
      add r2.xyz, -r1.yzww, r2
      rcp r0.z, c41.x
      mul_sat r0.y, r0.y, r0.z
      lrp r2.w, c41.w, r0.y, r0.x
      add r0.x, r2.w, c41.z
      mul r0.x, r1.x, r0.x
      mad oC0.xyz, r0.x, r2, r1.yzww
    else // https://www.desmos.com/calculator/8zvekzvd3j
      mad r20.xyz, v1, -r0.y, c140.x
      add r21.x, r20.z, c15.z
      dp3 r20.w, r20, r20
      rsq r20.w, r20.w
      mul r20.xyz, r20, r20.w // normalize(cameraToWorld)
      rcp r20.w, r20.w // length(cameraToWorld)
      
      rcp r21.y, -r20.z
      mul r21.y, r21.y, c15.z
      max r21.y, r21.y, c1.z
      mad r21.x, r21.x, -r1.x, r21.x
      cmp r20.w, r21.x, r20.w, r21.y // remap sky depth below the horizon
      
      mov r21.xyz, c212
      mad r21.w, r20.x, c140.y, c140.y
      lrp r22.xyz, r21.w, r21, c213
      mul_sat r21.x, r20.z, c212.w
      mad r21.x, r21.x, -c213.w, c213.w
      mad r21.xyz, r22, r21.x, c214 // base sky color
      
      dp3 r21.w, r20, c216 // dot(viewDir, SunDir)
      
      mad_sat r22.xy, r21.w, c140.zy, c140.wy
      mul r22.z, r22.x, r22.x
      mul r22.x, r22.x, r22.z // A, B
      mov r22.z, c141.x
      add_sat r22.z, r22.z, c216_abs.z // abs here to prevent excessive scattering at night
      // mul r22.y, r22.y, SunSize.x
      mad r22.x, r22.x, -r22.z, r22.y
      mul_sat r22.x, r22.x, c140.y
      mul r22.x, r22.x, c141.y // C
      add_sat r22.y, c141.z, -r22.x // D
      
      mul r23.xyz, r22.x, c215
      mul r23.xyz, r23, r23
      mul r23.xyz, r23, r23
      mad r23.xyz, r22.x, c215, r23
      mul r23.xyz, r23, c215.w
      
      mul r21.xyz, r21, r22.y
      mul_sat r21.xyz, r21, c215.w
      
      add r21.xyz, r21, r23
      mul r21.xyz, r21, c214.w
      min r21.xyz, r21, c141.w // min r21.xyz, r21, HDRExposureClamp
      
      mov r22.xyz, c43
      lrp r22.xyz, c41.w, r22, r21 // globalFogParams.w mixes far color with near color
      
      mov r20.x, c15.z
      mul r20.xy, r20.xz, c211.y     // hb, zb
      mul r20.x, r20.x, c210.x       // high altitude density compensation
      exp r20.x, -r20.x              // 2^(-hb)
      
      add r20.z, r20_abs.y, -c140.x
      cmp r20.y, r20.z, r20.y, c140.x // prevent division by 0
      rcp r20.z, r20.y               // 1/(zb)
      mul r20.y, r20.y, r20.w
      exp r20.y, -r20.y
      add r20.y, -r20.y, c141.z
      mul r20.y, r20.y, r20.z        // (1 - 2^(-zbx))/(zb)
      
      mul r20.x, r20.x, r20.y        // 2^(-hb) * (1 - 2^(-zbx))/(zb)
      mul r20.xy, r20.xw, c211.x     // density
      
      exp r20.x, -r20.x
      exp r20.y, -r20.y
      add r20.xy, -r20.xy, c141.z    // fog factor, color factor
      
      log r20.x, r20.x
      log r20.y, r20.y
      mul r20.xy, r20.xy, c211.zw
      exp r20.x, r20.x
      exp r20.y, r20.y
      
      lrp r22.xyz, r20.y, r22, c43
      lrp oC0.xyz, r20.x, r22, r1.yzw
    endif
    mov oC0.w, c1.y

// approximately 46 instruction slots used (2 texture, 44 arithmetic)
