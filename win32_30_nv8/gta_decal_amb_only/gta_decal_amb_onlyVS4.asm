//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   float4 gDayNightEffects;
//   row_major float4x4 gWorld;
//   row_major float4x4 gWorldViewProj;
//   float3 globalAnimUV0;
//   float3 globalAnimUV1;
//   float4 globalScalars;
//   float4 globalScalars2;
//
//
// Registers:
//
//   Name             Reg   Size
//   ---------------- ----- ----
//   gWorld           c0       4
//   gWorldViewProj   c8       4
//   globalScalars    c39      1
//   globalScalars2   c40      1
//   gDayNightEffects c45      1
//   globalAnimUV0    c208     1
//   globalAnimUV1    c209     1
//

    vs_3_0
    def c230, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 2.8936813288e-42 // 2065
    def c4, 9.99999975e-006, 1, 0, -1
    dcl_position v0
    dcl_color v1
    dcl_texcoord v2
    dcl_normal v3
    dcl_position o0
    dcl_texcoord9 o10
    dcl_texcoord o1.xy
    dcl_texcoord1 o2
    dcl_color o3
    dcl_texcoord6 o4
    mul r0.xyz, c1, v0.y
    mad r0.xyz, v0.x, c0, r0
    mad r0.xyz, v0.z, c2, r0
    add o4.xyz, r0, c3
    mul r0.xyz, c1, v3.y
    mad r0.xyz, v3.x, c0, r0
    mad r0.xyz, v3.z, c2, r0
    add r0.xyz, r0, c4.x
    dp3 r0.w, r0, r0
    rsq r0.w, r0.w
    mul o2.xyz, r0, r0.w
    mad r0.xyz, v2.xyxw, c4.yyzw, c4.zzyw
    dp3 o1.x, c208, r0
    dp3 o1.y, c209, r0
    mul r0.xy, c45, v1
    add r0.x, r0.y, r0.x
    mov r0.yw, c4
    mad r0.x, r0.x, c39.z, r0.w
    mad o3.xy, c40.z, r0.x, r0.y
    mul r0, c9, v0.y
    mad r0, v0.x, c8, r0
    mad r0, v0.z, c10, r0
    add r0, r0, c11
    mov o0, r0
    mov o10.zw, r0
    mov o2.w, r0.w
    mov o3.zw, v1
    mov o4.w, c4.y
    mov r20.x, c8.w
    add r20.x, r20.x, c9.w
    add r20.x, r20.x, c10.w
    add o10.y, r20.x, c11.w
    
// approximately 27 instruction slots used
