//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   float4 gDayNightEffects;
//   row_major float4x4 gViewInverse;
//   row_major float4x4 gWorld;
//   row_major float4x4 gWorldViewProj;
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
//

    vs_3_0
    def c230, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 3.9376486848e-42 // 2810
    def c4, 9.99999975e-006, -1, 1, 0
    dcl_position v0
    dcl_texcoord v1
    dcl_normal v2
    dcl_texcoord1 v3
    dcl_texcoord2 v4
    dcl_texcoord3 v5
    dcl_texcoord4 v6
    dcl_position o0
    dcl_texcoord9 o10 // LogDepth Interpolator
    dcl_texcoord o1.xy
    dcl_texcoord1 o2
    dcl_texcoord3 o3.xyz
    dcl_color o4
    dcl_texcoord6 o5
    mov r0.xyz, v0
    mul r1.xyz, r0.y, v4
    mad r0.xyw, r0.x, v3.xyzz, r1.xyzz
    mad r0.xyz, r0.z, v5, r0.xyww
    add r0.xyz, r0, v6
    mul r1.xyz, r0.y, c1
    mad r1.xyz, r0.x, c0, r1
    mad r1.xyz, r0.z, c2, r1
    add r1.xyz, r1, c3
    add o3.xyz, -r1, c15
    mov o5.xyz, r1
    mul r1.xyz, c1, v2.y
    mad r1.xyz, v2.x, c0, r1
    mad r1.xyz, v2.z, c2, r1
    add r1.xyz, r1, c4.x
    dp3 r0.w, r1, r1
    rsq r0.w, r0.w
    mul o2.xyz, r1, r0.w
    mul r0.w, c45.y, v4.w
    mad r0.w, v3.w, c45.x, r0.w
    mov r1.yz, c4
    mad r0.w, r0.w, c39.z, r1.y
    mad o4.xy, c40.z, r0.w, r1.z
    mul r1, r0.y, c9
    mad r1, r0.x, c8, r1
    mad r0, r0.z, c10, r1
    add r0, r0, c11
    mov o0, r0
    mov o10.zw, r0
    mov o2.w, r0.w
    mov o1.xy, v1
    mov o4.z, v5.w
    mov o4.w, v6.w
    mov o5.w, c4.z
    dp3 o10.xy, c10.xyw, c10.xyw

// approximately 33 instruction slots used
