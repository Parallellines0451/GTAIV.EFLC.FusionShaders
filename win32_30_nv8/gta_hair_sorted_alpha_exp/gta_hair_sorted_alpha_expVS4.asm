//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   float4x3 gBoneMtx[48];
//   row_major float4x4 gWorld;
//   row_major float4x4 gWorldViewProj;
//   float4 globalScalars;
//   float4 globalScalars2;
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   gWorld         c0       4
//   gWorldViewProj c8       4
//   globalScalars  c39      1
//   globalScalars2 c40      1
//   gBoneMtx       c64    144
//

    vs_3_0
    def c230, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 3.1515202463e-42 // 2249
    def c0, 765.005859, 1, 0, -1
    dcl_position v0
    dcl_blendweight v1
    dcl_blendindices v2
    dcl_texcoord v3
    dcl_normal v4
    dcl_tangent v5
    dcl_color v6
    dcl_position o0
    dcl_texcoord9 o10 // LogDepth Interpolator
    dcl_texcoord o1.xy
    dcl_texcoord1 o2
    dcl_texcoord4 o3.xyz
    dcl_texcoord5 o4.xyz
    dcl_color o5
    dcl_texcoord7 o6
    dcl_texcoord6 o7.x
    mul r0, c0.x, v2
    mova a0, r0
    mul r0, v1.y, c64[a0.y]
    mad r0, c64[a0.x], v1.x, r0
    mad r0, c64[a0.z], v1.z, r0
    mad r0, c64[a0.w], v1.w, r0
    dp3 r1.x, v4, r0
    mul r2, v1.y, c65[a0.y]
    mad r2, c65[a0.x], v1.x, r2
    mad r2, c65[a0.z], v1.z, r2
    mad r2, c65[a0.w], v1.w, r2
    dp3 r1.y, v4, r2
    mul r3, v1.y, c66[a0.y]
    mad r3, c66[a0.x], v1.x, r3
    mad r3, c66[a0.z], v1.z, r3
    mad r3, c66[a0.w], v1.w, r3
    dp3 r1.z, v4, r3
    dp3 r4.x, v5, r0
    dp3 r4.y, v5, r2
    dp3 r4.z, v5, r3
    mul r5.xyz, r1.yzxw, r4.zxyw
    mad r5.xyz, r4.yzxw, r1.zxyw, -r5
    mov o2.xyz, r1
    mov o3.xyz, r4
    mul o4.xyz, r5, v5.w
    mad r1, v0.xyzx, c0.yyyz, c0.zzzy
    dp4 r0.x, r1, r0
    dp4 r0.y, r1, r2
    dp4 r0.z, r1, r3
    add o6.xyz, r0, c3
    mul r1, r0.y, c9
    mad r1, r0.x, c8, r1
    mad r0, r0.z, c10, r1
    add r0, r0, c11
    mul o5.y, c40.w, v6.y
    mul r1.x, c40.y, c40.z
    mov r1.w, c0.w
    mad r1.y, v6.x, c39.z, r1.w
    mad o5.x, r1.x, r1.y, c0.y
    mov o0, r0
    mov o10.zw, r0
    mov o2.w, r0.w
    mov o1.xy, v3
    mov o5.zw, v6
    mov o6.w, c0.y
    mov o7.x, c0.z
    dp3 o10.xy, c10.xyw, c10.xyw

// approximately 45 instruction slots used
