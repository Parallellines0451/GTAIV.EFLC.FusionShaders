//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   row_major float4x4 gViewInverse;
//   row_major float4x4 gWorld;
//   row_major float4x4 gWorldViewProj;
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   gWorld         c0       4
//   gWorldViewProj c8       4
//   gViewInverse   c12      4
//

    vs_3_0
    def c230, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 3.1571254401e-42 // 2253
    def c4, 9.99999975e-006, 0, 1, 0
    dcl_position v0
    dcl_color v1
    dcl_texcoord v2
    dcl_normal v3
    dcl_tangent v4
    dcl_position o0
    dcl_texcoord9 o10 // LogDepth Interpolator
    dcl_texcoord o1.xy
    dcl_texcoord1 o2
    dcl_texcoord3 o3.xyz
    dcl_texcoord4 o4.xyz
    dcl_texcoord5 o5.xyz
    dcl_color o6
    dcl_texcoord6 o7.x
    dcl_texcoord2 o8
    mul r0.xyz, c1, v0.y
    mad r0.xyz, v0.x, c0, r0
    mad r0.xyz, v0.z, c2, r0
    add r0.xyz, r0, c3
    add o3.xyz, -r0, c15
    mov o8.xyz, r0
    mul r0.xyz, c1, v3.y
    mad r0.xyz, v3.x, c0, r0
    mad r0.xyz, v3.z, c2, r0
    add r0.xyz, r0, c4.x
    nrm r1.xyz, r0
    mul r0.xyz, c1, v4.y
    mad r0.xyz, v4.x, c0, r0
    mad r0.xyz, v4.z, c2, r0
    add r0.xyz, r0, c4.x
    nrm r2.xyz, r0
    mul r0.xyz, r1.yzxw, r2.zxyw
    mad r0.xyz, r2.yzxw, r1.zxyw, -r0
    mov o2.xyz, r1
    mov o4.xyz, r2
    mul o5.xyz, r0, v4.w
    mul r0, c9, v0.y
    mad r0, v0.x, c8, r0
    mad r0, v0.z, c10, r0
    add r0, r0, c11
    mov o0, r0
    mov o10.zw, r0
    mov o2.w, r0.w
    mov o1.xy, v2
    mov o6, v1
    mov o7.x, c4.y
    mov o8.w, c4.z
    dp3 o10.xy, c10.xyw, c10.xyw

// approximately 35 instruction slots used
