//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   float3 AzimuthColor;
//   float3 AzimuthColorEast;
//   float AzimuthHeight;
//   float AzimuthStrength;
//   float CloudBias;
//   float4 CloudColor;
//   float CloudFadeOut;
//   float CloudInscatteringRange;
//   float CloudShadowStrength;
//   float4 CloudThicknessEdgeSmoothDetailScaleStrength;
//   float CloudThreshold;
//   sampler2D GalaxySampler;
//   float HDRExposure;
//   float3 HDRExposureClamp;
//   float3 HDRSunExposure;
//   sampler2D HighDetailNoiseSampler;
//   sampler2D PerlinNoiseSampler;
//   float3 SkyColor;
//   float4 StarFieldBrightness;
//   float3 SunCentre;
//   float3 SunColor;
//   float4 SunDirection;
//   float SunSize;
//   float4 SunsetColor;
//   float4 TopCloudBiasDetailThresholdHeight;
//   float3 TopCloudColor;
//
//
// Registers:
//
//   Name                                        Reg   Size
//   ------------------------------------------- ----- ----
//   SunCentre                                   c64      1
//   SunDirection                                c65      1
//   SkyColor                                    c66      1
//   AzimuthColor                                c67      1
//   SunColor                                    c68      1
//   AzimuthColorEast                            c69      1
//   AzimuthHeight                               c70      1
//   CloudColor                                  c71      1
//   SunsetColor                                 c72      1
//   CloudThreshold                              c73      1
//   CloudBias                                   c74      1
//   CloudFadeOut                                c75      1
//   TopCloudBiasDetailThresholdHeight           c76      1
//   TopCloudColor                               c77      1
//   CloudShadowStrength                         c78      1
//   CloudInscatteringRange                      c79      1
//   AzimuthStrength                             c80      1
//   CloudThicknessEdgeSmoothDetailScaleStrength c81      1
//   StarFieldBrightness                         c82      1
//   SunSize                                     c83      1
//   HDRExposure                                 c84      1
//   HDRSunExposure                              c85      1
//   HDRExposureClamp                            c86      1
//   GalaxySampler                               s0       1
//   PerlinNoiseSampler                          s1       1
//   HighDetailNoiseSampler                      s2       1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 8.2676609395e-44 // 59
    def c0, -0.5, 0, 1, 4000
    def c1, 2, 9.99999975e-006, 32, 0.600000024
    def c2, 12.5799999, -0.0625, 0.5, 0.25
    def c3, -11.6163721, 0.9375, 0.5, 0.349999994
    def c4, -2, 3, 4, 0.200000003
    dcl_texcoord_pp v0.xy
    dcl_2d s0
    dcl_2d s1
    dcl_2d s2
    add_pp r0.xy, c0.x, v0
    mad r0.zw, r0.xyxy, c1.x, c1.y
    add r0.xy, r0, r0
    dp2add r0.x, r0, r0, c0.y
    dp2add r0.y, r0.zwzw, r0.zwzw, c0.y
    rsq r0.y, r0.y
    mul r0.yz, r0.xzww, r0.y
    mul r0.yz, r0.x, r0
    rsq r0.x, r0.x
    rcp r0.x, r0.x
    add r0.x, -r0.x, c0.z
    mul r1.xyz, r0.yxzw, c0.w
    add r0.xyz, r1, c1.y
    nrm r1.xyz, r0
    mul_sat r0.x, r1.y, c70.x
    add r0.x, -r0.x, c0.z
    mul r0.x, r0.x, c80.x
    mad r0.y, r1.x, -c0.x, -c0.x
    mov r2.xyz, c69
    add r2.xyz, -r2, c67
    mad r0.yzw, r0.y, r2.xxyz, c69.xxyz
    mad_pp r0.xyz, r0.yzww, r0.x, c66
    dp3 r0.w, r1, c65
    mov r1.z, c4.z
    mad_sat_pp r1.x, r1.y, r1.z, -c75.x
    mov r2, c2
    mad r2, r0.w, r2, c3
    mul_pp r0.w, r0.w, r0.w
    mov_sat r2.xyz, r2
    mul r1.y, r2.y, r2.y
    mul r1.y, r2.y, r1.y
    pow r1.z, r2.x, c1.z
    mov r1.w, c1.w
    add_sat r1.w, r1.w, c65.w
    mad r1.y, r1.y, -r1.w, r1.z
    mad r1.y, r2.z, c83.x, r1.y
    mad_sat r1.z, r2.z, c64.y, c64.x
    mul_sat r1.y, r1.y, -c0.x
    mul r1.w, r1.z, r1.z
    mad r1.z, r1.z, c4.x, c4.y
    mul r1.z, r1.w, r1.z
    mul r1.z, r1.z, c64.z
    mad r1.y, r1.y, c4.z, r1.z
    mul r2.xyz, r1.y, c68
    add_sat r3.w, -r1.y, c0.z
    mul r1.yzw, r2_abs.xxyz, r2_abs.xxyz
    mad r3.xyz, r1.yzww, r1.yzww, r2
    mul_pp r3, r3, c85.x
    mul_sat_pp r0.xyz, r0, r3.w
    min_pp r1.yzw, c86.xxyz, r3.xxyz
    add_pp r0.xyz, r0, r1.yzww
    texld_pp r3, v0, s0
    mad_pp r0.xyz, r3, c82.y, r0
    mul r1.yz, c81.z, v0.xxyw
    texld r3, r1.yzzw, s2
    mul r1.y, r3.x, c81.w
    texld_pp r3, v0, s1
    mad_pp r1.y, r1.y, c4.w, r3.x
    mov r2.x, c73.x
    mad r1.y, r2.x, r1.y, -c74.x
    mul_sat_pp r1.y, r1.y, c78.x
    add r1.z, -r1.y, c0.z
    texld_pp r4, v0, s2
    add_pp r1.w, r4.x, c0.x
    mad_pp r2.y, r1.w, c81.w, r3.x
    mad_sat_pp r2.x, r2.x, r2.y, -c74.x
    pow r3.x, r2.x, c81.x
    mul_sat r2.x, r2.x, c81.y
    mul_pp r2.y, r3.x, r2.x
    mad r2.x, r3.x, -r2.x, c0.z
    mul r1.z, r1.z, r2.y
    mad_sat r2.z, r1.w, c4.w, r3.z
    mul_pp r1.w, r1.w, c81.w
    mad_pp r1.w, r1.w, c76.y, r3.y
    mad_sat r1.w, c76.z, r1.w, -c76.x
    mul_pp r1.w, r1.w, v0.x
    mul_pp r1.w, r2.x, r1.w
    mad_pp r1.z, r1.z, r2.z, r2.z
    mul_pp r1.z, r2.w, r1.z
    mad r2.z, r1.y, c0.x, r2.x
    mad_pp r2.x, r2.x, r1.w, r2.y
    mul_pp r1.x, r1.x, r2.x
    max r3.x, r2.z, c0.y
    mul r0.w, r0.w, r3.x
    mov r2.z, c0.z
    mad_pp r0.w, r0.w, c79.x, r2.z
    mad r2.xyz, r0.w, c71, -r1.y
    mad_pp r2.xyz, c72, r1.z, r2
    lrp_pp r3.xyz, r1.w, c77, r2
    lrp_pp r2.xyz, r1.x, r3, r0
    mul_pp r0.xyz, r2, c84.x
    min_pp oC0.xyz, r0, c86
    mov oC0.w, c0.z

// approximately 101 instruction slots used (4 texture, 97 arithmetic)
