//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D blitSampler;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   blitSampler  s0       1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 1.0888089068e-42 // 777
    def c0, 0, 0, 0.125, 0.0625
    def c1, 0.0625, 0.1875, 0.3125, 0.4375
    def c2, 1, -0.5, 0, 0
    def c3, 0.5625, 0.6875, 0.8125, 0.9375
    defi i0, 8, 0, 0, 0
    dcl_2d s0
    mov r0.y, c1.x
    mov r1.y, c1.y
    mov r2.y, c1.z
    mov r3.y, c1.w
    mov r4.y, c3.x
    mov r5.y, c3.y
    mov r6.y, c3.z
    mov r7.y, c3.w
    mov r8.xyz, c0.y
    mov r0.zw, c0.y
    rep i0
      mad r0.x, r0.w, c0.z, c0.w
      texld r9, r0, s0
      mad r1.x, r0.w, c0.z, c0.w
      texld r10, r1, s0
      mad r2.x, r0.w, c0.z, c0.w
      texld r11, r2, s0
      mad r3.x, r0.w, c0.z, c0.w
      texld r12, r3, s0
      mad r4.x, r0.w, c0.z, c0.w
      texld r13, r4, s0
      mad r5.x, r0.w, c0.z, c0.w
      texld r14, r5, s0
      mad r6.x, r0.w, c0.z, c0.w
      texld r15, r6, s0
      mad r7.x, r0.w, c0.z, c0.w
      texld r16, r7, s0
      dp3 r17.x, r9, c2.x
      dp3 r17.y, r10, c2.x
      dp3 r17.z, r11, c2.x
      dp3 r17.w, r12, c2.x
      dp3 r18.x, r13, c2.x
      dp3 r18.y, r14, c2.x
      dp3 r18.z, r15, c2.x
      dp3 r18.w, r16, c2.x
      add r17, r17, c2.y
      cmp r17, r17, c2.x, c2.z
      add r18, r18, c2.y
      cmp r18, r18, c2.x, c2.z
      mad r1.xzw, r9.xyyz, r17.x, r8.xyyz
      mad r1.xzw, r10.xyyz, r17.y, r1
      mad r1.xzw, r11.xyyz, r17.z, r1
      mad r1.xzw, r12.xyyz, r17.w, r1
      mad r1.xzw, r13.xyyz, r18.x, r1
      mad r1.xzw, r14.xyyz, r18.y, r1
      mad r1.xzw, r15.xyyz, r18.z, r1
      mad r8.xyz, r16, r18.w, r1.xzww
      dp4 r0.x, r17, c2.x
      dp4 r1.x, r18, c2.x
      add r0.x, r0.x, r1.x
      add r0.z, r0.z, r0.x
      add r0.w, r0.w, c2.x
    endrep
    rcp r0.x, r0.z
    mul oC0.xyz, r8, r0.x
    mov oC0.w, c2.x

// approximately 59 instruction slots used (8 texture, 51 arithmetic)
