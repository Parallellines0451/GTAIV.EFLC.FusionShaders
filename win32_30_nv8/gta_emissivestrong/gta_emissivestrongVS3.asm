//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   float4x3 gBoneMtx[48];
//   row_major float4x4 gWorldViewProj;
//   float3 globalAnimUV0;
//   float3 globalAnimUV1;
//   float4 globalScreenSize;
//   float zShift;
//
//
// Registers:
//
//   Name             Reg   Size
//   ---------------- ----- ----
//   gWorldViewProj   c8       4
//   globalScreenSize c44      1
//   gBoneMtx         c64    144
//   globalAnimUV0    c208     1
//   globalAnimUV1    c209     1
//   zShift           c210     1
//

    vs_3_0
    def c230, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 3.0141929968e-42 // 2151
    def c0, 765.005859, 1, 0, 0.5
    dcl_position v0
    dcl_blendweight v1
    dcl_blendindices v2
    dcl_texcoord v3
    dcl_color v4
    dcl_position o0
    dcl_texcoord9 o10
    dcl_texcoord o1.xy
    dcl_color o2
    mad r0.xyz, v3.xyxw, c0.yyzw, c0.zzyw
    dp3 o1.x, c208, r0
    dp3 o1.y, c209, r0
    mul r0, c0.x, v2
    mova a0, r0
    mul r0, v1.y, c65[a0.y]
    mad r0, c65[a0.x], v1.x, r0
    mad r0, c65[a0.z], v1.z, r0
    mad r0, c65[a0.w], v1.w, r0
    mad r1, v0.xyzx, c0.yyyz, c0.zzzy
    dp4 r0.x, r1, r0
    mul r0, r0.x, c9
    mul r2, v1.y, c64[a0.y]
    mad r2, c64[a0.x], v1.x, r2
    mad r2, c64[a0.z], v1.z, r2
    mad r2, c64[a0.w], v1.w, r2
    dp4 r2.x, r1, r2
    mad r0, r2.x, c8, r0
    mul r2, v1.y, c66[a0.y]
    mad r2, c66[a0.x], v1.x, r2
    mad r2, c66[a0.z], v1.z, r2
    mad r2, c66[a0.w], v1.w, r2
    dp4 r1.x, r1, r2
    mad r0, r1.x, c10, r0
    add r0, r0, c11
    mul r1.x, r0.w, c0.w
    mad o0.xy, c44.zwzw, r1.x, r0
    mov o10.x, c210.x
    add o0.z, r0.z, -c210.x
    add o10.z, r0.z, -c210.x
    mov o0.w, r0.w
    mov o10.w, r0.w
    mov o2, v4
    mov r20.x, c8.w
    add r20.x, r20.x, c9.w
    add r20.x, r20.x, c10.w
    add o10.y, r20.x, c11.w
    
// approximately 30 instruction slots used
