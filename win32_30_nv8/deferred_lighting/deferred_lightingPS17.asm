// Summary: Improved shadow filter
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
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
//   sampler2D gDeferredLightSampler;
//   float3 gDeferredLightTangent;
//   float gDeferredLightType;
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
//   gDeferredLightType               c78      1
//   gDeferredLightPosition           c79      1
//   gDeferredLightDirection          c80      1
//   gDeferredLightTangent            c81      1
//   gDeferredLightInvSqrRadius       c82      1
//   gDeferredLightConeOffset         c83      1
//   gDeferredLightConeScale          c84      1
//   gDeferredLightColourAndIntensity c85      1
//   gooDeferredLightScreenSize       c86      1
//   gDeferredProjParams              c87      1
//   gDeferredLightSampler            s0       1
//   GBufferTextureSampler0           s1       1
//   GBufferTextureSampler1           s2       1
//   GBufferTextureSampler2           s4       1
//   GBufferTextureSampler3           s5       1
//   gShadowZSamplerCache             s14      1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 3.0828566215e-44 // 22
    def c0, 0.50999999, 512, 2, -0.999989986
    def c1, 1, 0.5, 0, 9.99999975e-006
    def c2, -0.100000001, 1.11111116, 0.100000001, 0.75
    def c3, 0.5, -0.5, 0.159154937, 0.25
    def c4, 3, 4.27199984, 0, 0
    def c5, 6.28318548, -3.14159274, -1, 1
    def c8, 17.0666666, 1.3333333, 0, 0
    // ------------------------------------------------------ Improved Shadow Filter Constants ------------------------------------------------------
    def c110, -0.25, 1, -1, 0
    def c111, 0.159154937, 0.5, 6.28318548, -3.14159274
    def c112, 3, 4.27199984, 0, 0
    def c113, 0.75, -0.5, 0.5, 0
    
    def c118, 0.06711056, 0.00583715, 52.9829189, 0
    
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
    dcl_2d s14
    mul r0.xyz, c85.w, c85
    add r1.xy, c0.x, vPos
    mul r1.xy, r1, c86.zwzw
    texld r2, r1, s5
    texld r3, r1, s1
    
    // LogDepth Read
    pow r19.x, c209_abs.z, r2.x
    mul r2.y, r19.x, c209.w
    
    rcp r0.w, v0.w
    mul r0.w, r0.w, r2.y
    mad r2.xyz, v0, -r0.w, c15
    texld r4, r1, s4
    add r1.z, r4.x, r4.x
    mul r1.w, r4.y, r4.y
    mul r1.w, r1.w, c0.y
    texld r4, r1, s2
    mad r4.xyz, r4, c0.z, c0.w
    nrm r5.xyz, r4
    add r4.xyz, r2, -c79
    mov r6.xyz, c80
    mul r7.xyz, -r6.zxyw, c81.yzxw
    mad r6.xyz, -r6.yzxw, c81.zxyw, -r7
    dp3 r1.x, r6, r4
    dp3 r1.y, c81, r4
    dp3 r2.w, -c80, r4
    mov r6.z, c0.z
    if_ge c78.x, r6.z
      mov r6.x, c1.x
      mad r3.w, c83.x, -c83.x, r6.x
      rsq r3.w, r3.w
      mul r3.w, r3.w, c83.x
      rcp r4.w, r2.w
      mul r3.w, r3.w, r4.w
      mul r6.xy, r1, r3.w
      mad r6.xy, r6, c1.y, c1.y
      mov r6.zw, c1.z
      texldl r6, r6, s0
    else
      dp3 r3.w, r4, r4
      rsq r3.w, r3.w
      rcp r4.x, r3.w
      mad r2.w, r2.w, -r3.w, c1.x
      mul r2.w, r4.x, r2.w
      rcp r2.w, r2.w
      mul r1.xy, r1, r2.w
      mad r4.xy, r1, c1.y, c1.y
      mov r4.zw, c1.z
      texldl r6, r4, s0
    endif
    mad r4.xyz, v0, -r0.w, c1.w
    nrm r7.xyz, r4
    add r4.xyz, -r2, c79
    dp3 r0.w, r4, r4
    add r4.xyz, r4, c1.w
    nrm r8.xyz, r4
    mov r1.x, c1.x
    mad_sat r0.w, r0.w, -c82.x, r1.x
    mul r0.w, r0.w, r0.w
    mad r0.w, r0.w, r0.w, c2.x
    mul r1.x, r0.w, c2.y
    mul r0.xyz, r0, r1.x
    dp3 r1.x, r8, -c80
    add r1.x, r1.x, -c83.x
    mul_sat r1.x, r1.x, c84.x
    mul r0.xyz, r0, r1.x
    mov r20.x, c77.z
    mul r20.xy, r20.x, c8.xy
    mad r2.xyz, r5, r20.x, r2 // scale bias with resolution
    mul r4.xyz, r2.y, c73
    mad r2.xyw, r2.x, c72.xyzz, r4.xyzz
    mad r2.xyz, r2.z, c74, r2.xyww
    add r2.xyz, r2, c75
    add r1.x, r2.z, c76.z
    cmp r4.xy, -r1.x, c1.xzzw, c1.zxzw
    mov r2.w, -r1_abs.x
    dp3 r1.y, r2.xyww, r2.xyww
    rsq r1.y, r1.y
    rcp r1.y, r1.y
    add r1.x, r1_abs.x, r1.y
    rcp r1.x, r1.x
    mul r2.xy, r2, r1.x
    mad r2.xy, r2, c3, c3.x
    // ----------------------------------------------------------- Improved Shadow Filter -----------------------------------------------------------
    if_eq -c221_abs.x, c221_abs.x
      dp2add r1.x, vPos, c4, c4.z
      mad r1.x, r1.x, c3.z, c3.x
      frc r1.x, r1.x
      mad r1.x, r1.x, c5.x, c5.y
      sincos r9.xy, r1.x
      mul r2.zw, r9.xyyx, r20.y
      mul r10, r9.xyxy, c5.zwwz
      mul r4.zw, -r9.xyyx, r20.y
      mul r9.xy, r10, r20.y
      mad_sat r9.zw, r10, r20.y, r2.xyxy
      mad_sat r2.zw, r2, c2.w, r2.xyxy
      mad_sat r9.xy, r9, c1.y, r2
      mad_sat r2.xy, r4.zwzw, c3.w, r2
      mad r4.zw, r9, c77.w, c77.xyxy
      mad r2.zw, r2, c77.w, c77.xyxy
      mad r9.xy, r9, c77.w, c77
      mad r2.xy, r2, c77.w, c77
      texldl r10, r4.zwzw, s14
      dp2add r10.x, r10, r4, c1.z
      texldl r11, r2.zwzw, s14
      dp2add r10.y, r11, r4, c1.z
      texldl r9, r9, s14
      dp2add r10.z, r9, r4, c1.z
      texldl r2, r2, s14
      dp2add r10.w, r2, r4, c1.z
      mad r2, r1.y, c66.w, r10
      cmp r2, r2, c1.x, c1.z
      dp4 r1.x, r2, c3.w
    else
      dp2add r21.x, vPos.xy, c118.xy, c118.w
      frc r21.x, r21.x
      mul r21.x, r21.x, c118.z
      frc r21.x, r21.x
      mul r21.x, r21.x, c111.z
      sincos r22.xy, r21.x
      mul r22, r22.xyyx, c110.yzyy
      
      mul r21, c130.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c130.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad_sat r21, r23, r20.y, r2.xyxy
      mad r21, r21, c77.w, c77.xyxy
      texldl r24, r21.xy, s14
      dp2add r24.x, r24, r4.xy, c110.w
      texldl r23, r21.zw, s14
      dp2add r24.y, r23, r4.xy, c110.w
      mul r21, c131.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c131.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad_sat r21, r23, r20.y, r2.xyxy
      mad r21, r21, c77.w, c77.xyxy
      texldl r23, r21.xy, s14
      dp2add r24.z, r23, r4.xy, c110.w
      texldl r23, r21.zw, s14
      dp2add r24.w, r23, r4.xy, c110.w
      mad r24, r1.y, c66.w, r24
      cmp r24, r24, c110.y, c110.w
      dp4 r25.x, r24, -c110.x
      
      mul r21, c132.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c132.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad_sat r21, r23, r20.y, r2.xyxy
      mad r21, r21, c77.w, c77.xyxy
      texldl r24, r21.xy, s14
      dp2add r24.x, r24, r4.xy, c110.w
      texldl r23, r21.zw, s14
      dp2add r24.y, r23, r4.xy, c110.w
      mul r21, c133.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c133.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad_sat r21, r23, r20.y, r2.xyxy
      mad r21, r21, c77.w, c77.xyxy
      texldl r23, r21.xy, s14
      dp2add r24.z, r23, r4.xy, c110.w
      texldl r23, r21.zw, s14
      dp2add r24.w, r23, r4.xy, c110.w
      mad r24, r1.y, c66.w, r24
      cmp r24, r24, c110.y, c110.w
      dp4 r25.y, r24, -c110.x
      
      mul r21, c134.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c134.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad_sat r21, r23, r20.y, r2.xyxy
      mad r21, r21, c77.w, c77.xyxy
      texldl r24, r21.xy, s14
      dp2add r24.x, r24, r4.xy, c110.w
      texldl r23, r21.zw, s14
      dp2add r24.y, r23, r4.xy, c110.w
      mul r21, c135.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c135.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad_sat r21, r23, r20.y, r2.xyxy
      mad r21, r21, c77.w, c77.xyxy
      texldl r23, r21.xy, s14
      dp2add r24.z, r23, r4.xy, c110.w
      texldl r23, r21.zw, s14
      dp2add r24.w, r23, r4.xy, c110.w
      mad r24, r1.y, c66.w, r24
      cmp r24, r24, c110.y, c110.w
      dp4 r25.z, r24, -c110.x
      
      mul r21, c136.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c136.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad_sat r21, r23, r20.y, r2.xyxy
      mad r21, r21, c77.w, c77.xyxy
      texldl r24, r21.xy, s14
      dp2add r24.x, r24, r4.xy, c110.w
      texldl r23, r21.zw, s14
      dp2add r24.y, r23, r4.xy, c110.w
      mul r21, c137.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c137.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad_sat r21, r23, r20.y, r2.xyxy
      mad r21, r21, c77.w, c77.xyxy
      texldl r23, r21.xy, s14
      dp2add r24.z, r23, r4.xy, c110.w
      texldl r23, r21.zw, s14
      dp2add r24.w, r23, r4.xy, c110.w
      mad r24, r1.y, c66.w, r24
      cmp r24, r24, c110.y, c110.w
      dp4 r25.w, r24, -c110.x
      
      dp4 r1.x, r25, -c110.x
    endif
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    mul r0.xyz, r0, r1.x
    cmp r0.xyz, r0.w, r0, c1.z
    dp3 r0.w, r7, r5
    add r0.w, r0.w, r0.w
    mad r2.xyz, r5, -r0.w, r7
    dp3_sat r0.w, r8, r2
    pow r2.x, r0.w, r1.w
    dp3_sat r0.w, r8, r5
    mul r1.xyw, r0.xyzz, r2.x
    mul r0.xyz, r0, r0.w
    mul r2.xyz, r3, r6
    mul r1.xyz, r1.z, r1.xyww
    mad oC0.xyz, r2, r0, r1
    mov oC0.w, c1.x
    
    // LogDepth Write
    mul r19.x, v9.w, c209.x
    log r19.x, r19.x
    mul r19.x, r19.x, c209.y
    rcp r19.y, v9.w
    mul r19.y, r19.y, v9.z
    cmp oDepth, -v9_abs.y, r19.y, r19.x

// approximately 144 instruction slots used (12 texture, 132 arithmetic)
