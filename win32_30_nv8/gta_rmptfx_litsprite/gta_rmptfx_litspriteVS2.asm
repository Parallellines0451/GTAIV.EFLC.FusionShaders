// Summary: remapped shadowmap depth + added volumetric fog
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   float4 NearFarPlane;
//   float gAmbientAmount;
//   float gAmbientShadow;
//   float4 gAspectRatio;
//   float gBiasToCamera;
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
//   float gScaleFade;
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
//   row_major float4x4 gWorldViewProj;
//   float gWrapBias;
//   float gWrapScale;
//   float4 globalFogColor;
//   float4 globalFogColorN;
//   float4 globalFogParams;
//
//
// Registers:
//
//   Name                 Reg   Size
//   -------------------- ----- ----
//   gWorld               c0       4
//   gWorldView           c4       4
//   gWorldViewProj       c8       4
//   gViewInverse         c12      4
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
//   gAspectRatio         c47      1
//   gFacetCentre         c54      1
//   gShadowParam14151617 c56      1
//   gShadowParam0123     c57      1
//   gShadowParam4567     c58      1
//   gShadowParam891113   c59      1
//   gShadowMatrix        c60      4
//   gBiasToCamera        c64      1
//   gWrapScale           c65      1
//   gWrapBias            c66      1
//   gDiffuse             c67      1
//   gExtraLights         c68      1
//   gAmbientAmount       c69      1
//   gSuperAlpha          c70      1
//   gNormalArc           c71      1
//   gScaleFade           c72      1
//   gUseShadows          c73      1
//   gAmbientShadow       c74      1
//   gLightIntensityClamp c75      1
//   NearFarPlane         c128     1
//   gShadowZSamplerDirVS s3       1
//

    vs_3_0
    def c230, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 3.5564955025e-42 // 2538
    def c32, 0.100000001, 9.99999997e-007, 0.159154937, 0.5
    def c33, 6.28318548, -3.14159274, 0, 9.99999975e-006
    def c34, 0.111111112, -1, 1.11111116, 0
    def c35, 1, 0.5, 0, -0.5
    def c12, 0.5, 0.25, -0.5, 0.375
    def c139, 0.0005, 0.5, 0, 0
    def c140, 1e-6, 0.5, -0.0625, 0.9375
    def c141, 0.6, 4, 1, 30
    def c142, 1000, 0, 0, 0
    dcl_position v0
    dcl_normal v1
    dcl_color v2
    dcl_texcoord v3
    dcl_texcoord1 v4
    dcl_texcoord2 v5
    dcl_texcoord3 v6
    dcl_2d s3
    dcl_position o0
    dcl_texcoord9 o10
    dcl_color o1
    dcl_texcoord o2
    dcl_texcoord1 o3
    dcl_texcoord2 o4
    dcl_texcoord3 o5
    dcl_texcoord4 o6
    mov r0.zw, c33.z
    mov r1.x, c32.x
    mul r1.x, r1.x, c64.x
    lrp r2.xyz, r1.x, c15, v0
    
    mul r20.xyz, r2.y, c1
    mad r20.xyz, r2.x, c0, r20
    mad r20.xyz, r2.z, c2, r20
    add r20.xyz, r20, c3
    
    mul r1.xyz, r2.y, c61.xyww
    mad r1.xyz, r2.x, c60.xyww, r1
    mad r1.xyz, r2.z, c62.xyww, r1
    add r1.xyz, r1, c63.xyww
    mov r3.x, c35.x
    dp3 r1.w, c14, r2
    sge r3.yzw, -r1.w, c54.xxyz
    dp4 r4.x, r3, c57
    dp4 r4.y, r3, c58
    dp4 r5.x, r3, c59
    dp4 r5.y, r3, c56
    mad r0.xy, r1, r4, r5
    texldl r0, r0, s3
    mad r1.z, r1.z, -c139.x, c139.y
    add r0.x, r1.z, -r0.x
    slt r0.x, r0.x, c33.z
    mov r1.zw, c33.z
    sge r0.y, c32.y, v2.w
    rcp r0.z, c72.x
    mul r3, r2.y, c9
    mad r3, r2.x, c8, r3
    mad r3, r2.z, c10, r3
    add r3, r3, c11
    add r0.w, r3.w, -c128.x
    mul_sat r0.z, r0.z, r0.w
    mad r0.y, r0.y, -r0.z, r0.z
    mul r4, r0.y, v1.xyxy
    mul r0.y, r0.y, v2.w
    mul_sat o1.w, r0.y, c70.x
    add r0.y, r4.w, r4.z
    mad r5.xyz, r0.y, c35.yyzw, r2
    mul r6.xyz, r5.y, c61.xyww
    mad r6.xyz, r5.x, c60.xyww, r6
    mad r6.xyz, r5.z, c62.xyww, r6
    dp3 r0.z, c14, r5
    sge r5.yzw, -r0.z, c54.xxyz
    add r6.xyz, r6, c63.xyww
    mov r5.x, c35.x
    dp4 r7.x, r5, c57
    dp4 r7.y, r5, c58
    dp4 r8.x, r5, c59
    dp4 r8.y, r5, c56
    mad r1.xy, r6, r7, r8
    texldl r1, r1, s3
    mad r6.z, r6.z, -c139.x, c139.y
    add r0.z, r6.z, -r1.x
    slt r0.z, r0.z, c33.z
    add r0.x, r0.x, r0.z
    mov r1.zw, c33.z
    mad r5.xyz, r0.y, c35.ywzw, r2
    mul r6.xyz, r5.y, c61.xyww
    mad r6.xyz, r5.x, c60.xyww, r6
    mad r6.xyz, r5.z, c62.xyww, r6
    dp3 r0.z, c14, r5
    sge r5.yzw, -r0.z, c54.xxyz
    add r6.xyz, r6, c63.xyww
    mov r5.x, c35.x
    dp4 r7.x, r5, c57
    dp4 r7.y, r5, c58
    dp4 r8.x, r5, c59
    dp4 r8.y, r5, c56
    mad r1.xy, r6, r7, r8
    texldl r1, r1, s3
    mad r6.z, r6.z, -c139.x, c139.y
    add r0.z, r6.z, -r1.x
    slt r0.z, r0.z, c33.z
    add r0.x, r0.x, r0.z
    mov r1.zw, c33.z
    mad r5.xyz, r0.y, c35.wyzw, r2
    mul r6.xyz, r5.y, c61.xyww
    mad r6.xyz, r5.x, c60.xyww, r6
    mad r6.xyz, r5.z, c62.xyww, r6
    dp3 r0.z, c14, r5
    sge r5.yzw, -r0.z, c54.xxyz
    add r6.xyz, r6, c63.xyww
    mov r5.x, c35.x
    dp4 r7.x, r5, c57
    dp4 r7.y, r5, c58
    dp4 r8.x, r5, c59
    dp4 r8.y, r5, c56
    mad r1.xy, r6, r7, r8
    texldl r1, r1, s3
    mad r6.z, r6.z, -c139.x, c139.y
    add r0.z, r6.z, -r1.x
    slt r0.z, r0.z, c33.z
    add r0.x, r0.x, r0.z
    mov r1.zw, c33.z
    mad r5.xyz, r0.y, c35.wwzw, r2
    mul r6.xyz, r5.y, c61.xyww
    mad r6.xyz, r5.x, c60.xyww, r6
    mad r6.xyz, r5.z, c62.xyww, r6
    dp3 r0.z, c14, r5
    sge r5.yzw, -r0.z, c54.xxyz
    add r6.xyz, r6, c63.xyww
    mov r5.x, c35.x
    dp4 r7.x, r5, c57
    dp4 r7.y, r5, c58
    dp4 r8.x, r5, c59
    dp4 r8.y, r5, c56
    mad r1.xy, r6, r7, r8
    texldl r1, r1, s3
    mad r6.z, r6.z, -c139.x, c139.y
    add r0.z, r6.z, -r1.x
    slt r0.z, r0.z, c33.z
    add r0.x, r0.x, r0.z
    mad r1.xyz, r0.y, c12.xxyw, r2
    mul r5.xyz, r1.y, c61.xyww
    mad r5.xyz, r1.x, c60.xyww, r5
    mad r5.xyz, r1.z, c62.xyww, r5
    dp3 r0.z, c14, r1
    sge r1.yzw, -r0.z, c54.xxyz
    add r5.xyz, r5, c63.xyww
    mov r1.x, c35.x
    dp4 r6.x, r1, c57
    dp4 r6.y, r1, c58
    dp4 r7.x, r1, c59
    dp4 r7.y, r1, c56
    mad r1.xy, r5, r6, r7
    mov r1.zw, c33.z
    texldl r1, r1, s3
    mad r5.z, r5.z, -c139.x, c139.y
    add r0.z, r5.z, -r1.x
    slt r0.z, r0.z, c33.z
    add r0.x, r0.x, r0.z
    mad r1.xyz, r0.y, c12.xzyw, r2
    mul r5.xyz, r1.y, c61.xyww
    mad r5.xyz, r1.x, c60.xyww, r5
    mad r5.xyz, r1.z, c62.xyww, r5
    dp3 r0.z, c14, r1
    sge r1.yzw, -r0.z, c54.xxyz
    add r5.xyz, r5, c63.xyww
    mov r1.x, c35.x
    dp4 r6.x, r1, c57
    dp4 r6.y, r1, c58
    dp4 r7.x, r1, c59
    dp4 r7.y, r1, c56
    mad r1.xy, r5, r6, r7
    mov r1.zw, c33.z
    texldl r1, r1, s3
    mad r5.z, r5.z, -c139.x, c139.y
    add r0.z, r5.z, -r1.x
    slt r0.z, r0.z, c33.z
    add r0.x, r0.x, r0.z
    mad r1.xyz, r0.y, c12.zxyw, r2
    mad r0.yzw, r0.y, c12.xzzy, r2.xxyz
    mul r5.xyz, r1.y, c61.xyww
    mad r5.xyz, r1.x, c60.xyww, r5
    mad r5.xyz, r1.z, c62.xyww, r5
    dp3 r1.x, c14, r1
    sge r1.yzw, -r1.x, c54.xxyz
    add r5.xyz, r5, c63.xyww
    mov r1.x, c35.x
    dp4 r6.x, r1, c57
    dp4 r6.y, r1, c58
    dp4 r7.x, r1, c59
    dp4 r7.y, r1, c56
    mad r1.xy, r5, r6, r7
    mov r1.zw, c33.z
    texldl r1, r1, s3
    mad r5.z, r5.z, -c139.x, c139.y
    add r1.x, r5.z, -r1.x
    slt r1.x, r1.x, c33.z
    add r0.x, r0.x, r1.x
    mul r1.xyz, r0.z, c61.xyww
    mad r1.xyz, r0.y, c60.xyww, r1
    mad r1.xyz, r0.w, c62.xyww, r1
    dp3 r0.y, c14, r0.yzww
    sge r5.yzw, -r0.y, c54.xxyz
    add r0.yzw, r1.xxyz, c63.xxyw
    mov r5.x, c35.x
    dp4 r1.x, r5, c57
    dp4 r1.y, r5, c58
    dp4 r6.x, r5, c59
    dp4 r6.y, r5, c56
    mad r1.xy, r0.yzzw, r1, r6
    mov r1.zw, c33.z
    texldl r1, r1, s3
    mad r0.w, r0.w, -c139.x, c139.y
    add r0.y, r0.w, -r1.x
    slt r0.y, r0.y, c33.z
    add r0.x, r0.x, r0.y
    mad r0.x, r0.x, c34.x, c34.y
    mov r1.x, c35.x
    mad r0.x, c73.x, r0.x, r1.x
    mov_sat r0.y, -c17.z
    mul r5.w, r0.y, c12.w
    mad r0.y, v1.z, c32.z, c32.w
    frc r0.y, r0.y
    mad r0.y, r0.y, c33.x, c33.y
    sincos r6.xy, r0.y
    mul r0.yzw, r4, r6.xyyx
    mad r4.x, r4.x, r6.x, -r0.y
    add r4.y, r0.w, r0.z
    mul r0.yz, r4.xxyw, c47.xxyw
    rcp r6.x, c47.x
    rcp r6.y, c47.y
    mul r6.xy, r0.yzzw, r6
    mov r6.z, c33.z
    add r0.yzw, r6.xxyz, c33.w
    nrm r5.xyz, r0.yzww
    dp3 r0.y, r5.xyww, -c17
    max r0.y, r0.y, -c75.x
    min r0.y, r0.y, c75.x
    add r0.z, -r0.y, c35.x
    mad r0.y, c71.x, r0.z, r0.y
    mov r6.x, c65.x
    mad r0.y, r0.y, r6.x, c66.x
    mul r0.y, r0.y, c18.x
    mul r0.y, r0.y, c18.w
    mul r0.y, r0.x, r0.y
    max r0.x, r0.x, c74.x
    mul r0.y, r0.y, c67.x
    mul r0.yzw, r0.y, v2.xxyz
    max r0.yzw, r0, c33.z
    add r0.yzw, r0, v2.xxyz
    mul r1.yzw, r2.y, c5.xxyz
    mad r1.yzw, r2.x, c4.xxyz, r1
    mad r1.yzw, r2.z, c6.xxyz, r1
    add r1.yzw, r1, c7.xxyz
    add r2, -r1.y, c19
    mul r6, r5.x, r2
    add r7, -r1.z, c20
    add r8, -r1.w, c21
    mad r6, r7, r5.y, r6
    mad r6, r8, r5.z, r6
    mad_sat r1.y, r5.y, c35.w, c35.y
    mov r5.xyz, c38
    mad r1.yzw, r5.xxyz, r1.y, c37.xxyz
    mul r1.yzw, r1, c69.x
    mul r1.yzw, r1, v2.xxyz
    max r1.yzw, r1, c33.z
    mul r5, r2, r2
    mul r2, r2, -c22
    mad r2, r7, -c23, r2
    mad r5, r7, r7, r5
    mad r5, r8, r8, r5
    mad r2, r8, -c24, r2
    mad r7, r5, -c25, r1.x
    add r5, r5, c33.w
    max r7, r7, c33.z
    mul r7, r7, r7
    mad r7, r7, r7, -c32.x
    max r7, r7, c33.z
    mul r7, r7, c34.z
    mul r6, r6, r7
    mul r7, r8, r7
    rsq r8.x, r5.x
    rsq r8.y, r5.y
    rsq r8.z, r5.z
    rsq r8.w, r5.w
    mul r5, r6, r8
    mul r2, r2, r8
    mul r6, r7, r8
    mov r7, c26
    mad_sat r2, r2, r7, c27
    mul r5, r5, r2
    mul r2, r6, r2
    dp4 r6.x, c29, r5
    dp4 r6.y, c29, r2
    mad r6.x, r6.y, c12.y, r6.x
    dp4 r6.w, c30, r2
    dp4 r2.x, c31, r2
    dp4 r2.y, c30, r5
    dp4 r2.z, c31, r5
    mad r6.z, r2.x, c12.y, r2.z
    mad r6.y, r6.w, c12.y, r2.y
    mul r2.xyz, r6, v2
    mul r2.xyz, r2, c68.x
    max r2.xyz, r2, c33.z
    add r0.yzw, r0, r2.xxyz
    mad o1.xyz, r1.yzww, r0.x, r0.yzww
    mov r4.zw, c33.z
    mad r0, r4, c47, r3
    mov o0, r0
    mov o10.zw, r0
    mov o4.y, r3.w
    add r1.y, -r0.w, c16.w
    add r1.z, -c16.z, c16.w
    rcp r1.z, r1.z
    mul_sat r1.y, r1.y, r1.z
    add r1.y, -r1.y, c35.x
    add r1.xz, -r1.x, c16.xyyw
    mad o3.zw, r1.y, r1.xyxz, c35.x
    mov r20.x, c142.x
    add r20.x, c41.x, -r20.x
    mul r20.x, r20.x, c236.y
    if_ge r20.x, r20_abs.x
      rcp r1.x, c41.x
      mul_sat r1.x, r0.w, r1.x
      add r1.y, r0.w, -c41.x
      add r0.x, -c41.x, c41.y
      rcp r0.x, r0.x
      mul_sat r0.x, r1.y, r0.x
      lrp r2.x, c41.w, r1.x, r0.x
      add o5.w, r2.x, c41.z
      mov r1.xyz, c43
      add r0.yzw, -r1.xxyz, c42.xxyz
      mad o5.xyz, r0.x, r0.yzww, c43
    else
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
      mul r20.x, r20.x, c236.x
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
      
      exp r20.x, -r20.x
      exp r20.y, -r20.y
      add r20.xy, -r20.xy, c141.z
      
      log r20.x, r20.x
      log r20.y, r20.y
      mul r20.xy, r20.xy, c235.zw
      exp r20.x, r20.x
      exp r20.y, r20.y
      
      lrp r22.xyz, r20.y, r22, c43
      mov o5.xyz, r22
      mov o5.w, r20.x
    endif
    mov o2, v3
    mov o3.xy, v4
    mul o4.xzw, c35.xyzz, v5.z
    mov o6, v6
    mov r20.x, c8.w
    add r20.x, r20.x, c9.w
    add r20.x, r20.x, c10.w
    add o10.y, r20.x, c11.w
    
// approximately 310 instruction slots used (18 texture, 292 arithmetic)
