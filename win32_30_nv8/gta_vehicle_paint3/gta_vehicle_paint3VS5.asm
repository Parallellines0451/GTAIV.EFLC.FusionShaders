//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   float BoundRadius;
//   sampler2D DamageSampler;
//   row_major float4x4 gShadowMatrix;
//   row_major float4x4 gWorld;
//   bool switchOn;
//
//
// Registers:
//
//   Name          Reg   Size
//   ------------- ----- ----
//   switchOn      b8       1
//   gWorld        c0       4
//   gShadowMatrix c60      4
//   BoundRadius   c208     1
//   DamageSampler s0       1
//

    vs_3_0
    def c230, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 3.8157357184e-42 // 2723
    def c4, 9.99999975e-006, 1, 0.5, 126.732674
    def c5, 0, 0.00789062493, 1.52587891e-005, 65536
    def c6, 0.00390625, 256, -128, 0.0078125
    def c7, 1, 0, 0, 0
    dcl_position v0
    dcl_2d s0
    dcl_position o0
    dcl_texcoord o1.x
    if b8
      dp3 r0.x, v0, v0
      rsq r0.x, r0.x
      rcp r0.x, r0.x
      add r0.y, r0.x, c4.x
      rcp r0.y, r0.y
      mad r0.z, v0.z, -r0.y, c4.y
      mul r0.z, r0.z, c4.z
      mad r0.yw, v0.xxzy, r0.y, c4.x
      mul r1.xy, r0.ywzw, r0.ywzw
      add r1.x, r1.y, r1.x
      rsq r1.x, r1.x
      mul r0.yw, r0, r1.x
      mul r0.yz, r0.z, r0.xyww
      mad r1.xy, r0.yzzw, c4.z, c4.z
      mul r0.yz, r1.xxyw, c4.w
      frc r2.xy, r0_abs.yzzw
      sge r0.yz, r0, -r0
      lrp r3.xy, r0.yzzw, r2, -r2
      mov r1.zw, c5.x
      texldl r2, r1, s0
      mad r0.yz, r3.xxyw, -c5.y, r1.xxyw
      add r1.xy, r0.yzzw, c5.yxzw
      mov r1.zw, c5.x
      texldl r1, r1, s0
      add r4.xy, r0.yzzw, c5
      mov r4.zw, c5.x
      texldl r4, r4, s0
      add r5.xy, r0.yzzw, c5.y
      mov r5.zw, c5.x
      texldl r5, r5, s0
      mul r0.y, r2.x, c5.z
      frc r0.z, r0.y
      add r0.w, r0.y, -r0.z
      slt r0.y, r0.y, -r0.y
      slt r0.z, -r0.z, r0.z
      mad r6.z, r0.y, r0.z, r0.w
      mad r0.y, r6.z, -c5.w, r2.x
      mul r0.z, r0.y, c6.x
      frc r0.w, r0.z
      add r1.y, r0.z, -r0.w
      slt r0.z, r0.z, -r0.z
      slt r0.w, -r0.w, r0.w
      mad r6.y, r0.z, r0.w, r1.y
      mad r6.x, r6.y, -c6.y, r0.y
      mul r0.y, r1.x, c5.z
      frc r0.z, r0.y
      add r0.w, r0.y, -r0.z
      slt r0.y, r0.y, -r0.y
      slt r0.z, -r0.z, r0.z
      mad r2.z, r0.y, r0.z, r0.w
      mad r0.y, r2.z, -c5.w, r1.x
      mul r0.z, r0.y, c6.x
      frc r0.w, r0.z
      add r1.x, r0.z, -r0.w
      slt r0.z, r0.z, -r0.z
      slt r0.w, -r0.w, r0.w
      mad r2.y, r0.z, r0.w, r1.x
      mad r2.x, r2.y, -c6.y, r0.y
      mul r0.y, r4.x, c5.z
      frc r0.z, r0.y
      add r0.w, r0.y, -r0.z
      slt r0.y, r0.y, -r0.y
      slt r0.z, -r0.z, r0.z
      mad r1.z, r0.y, r0.z, r0.w
      mad r0.y, r1.z, -c5.w, r4.x
      mul r0.z, r0.y, c6.x
      frc r0.w, r0.z
      add r1.w, r0.z, -r0.w
      slt r0.z, r0.z, -r0.z
      slt r0.w, -r0.w, r0.w
      mad r1.y, r0.z, r0.w, r1.w
      mad r1.x, r1.y, -c6.y, r0.y
      mul r0.y, r5.x, c5.z
      frc r0.z, r0.y
      add r0.w, r0.y, -r0.z
      slt r0.y, r0.y, -r0.y
      slt r0.z, -r0.z, r0.z
      mad r4.z, r0.y, r0.z, r0.w
      mad r0.y, r4.z, -c5.w, r5.x
      mul r0.z, r0.y, c6.x
      frc r0.w, r0.z
      add r1.w, r0.z, -r0.w
      slt r0.z, r0.z, -r0.z
      slt r0.w, -r0.w, r0.w
      mad r4.y, r0.z, r0.w, r1.w
      mad r4.x, r4.y, -c6.y, r0.y
      add r0.yz, -r3.xxyw, c4.y
      mul r5.xyz, r6, r0.y
      mul r2.xyz, r3.x, r2
      mul r2.xyz, r0.z, r2
      mad r2.xyz, r5, r0.z, r2
      mul r0.yzw, r1.xxyz, r0.y
      mad r0.yzw, r0, r3.y, r2.xxyz
      mul r1.xyz, r3.x, r4
      mad r0.yzw, r1.xxyz, r3.y, r0
      add r0.yzw, r0, c6.z
      mul r0.yzw, r0, c6.w
      rcp r1.x, c208.x
      mul r0.x, r0.x, r1.x
      min r0.x, r0.x, c4.y
      mul r0.xyz, r0.yzww, r0.x
      mad r0.xyz, r0, c4.z, v0
    else
      mov r0.xyz, v0
    endif
    mul r1.xyz, r0.y, c1
    mad r0.xyw, r0.x, c0.xyzz, r1.xyzz
    mad r0.xyz, r0.z, c2, r0.xyww
    add r0.xyz, r0, c3
    mul r1, r0.y, c61
    mad r1, r0.x, c60, r1
    mad r0, r0.z, c62, r1
    add r0, r0, c63
    min r0.z, r0.z, c4.y
    add o0.z, -r0.z, c4.y
    mad o0.xyw, r0.xyzx, c7.xxzy, c7.yyzx
    mov o1.x, r0.w

// approximately 124 instruction slots used (8 texture, 116 arithmetic)
