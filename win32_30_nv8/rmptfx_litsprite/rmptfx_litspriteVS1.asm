//
// Generated by Microsoft (R) HLSL Shader Compiler 9.29.952.3111
//
// Parameters:
//
//   float Billboard;
//   float3 LightDir;
//   float4 gAspectRatio;
//   float gBiasToCamera;
//   row_major float4x4 gViewInverse;
//   row_major float4x4 gWorldView;
//   row_major float4x4 gWorldViewProj;
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   gWorldView     c4       3
//   gWorldViewProj c8       4
//   gViewInverse   c12      4
//   gAspectRatio   c48      1
//   gBiasToCamera  c64      1
//   Billboard      c65      1
//   LightDir       c66      1
//

    vs_3_0
    def c230, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 3.9586681617e-42 // 2825
    def c0, 0.100000001, 0.159154937, -0.159154937, 0.5
    def c1, 6.28318548, -3.14159274, 0, 1
    dcl_position v0
    dcl_normal v1
    dcl_color v2
    dcl_texcoord v3
    dcl_texcoord1 v4
    dcl_texcoord2 v5
    dcl_texcoord3 v6
    dcl_texcoord4 v7
    dcl_color o0
    dcl_position o1
    dcl_texcoord9 o10
    dcl_texcoord o2
    dcl_texcoord1 o3
    dcl_texcoord2 o4
    dcl_texcoord3 o5
    dcl_texcoord4 o6
    dcl_texcoord5 o7.xyz
    mad r0.xy, v1.z, c0.yzzw, c0.w
    frc r0.xy, r0
    mad r0.xy, r0, c1.x, c1.y
    sincos r1.xy, r0.y
    sincos r2.xy, r0.x
    nrm r0.xyz, c66
    mul r3.xyz, -r0.y, c5
    mad r0.xyw, -r0.x, c4.xyzz, r3.xyzz
    mad r0.xyz, -r0.z, c6, r0.xyww
    mul r1.yzw, r1.xyyx, r0.xyxy
    mad r1.x, r0.x, r1.x, -r1.y
    add r1.y, r1.w, r1.z
    add r1.xy, -r0, r1
    slt r0.w, -v1_abs.z, v1_abs.z
    mad o7.xy, r0.w, r1, r0
    mov o7.z, r0.z
    mul r0.xyz, r2.yyxw, v1.yxyw
    mad r1.x, v1.x, r2.x, -r0.x
    add r1.y, r0.z, r0.y
    mul r0.xy, r1, c48
    abs r0.z, c65.x
    slt r0.z, -r0.z, r0.z
    mul r0.xy, r0, r0.z
    mov r1.x, c0.x
    mul r1.x, r1.x, c64.x
    lrp r2.xyz, r1.x, c15, v0
    mul r1, r2.y, c9
    mad r1, r2.x, c8, r1
    mad r1, r2.z, c10, r1
    add r1, r1, c11
    mov r0.zw, c1.z
    add r0, r0, r1
    rcp r1.x, r0.w
    mul o4.zw, r0.xyxy, r1.x
    mov o1, r0
	mov o10.zw, r0
    mov o0, v2
    mov o2, v3
    mov o3, v4
    mul o4.xy, c1.wzzw, v5.z
    mov o5, v6
    mov o6, v7
    mov r20.x, c8.w
    add r20.x, r20.x, c9.w
    add r20.x, r20.x, c10.w
    add o10.y, r20.x, c11.w
    
// approximately 57 instruction slots used
