//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   float4 NearFarPlane;
//   float3 HDRExposureClamp;
//   float3 HDRSunExposure;
//   float3 SunCentre;
//   float3 SunColor;
//   float4 SunDirection;
//
//
// Registers:
//
//   Name             Reg   Size
//   ---------------- ----- ----
//   NearFarPlane     c128     1
//   SunCentre        c64      1
//   SunDirection     c65      1
//   SunColor         c66      1
//   HDRSunExposure   c67      1
//   HDRExposureClamp c68      1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 8.8281803252e-44 // 63
    def c127, 1, 0.99, 0, 0 // LogDepth constants
    def c0, 9.99999975e-006, 1, 0.5, 4
    def c1, -2, 3, 0, 0
    dcl_texcoord_pp v0.w
    dcl_texcoord1_pp v1.zw
    dcl_texcoord9 v9
    mov_pp r0.xy, v1.zwzw
    mov_pp r0.z, v0.w
    add r0.xyz, r0, c0.x
    nrm_pp r1.xyz, r0
    mov r0.xz, c0
    add r0.xyw, r0.x, c65.xyzz
    nrm_pp r2.xyz, r0.xyww
    dp3_pp r0.x, r1, r2
    add_pp r0.x, r0.x, c0.y
    mad r0.x, r0.x, r0.z, -c64.x
    add r0.y, -c64.x, c64.y
    rcp r0.y, r0.y
    mul_sat r0.x, r0.x, r0.y
    mad r0.y, r0.x, c1.x, c1.y
    mul r0.x, r0.x, r0.x
    mul r0.x, r0.y, r0.x
    mul_pp r0.x, r0.x, c64.z
    mul_pp r0.x, r0.x, c0.w
    mul_pp r0.xyz, r0.x, c66
    mul r1.xyz, r0_abs, r0_abs
    mad_pp r0.xyz, r1, r1, r0
    mul_pp r0.xyz, r0, c67.x
    min_pp oC0.xyz, c68, r0
    mov_pp oC0.w, c0.y
    
    // LogDepth Write
    if_ne v9.y, c127.x
      rcp r20.x, c209.x
      mul r20.y, r20.x, v9.w
      mul r20.x, r20.x, c209.y
      log r20.x, r20.x
      log r20.y, r20.y
      rcp r20.x, r20.x
      mul r20.x, r20.x, r20.y
    else
      rcp r20.x, v9.w
      mul r20.x, r20.x, v9.z
    endif
    mov oDepth, r20.x

// approximately 28 instruction slots used
