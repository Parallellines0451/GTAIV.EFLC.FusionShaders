// Summary: removed unnecessary stipple + improved shadow filter + restored normal offset bias + improved shadow fadeout
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D BumpSampler;
//   sampler2D SpecSampler;
//   sampler2D StippleTexture;
//   sampler2D TextureSampler;
//   float bumpiness;
//   sampler2D damageSpecTextureSampler;
//   sampler2D damageTextureSampler;
//   float4 gDepthFxParams;
//   float4 gDirectionalColour;
//   float4 gDirectionalLight;
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
//   float4 gLightPosX;
//   float4 gLightPosY;
//   float4 gLightPosZ;
//   row_major float4x4 gShadowMatrix;
//   float4 gShadowParam0123;
//   float4 gShadowParam14151617;
//   float4 gShadowParam18192021;
//   float4 gShadowParam4567;
//   float4 gShadowParam891113;
//   sampler2D gShadowZSamplerDir;
//   row_major float4x4 gViewInverse;
//   float4 globalFogColor;
//   float4 globalFogColorN;
//   float4 globalFogParams;
//   float4 globalScalars;
//   float4 matMaterialColorScale;
//   float3 specMapIntMask;
//   float specularColorFactor;
//   float specularFactor;
//
//
// Registers:
//
//   Name                     Reg   Size
//   ------------------------ ----- ----
//   gViewInverse             c12      4
//   gDepthFxParams           c16      1
//   gDirectionalLight        c17      1
//   gDirectionalColour       c18      1
//   gLightPosX               c19      1
//   gLightPosY               c20      1
//   gLightPosZ               c21      1
//   gLightDirX               c22      1
//   gLightDirY               c23      1
//   gLightDirZ               c24      1
//   gLightFallOff            c25      1
//   gLightConeScale          c26      1
//   gLightConeOffset         c27      1
//   gLightColR               c29      1
//   gLightColG               c30      1
//   gLightColB               c31      1
//   gLightAmbient0           c37      1
//   gLightAmbient1           c38      1
//   globalScalars            c39      1
//   globalFogParams          c41      1
//   globalFogColor           c42      1
//   globalFogColorN          c43      1
//   gShadowParam18192021     c53      1
//   gFacetCentre             c54      1
//   gShadowParam14151617     c56      1
//   gShadowParam0123         c57      1
//   gShadowParam4567         c58      1
//   gShadowParam891113       c59      1
//   gShadowMatrix            c60      4
//   matMaterialColorScale    c66      1
//   specularFactor           c72      1
//   specularColorFactor      c73      1
//   specMapIntMask           c74      1
//   bumpiness                c75      1
//   TextureSampler           s0       1
//   damageTextureSampler     s1       1
//   damageSpecTextureSampler s2       1
//   BumpSampler              s4       1
//   SpecSampler              s5       1
//   StippleTexture           s10      1
//   gShadowZSamplerDir       s15      1
//

    ps_3_0
    // -------------------------------------------------------------- Shadow Constants --------------------------------------------------------------
    def c110, -0.25, 1, -1, 0
    def c111, 0.159154937, 0.5, 6.28318548, -3.14159274
    def c112, 3, 7.13800001, 0.03125, 0
    def c113, 0.75, -0.5, 0.5, 0
    
    def c114, 0.14, 0.24, 0.5, 0.75 // static bias
    def c115, 0.24, 0.44, 1.1, 1.15
    def c116, 0.3, 0.54, 1.1, 0.95
    def c117, 0.64, 1.04, 2.2, 2.3
    
    def c118, 8, 0.3, 0, 0 // normal offset bias and blend params
    
    def c119, 0, 0.25, 0.5, 0.75 // UV clamps
    def c120, 0.2499, 0.4999, 0.7499, 1
    
    def c130, 0.18993645671348536, 0.027087114076591513, -0.21261242652069953, 0.23391293246949066
    def c131, 0.04771781344140756, -0.3666840644525993, 0.297730981239584, 0.398259878229082
    def c132, -0.509063425827436, -0.06528681462854097, 0.507855152944665, -0.2875976005206389
    def c133, -0.15230616564632418, 0.6426121151781916, -0.30240170651828074, -0.5805072900736001
    def c134, 0.6978019230005561, 0.2771173334141519, -0.6990963248129052, 0.3210960724922725
    def c135, 0.3565142601623699, -0.7066415061851589, 0.266890002328106, 0.8360191043249159
    def c136, -0.7515861305520581, -0.41609876195815027, 0.9102937449894895, -0.17014527555321657
    def c137, -0.5343471434373126, 0.8058593459499529, -0.1133270115046468, -0.9490025827627441
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 6.7122196441e-43 // 479
    def c127, 0.9999999, 1, 0, 0 // LogDepth constants
    def c0, 1, -0.5, 9.99999975e-006, 0
    def c1, 0.333333343, -0.5, 0.5, -0.25
    def c2, 1.33333337, 1.5, -0.326211989, -0.405809999
    def c3, 9.99999975e-005, 0.212500006, 0.715399981, 0.0720999986
    def c4, -0.791558981, -0.597710013, 0.0833333358, -0.100000001
    def c5, 1.11111116, 3.99600005, 4, 0.125
    def c6, 1.00000001e-007, 0, 0, 0
    def c7, 1, -1, 0, -0
    def c8, 0.896420002, 0.412458003, -0.321940005, -0.932614982
    def c9, 0.185461, -0.893123984, 0.507430971, 0.0644249991
    def c10, 0.473434001, -0.480026007, 0.519456029, 0.767022014
    def c11, -0.203345001, 0.620715976, 0.962339997, -0.194983006
    def c12, -0.840143979, -0.0735799968, -0.69591397, 0.457136989
    dcl_texcoord v0.xy
    dcl_texcoord1 v1
    dcl_texcoord3 v2.xyz
    dcl_texcoord4 v3.xyz
    dcl_texcoord5 v4.xyz
    dcl_color v5.xw
    dcl_texcoord6 v6.x
    dcl_texcoord2 v7.xyz
    dcl vPos.xy
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s1
    dcl_2d s2
    dcl_2d s4
    dcl_2d s5
    dcl_2d s10
    dcl_2d s15
    texld r0, v0, s4
    add r0.z, -r0.w, c0.x
    add r0.z, -r0.x, r0.z
    cmp r0.xy, r0.z, r0.wyzw, r0
    texld r1, v0, s0
    add r0.zw, r0.xyxy, c0.y
    mul r0.zw, r0, c75.x
    dp2add r0.x, r0, -r0, c0.x
    rsq r0.x, r0.x
    rcp r0.x, r0.x
    mul r2.xyz, r0.z, v3
    mad r0.xyz, v1, r0.x, r2
    mad r0.xyz, r0.w, v4, r0
    add r0.xyz, r0, c0.z
    nrm r2.xyz, r0
    texld r0, v0, s5
    mul r0.w, r0.w, c72.x
    dp3 r0.x, r0, c74
    mul r0.x, r0.x, c73.x
    if_lt -v6.x, c0.w
      texld r3, v0, s1
      if_lt -r3.w, c0.w
        texld r4, v0, s2
        add r0.y, c0.x, -v6.x
        mul r0.z, r4.w, c72.x
        lrp r2.w, v6.x, r0.z, r0.w
        add r0.z, r4.y, r4.x
        add r0.z, r4.z, r0.z
        mul r0.z, r0.z, v6.x
        mul r0.z, r0.z, c73.x
        mul r0.z, r0.z, c1.x
        mad r0.x, r0.y, r0.x, r0.z
        mad r0.y, r3.w, -v6.x, c0.x
        mul r3.xyz, r3.w, r3
        mul r3.xyz, r3, v6.x
        mad r1.xyz, r1, r0.y, r3
        mov r0.w, r2.w
      endif
    endif
    mad_sat r0.y, r2.z, c1.y, c1.z
    mov r3.xyz, c38
    mad r3.xyz, r3, r0.y, c37
    mul r4.xyz, c18.w, c18
    dp3 r0.y, r2, -c17
    mul r20.xyz, r2.y, c61.xyww
    mad r20.xyz, r2.x, c60.xyww, r20
    mad r20.xyz, r2.z, c62.xyww, r20
    add r0.y, r0.y, c1.w
    mul_sat r0.y, r0.y, c2.x
    mul r5.xyz, c61.xyww, v7.y
    mad r5.xyz, v7.x, c60.xyww, r5
    mad r5.xyz, v7.z, c62.xyww, r5
    add r5.xyz, r5, c63.xyww
    dp3 r0.z, c14, v7
    add r6.xyz, -r0.z, -c54
    cmp r6.yzw, r6.xxyz, c0.x, c0.w
    mov r6.x, c0.x
    mad r21, r6, c110.yyyw, -r6.yzww // shadow cascade mask
    // ---------------------------------------------------------------- Shadow Fixes -----------------------------------------------------------------
    add r22, c54.w, -c54
    add r22, c53.w, -r22 // cascade ranges
    dp4 r23.x, r21_abs, r22
    dp4 r23.y, r21_abs, r22.yzww
    
    rcp r23.z, r22.x
    mul r23.zw, r23.xyxy, r23.z // (curr_range, next_range) / first_range
    mul r24.x, r22.x, c53.y
    mul r24.x, r24.x, c218_abs.y
    mul r23.zw, r23, r24.x // bias magnitude
    
    mad r24, r22.xxyz, -c110.wyyy, r22
    dp4 r24.x, r21_abs, r24 // curr_range - prev_range
    mul r24.x, r24.x, c218_abs.z
    rcp r24.z, r24.x
    add r24.x, r23.x, -r24.x
    add r24.x, v9.w, -r24.x
    mul_sat r24.x, r24.x, r24.z // blending factor
    
    rcp r24.z, r23.x
    mul r23.xy, r23.xy, r24.z // 1.0, next_range / curr_range
    
    lrp r22.xy, r24.x, r23.yw, r23.xz
    
    m4x4 r24, r21_abs, c114
    dp4 r24.x, r24, c220
    add r5.z, r5.z, -r24.x // undo static bias
    
    mul r22.y, r22.y, c223.y // scale bias with FOV
    mad r5.xyz, r20.xyz, r22.y, r5 // normal offset bias
    
    mul r20.xy, r22.x, c53.y
    rcp r20.x, c58.x
    mul r20.x, r20.x, c57.x
    mul r20.x, r20.x, r20.y // fix filter stretching
    
    mul r20.xy, r20.xy, c218_abs.x
    
    dp4 r20.z, r21_abs, c119 // fix pixels leaking into other cascades
    dp4 r20.w, r21_abs, c120
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    dp4 r7.x, r6, c57
    dp4 r7.y, r6, c58
    dp4 r8.x, r6, c59
    dp4 r8.y, r6, c56
    mad r5.xy, r5, r7, r8
    add r6.xyz, c15, -v7
    dp3 r0.z, r6, r6
    rsq r0.z, r0.z
    rcp r0.z, r0.z
    /* removed 1.0.6.0 filter
    rcp r2.w, c53.w
    mul r2.w, r0.z, r2.w
    mul r2.w, r2.w, r2.w
    mul r2.w, r2.w, c2.y
    mov r6.y, c53.y
    mad r6.xz, r6.y, c2.zyww, r5.xyyw
    texld r7, r6.xzzw, s15
    add r3.w, r5.z, -r7.x
    cmp r3.w, r3.w, c0.x, c0.w
    mad r6.xz, r6.y, c12.xyyw, r5.xyyw
    texld r7, r6.xzzw, s15
    add r4.w, r5.z, -r7.x
    cmp r4.w, r4.w, c0.x, c0.w
    add r3.w, r3.w, r4.w
    mad r6.xz, r6.y, c12.zyww, r5.xyyw
    texld r7, r6.xzzw, s15
    add r4.w, r5.z, -r7.x
    cmp r4.w, r4.w, c0.x, c0.w
    add r3.w, r3.w, r4.w
    mad r6.xz, r6.y, c11.xyyw, r5.xyyw
    texld r7, r6.xzzw, s15
    add r4.w, r5.z, -r7.x
    cmp r4.w, r4.w, c0.x, c0.w
    add r3.w, r3.w, r4.w
    mad r6.xz, r6.y, c11.zyww, r5.xyyw
    texld r7, r6.xzzw, s15
    add r4.w, r5.z, -r7.x
    cmp r4.w, r4.w, c0.x, c0.w
    add r3.w, r3.w, r4.w
    mad r6.xz, r6.y, c10.xyyw, r5.xyyw
    texld r7, r6.xzzw, s15
    add r4.w, r5.z, -r7.x
    cmp r4.w, r4.w, c0.x, c0.w
    add r3.w, r3.w, r4.w
    mad r6.xz, r6.y, c10.zyww, r5.xyyw
    texld r7, r6.xzzw, s15
    add r4.w, r5.z, -r7.x
    cmp r4.w, r4.w, c0.x, c0.w
    add r3.w, r3.w, r4.w
    mad r6.xz, r6.y, c9.xyyw, r5.xyyw
    texld r7, r6.xzzw, s15
    add r4.w, r5.z, -r7.x
    cmp r4.w, r4.w, c0.x, c0.w
    add r3.w, r3.w, r4.w
    mad r6.xz, r6.y, c9.zyww, r5.xyyw
    texld r7, r6.xzzw, s15
    add r4.w, r5.z, -r7.x
    cmp r4.w, r4.w, c0.x, c0.w
    add r3.w, r3.w, r4.w
    mad r6.xz, r6.y, c8.xyyw, r5.xyyw
    texld r7, r6.xzzw, s15
    add r4.w, r5.z, -r7.x
    cmp r4.w, r4.w, c0.x, c0.w
    add r3.w, r3.w, r4.w
    mad r6.xz, r6.y, c8.zyww, r5.xyyw
    texld r7, r6.xzzw, s15
    add r4.w, r5.z, -r7.x
    cmp r4.w, r4.w, c0.x, c0.w
    add r3.w, r3.w, r4.w
    mad r5.xy, r6.y, c4, r5
    texld r6, r5, s15
    add r4.w, r5.z, -r6.x
    cmp r4.w, r4.w, c0.x, c0.w
    add r3.w, r3.w, r4.w
    mad r2.w, r3.w, c4.z, r2.w
    add r0.z, r0.z, -c53.w
    cmp r5.xy, r0.z, c7, c7.zwzw
    add r0.z, r2.w, r5.y
    cmp_sat r0.z, r0.z, r2.w, r5.x
    removed 1.0.6.0 filter */
    // ---------------------------------------------------------- Improved Shadow Filter ------------------------------------------------------------
    mov r21.x, c110.y
    if_lt c223.z, r21.x
      dp2add r21.y, vPos, c112.xy, c112.w
      mad r21.y, r21.y, c111.x, c111.y
      frc r21.y, r21.y
      mad r21.y, r21.y, c111.z, c111.w
      sincos r22.xy, r21.y
      mul r23, r22.yxxy, c110.xxyz
      mul r21, r22.yxxy, c113.xxyz
      mad r23, r23, r20.xyxy, r5.xyxy
      mad r21, r21, r20.xyxy, r5.xyxy
      max r23.xz, r23, r20.z
      min r23.xz, r23, r20.w
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r25, r23.xy, s15
      texldl r24, r21.zw, s15
      mov r25.y, r24.x
      texldl r24, r21.xy, s15
      mov r25.z, r24.x
      texldl r24, r23.zw, s15
      mov r25.w, r24.x
      add r25, r5.z, -r25
      cmp r25, r25, c110.y, c110.w
      dp4 r20.x, r25, -c110.x
    else
      mul r24.xy, vPos.xy, c112.z
      texldl r24, r24, s10
      mul r24.x, r24.z, c111.z
      sincos r25.xy, r24.x
      mul r25, r25.xyyx, c110.yzyy
      mul r26, c130.xyxy, r25
      add r27.xy, r26.xzxz, r26.ywyw
      mul r26, c130.zwzw, r25
      add r27.zw, r26.xzxz, r26.ywyw
      mad r26, r27, r20.xyxy, r5.xyxy
      max r26.xz, r26, r20.z
      min r26.xz, r26, r20.w
      texldl r28, r26.xy, s15
      texldl r27, r26.zw, s15
      mov r28.y, r27.x
      mul r26, c131.xyxy, r25
      add r27.xy, r26.xzxz, r26.ywyw
      mul r26, c131.zwzw, r25
      add r27.zw, r26.xzxz, r26.ywyw
      mad r26, r27, r20.xyxy, r5.xyxy
      max r26.xz, r26, r20.z
      min r26.xz, r26, r20.w
      texldl r27, r26.xy, s15
      mov r28.z, r27.x
      texldl r27, r26.zw, s15
      mov r28.w, r27.x
      add r28, r5.z, -r28
      cmp r28, r28, c110.y, c110.w
      dp4 r29.x, r28, -c110.x
      mul r26, c132.xyxy, r25
      add r27.xy, r26.xzxz, r26.ywyw
      mul r26, c132.zwzw, r25
      add r27.zw, r26.xzxz, r26.ywyw
      mad r26, r27, r20.xyxy, r5.xyxy
      max r26.xz, r26, r20.z
      min r26.xz, r26, r20.w
      texldl r28, r26.xy, s15
      texldl r27, r26.zw, s15
      mov r28.y, r27.x
      mul r26, c133.xyxy, r25
      add r27.xy, r26.xzxz, r26.ywyw
      mul r26, c133.zwzw, r25
      add r27.zw, r26.xzxz, r26.ywyw
      mad r26, r27, r20.xyxy, r5.xyxy
      max r26.xz, r26, r20.z
      min r26.xz, r26, r20.w
      texldl r27, r26.xy, s15
      mov r28.z, r27.x
      texldl r27, r26.zw, s15
      mov r28.w, r27.x
      add r28, r5.z, -r28
      cmp r28, r28, c110.y, c110.w
      dp4 r29.y, r28, -c110.x
      mul r26, c134.xyxy, r25
      add r27.xy, r26.xzxz, r26.ywyw
      mul r26, c134.zwzw, r25
      add r27.zw, r26.xzxz, r26.ywyw
      mad r26, r27, r20.xyxy, r5.xyxy
      max r26.xz, r26, r20.z
      min r26.xz, r26, r20.w
      texldl r28, r26.xy, s15
      texldl r27, r26.zw, s15
      mov r28.y, r27.x
      mul r26, c135.xyxy, r25
      add r27.xy, r26.xzxz, r26.ywyw
      mul r26, c135.zwzw, r25
      add r27.zw, r26.xzxz, r26.ywyw
      mad r26, r27, r20.xyxy, r5.xyxy
      max r26.xz, r26, r20.z
      min r26.xz, r26, r20.w
      texldl r27, r26.xy, s15
      mov r28.z, r27.x
      texldl r27, r26.zw, s15
      mov r28.w, r27.x
      add r28, r5.z, -r28
      cmp r28, r28, c110.y, c110.w
      dp4 r29.z, r28, -c110.x
      mul r26, c136.xyxy, r25
      add r27.xy, r26.xzxz, r26.ywyw
      mul r26, c136.zwzw, r25
      add r27.zw, r26.xzxz, r26.ywyw
      mad r26, r27, r20.xyxy, r5.xyxy
      max r26.xz, r26, r20.z
      min r26.xz, r26, r20.w
      texldl r28, r26.xy, s15
      texldl r27, r26.zw, s15
      mov r28.y, r27.x
      mul r26, c137.xyxy, r25
      add r27.xy, r26.xzxz, r26.ywyw
      mul r26, c137.zwzw, r25
      add r27.zw, r26.xzxz, r26.ywyw
      mad r26, r27, r20.xyxy, r5.xyxy
      max r26.xz, r26, r20.z
      min r26.xz, r26, r20.w
      texldl r27, r26.xy, s15
      mov r28.z, r27.x
      texldl r27, r26.zw, s15
      mov r28.w, r27.x
      add r28, r5.z, -r28
      cmp r28, r28, c110.y, c110.w
      dp4 r29.w, r28, -c110.x
      dp4 r20.x, r29, -c110.x
    endif
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    // -------------------------------------------------------------- Improved Fadeout --------------------------------------------------------------
    rcp r20.y, c53.w
    mul_sat r20.y, r20.y, r0.z
    mul r20.y, r20.y, r20.y
    lrp r0.z, r20.y, c110.y, r20.x // improved fadeout
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    mul r5.xyz, r4, r0.y
    mul r5.xyz, r0.z, r5
    mad r3.xyz, r3, v5.x, r5
    add r5, c19, -v7.x
    add r6, c20, -v7.y
    add r7, c21, -v7.z
    mul r8, r5, r5
    mad r8, r6, r6, r8
    mad r8, r7, r7, r8
    add r9, r8, c0.z
    rsq r10.x, r9.x
    rsq r10.y, r9.y
    rsq r10.z, r9.z
    rsq r10.w, r9.w
    mov r9.x, c0.x
    mad r8, r8, -c25, r9.x
    max r11, r8, c0.w
    mul r8, r11, r11
    mad r8, r8, r8, c4.w
    mul r11, r8, c5.x
    cmp r8, r8, r11, c0.w
    mul r11, r2.x, r5
    mad r11, r6, r2.y, r11
    mad r11, r7, r2.z, r11
    mul r8, r8, r11
    mul_sat r8, r10, r8
    mul r11, r5, -c22
    mad r11, r6, -c23, r11
    mad r11, r7, -c24, r11
    mul r11, r10, r11
    mov r12, c26
    mad_sat r11, r11, r12, c27
    mul r8, r8, r11
    dp4 r11.x, c29, r8
    dp4 r11.y, c30, r8
    dp4 r11.z, c31, r8
    add r3.xyz, r3, r11
    mov r1.w, v5.w
    mov r3.w, c0.x
    mul r1, r1, r3
    mul r0.y, r1.w, c39.x
    /* removed stipple
    mov_sat r1.w, r0.y
    mul r1.w, r1.w, c5.y
    frc r2.w, r1.w
    mul r3.x, r2.w, c5.z
    frc r3.y, r3.x
    add r3.x, r3.x, -r3.y
    add r3.y, r1.w, -r2.w
    mul r3.zw, c5.w, vPos.xyxy
    frc r3.zw, r3_abs
    cmp r3.zw, vPos.xyxy, r3, -r3
    mul r3.zw, r3, -c1.w
    mad r3.xy, r3, -c1.w, r3.zwzw
    mov r3.zw, c0.w
    texldl r3, r3, s10
    cmp r3, -r3.y, -c0.x, -c0.w
    texkill r3
    removed stipple */
    add r3.xyz, c0.z, v2
    nrm r11.xyz, r3
    dp3 r1.w, -r11, r2
    add r1.w, r1.w, r1.w
    mad r2.xyz, r2, -r1.w, -r11
    dp3_sat r1.w, -c17, r2
    add r1.w, r1.w, c3.x
    add r2.w, r0.w, c3.x
    pow r3.x, r1.w, r2.w
    mul r3.xyz, r4, r3.x
    mul r3.xyz, r0.z, r3
    mul r0.z, r0.w, -c1.w
    mul r4, r5, r2.x
    mad r4, r2.y, r6, r4
    mad r2, r2.z, r7, r4
    mul r2, r10, r2
    log r4.x, r2_abs.x
    log r4.y, r2_abs.y
    log r4.z, r2_abs.z
    log r4.w, r2_abs.w
    mul r2, r0.z, r4
    exp r4.x, r2.x
    exp r4.y, r2.y
    exp r4.z, r2.z
    exp r4.w, r2.w
    mul r2, r8, r4
    dp4 r4.x, c29, r2
    dp4 r4.y, c30, r2
    dp4 r4.z, c31, r2
    mad r2.xyz, r3, c17.w, r4
    mad r0.xzw, r0.x, r2.xyyz, r1.xyyz
    add r1.x, c16.w, -v1.w
    add r1.y, -c16.z, c16.w
    rcp r1.y, r1.y
    mul_sat r1.x, r1.x, r1.y
    add r1.x, -r1.x, c0.x
    add r1.yz, -r9.x, c16.xxyw
    mul r1.z, r1.x, r1.z
    mad r1.x, r1.x, r1.y, c0.x
    dp3 r1.y, r0.xzww, c3.yzww
    lrp r2.xyz, r1.x, r0.xzww, r1.y
    add r0.x, r1.y, c6.x
    pow r2.w, r0_abs.x, r1.z
    mul r0.xzw, r2.xyyz, r2.w
    rcp r1.x, c41.x
    mul_sat r1.x, r1.x, v1.w
    add r1.y, -c41.x, v1.w
    add r1.z, -c41.x, c41.y
    rcp r1.z, r1.z
    mul_sat r1.y, r1.y, r1.z
    lrp r3.x, c41.w, r1.x, r1.y
    add r1.x, r3.x, c41.z
    mov r3.xyz, c43
    add r3.xyz, -r3, c42
    mad r1.yzw, r1.y, r3.xxyz, c43.xxyz
    mad r1.yzw, r2.xxyz, -r2.w, r1
    mad r0.xzw, r1.x, r1.yyzw, r0
    mul oC0.xyz, r0.xzww, c66.x
    mov oC0.w, r0.y
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

// approximately 262 instruction slots used (19 texture, 243 arithmetic)
