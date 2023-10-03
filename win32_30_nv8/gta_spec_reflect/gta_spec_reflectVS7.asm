//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   row_major float4x4 gShadowMatrix;
//   row_major float4x4 gWorld;
//
//
// Registers:
//
//   Name          Reg   Size
//   ------------- ----- ----
//   gWorld        c0       4
//   gShadowMatrix c60      4
//

    vs_3_0
    def c230, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 3.6279617241e-42 // 2589
    def c4, 1, 0, 0, 0
    dcl_position v0
    dcl_texcoord v1
    dcl_position o0
    dcl_texcoord o1.xyz
    mul r0.xyz, c1, v0.y
    mad r0.xyz, v0.x, c0, r0
    mad r0.xyz, v0.z, c2, r0
    add r0.xyz, r0, c3
    mul r1, r0.y, c61
    mad r1, r0.x, c60, r1
    mad r0, r0.z, c62, r1
    add r0, r0, c63
    min r0.z, r0.z, c4.x
    add o0.z, -r0.z, c4.x
    mad o0.xyw, r0.xyzx, c4.xxzy, c4.yyzx
    mov o1.x, r0.w
    mov o1.yz, v1.xxyw

// approximately 13 instruction slots used
