// Summary: remapped shadowmap depth + added volumetric fog
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   float gAmbientAmount;
//   float gAmbientShadow;
//   float4 gAspectRatio;
//   float4 gDepthFxParams;
//   float gDiffuse;
//   float4 gDirectionalColour;
//   float4 gDirectionalLight;
//   float gExtraLights;
//   float4 gFacetCentre;
//   float4 gLightAmbient0;
//   float4 gLightAmbient1;
//   float4 gLightColB;
//   float4 gLightColG;
//   float4 gLightColR;
//   float4 gLightConeOffset;
//   float4 gLightConeScale;
//   float4 gLightDirX;
//   float4 gLightDirY;
//   float4 gLightDirZ;
//   float4 gLightFallOff;
//   float gLightIntensityClamp;
//   float4 gLightPosX;
//   float4 gLightPosY;
//   float4 gLightPosZ;
//   float gNormalArc;
//   row_major float4x4 gShadowMatrix;
//   float4 gShadowParam0123;
//   float4 gShadowParam14151617;
//   float4 gShadowParam4567;
//   float4 gShadowParam891113;
//   sampler2D gShadowZSamplerDirVS;
//   float gSuperAlpha;
//   float gUseShadows;
//   row_major float4x4 gViewInverse;
//   row_major float4x4 gWorld;
//   row_major float4x4 gWorldView;
//   float gWrapBias;
//   float gWrapScale;
//   float4 globalFogColor;
//   float4 globalFogColorN;
//   float4 globalFogParams;
//   float4 globalScreenSize;
//
//
// Registers:
//
//   Name                 Reg   Size
//   -------------------- ----- ----
//   gWorld               c0       4
//   gWorldView           c4       4
//   gViewInverse         c12      3
//   gDepthFxParams       c16      1
//   gDirectionalLight    c17      1
//   gDirectionalColour   c18      1
//   gLightPosX           c19      1
//   gLightPosY           c20      1
//   gLightPosZ           c21      1
//   gLightDirX           c22      1
//   gLightDirY           c23      1
//   gLightDirZ           c24      1
//   gLightFallOff        c25      1
//   gLightConeScale      c26      1
//   gLightConeOffset     c27      1
//   gLightColR           c29      1
//   gLightColG           c30      1
//   gLightColB           c31      1
//   gLightAmbient0       c37      1
//   gLightAmbient1       c38      1
//   globalFogParams      c41      1
//   globalFogColor       c42      1
//   globalFogColorN      c43      1
//   globalScreenSize     c44      1
//   gAspectRatio         c47      1
//   gFacetCentre         c54      1
//   gShadowParam14151617 c56      1
//   gShadowParam0123     c57      1
//   gShadowParam4567     c58      1
//   gShadowParam891113   c59      1
//   gShadowMatrix        c60      4
//   gWrapScale           c64      1
//   gWrapBias            c65      1
//   gDiffuse             c66      1
//   gExtraLights         c67      1
//   gAmbientAmount       c68      1
//   gSuperAlpha          c69      1
//   gNormalArc           c70      1
//   gUseShadows          c71      1
//   gAmbientShadow       c72      1
//   gLightIntensityClamp c73      1
//   gShadowZSamplerDirVS s3       1
//

    vs_3_0
    def c230, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 3.5578968009e-42 // 2539
    def c32, -1, 0.159154937, 0.5, 0
    def c33, 6.28318548, -3.14159274, 9.99999975e-006, 0.375
    def c34, 0.111111112, -1, -0.100000001, 1.11111116
    def c35, 0.5, -0.5, 0, 0.25
    def c139, 0.0005, 0.5, 0, 0
    def c140, 1e-6, 0.5, -0.0625, 0.9375
    def c141, 0.6, 4, 1, 30
    def c142, 0.003, 0.015, 0.7, 0.5 // density, height falloff, altitude compensation, color mixing
    def c143, 1000, 0, 0, 0
    dcl_position v0
    dcl_normal v1
    dcl_color v2
    dcl_texcoord v3
    dcl_texcoord1 v4
    dcl_texcoord2 v5
    dcl_texcoord3 v6
    dcl_2d s3
    dcl_position o0
    dcl_color o1
    dcl_texcoord o2
    dcl_texcoord1 o3
    dcl_texcoord2 o4
    dcl_texcoord3 o5
    dcl_texcoord4 o6
    mad r0.x, v1.z, c32.y, c32.z
    frc r0.x, r0.x
    mad r0.x, r0.x, c33.x, c33.y
    sincos r1.xy, r0.x
    mul r0.xyz, r1.yyxw, v1.yxyw
    mad r1.x, v1.x, r1.x, -r0.x
    add r1.y, r0.z, r0.y
    rcp r0.x, c44.y
    mul r0.y, r0.x, c44.x
    mov r1.z, c32.w
    mov r0.xz, -c32.x
    mul r2.xyz, r1, r0
    mad r0.xyz, r1, r0, -v0
    add r0.w, c32.x, v1.w
    sge r0.w, -r0_abs.w, r0_abs.w
    mul r1.xyz, r2, r0.w
    mad r0.xyz, r0.w, r0, v0
    mad o0.xyz, v0.xyxw, c32_abs.xxww, r1
    mul r1.xyz, c61.xyww, v0.y
    mad r1.xyz, v0.x, c60.xyww, r1
    mad r1.xyz, v0.z, c62.xyww, r1
    add r1.xyz, r1, c63.xyww
    dp3 r0.w, c14, v0
    sge r2.yzw, -r0.w, c54.xxyz
    mov r2.x, -c32.x
    dp4 r3.x, r2, c57
    dp4 r3.y, r2, c58
    dp4 r4.x, r2, c59
    dp4 r4.y, r2, c56
    mad r2.xy, r1, r3, r4
    mov r2.zw, c32.w
    texldl r2, r2, s3
    mad r1.z, r1.z, -c139.x, c139.y
    add r0.w, r1.z, -r2.x
    slt r0.w, r0.w, c32.w
    mov r1.zw, c32.w
    add r2.x, v1.y, v1.x
    mad r2.yzw, r2.x, c32.xzzw, v0.xxyz
    mul r3.xyz, r2.z, c61.xyww
    mad r3.xyz, r2.y, c60.xyww, r3
    mad r3.xyz, r2.w, c62.xyww, r3
    dp3 r2.y, c14, r2.yzww
    sge r4.yzw, -r2.y, c54.xxyz
    add r2.yzw, r3.xxyz, c63.xxyw
    mov r4.x, -c32.x
    dp4 r3.x, r4, c57
    dp4 r3.y, r4, c58
    dp4 r5.x, r4, c59
    dp4 r5.y, r4, c56
    mad r1.xy, r2.yzzw, r3, r5
    texldl r1, r1, s3
    mad r2.w, r2.w, -c139.x, c139.y
    add r1.x, r2.w, -r1.x
    slt r1.x, r1.x, c32.w
    add r0.w, r0.w, r1.x
    mad r1.xyz, r2.x, c35, v0
    mul r2.yzw, r1.y, c61.xxyw
    mad r2.yzw, r1.x, c60.xxyw, r2
    mad r2.yzw, r1.z, c62.xxyw, r2
    dp3 r1.x, c14, r1
    sge r1.yzw, -r1.x, c54.xxyz
    add r2.yzw, r2, c63.xxyw
    mov r1.x, -c32.x
    dp4 r3.x, r1, c57
    dp4 r3.y, r1, c58
    dp4 r4.x, r1, c59
    dp4 r4.y, r1, c56
    mad r1.xy, r2.yzzw, r3, r4
    mov r1.zw, c32.w
    texldl r1, r1, s3
    mad r2.w, r2.w, -c139.x, c139.y
    add r1.x, r2.w, -r1.x
    slt r1.x, r1.x, c32.w
    add r0.w, r0.w, r1.x
    mad r1.xyz, r2.x, c35.yxzw, v0
    mul r2.yzw, r1.y, c61.xxyw
    mad r2.yzw, r1.x, c60.xxyw, r2
    mad r2.yzw, r1.z, c62.xxyw, r2
    dp3 r1.x, c14, r1
    sge r1.yzw, -r1.x, c54.xxyz
    add r2.yzw, r2, c63.xxyw
    mov r1.x, -c32.x
    dp4 r3.x, r1, c57
    dp4 r3.y, r1, c58
    dp4 r4.x, r1, c59
    dp4 r4.y, r1, c56
    mad r1.xy, r2.yzzw, r3, r4
    mov r1.zw, c32.w
    texldl r1, r1, s3
    mad r2.w, r2.w, -c139.x, c139.y
    add r1.x, r2.w, -r1.x
    slt r1.x, r1.x, c32.w
    add r0.w, r0.w, r1.x
    mad r1.xyz, r2.x, c35.yyzw, v0
    mul r2.yzw, r1.y, c61.xxyw
    mad r2.yzw, r1.x, c60.xxyw, r2
    mad r2.yzw, r1.z, c62.xxyw, r2
    dp3 r1.x, c14, r1
    sge r1.yzw, -r1.x, c54.xxyz
    add r2.yzw, r2, c63.xxyw
    mov r1.x, -c32.x
    dp4 r3.x, r1, c57
    dp4 r3.y, r1, c58
    dp4 r4.x, r1, c59
    dp4 r4.y, r1, c56
    mad r1.xy, r2.yzzw, r3, r4
    mov r1.zw, c32.w
    texldl r1, r1, s3
    mad r2.w, r2.w, -c139.x, c139.y
    add r1.x, r2.w, -r1.x
    slt r1.x, r1.x, c32.w
    add r0.w, r0.w, r1.x
    mad r1.xyz, r2.x, c35.xxww, v0
    mul r2.yzw, r1.y, c61.xxyw
    mad r2.yzw, r1.x, c60.xxyw, r2
    mad r2.yzw, r1.z, c62.xxyw, r2
    dp3 r1.x, c14, r1
    sge r1.yzw, -r1.x, c54.xxyz
    add r2.yzw, r2, c63.xxyw
    mov r1.x, -c32.x
    dp4 r3.x, r1, c57
    dp4 r3.y, r1, c58
    dp4 r4.x, r1, c59
    dp4 r4.y, r1, c56
    mad r1.xy, r2.yzzw, r3, r4
    mov r1.zw, c32.w
    texldl r1, r1, s3
    mad r2.w, r2.w, -c139.x, c139.y
    add r1.x, r2.w, -r1.x
    slt r1.x, r1.x, c32.w
    add r0.w, r0.w, r1.x
    mad r1.xyz, r2.x, c35.xyww, v0
    mul r2.yzw, r1.y, c61.xxyw
    mad r2.yzw, r1.x, c60.xxyw, r2
    mad r2.yzw, r1.z, c62.xxyw, r2
    dp3 r1.x, c14, r1
    sge r1.yzw, -r1.x, c54.xxyz
    add r2.yzw, r2, c63.xxyw
    mov r1.x, -c32.x
    dp4 r3.x, r1, c57
    dp4 r3.y, r1, c58
    dp4 r4.x, r1, c59
    dp4 r4.y, r1, c56
    mad r1.xy, r2.yzzw, r3, r4
    mov r1.zw, c32.w
    texldl r1, r1, s3
    mad r2.w, r2.w, -c139.x, c139.y
    add r1.x, r2.w, -r1.x
    slt r1.x, r1.x, c32.w
    add r0.w, r0.w, r1.x
    mad r1.xyz, r2.x, c35.yxww, v0
    mad r2.xyz, r2.x, c35.yyww, v0
    mul r3.xyz, r1.y, c61.xyww
    mad r3.xyz, r1.x, c60.xyww, r3
    mad r3.xyz, r1.z, c62.xyww, r3
    dp3 r1.x, c14, r1
    sge r1.yzw, -r1.x, c54.xxyz
    add r3.xyz, r3, c63.xyww
    mov r1.x, -c32.x
    dp4 r4.x, r1, c57
    dp4 r4.y, r1, c58
    dp4 r5.x, r1, c59
    dp4 r5.y, r1, c56
    mad r1.xy, r3, r4, r5
    mov r1.zw, c32.w
    texldl r1, r1, s3
    mad r3.z, r3.z, -c139.x, c139.y
    add r1.x, r3.z, -r1.x
    slt r1.x, r1.x, c32.w
    add r0.w, r0.w, r1.x
    mul r1.xyz, r2.y, c61.xyww
    mad r1.xyz, r2.x, c60.xyww, r1
    mad r1.xyz, r2.z, c62.xyww, r1
    dp3 r1.w, c14, r2
    sge r2.yzw, -r1.w, c54.xxyz
    add r1.xyz, r1, c63.xyww
    mov r2.x, -c32.x
    dp4 r3.x, r2, c57
    dp4 r3.y, r2, c58
    dp4 r4.x, r2, c59
    dp4 r4.y, r2, c56
    mad r2.xy, r1, r3, r4
    mov r2.zw, c32.w
    texldl r2, r2, s3
    mad r1.z, r1.z, -c139.x, c139.y
    add r1.x, r1.z, -r2.x
    slt r1.x, r1.x, c32.w
    add r0.w, r0.w, r1.x
    mad r0.w, r0.w, c34.x, c34.y
    mov r1.x, c32.x
    mad r0.w, c71.x, r0.w, -r1.x
    rcp r2.x, c47.x
    rcp r2.y, c47.y
    mov r2.z, -c32.x
    mad r0.xyz, r0, r2, c33.z
    nrm r2.xyz, r0
    mov_sat r0.x, -c17.z
    mul r2.w, r0.x, c33.w
    dp3 r0.x, r2.xyww, -c17
    max r0.x, r0.x, -c73.x
    min r0.x, r0.x, c73.x
    add r0.y, -r0.x, -c32.x
    mad r0.x, c70.x, r0.y, r0.x
    mov r3.x, c64.x
    mad r0.x, r0.x, r3.x, c65.x
    mul r0.x, r0.x, c18.x
    mul r0.x, r0.x, c18.w
    mul r0.x, r0.w, r0.x
    max r0.y, r0.w, c72.x
    mul r0.x, r0.x, c66.x
    mul r0.xzw, r0.x, v2.xyyz
    max r0.xzw, r0, c32.w
    add r0.xzw, r0, v2.xyyz
    mul r1.yzw, c5.xxyz, v0.y
    mad r1.yzw, v0.x, c4.xxyz, r1
    mad r1.yzw, v0.z, c6.xxyz, r1
    add r1.yzw, r1, c7.xxyz
    add r3, -r1.y, c19
    mul r4, r2.x, r3
    add r5, -r1.z, c20
    add r6, -r1.w, c21
    mad r4, r5, r2.y, r4
    mad r4, r6, r2.z, r4
    mad_sat r1.y, r2.y, c35.y, c35.x
    mov r2.xyz, c38
    mad r1.yzw, r2.xxyz, r1.y, c37.xxyz
    mul r1.yzw, r1, c68.x
    mul r1.yzw, r1, v2.xxyz
    max r1.yzw, r1, c32.w
    mul r2, r3, r3
    mul r3, r3, -c22
    mad r3, r5, -c23, r3
    mad r2, r5, r5, r2
    mad r2, r6, r6, r2
    mad r3, r6, -c24, r3
    mad r5, r2, -c25, -r1.x
    add r2, r2, c33.z
    max r5, r5, c32.w
    mul r5, r5, r5
    mad r5, r5, r5, c34.z
    max r5, r5, c32.w
    mul r5, r5, c34.w
    mul r4, r4, r5
    mul r5, r6, r5
    rsq r6.x, r2.x
    rsq r6.y, r2.y
    rsq r6.z, r2.z
    rsq r6.w, r2.w
    mul r2, r4, r6
    mul r3, r3, r6
    mul r4, r5, r6
    mov r5, c26
    mad_sat r3, r3, r5, c27
    mul r2, r2, r3
    mul r3, r4, r3
    dp4 r4.x, c29, r2
    dp4 r4.y, c29, r3
    mad r4.x, r4.y, c35.w, r4.x
    dp4 r4.w, c30, r2
    dp4 r2.x, c31, r2
    dp4 r2.y, c30, r3
    dp4 r2.z, c31, r3
    mad r4.z, r2.z, c35.w, r2.x
    mad r4.y, r2.y, c35.w, r4.w
    mul r2.xyz, r4, v2
    mul r2.xyz, r2, c67.x
    max r2.xyz, r2, c32.w
    add r0.xzw, r0, r2.xyyz
    mad o1.xyz, r1.yzww, r0.y, r0.xzww
    mul_sat o1.w, c69.x, v2.w
    add r0.x, -c16.z, c16.w
    rcp r0.x, r0.x
    add r0.yzw, r1.x, c16.xwxy
    mul_sat r0.x, r0.x, r0.y
    add r0.x, -r0.x, -c32.x
    mad o3.zw, r0.x, r0, -c32.x
    mov r20.x, c143.x
    add r20.x, c41.x, -r20.x
    mul r20.x, r20.x, c236.y
    if_ge r20.x, r20_abs.x
      add r0.x, -c41.x, c41.y
      rcp r0.x, r0.x
      add r0.y, -r1.x, -c41.x
      mul_sat r0.x, r0.x, r0.y
      rcp_sat r0.y, c41.x
      lrp r1.x, c41.w, r0.y, r0.x
      add o5.w, r1.x, c41.z
      mov r1.xyz, c43
      add r0.yzw, -r1.xxyz, c42.xxyz
      mad o5.xyz, r0.x, r0.yzww, c43
    else
      mul r20.xyz, v0.y, c1
      mad r20.xyz, v0.x, c0, r20
      mad r20.xyz, v0.z, c2, r20
      add r20.xyz, r20, c3
    
      add r20.xyz, -c15, r20
      dp3 r20.w, r20, r20
      rsq r20.w, r20.w
      mul r20.xyz, r20, r20.w
      rcp r20.w, r20.w
      
      mov r21.xyz, c228
      mad r21.w, r20.x, c140.y, c140.y
      lrp r22.xyz, r21.w, r21, c229
      mul_sat r21.x, r20.z, c228.w
      mad r21.x, r21.x, -c229.w, c229.w
      mad r21.xyz, r22, r21.x, c234
      
      dp3 r21.w, r20, c232
      
      mad_sat r22.xy, r21.w, c140.zy, c140.wy
      mul r22.z, r22.x, r22.x
      mul r22.x, r22.x, r22.z
      mov r22.z, c141.x
      add_sat r22.z, r22.z, c232_abs.z
      mad r22.x, r22.x, -r22.z, r22.y
      mul_sat r22.x, r22.x, c140.y
      mul r22.x, r22.x, c141.y
      add_sat r22.y, c141.z, -r22.x
      
      mul r23.xyz, r22.x, c231
      mul r23.xyz, r23, r23
      mul r23.xyz, r23, r23
      mad r23.xyz, r22.x, c231, r23
      mul r23.xyz, r23, c231.w
      
      mul r21.xyz, r21, r22.y
      mul_sat r21.xyz, r21, c231.w
      
      add r21.xyz, r21, r23
      mul r21.xyz, r21, c234.w
      min r21.xyz, r21, c141.w
      
      mov r22.xyz, c43
      lrp r22.xyz, c41.w, r22, r21
      
      mov r20.x, c15.z
      mul r20.xy, r20.xz, c235.y
      mul r20.x, r20.x, c235.z
      exp r20.x, -r20.x
      
      sge r21.x, r20_abs.y, c140.x
      lrp r20.y, r21.x, r20.y, c140.x
      rcp r20.z, r20.y
      mul r20.y, r20.y, r20.w
      exp r20.y, -r20.y
      add r20.y, -r20.y, c141.z
      mul r20.y, r20.y, r20.z
      
      mul r20.x, r20.x, r20.y
      mul r20.xy, r20.xw, c235.x
      mul r20.y, r20.y, c142.w
      
      exp r20.x, -r20.x
      exp r20.y, -r20.y
      add r20.xy, -r20.xy, c141.z
      
      lrp r22.xyz, r20.y, r22, c43
      mov o5.xyz, r22
      mov o5.w, r20.x
    endif
    mov o0.w, -c32.x
    mov o2, v3
    mov o3.xy, v4
    mul o4, c32_abs.xwww, v5.z
    mov o6, v6

// approximately 300 instruction slots used (18 texture, 282 arithmetic)
