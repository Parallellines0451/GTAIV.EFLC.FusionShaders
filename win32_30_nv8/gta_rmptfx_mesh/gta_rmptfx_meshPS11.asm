// Summary: removed unnecessary stipple + improved shadow filter + restored normal offset bias + improved shadow fadeout + sped up forward fading
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D StippleTexture;
//   sampler2D TextureSampler;
//   float4 colorize;
//   float4 gDirectionalColour;
//   float4 gDirectionalLight;
//   float4 gFacetCentre;
//   float4 gLightAmbient0;
//   float4 gLightAmbient1;
//   float4 gLightColB;
//   float4 gLightColG;
//   float4 gLightColR;
//   float4 gLightConeOffset;
//   float4 gLightConeOffset2;
//   float4 gLightConeScale;
//   float4 gLightConeScale2;
//   float4 gLightDir2X;
//   float4 gLightDir2Y;
//   float4 gLightDir2Z;
//   float4 gLightDirX;
//   float4 gLightDirY;
//   float4 gLightDirZ;
//   float4 gLightFallOff;
//   float4 gLightPointColB;
//   float4 gLightPointColG;
//   float4 gLightPointColR;
//   float4 gLightPointFallOff;
//   float4 gLightPointPosX;
//   float4 gLightPointPosY;
//   float4 gLightPointPosZ;
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
//   float4 globalScalars;
//   float specularColorFactor;
//   float specularFactor;
//
//
// Registers:
//
//   Name                 Reg   Size
//   -------------------- ----- ----
//   gViewInverse         c12      4
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
//   gLightPointPosX      c32      1
//   gLightPointPosY      c33      1
//   gLightPointPosZ      c34      1
//   gLightPointColR      c35      1
//   gLightPointFallOff   c36      1
//   gLightAmbient0       c37      1
//   gLightAmbient1       c38      1
//   globalScalars        c39      1
//   colorize             c51      1
//   gShadowParam18192021 c53      1
//   gFacetCentre         c54      1
//   gShadowParam14151617 c56      1
//   gShadowParam0123     c57      1
//   gShadowParam4567     c58      1
//   gShadowParam891113   c59      1
//   gShadowMatrix        c60      4
//   gLightPointColG      c64      1
//   gLightPointColB      c65      1
//   specularFactor       c66      1
//   gLightDir2X          c67      1
//   gLightDir2Y          c68      1
//   gLightDir2Z          c69      1
//   gLightConeScale2     c70      1
//   gLightConeOffset2    c71      1
//   specularColorFactor  c72      1
//   TextureSampler       s0       1
//   StippleTexture       s10      1
//   gShadowZSamplerDir   s15      1
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
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 7.7211545384e-43 // 551
    def c127, 0.9999999, 1, 0, 0 // LogDepth constants
    def c0, -0.5, 0.5, 1.33333337, 9.99999975e-005
    def c1, 1.5, -0.326211989, -0.405809999, 0.0833333358
    def c2, 0, -1, -0, 9.99999975e-006
    def c3, -0.791558981, -0.597710013, -0.100000001, 1.11111116
    def c4, 3.99600005, 4, 0.125, 0.25
    def c5, 1, -1, 0, -0
    def c6, 0.896420002, 0.412458003, -0.321940005, -0.932614982
    def c7, 0.185461, -0.893123984, 0.507430971, 0.0644249991
    def c8, 0.473434001, -0.480026007, 0.519456029, 0.767022014
    def c9, -0.203345001, 0.620715976, 0.962339997, -0.194983006
    def c10, -0.840143979, -0.0735799968, -0.69591397, 0.457136989
    def c46, 2, 0, 0, 0
    dcl_texcoord v0.xy
    dcl_texcoord1 v1.xyz
    dcl_texcoord3 v2.xyz
    dcl_color v3
    dcl_texcoord6 v4.xyz
    dcl vPos.xy
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s10
    dcl_2d s15
    mov r31.w, c39.x
    mul_sat r31.w, r31.w, c46.x
    /* removed stipple
    mov_sat r0.x, c39.x
    mul r0.x, r0.x, c4.x
    frc r0.y, r0.x
    mul r0.z, r0.y, c4.y
    frc r0.w, r0.z
    add r1.xy, r0.zxzw, -r0.wyzw
    mul r0.xy, c4.z, vPos
    frc r0.xy, r0_abs
    cmp r0.xy, vPos, r0, -r0
    mul r0.xy, r0, c4.w
    mad r0.xy, r1, c4.w, r0
    mov r0.zw, c2.x
    texldl r0, r0, s10
    cmp r0, -r0.y, c2.y, c2.z
    texkill r0
    removed stipple */
    texld r0, v0, s0
    add r1.xyz, c2.w, v1
    nrm r2.xyz, r1
    mul r0, r0, c51
    mul r0, r0, v3
    add r1.xyz, c2.w, v2
    nrm r3.xyz, r1
    mad_sat r1.x, r2.z, c0.x, c0.y
    mov r4.xyz, c38
    mad r1.xyz, r4, r1.x, c37
    dp3 r1.w, -r3, r2
    add r1.w, r1.w, r1.w
    mad r3.xyz, r2, -r1.w, -r3
    mul r4.xyz, c18.w, c18
    dp3 r1.w, r2, -c17
    mul r20.xyz, r2.y, c61.xyww
    mad r20.xyz, r2.x, c60.xyww, r20
    mad r20.xyz, r2.z, c62.xyww, r20
    add r1.w, r1.w, -c4.w
    mul_sat r1.w, r1.w, c0.z
    dp3_sat r2.w, -c17, r3
    add r2.w, r2.w, c0.w
    mov r3.w, c0.w
    add r3.w, r3.w, c66.x
    pow r4.w, r2.w, r3.w
    mul r5.xyz, c61.xyww, v4.y
    mad r5.xyz, v4.x, c60.xyww, r5
    mad r5.xyz, v4.z, c62.xyww, r5
    add r5.xyz, r5, c63.xyww
    dp3 r2.w, c14, v4
    add r6.xyz, -r2.w, -c54
    cmp r6.yzw, r6.xxyz, -c2.y, -c2.z
    mov r6.x, -c2.y
    mad r21, r6, c110.yyyw, -r6.yzww // shadow cascade mask
    // ---------------------------------------------------------------- Shadow Fixes -----------------------------------------------------------------
    add r22, c54.w, -c54
    add r22, c53.w, -r22 // cascade ranges
    dp4 r23.x, r21_abs, r22
    dp4 r23.y, r21_abs, r22.yzww
    
    mul r23.zw, r23.xyxy, c53.y
    mul r23.zw, r23, c218_abs.y // (curr_range, next_range) * resY * bias_magnitnude
    
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
    add r6.xyz, c15, -v4
    dp3 r2.w, r6, r6
    rsq r2.w, r2.w
    rcp r2.w, r2.w
    /* removed 1.0.6.0 filter
    rcp r3.w, c53.w
    mul r3.w, r2.w, r3.w
    mul r3.w, r3.w, r3.w
    mul r3.w, r3.w, c1.x
    mov r6.y, c53.y
    mad r6.xz, r6.y, c1.yyzw, r5.xyyw
    texld r7, r6.xzzw, s15
    add r5.w, r5.z, -r7.x
    cmp r5.w, r5.w, -c2.y, -c2.z
    mad r6.xz, r6.y, c10.xyyw, r5.xyyw
    texld r7, r6.xzzw, s15
    add r6.x, r5.z, -r7.x
    cmp r6.x, r6.x, -c2.y, -c2.z
    add r5.w, r5.w, r6.x
    mad r6.xz, r6.y, c10.zyww, r5.xyyw
    texld r7, r6.xzzw, s15
    add r6.x, r5.z, -r7.x
    cmp r6.x, r6.x, -c2.y, -c2.z
    add r5.w, r5.w, r6.x
    mad r6.xz, r6.y, c9.xyyw, r5.xyyw
    texld r7, r6.xzzw, s15
    add r6.x, r5.z, -r7.x
    cmp r6.x, r6.x, -c2.y, -c2.z
    add r5.w, r5.w, r6.x
    mad r6.xz, r6.y, c9.zyww, r5.xyyw
    texld r7, r6.xzzw, s15
    add r6.x, r5.z, -r7.x
    cmp r6.x, r6.x, -c2.y, -c2.z
    add r5.w, r5.w, r6.x
    mad r6.xz, r6.y, c8.xyyw, r5.xyyw
    texld r7, r6.xzzw, s15
    add r6.x, r5.z, -r7.x
    cmp r6.x, r6.x, -c2.y, -c2.z
    add r5.w, r5.w, r6.x
    mad r6.xz, r6.y, c8.zyww, r5.xyyw
    texld r7, r6.xzzw, s15
    add r6.x, r5.z, -r7.x
    cmp r6.x, r6.x, -c2.y, -c2.z
    add r5.w, r5.w, r6.x
    mad r6.xz, r6.y, c7.xyyw, r5.xyyw
    texld r7, r6.xzzw, s15
    add r6.x, r5.z, -r7.x
    cmp r6.x, r6.x, -c2.y, -c2.z
    add r5.w, r5.w, r6.x
    mad r6.xz, r6.y, c7.zyww, r5.xyyw
    texld r7, r6.xzzw, s15
    add r6.x, r5.z, -r7.x
    cmp r6.x, r6.x, -c2.y, -c2.z
    add r5.w, r5.w, r6.x
    mad r6.xz, r6.y, c6.xyyw, r5.xyyw
    texld r7, r6.xzzw, s15
    add r6.x, r5.z, -r7.x
    cmp r6.x, r6.x, -c2.y, -c2.z
    add r5.w, r5.w, r6.x
    mad r6.xz, r6.y, c6.zyww, r5.xyyw
    texld r7, r6.xzzw, s15
    add r6.x, r5.z, -r7.x
    cmp r6.x, r6.x, -c2.y, -c2.z
    add r5.w, r5.w, r6.x
    mad r5.xy, r6.y, c3, r5
    texld r6, r5, s15
    add r5.x, r5.z, -r6.x
    cmp r5.x, r5.x, -c2.y, -c2.z
    add r5.x, r5.w, r5.x
    mad r3.w, r5.x, c1.w, r3.w
    add r2.w, r2.w, -c53.w
    cmp r5.xy, r2.w, c5, c5.zwzw
    add r2.w, r3.w, r5.y
    cmp_sat r2.w, r2.w, r3.w, r5.x
    removed 1.0.6.0 filter */
    // ---------------------------------------------------------- Improved Shadow Filter ------------------------------------------------------------
    mov r21.x, c110.y
    if_lt c221.x, r21.x
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
    mul_sat r20.y, r20.y, r2.w
    mul r20.y, r20.y, r20.y
    lrp r2.w, r20.y, c110.y, r20.x // improved fadeout
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    mul r5.xyz, r4, r4.w
    mul r5.xyz, r2.w, r5
    mul r4.xyz, r4, r1.w
    mul r4.xyz, r2.w, r4
    mad r1.xyz, r1, v3.x, r4
    mov r1.w, c4.w
    mul r1.w, r1.w, c66.x
    add r4, c19, -v4.x
    add r6, c20, -v4.y
    add r7, c21, -v4.z
    mul r8, r4, r4
    mad r8, r6, r6, r8
    mad r8, r7, r7, r8
    add r9, r8, c2.w
    rsq r10.x, r9.x
    rsq r10.y, r9.y
    rsq r10.z, r9.z
    rsq r10.w, r9.w
    mov r9.y, c2.y
    mad r8, r8, -c25, -r9.y
    max r11, r8, c2.x
    mul r8, r11, r11
    mad r8, r8, r8, c3.z
    mul r11, r8, c3.w
    cmp r8, r8, r11, c2.x
    mul r11, r2.x, r4
    mad r11, r6, r2.y, r11
    mad r11, r7, r2.z, r11
    mul r8, r8, r11
    mul_sat r8, r10, r8
    mul r11, r4, -c22
    mad r11, r6, -c23, r11
    mad r11, r7, -c24, r11
    mul r11, r10, r11
    mov r12, c26
    mad_sat r11, r11, r12, c27
    mul r8, r8, r11
    mul r4, r3.x, r4
    mad r4, r3.y, r6, r4
    mad r4, r3.z, r7, r4
    mul r4, r10, r4
    log r6.x, r4_abs.x
    log r6.y, r4_abs.y
    log r6.z, r4_abs.z
    log r6.w, r4_abs.w
    mul r4, r1.w, r6
    exp r6.x, r4.x
    exp r6.y, r4.y
    exp r6.z, r4.z
    exp r6.w, r4.w
    mul r4, r8, r6
    dp4 r6.x, c29, r8
    dp4 r6.y, c30, r8
    dp4 r6.z, c31, r8
    dp4 r7.x, c29, r4
    dp4 r7.y, c30, r4
    dp4 r7.z, c31, r4
    add r1.xyz, r1, r6
    mad r4.xyz, r5, c17.w, r7
    add r5, c32, -v4.x
    add r6, c33, -v4.y
    add r7, c34, -v4.z
    mul r8, r5, r5
    mad r8, r6, r6, r8
    mad r8, r7, r7, r8
    add r10, r8, c2.w
    rsq r11.x, r10.x
    rsq r11.y, r10.y
    rsq r11.z, r10.z
    rsq r11.w, r10.w
    mad r8, r8, -c36, -r9.y
    max r9, r8, c2.x
    mul r8, r9, r9
    mad r8, r8, r8, c3.z
    mul r9, r8, c3.w
    cmp r8, r8, r9, c2.x
    mul r9, r2.x, r5
    mad r9, r6, r2.y, r9
    mad r2, r7, r2.z, r9
    mul r2, r8, r2
    mul_sat r2, r11, r2
    mul r8, r5, -c67
    mad r8, r6, -c68, r8
    mad r8, r7, -c69, r8
    mul r8, r11, r8
    mov r9, c70
    mad_sat r8, r8, r9, c71
    mul r2, r2, r8
    mul r5, r3.x, r5
    mad r5, r3.y, r6, r5
    mad r3, r3.z, r7, r5
    mul r3, r11, r3
    log r5.x, r3_abs.x
    log r5.y, r3_abs.y
    log r5.z, r3_abs.z
    log r5.w, r3_abs.w
    mul r3, r1.w, r5
    exp r5.x, r3.x
    exp r5.y, r3.y
    exp r5.z, r3.z
    exp r5.w, r3.w
    mul r3, r2, r5
    dp4 r5.x, c35, r2
    dp4 r5.y, c64, r2
    dp4 r5.z, c65, r2
    dp4 r2.x, c35, r3
    dp4 r2.y, c64, r3
    dp4 r2.z, c65, r3
    add r1.xyz, r1, r5
    add r2.xyz, r4, r2
    mov r1.w, -c2.y
    mul r0, r0, r1
    mad oC0.xyz, c72.x, r2, r0
    mul oC0.w, r0.w, r31.w
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

// approximately 244 instruction slots used (15 texture, 229 arithmetic)
