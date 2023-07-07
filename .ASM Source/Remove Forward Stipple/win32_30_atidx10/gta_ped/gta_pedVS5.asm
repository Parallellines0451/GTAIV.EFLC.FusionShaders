//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   float4 gBoneDamage0[14];
//   bool gBoneDamageEnabled;
//   float4x3 gBoneMtx[48];
//   row_major float4x4 gWorld;
//   row_major float4x4 gWorldViewProj;
//   float4 globalScalars;
//   float4 globalScalars2;
//
//
// Registers:
//
//   Name               Reg   Size
//   ------------------ ----- ----
//   gBoneDamageEnabled b11      1
//   gWorld             c0       4
//   gWorldViewProj     c8       4
//   globalScalars      c39      1
//   globalScalars2     c40      1
//   gBoneMtx           c64    144
//   gBoneDamage0       c208    14
//

    vs_3_0
    def c226, 765.005859, 63.7504883, 4, 0
    def c222, 1, 0, 0, 0
    def c223, 0, 1, 0, 0
    def c224, 0, 0, 1, 0
    def c225, 0, 0, 0, 1
    dcl_position v0
    dcl_blendweight v1
    dcl_blendindices v2
    dcl_texcoord v3
    dcl_normal v4
    dcl_tangent v5
    dcl_color v6
    dcl_position o0
    dcl_texcoord o1.xy
    dcl_texcoord1 o2
    dcl_texcoord4 o3.xyz
    dcl_texcoord5 o4.xyz
    dcl_color o5
    dcl_texcoord7 o6
    dcl_texcoord6 o7.x
    mul r0, v2, c226.x
    mova a0.w, r0.y
    mul r1, v1.y, c64[a0.w]
    mova a0.w, r0.y
    mul r2, v1.y, c65[a0.w]
    mova a0.w, r0.y
    mul r3, v1.y, c66[a0.w]
    mova a0.w, r0.x
    mad r1, c64[a0.w], v1.x, r1
    mova a0.w, r0.x
    mad r2, c65[a0.w], v1.x, r2
    mova a0.w, r0.x
    mad r3, c66[a0.w], v1.x, r3
    mova a0.w, r0.z
    mad r1, c64[a0.w], v1.z, r1
    mova a0.w, r0.z
    mad r2, c65[a0.w], v1.z, r2
    mova a0.w, r0.z
    mad r3, c66[a0.w], v1.z, r3
    mova a0.w, r0.w
    mad r1, c64[a0.w], v1.w, r1
    mova a0.w, r0.w
    mad r2, c65[a0.w], v1.w, r2
    mova a0.w, r0.w
    mad r0, c66[a0.w], v1.w, r3
    if b11
      mul r3, v2, c226.y
      frc r4, r3
      mul r5, r4, c226.z
      frc r6, r5
      add r5, r5, -r6
      add r3, r3, -r4
      mova a0.w, r3.x
      mov r4, c208[a0.w]
      mova a0.w, r5.x
      dp4 r4.x, r4, c222[a0.w]
      mova a0.w, r3.y
      mov r6, c208[a0.w]
      mova a0.w, r5.y
      dp4 r4.y, r6, c222[a0.w]
      mova a0.w, r3.z
      mov r6, c208[a0.w]
      mova a0.w, r5.z
      dp4 r4.z, r6, c222[a0.w]
      mova a0.w, r3.w
      mov r3, c208[a0.w]
      mova a0.w, r5.w
      dp4 r4.w, r3, c222[a0.w]
      dp4 o7.x, r4, v1
    else
      mov o7.x, c222.w
    endif
    mad r3, v0.xyzx, c222.xxxw, c222.yyzx
    dp4 r4.x, r3, r1
    dp4 r4.y, r3, r2
    dp4 r4.z, r3, r0
    dp3 r3.x, v4, r1
    dp3 r3.y, v4, r2
    dp3 r3.z, v4, r0
    dp3 r1.x, v5, r1
    dp3 r1.y, v5, r2
    dp3 r1.z, v5, r0
    mul r0.xyz, r3.yzxw, r1.zxyw
    mad r0.xyz, r1.yzxw, r3.zxyw, -r0
    mul o4.xyz, r0, v5.w
    mul r0, r4.y, c9
    mad r0, r4.x, c8, r0
    mad r0, r4.z, c10, r0
    add r0, r0, c11
    add o6.xyz, r4, c3
    mul o5.y, c40.w, v6.y
    mul r1.w, c40.y, c40.z
    mov r2.x, c222.x
    mad r2.x, v6.x, c39.z, -r2.x
    mad o5.x, r1.w, r2.x, c222.x
    mov o0, r0
    mov o1.xy, v3
    mov o2.w, r0.w
    mov o2.xyz, r3
    mov o3.xyz, r1
    mov o5.zw, v6
    mov o6.w, c222.x

// approximately 84 instruction slots used
