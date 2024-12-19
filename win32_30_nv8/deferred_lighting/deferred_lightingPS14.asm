// Summary: Fixed incorrect shadow casting lights intensity thanks to AssaultKifle47 + improved shadow filter
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D GBufferStencilTextureSampler;
//   sampler2D GBufferTextureSampler0;
//   sampler2D GBufferTextureSampler1;
//   sampler2D GBufferTextureSampler2;
//   sampler2D GBufferTextureSampler3;
//   row_major float4x4 dShadowMatrix;
//   float4 dShadowOffsetScale;
//   float4 dShadowParam0123;
//   float4 dShadowParam891113;
//   float4 gDeferredLightColourAndIntensity;
//   float gDeferredLightConeOffset;
//   float gDeferredLightConeScale;
//   float3 gDeferredLightDirection;
//   float gDeferredLightInvSqrRadius;
//   float3 gDeferredLightPosition;
//   float4 gDeferredProjParams;
//   sampler2D gShadowZSamplerCache;
//   row_major float4x4 gViewInverse;
//   float4 gooDeferredLightScreenSize;
//
//
// Registers:
//
//   Name                             Reg   Size
//   -------------------------------- ----- ----
//   gViewInverse                     c12      4
//   dShadowParam0123                 c66      1
//   dShadowMatrix                    c72      4
//   dShadowParam891113               c76      1
//   dShadowOffsetScale               c77      1
//   gDeferredLightPosition           c78      1
//   gDeferredLightDirection          c79      1
//   gDeferredLightInvSqrRadius       c80      1
//   gDeferredLightConeOffset         c81      1
//   gDeferredLightConeScale          c82      1
//   gDeferredLightColourAndIntensity c83      1
//   gooDeferredLightScreenSize       c84      1
//   gDeferredProjParams              c85      1
//   GBufferTextureSampler0           s0       1
//   GBufferTextureSampler1           s1       1
//   GBufferTextureSampler2           s2       1
//   GBufferTextureSampler3           s4       1
//   GBufferStencilTextureSampler     s5       1
//   gShadowZSamplerCache             s14      1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 2.6624670822e-44 // 19
    def c127, 0.9999999, 1, 0, 0 // LogDepth constants
    def c0, 0.50999999, 512, 0.25, 256
    def c1, 0.99609375, 7.96875, 63.75, -127.999992
    def c2, 9.99999975e-006, 1, -0.100000001, 1.11111116
    def c3, 1, 0, 0.5, -0.5
    def c4, 3, 4.27199984, 0, 0.75
    def c5, 0.159154937, 0.5, 6.28318548, -3.14159274
    def c6, -1, 1, 255, -128
    def c7, -128, -0, -7.9000001, 2
    // ------------------------------------------------------ Improved Shadow Filter Constants ------------------------------------------------------
    def c110, -0.25, 1, -1, 0
    def c111, 0.159154937, 0.5, 6.28318548, -3.14159274
    def c112, 3, 4.27199984, 0.03125, 0
    def c113, 0.75, -0.5, 0.5, 0
    
    def c130, 0.18993645671348536, 0.027087114076591513, -0.21261242652069953, 0.23391293246949066
    def c131, 0.04771781344140756, -0.3666840644525993, 0.297730981239584, 0.398259878229082
    def c132, -0.509063425827436, -0.06528681462854097, 0.507855152944665, -0.2875976005206389
    def c133, -0.15230616564632418, 0.6426121151781916, -0.30240170651828074, -0.5805072900736001
    def c134, 0.6978019230005561, 0.2771173334141519, -0.6990963248129052, 0.3210960724922725
    def c135, 0.3565142601623699, -0.7066415061851589, 0.266890002328106, 0.8360191043249159
    def c136, -0.7515861305520581, -0.41609876195815027, 0.9102937449894895, -0.17014527555321657
    def c137, -0.5343471434373126, 0.8058593459499529, -0.1133270115046468, -0.9490025827627441
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    dcl_texcoord v0
    dcl vPos.xy
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s1
    dcl_2d s2
    dcl_2d s4
    dcl_2d s5
    dcl_2d s10
    dcl_2d s14
    /* removed original filter
    dp2add r0.x, vPos, c4, c4.z
    mad r0.x, r0.x, c5.x, c5.y
    frc r0.x, r0.x
    mad r0.x, r0.x, c5.z, c5.w
    sincos r1.xy, r0.x
    mul r0.xy, r1.yxzw, c77.z
    removed original filter */
    add r0.zw, c0.x, vPos.xyxy
    mul r0.zw, r0, c84
    texld r2, r0.zwzw, s1
    mul r3.xyz, r2.w, c1
    frc r3.xyz, r3
    add r4.xyz, r3, r3
    mad r4.xy, r3.yzzw, -c0.z, r4
    mad r2.xyz, r2, c0.w, r4
    add r2.xyz, r2, c1.w
    nrm r3.xyz, r2
    texld r2, r0.zwzw, s4
    // ----------------------------------------------------------------- Log2Linear -----------------------------------------------------------------
    if_ne r2.x, c127.y
      rcp r20.x, c128.x
      mul r20.x, r20.x, c128.y
      pow r20.x, r20.x, r2.x
      mul r20.x, r20.x, c128.x // W_clip
      
      add r20.y, r20.x, -c128.x
      add r20.z, c128.y, -c128.x
      mul r20.y, r20.y, c128.y
      mul r20.z, r20.z, r20.x
      rcp r20.z, r20.z
      mul r20.w, r20.y, r20.z // Linear depth
      
      min r2, r20.w, c127.x // FP error hack
    endif
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    mad r1.z, r2.x, c85.z, -c85.w
    mul r1.z, r1.z, v0.w
    rcp r1.z, r1.z
    mad r2.xyz, v0, -r1.z, c15
    mad r4.xyz, v0, -r1.z, c2.x
    nrm r5.xyz, r4
    mad r4.xyz, r3, -c2.z, r2
    add r2.xyz, -r2, c78
    mul r6.xyz, r4.y, c73
    mad r4.xyw, r4.x, c72.xyzz, r6.xyzz
    mad r4.xyz, r4.z, c74, r4.xyww
    add r4.xyz, r4, c75
    add r1.z, r4.z, c76.z
    mov r4.w, -r1_abs.z
    dp3 r1.w, r4.xyww, r4.xyww
    rsq r1.w, r1.w
    rcp r1.w, r1.w
    add r2.w, r1_abs.z, r1.w
    cmp r4.zw, -r1.z, c3.xyxy, c3.xyyx
    rcp r1.z, r2.w
    mul r4.xy, r4, r1.z
    mad r4.xy, r4, c3.zwzw, c3.z
    /* removed original filter
    mad_sat r0.xy, r0, c4.w, r4
    mad r0.xy, r0, c77.w, c77
    texld r6, r0, s14
    dp2add r6.y, r6, r4.zwzw, c3.y
    mul r0.xy, -r1.yxzw, c77.z
    mul r7, r1.xyxy, c6.xyyx
    mad_sat r0.xy, r0, c0.z, r4
    mad r0.xy, r0, c77.w, c77
    texld r8, r0, s14
    dp2add r6.w, r8, r4.zwzw, c3.y
    mul r0.xy, r7, c77.z
    mad_sat r1.xy, r7.zwzw, c77.z, r4
    mad_sat r0.xy, r0, c3.z, r4
    mad r0.xy, r0, c77.w, c77
    texld r7, r0, s14
    dp2add r6.z, r7, r4.zwzw, c3.y
    mad r0.xy, r1, c77.w, c77
    texld r7, r0, s14
    dp2add r6.x, r7, r4.zwzw, c3.y
    mad r1, r1.w, c66.w, r6
    cmp r1, r1, c3.x, c3.y
    dp4 r0.x, r1, c0.z
    removed original filter */
    // ----------------------------------------------------------- Improved Shadow Filter -----------------------------------------------------------
    mov r21.x, c110.y
    if_lt c221.x, r21.x
      dp2add r21.y, vPos, c112.xy, c112.w
      mad r21.y, r21.y, c111.x, c111.y
      frc r21.y, r21.y
      mad r21.y, r21.y, c111.z, c111.w
      sincos r22.xy, r21.y
      mul r21, r22.yxxy, c110.xxyz
      mul r22, r22.yxxy, c113.xxyz
      mov r20.xy, c77.z
      mad_sat r21, r21, r20.xyxy, r4.xyxy
      mad r21, r21, c77.w, c77.xyxy
      mad_sat r22, r22, r20.xyxy, r4.xyxy
      mad r22, r22, c77.w, c77.xyxy
      texldl r25, r21.xy, s14
      dp2add r25.x, r25, r4.zw, c110.w
      texldl r24, r22.zw, s14
      dp2add r25.y, r24, r4.zw, c110.w
      texldl r24, r22.xy, s14
      dp2add r25.z, r24, r4.zw, c110.w
      texldl r24, r21.zw, s14
      dp2add r25.w, r24, r4.zw, c110.w
      mad r25, r1.w, c66.w, r25
      cmp r25, r25, c110.y, c110.w
      dp4 r0.x, r25, -c110.x
    else
      mul r21.xy, vPos.xy, c112.z
      mov r21.zw, c110.w
      texldl r21, r21, s10
      mul r21.x, r21.z, c111.z
      sincos r22.xy, r21.x
      mul r22, r22.xyyx, c110.yzyy
      mov r20.xy, c77.z
      
      mul r21, c130.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c130.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad_sat r21, r23, r20.xyxy, r4.xyxy
      mad r21, r21, c77.w, c77.xyxy
      texldl r24, r21.xy, s14
      dp2add r24.x, r24, r4.zw, c110.w
      texldl r23, r21.zw, s14
      dp2add r24.y, r23, r4.zw, c110.w
      mul r21, c131.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c131.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad_sat r21, r23, r20.xyxy, r4.xyxy
      mad r21, r21, c77.w, c77.xyxy
      texldl r23, r21.xy, s14
      dp2add r24.z, r23, r4.zw, c110.w
      texldl r23, r21.zw, s14
      dp2add r24.w, r23, r4.zw, c110.w
      mad r24, r1.w, c66.w, r24
      cmp r24, r24, c110.y, c110.w
      dp4 r25.x, r24, -c110.x
      
      mul r21, c132.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c132.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad_sat r21, r23, r20.xyxy, r4.xyxy
      mad r21, r21, c77.w, c77.xyxy
      texldl r24, r21.xy, s14
      dp2add r24.x, r24, r4.zw, c110.w
      texldl r23, r21.zw, s14
      dp2add r24.y, r23, r4.zw, c110.w
      mul r21, c133.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c133.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad_sat r21, r23, r20.xyxy, r4.xyxy
      mad r21, r21, c77.w, c77.xyxy
      texldl r23, r21.xy, s14
      dp2add r24.z, r23, r4.zw, c110.w
      texldl r23, r21.zw, s14
      dp2add r24.w, r23, r4.zw, c110.w
      mad r24, r1.w, c66.w, r24
      cmp r24, r24, c110.y, c110.w
      dp4 r25.y, r24, -c110.x
      
      mul r21, c134.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c134.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad_sat r21, r23, r20.xyxy, r4.xyxy
      mad r21, r21, c77.w, c77.xyxy
      texldl r24, r21.xy, s14
      dp2add r24.x, r24, r4.zw, c110.w
      texldl r23, r21.zw, s14
      dp2add r24.y, r23, r4.zw, c110.w
      mul r21, c135.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c135.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad_sat r21, r23, r20.xyxy, r4.xyxy
      mad r21, r21, c77.w, c77.xyxy
      texldl r23, r21.xy, s14
      dp2add r24.z, r23, r4.zw, c110.w
      texldl r23, r21.zw, s14
      dp2add r24.w, r23, r4.zw, c110.w
      mad r24, r1.w, c66.w, r24
      cmp r24, r24, c110.y, c110.w
      dp4 r25.z, r24, -c110.x
      
      mul r21, c136.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c136.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad_sat r21, r23, r20.xyxy, r4.xyxy
      mad r21, r21, c77.w, c77.xyxy
      texldl r24, r21.xy, s14
      dp2add r24.x, r24, r4.zw, c110.w
      texldl r23, r21.zw, s14
      dp2add r24.y, r23, r4.zw, c110.w
      mul r21, c137.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c137.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad_sat r21, r23, r20.xyxy, r4.xyxy
      mad r21, r21, c77.w, c77.xyxy
      texldl r23, r21.xy, s14
      dp2add r24.z, r23, r4.zw, c110.w
      texldl r23, r21.zw, s14
      dp2add r24.w, r23, r4.zw, c110.w
      mad r24, r1.w, c66.w, r24
      cmp r24, r24, c110.y, c110.w
      dp4 r25.w, r24, -c110.x
      
      dp4 r0.x, r25, -c110.x
    endif
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    dp3 r0.y, r2, r2
    add r1.xyz, r2, c2.x
    nrm r2.xyz, r1
    mov r1.y, c2.y
    mad_sat r0.y, r0.y, -c80.x, r1.y
    mul r0.y, r0.y, r0.y
    mad r0.y, r0.y, r0.y, c2.z
    mul r1.x, r0.y, c2.w
    mul r1.yzw, c83.w, c83.xxyz
    mul r1.xyz, r1.x, r1.yzww
    dp3 r1.w, r2, -c79
    add r1.w, r1.w, -c81.x
    mul_sat r1.w, r1.w, c82.x
    mul r1.xyz, r1, r1.w
    mul r1.xyz, r0.x, r1
    cmp r1.xyz, r0.y, r1, c3.y
    dp3 r0.x, r5, r3
    add r0.x, r0.x, r0.x
    mad r4.xyz, r3, -r0.x, r5
    dp3_sat r0.x, r2, r3
    dp3_sat r0.y, r2, r4
    mul r2.xyz, r1, r0.x
    texld r3, r0.zwzw, s2
    mul r3.y, r3, r3
    add r0.x, r3.x, r3.x
    mul r1.w, r3.y, c0.y
    pow r2.w, r0.y, r1.w
    mul r1.xyz, r1, r2.w
    mul r1.xyz, r0.x, r1
    texld r4, r0.zwzw, s0
    texld r0, r0.zwzw, s5
    mad r1.xyz, r4, r2, r1
    mad_sat r0.y, r3.z, r3.z, c3.z
    mad r0.z, r0.x, c6.z, c6.w
    cmp r0.z, r0.z, c7.x, c7.y
    mad r0.x, r0.x, c6.z, r0.z
    add r0.x, r0.x, c7.z
    cmp r0.x, r0.x, c2.y, r0.y
    mov r1.w, c7.w
    mul oC0, r1, r0.x
    // ----------------------------------------------------------------- Linear2Log -----------------------------------------------------------------
    if_ne v9.y, c127.y
      rcp r20.z, c128.x
      mul r20.x, v9.w, r20.z
      mul r20.y, c128.y, r20.z
      log r20.x, r20.x
      log r20.y, r20.y
      rcp r20.y, r20.y
    else
      mov r20.x, v9.z
      rcp r20.y, v9.w
    endif
    mul oDepth, r20.x, r20.y
    // ----------------------------------------------------------------------------------------------------------------------------------------------

// approximately 122 instruction slots used (9 texture, 113 arithmetic)
