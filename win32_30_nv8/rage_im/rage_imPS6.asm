//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   float4 TexelSize;
//   sampler2D TransparentSrcMapSampler;
//
//
// Registers:
//
//   Name                     Reg   Size
//   ------------------------ ----- ----
//   TexelSize                c64      1
//   TransparentSrcMapSampler s0       1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 1.1224400699e-42 // 801
    def c0, 3.75, -2.25, -0.75, 1.25
    def c1, -6, 0, 3, 1
    def c2, 1, -1, 0, 2
    dcl_texcoord_pp v0.xy
    dcl_2d s0
    mul_pp r0, c64.zzww, v0.xxyy
    frc_pp r0, r0
    mad_pp r1, r0.zzww, c2.xxyy, c2.xzxw
    mad_pp r0, r0.xxyy, c2.xxyy, c2.xzxw
    mul_pp r2, r1, r1
    mul_pp r3, r1, r2
    mul_pp r2, r2, c0.xyyx
    mad_pp r2, r3, c0.zwwz, r2
    mad_pp r1, r1, c1.xyyx, r2
    add_pp r1, r1, c1.zwwz
    mov r2, c2
    mad_pp r3.xy, c64, r2.wzzw, v0
    texld_pp r3, r3, s0
    mad_pp r4.xy, c64, r2.xzzw, v0
    texld_pp r4, r4, s0
    mad_pp r5.xy, c64, r2.yzzw, v0
    texld_pp r5, r5, s0
    texld_pp r6, v0, s0
    mul_pp r7, r0, r0
    mul_pp r8, r0, r7
    mul_pp r7, r7, c0.xyyx
    mad_pp r7, r8, c0.zwwz, r7
    mad_pp r0, r0, c1.xyyx, r7
    add_pp r0, r0, c1.zwwz
    mul_pp r6, r6, r0.y
    mad_pp r5, r5, r0.x, r6
    mad_pp r4, r4, r0.z, r5
    mad_pp r3, r3, r0.w, r4
    mul_pp r3, r1.y, r3
    mad_pp r4.xy, c64, r2.wyzw, v0
    texld_pp r4, r4, s0
    mad_pp r5.xy, c64, r2, v0
    texld_pp r5, r5, s0
    add_pp r6.xy, -c64, v0
    texld_pp r6, r6, s0
    mad_pp r7.xy, c64, r2.zyzw, v0
    texld_pp r7, r7, s0
    mul_pp r7, r0.y, r7
    mad_pp r6, r6, r0.x, r7
    mad_pp r5, r5, r0.z, r6
    mad_pp r4, r4, r0.w, r5
    mad_pp r3, r4, r1.x, r3
    mad_pp r1.xy, c64, r2.yxzw, v0
    texld_pp r4, r1, s0
    mad_pp r1.xy, c64, r2.zxzw, v0
    texld_pp r5, r1, s0
    mul_pp r5, r0.y, r5
    mad_pp r4, r4, r0.x, r5
    add_pp r1.xy, c64, v0
    texld_pp r5, r1, s0
    mad_pp r4, r5, r0.z, r4
    mad_pp r1.xy, c64, r2.wxzw, v0
    texld_pp r5, r1, s0
    mad_pp r4, r5, r0.w, r4
    mad_pp r3, r4, r1.z, r3
    mad_pp r1.xy, c64, r2.zwzw, v0
    texld_pp r4, r1, s0
    mul_pp r4, r0.y, r4
    mad_pp r1.xy, c64, r2.ywzw, v0
    texld_pp r5, r1, s0
    mad_pp r4, r5, r0.x, r4
    mad_pp r0.xy, c64, r2.xwzw, v0
    texld_pp r5, r0, s0
    mad_pp r4, r5, r0.z, r4
    mad_pp r0.xy, c64, r2.w, v0
    texld_pp r2, r0, s0
    mad_pp r0, r2, r0.w, r4
    mad_pp oC0, r0, r1.w, r3

// approximately 68 instruction slots used (16 texture, 52 arithmetic)
