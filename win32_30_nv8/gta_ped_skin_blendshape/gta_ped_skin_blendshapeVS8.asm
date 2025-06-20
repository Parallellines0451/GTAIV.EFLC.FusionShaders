//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
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
//

    vs_3_0
    def c230, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 3.4612072069e-42 // 2470
    def c4, 9.99999975e-006, 2, 1, -1
    def c5, 0, 0, 0, 0
    dcl_position v0
    dcl_color v1
    dcl_texcoord v2
    dcl_normal v3
    dcl_tangent v4
    dcl_position1 v5
    dcl_normal1 v6
    dcl_tangent1 v7
    dcl_position o0
    dcl_texcoord9 o10 // LogDepth Interpolator
    dcl_texcoord o1.xy
    dcl_texcoord1 o2
    dcl_texcoord4 o3.xyz
    dcl_texcoord5 o4.xyz
    dcl_color o5
    dcl_texcoord7 o6
    dcl_texcoord6 o7.x
    mov r0.xyz, v3
    add r0.xyz, r0, v6
    mul r1.xyz, r0.y, c1
    mad r0.xyw, r0.x, c0.xyzz, r1.xyzz
    mad r0.xyz, r0.z, c2, r0.xyww
    add r0.xyz, r0, c4.x
    nrm r1.xyz, r0
    mov r0, v4
    add r0, r0, v7
    mul r2.xyz, r0.y, c1
    mad r2.xyz, r0.x, c0, r2
    mad r0.xyz, r0.z, c2, r2
    add r0.xyz, r0, c4.x
    nrm r2.xyz, r0
    mul r0.xyz, r1.yzxw, r2.zxyw
    mad r0.xyz, r2.yzxw, r1.zxyw, -r0
    mov o2.xyz, r1
    mov o3.xyz, r2
    mul o4.xyz, r0.w, r0
    mov r0.xyz, v0
    add r0.xyz, r0, v5
    mul r1.xyz, r0.y, c1
    mad r1.xyz, r0.x, c0, r1
    mad r1.xyz, r0.z, c2, r1
    mov r2.yw, c4
    mad o6.xyz, c3, r2.y, r1
    mad o5.z, v1.y, -v1.x, c4.z
    mul o5.y, c40.w, v1.y
    mul r0.w, c40.y, c40.z
    mad r1.x, v1.x, c39.z, r2.w
    mad o5.x, r0.w, r1.x, c4.z
    mul r1, r0.y, c9
    mad r1, r0.x, c8, r1
    mad r0, r0.z, c10, r1
    add r0, r0, c11
    mov o0, r0
    mov o10.zw, r0
    mov o2.w, r0.w
    mov o1.xy, v2
    mov o5.w, v1.w
    mov o6.w, c4.z
    mov o7.x, c5.x
    dp3 o10.xy, c10.xyw, c10.xyw

// approximately 45 instruction slots used
