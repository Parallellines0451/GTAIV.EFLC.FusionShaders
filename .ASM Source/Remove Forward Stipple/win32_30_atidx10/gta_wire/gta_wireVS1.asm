//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   float4x3 gBoneMtx[48];
//   float4 gDayNightEffects;
//   row_major float4x4 gViewInverse;
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
//   gViewInverse     c12      4
//   globalScalars    c39      1
//   globalScalars2   c40      1
//   gDayNightEffects c45      1
//   gBoneMtx         c64    144
//   globalAnimUV0    c208     1
//   globalAnimUV1    c209     1
//

    vs_3_0
    def c0, 765.005859, 1, 0, -0.00200000009
    dcl_position v0
    dcl_blendweight v1
    dcl_blendindices v2
    dcl_texcoord v3
    dcl_normal v4
    dcl_color v5
    dcl_position o0
    dcl_texcoord o1.xy
    dcl_texcoord1 o2
    dcl_color o3
    dcl_texcoord6 o4
    dcl_texcoord8 o5
    dcl_texcoord7 o6
    mul r0, c0.x, v2
    mova a0, r0
    mul r0, v1.y, c64[a0.y]
    mad r0, c64[a0.x], v1.x, r0
    mad r0, c64[a0.z], v1.z, r0
    mad r0, c64[a0.w], v1.w, r0
    dp3 o2.x, v4, r0
    mul r1, v1.y, c65[a0.y]
    mad r1, c65[a0.x], v1.x, r1
    mad r1, c65[a0.z], v1.z, r1
    mad r1, c65[a0.w], v1.w, r1
    dp3 o2.y, v4, r1
    mul r2, v1.y, c66[a0.y]
    mad r2, c66[a0.x], v1.x, r2
    mad r2, c66[a0.z], v1.z, r2
    mad r2, c66[a0.w], v1.w, r2
    dp3 o2.z, v4, r2
    mad r3.xyz, v3.xyxw, c0.yyzw, c0.zzyw
    dp3 o1.x, c208, r3
    dp3 o1.y, c209, r3
    mad r3, v0.xyzx, c0.yyyz, c0.zzzy
    dp4 r0.x, r3, r0
    dp4 r0.y, r3, r1
    dp4 r0.z, r3, r2
    add o4.xyz, r0, c3
    add r1.xyz, r0, -c15
    mul r2, r0.y, c9
    mad r2, r0.x, c8, r2
    mad r0, r0.z, c10, r2
    add r0, r0, c11
    dp3 r1.x, r1, r1
    rsq r1.x, r1.x
    rcp r1.x, r1.x
    mov r2.xyz, v4
    add r1.yzw, r2.xxyz, v0.xxyz
    mul r2.xy, r1.z, c9
    mad r1.yz, r1.y, c8.xxyw, r2.xxyw
    mad r1.yz, r1.w, c10.xxyw, r1
    add r1.yz, r1, c11.xxyw
    add r1.yz, r0.xxyw, -r1
    mul r1.yz, r1, c0.w
    mad o0.xy, r1.yzzw, r1.x, r0
    mul r0.xy, c45, v5
    add r0.x, r0.y, r0.x
    mov r0.y, c0.y
    mad r0.x, r0.x, c39.z, -r0.y
    mad o3.xy, c40.z, r0.x, r0.y
    mov o0.zw, r0
    mov o2.w, r0.w
    mov o3.zw, v5
    mov o4.w, c0.y
    mov o5, c0.z
    mov o6, c0.z

// approximately 53 instruction slots used
