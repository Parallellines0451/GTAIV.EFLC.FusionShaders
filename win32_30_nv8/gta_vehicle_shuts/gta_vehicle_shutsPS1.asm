//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   float BoundRadius;
//   sampler2D DamageSampler;
//   sampler2D DamageVertBuffer;
//   bool switchOn;
//
//
// Registers:
//
//   Name             Reg   Size
//   ---------------- ----- ----
//   switchOn         b8       1
//   BoundRadius      c66      1
//   DamageSampler    s0       1
//   DamageVertBuffer s1       1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 1.0243491774e-42 // 731
    def c0, 1, 0.5, 9.99999975e-006, 0
    def c1, 126.732674, 0.00789062493, 0, 1.52587891e-005
    def c2, 65536, 0.00390625, 256, -128
    def c3, 0.0078125, -0.0078125, 0, 9.99999994e-009
    def c4, -0.5, -0.492109388, 2, 1
    dcl_texcoord v0.xy
    dcl_2d s0
    dcl_2d s1
    texld r0, v0, s1
    if b8
      dp3 r1.x, r0, r0
      rsq r1.x, r1.x
      rcp r1.y, r1.x
      mad r1.z, r0.z, -r1.x, c0.x
      mul r1.z, r1.z, c0.y
      mad r1.xw, r0.xyzy, r1.x, c0.z
      dp2add r2.x, r1.xwzw, r1.xwzw, c0.w
      rsq r2.x, r2.x
      mul r1.xw, r1, r2.x
      mul r1.xz, r1.z, r1.xyww
      mad r2.xy, r1.xzzw, c0.y, c0.y
      mul r1.xz, r2.xyyw, c1.x
      frc r1.xz, r1_abs
      cmp r1.xz, r2.xyyw, r1, -r1
      mov r2.zw, c0.w
      texldl r3, r2, s0
      mad r2.xy, r1.xzzw, -c1.y, r2
      add r4.xy, r2, c1.yzzw
      mov r4.zw, c0.w
      texldl r4, r4, s0
      add r5.xy, r2, c1.zyzw
      mov r5.zw, c0.w
      texldl r5, r5, s0
      add r2.xy, r2, c1.y
      mov r2.zw, c0.w
      texldl r2, r2, s0
      mul r1.w, r3.x, c1.w
      frc r2.y, r1.w
      add r1.w, r1.w, -r2.y
      cmp r2.y, -r2.y, c0.w, c0.x
      cmp r2.y, r3.x, c0.w, r2.y
      add r6.z, r1.w, r2.y
      mad r1.w, r6.z, -c2.x, r3.x
      mul r2.y, r1.w, c2.y
      frc r2.z, r2.y
      add r2.y, r2.y, -r2.z
      cmp r2.z, -r2.z, c0.w, c0.x
      cmp r2.z, r1.w, c0.w, r2.z
      add r6.y, r2.y, r2.z
      mad r6.x, r6.y, -c2.z, r1.w
      mul r1.w, r4.x, c1.w
      frc r2.y, r1.w
      add r1.w, r1.w, -r2.y
      cmp r2.y, -r2.y, c0.w, c0.x
      cmp r2.y, r4.x, c0.w, r2.y
      add r3.z, r1.w, r2.y
      mad r1.w, r3.z, -c2.x, r4.x
      mul r2.y, r1.w, c2.y
      frc r2.z, r2.y
      add r2.y, r2.y, -r2.z
      cmp r2.z, -r2.z, c0.w, c0.x
      cmp r2.z, r1.w, c0.w, r2.z
      add r3.y, r2.y, r2.z
      mad r3.x, r3.y, -c2.z, r1.w
      mul r1.w, r5.x, c1.w
      frc r2.y, r1.w
      add r1.w, r1.w, -r2.y
      cmp r2.y, -r2.y, c0.w, c0.x
      cmp r2.y, r5.x, c0.w, r2.y
      add r4.z, r1.w, r2.y
      mad r1.w, r4.z, -c2.x, r5.x
      mul r2.y, r1.w, c2.y
      frc r2.z, r2.y
      add r2.y, r2.y, -r2.z
      cmp r2.z, -r2.z, c0.w, c0.x
      cmp r2.z, r1.w, c0.w, r2.z
      add r4.y, r2.y, r2.z
      mad r4.x, r4.y, -c2.z, r1.w
      mul r1.w, r2.x, c1.w
      frc r2.y, r1.w
      add r1.w, r1.w, -r2.y
      cmp r2.y, -r2.y, c0.w, c0.x
      cmp r2.y, r2.x, c0.w, r2.y
      add r5.z, r1.w, r2.y
      mad r1.w, r5.z, -c2.x, r2.x
      mul r2.x, r1.w, c2.y
      frc r2.y, r2.x
      add r2.x, r2.x, -r2.y
      cmp r2.y, -r2.y, c0.w, c0.x
      cmp r2.y, r1.w, c0.w, r2.y
      add r5.y, r2.x, r2.y
      mad r5.x, r5.y, -c2.z, r1.w
      add r2.xy, -r1.xzzw, c0.x
      mul r6.xyz, r6, r2.x
      mul r3.xyz, r1.x, r3
      mul r3.xyz, r2.y, r3
      mad r2.yzw, r6.xxyz, r2.y, r3.xxyz
      mul r3.xyz, r4, r2.x
      mad r2.xyz, r3, r1.z, r2.yzww
      mul r3.xyz, r1.x, r5
      mad r1.xzw, r3.xyyz, r1.z, r2.xyyz
      add r1.xzw, r1, c2.w
      mul r1.xzw, r1, c3.x
      rcp r2.x, c66.x
      mul r1.y, r1.y, r2.x
      min r2.x, r1.y, c0.x
      mul r1.xyz, r1.xzww, r2.x
      mad r0.xyz, r1, c0.y, r0
    endif
    add r1.xy, c3.yzzw, v0
    texld r1, r1, s1
    if b8
      add r2.xyz, r1, -c0.x
      cmp r1.w, -r2_abs.z, c0.x, c0.w
      cmp r1.w, -r2_abs.y, r1.w, c0.w
      cmp r1.w, -r2_abs.x, r1.w, c0.w
      if_ne r1.w, -r1.w
        mul r1.xyz, r1.z, c0.wwxw
      else
        dp3 r1.w, r1, r1
        rsq r1.w, r1.w
        rcp r2.x, r1.w
        mad r2.y, r1.z, -r1.w, c0.x
        mul r2.y, r2.y, c0.y
        mad r2.zw, r1.xyxy, r1.w, c0.z
        dp2add r1.w, r2.zwzw, r2.zwzw, c0.w
        rsq r1.w, r1.w
        mul r2.zw, r2, r1.w
        mul r2.yz, r2.y, r2.xzww
        mad r3.xy, r2.yzzw, c0.y, c0.y
        mul r2.yz, r3.xxyw, c1.x
        frc r2.yz, r2_abs
        cmp r2.yz, r3.xxyw, r2, -r2
        mov r3.zw, c0.w
        texldl r4, r3, s0
        mad r2.yz, r2, -c1.y, r3.xxyw
        add r3.xy, r2.yzzw, c1.yzzw
        mov r3.zw, c0.w
        texldl r3, r3, s0
        add r5.xy, r2.yzzw, c1.zyzw
        mov r5.zw, c0.w
        texldl r5, r5, s0
        mul r1.w, r4.x, c1.w
        frc r2.w, r1.w
        add r1.w, r1.w, -r2.w
        cmp r2.w, -r2.w, c0.w, c0.x
        cmp r2.w, r4.x, c0.w, r2.w
        add r1.w, r1.w, r2.w
        mad r2.w, r1.w, -c2.x, r4.x
        mul r3.y, r2.w, c2.y
        frc r3.z, r3.y
        add r3.y, r3.y, -r3.z
        cmp r3.z, -r3.z, c0.w, c0.x
        cmp r3.z, r2.w, c0.w, r3.z
        add r3.y, r3.y, r3.z
        mad r2.w, r3.y, -c2.z, r2.w
        mul r3.z, r3.x, c1.w
        frc r3.w, r3.z
        add r3.z, r3.z, -r3.w
        cmp r3.w, -r3.w, c0.w, c0.x
        cmp r3.w, r3.x, c0.w, r3.w
        add r3.z, r3.z, r3.w
        mad r3.x, r3.z, -c2.x, r3.x
        mul r3.w, r3.x, c2.y
        frc r4.x, r3.w
        add r3.w, r3.w, -r4.x
        cmp r4.x, -r4.x, c0.w, c0.x
        cmp r4.x, r3.x, c0.w, r4.x
        add r3.w, r3.w, r4.x
        mad r3.x, r3.w, -c2.z, r3.x
        mul r4.x, r5.x, c1.w
        frc r4.y, r4.x
        add r4.x, r4.x, -r4.y
        cmp r4.y, -r4.y, c0.w, c0.x
        cmp r4.y, r5.x, c0.w, r4.y
        add r4.x, r4.x, r4.y
        mad r4.y, r4.x, -c2.x, r5.x
        mul r4.z, r4.y, c2.y
        frc r4.w, r4.z
        add r4.z, r4.z, -r4.w
        cmp r4.w, -r4.w, c0.w, c0.x
        cmp r4.w, r4.y, c0.w, r4.w
        add r4.z, r4.z, r4.w
        mad r4.y, r4.z, -c2.z, r4.y
        add r5, r2.yzyz, c4.xxyx
        add r5, r5, r5
        dp2add r4.w, r5, r5, c0.w
        rsq r6.x, r4.w
        rcp r6.x, r6.x
        cmp r4.w, -r4.w, c0.w, r6.x
        mad r6.x, r4.w, -c4.z, c4.w
        max r7.z, -c0.x, r6.x
        add r6.x, r7.z, -c0.x
        add r6.y, -r7.z, -c0.x
        mad r6.z, r7.z, -r7.z, c0.x
        rsq r6.z, r6.z
        rcp r6.z, r6.z
        rcp r6.w, r4.w
        mul r6.z, r6.z, r6.w
        cmp r4.w, -r4.w, -c0.w, -c0.x
        cmp r4.w, r6.y, -c0.w, r4.w
        cmp r4.w, r6.x, -c0.w, r4.w
        cmp r4.w, r4.w, c0.w, r6.z
        mul r7.xy, r5, r4.w
        add r2.w, r2.w, c2.w
        mul r6.x, r2.w, c3.x
        add r2.w, r3.y, c2.w
        mul r6.y, r2.w, c3.x
        add r1.w, r1.w, c2.w
        mul r6.z, r1.w, c3.x
        rcp r1.w, c66.x
        mul r1.w, r2.x, r1.w
        min r2.x, r1.w, c0.x
        mul r6.xyz, r6, r2.x
        mul r6.xyz, r6, c0.y
        dp2add r1.w, r5.zwzw, r5.zwzw, c0.w
        rsq r2.w, r1.w
        rcp r2.w, r2.w
        cmp r1.w, -r1.w, c0.w, r2.w
        mad r2.w, r1.w, -c4.z, c4.w
        max r8.z, -c0.x, r2.w
        add r2.w, r8.z, -c0.x
        add r3.y, -r8.z, -c0.x
        mad r4.w, r8.z, -r8.z, c0.x
        rsq r4.w, r4.w
        rcp r4.w, r4.w
        rcp r5.x, r1.w
        mul r4.w, r4.w, r5.x
        cmp r1.w, -r1.w, -c0.w, -c0.x
        cmp r1.w, r3.y, -c0.w, r1.w
        cmp r1.w, r2.w, -c0.w, r1.w
        cmp r1.w, r1.w, c0.w, r4.w
        mul r8.xy, r5.zwzw, r1.w
        add r5.xyz, r8, c3.w
        add r1.w, r3.x, c2.w
        mul r8.x, r2.x, r1.w
        add r1.w, r3.w, c2.w
        mul r8.y, r2.x, r1.w
        add r1.w, r3.z, c2.w
        mul r8.z, r2.x, r1.w
        add r3.xyz, -r7, r5
        mad r5.xyz, r8, c2.y, -r6
        dp3 r1.w, r5, r1
        dp3 r2.w, r3, r3
        rcp r3.w, r2.w
        mul r1.w, -r1.w, r3.w
        mad r3.xyz, r3, r1.w, r1
        cmp r3.xyz, -r2.w, r1, r3
        add r2.yz, r2, c4.xxyw
        add r2.yz, r2, r2
        dp2add r1.w, r2.yzzw, r2.yzzw, c0.w
        rsq r2.w, r1.w
        rcp r2.w, r2.w
        cmp r1.w, -r1.w, c0.w, r2.w
        mad r2.w, r1.w, -c4.z, c4.w
        max r5.z, -c0.x, r2.w
        add r2.w, r5.z, -c0.x
        add r3.w, -r5.z, -c0.x
        mad r4.w, r5.z, -r5.z, c0.x
        rsq r4.w, r4.w
        rcp r4.w, r4.w
        rcp r5.w, r1.w
        mul r4.w, r4.w, r5.w
        cmp r1.w, -r1.w, -c0.w, -c0.x
        cmp r1.w, r3.w, -c0.w, r1.w
        cmp r1.w, r2.w, -c0.w, r1.w
        cmp r1.w, r1.w, c0.w, r4.w
        mul r5.xy, r2.yzzw, r1.w
        add r1.w, r4.y, c2.w
        mul r8.x, r2.x, r1.w
        add r1.w, r4.z, c2.w
        mul r8.y, r2.x, r1.w
        add r1.w, r4.x, c2.w
        mul r8.z, r2.x, r1.w
        add r2.xyz, -r7, r5
        mad r4.xyz, r8, c2.y, -r6
        dp3 r1.w, r4, r1
        dp3 r2.w, r2, r2
        rcp r3.w, r2.w
        mul r1.w, -r1.w, r3.w
        mad r2.xyz, r2, r1.w, r3
        cmp r2.xyz, -r2.w, r3, r2
        nrm r1.xyz, r2
      endif
    endif
    cmp oC0.xyz, -r0_abs.w, r0, r1
    mov oC0.w, r0.w

// approximately 299 instruction slots used (16 texture, 283 arithmetic)
