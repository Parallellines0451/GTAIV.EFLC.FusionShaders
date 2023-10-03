//
// Generated by Microsoft (R) HLSL Shader Compiler 9.29.952.3111
//
// Parameters:
//
//   float3 AzimuthColor;
//   float3 AzimuthColorEast;
//   float AzimuthHeight;
//   float AzimuthStrength;
//   float CloudShadowOffset;
//   float4 CloudThicknessEdgeSmoothDetailScaleStrength;
//   float2 DetailOffset;
//   float2 GalaxyOffset;
//   float3 SkyColor;
//   float StarFieldUVRepeat;
//   float4 SunDirection;
//   float4 TopCloudBiasDetailThresholdHeight;
//   float dpMapFarClip;
//   row_major float4x4 gWorld;
//   row_major float4x4 gWorldViewProj;
//
//
// Registers:
//
//   Name                                        Reg   Size
//   ------------------------------------------- ----- ----
//   gWorld                                      c0       4
//   gWorldViewProj                              c8       4
//   SunDirection                                c64      1
//   SkyColor                                    c65      1
//   AzimuthColor                                c66      1
//   AzimuthColorEast                            c67      1
//   AzimuthHeight                               c68      1
//   TopCloudBiasDetailThresholdHeight           c69      1
//   CloudShadowOffset                           c70      1
//   AzimuthStrength                             c71      1
//   CloudThicknessEdgeSmoothDetailScaleStrength c72      1
//   StarFieldUVRepeat                           c73      1
//   GalaxyOffset                                c74      1
//   DetailOffset                                c75      1
//   dpMapFarClip                                c76      1
//

    vs_3_0
    def c230, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 3.9096227155e-42 // 2790
    def c4, 1, 0.5, 1.5, -0.212114394
    def c5, -0.0187292993, 0.0742610022, 1.57072878, 1.57079637
    def c6, -2, 3.14159274, 0.317732662, 0.100000001
    def c7, 2, -1, -0.5, -0
    dcl_position v0
    dcl_texcoord v1
    dcl_position o0
    dcl_texcoord9 o10
    dcl_texcoord o1.xyz
    dcl_texcoord1 o2.xyz
    dcl_texcoord2 o3
    dcl_texcoord3 o4
    dcl_texcoord4 o5.xyz
    dcl_texcoord5 o6.xyz
    mul r0.xyz, c1, v0.y
    mad r0.xyz, v0.x, c0, r0
    mad r0.xyz, v0.z, c2, r0
    mad r0.xyz, v0.w, c3, r0
    add r0.xyz, r0, -c3
    dp3 r0.w, r0, r0
    rsq r0.w, r0.w
    mul r1.xyz, r0.w, r0
    mad r2.xy, r0.xzzw, -r0.w, c64.xzzw
    mov o2.xyz, r0
    mad r1.w, r1.y, c4.z, c4.y
    dp3 r0.x, r1.xzww, r1.xzww
    rsq r0.x, r0.x
    mul r0.xy, r0.x, r1.xzzw
    mad r0.zw, r0_abs.xyxy, c5.x, c5.y
    mad r0.zw, r0, r0_abs.xyxy, c4.w
    mad r0.zw, r0, r0_abs.xyxy, c5.z
    add r1.zw, -r0_abs.xyxy, c4.x
    slt r0.xy, r0, -r0
    rsq r1.z, r1.z
    rsq r1.w, r1.w
    rcp r1.w, r1.w
    rcp r1.z, r1.z
    mul r0.zw, r0, r1
    mad r1.z, r0.z, c6.x, c6.y
    mad r0.x, r1.z, r0.x, r0.z
    add r0.x, -r0.x, c5.w
    mov r1.zw, c6
    mad r2.z, r0.x, r1.z, c74.x
    mad r0.x, r0.w, c6.x, c6.y
    mad r0.x, r0.x, r0.y, r0.w
    add r0.x, -r0.x, c5.w
    mad r2.w, r0.x, r1.z, c74.y
    add r0.xy, r2.zwzw, c4.y
    mul o4.xy, r0, c73.x
    mov o4.zw, r0.xyxy
    mul r0.x, r1.w, c70.x
    mul r0.xy, r2, r0.x
    mad r0.zw, v1.xyxy, c7.x, c7.y
    mul r0.zw, r0, r0
    add r0.z, r0.w, r0.z
    add r0.z, -r0.z, c4.x
    mad o3.xy, r0, r0.z, v1
    add r0.xy, -c4.y, v1
    mul r0.zw, r0.xyxy, r0.xyxy
    add r0.z, r0.w, r0.z
    rsq r0.w, r0.z
    mul r1.zw, r0.w, r0.xyxy
    sge r0.w, -r0.z, r0.z
    mad r1.zw, r0.w, -r1, r1
    mul r0.zw, r0.z, r1
    mov r1.z, c72.z
    mad o3.zw, r0, r1.z, c75.xyxy
    mul r0.zw, r0.xyxy, c69.w
    mov r2.y, c4.y
    mad o5.xy, r0, c69.w, r2.y
    mul r0.xy, r0.zwzw, r0.zwzw
    add r0.x, r0.y, r0.x
    rsq r0.x, r0.x
    rcp r0.x, r0.x
    add o5.z, -r0.x, c4.x
    mul r0, c9, v0.y
    mad r0, v0.x, c8, r0
    mad r0, v0.z, c10, r0
    add r0, r0, c11
    rcp r1.z, c76.x
    mad o1.z, r0.z, -r1.z, c4.x
    mul r1.z, r0.z, r1.z
    mov o0.z, r1.z
	mov o10.z, r1.z
    mul_sat r1.y, r1.y, c68.x
    mad r1.x, r1.x, c4.y, c4.y
    add r1.y, -r1.y, c4.x
    mul r1.y, r1.y, c71.x
    mov r2.xyz, c67
    add r2.xyz, -r2, c66
    mad r1.xzw, r1.x, r2.xyyz, c67.xyyz
    mad o6.xyz, r1.xzww, r1.y, c65
    rcp r0.w, r0_abs.w
    mul r0.xyz, r0.w, r0
    dp3 r0.w, r0, r0
    rsq r0.w, r0.w
    mad r0.z, r0.z, r0.w, c4.x
    mul r0.xy, r0.w, r0
    rcp r0.z, r0.z
    mul r0.xyz, r0.z, r0.xyxw
    mad o0.xyw, r0.xyzz, -c7.zyzw, -c7.zwzy
	mad o10.w, r0.xyzz, -c7.zyzw, -c7.zwzy
    mov o1.xy, v1
    mov r20.x, c8.w
    add r20.x, r20.x, c9.w
    add r20.x, r20.x, c10.w
    add o10.y, r20.x, c11.w
    
// approximately 87 instruction slots used
