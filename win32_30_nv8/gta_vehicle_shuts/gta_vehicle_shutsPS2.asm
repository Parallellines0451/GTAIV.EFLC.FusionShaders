// Summary: Disabled PC parameters that cause the dirt level in vehicle.ide to affect reflection intensity + improved shadow filter + restored normal offset bias + improved shadow fadeout
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D BumpSampler;
//   float3 LuminanceConstants;
//   sampler2D SpecSampler;
//   sampler2D TextureSampler;
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
//   float4 globalFogColor;
//   float4 globalFogColorN;
//   float4 globalFogParams;
//   float4 globalScalars;
//   float3 matDiffuseColor;
//   float reflectivePowerED;
//   float3 specMapIntMask;
//
//
// Registers:
//
//   Name                 Reg   Size
//   -------------------- ----- ----
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
//   gLightPointPosX      c32      1
//   gLightPointPosY      c33      1
//   gLightPointPosZ      c34      1
//   gLightPointColR      c35      1
//   gLightPointFallOff   c36      1
//   gLightAmbient0       c37      1
//   gLightAmbient1       c38      1
//   globalScalars        c39      1
//   globalFogParams      c41      1
//   globalFogColor       c42      1
//   globalFogColorN      c43      1
//   gShadowParam18192021 c53      1
//   gFacetCentre         c54      1
//   gShadowParam14151617 c56      1
//   gShadowParam0123     c57      1
//   gShadowParam4567     c58      1
//   gShadowParam891113   c59      1
//   gShadowMatrix        c60      4
//   gLightPointColG      c64      1
//   gLightPointColB      c65      1
//   matDiffuseColor      c66      1
//   gLightDir2X          c67      1
//   gLightDir2Y          c68      1
//   gLightDir2Z          c69      1
//   gLightConeScale2     c70      1
//   gLightConeOffset2    c71      1
//   specMapIntMask       c72      1
//   reflectivePowerED    c73      1
//   LuminanceConstants   c74      1
//   TextureSampler       s0       1
//   BumpSampler          s1       1
//   SpecSampler          s2       1
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
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 1.0257504759e-42 // 732
    def c127, 0.9999999, 1, 0, 0 // LogDepth constants
    def c0, 1, -0.5, 5, 9.99999975e-006
    def c1, -0.25, 1.33333337, 9.99999975e-005, 190
    def c2, 47.5, 0.150000006, -0.5, 0.5
    def c3, 1, 0, 1.5, 0.0833333358
    def c4, -0.100000001, 1.11111116, 1.00000001e-007, 0
    def c5, 0.212500006, 0.715399981, 0.0720999986, 0
    def c6, 1, -1, 0, -0
    def c7, -0.321940005, -0.932614982, -0.791558981, -0.597710013
    def c8, 0.507430971, 0.0644249991, 0.896420002, 0.412458003
    def c9, 0.519456029, 0.767022014, 0.185461, -0.893123984
    def c10, 0.962339997, -0.194983006, 0.473434001, -0.480026007
    def c11, -0.69591397, 0.457136989, -0.203345001, 0.620715976
    def c12, -0.326211989, -0.405809999, -0.840143979, -0.0735799968
    def c73, 1, 1, 1, 1 // disable IDE dirt influence
    dcl vPos.xy
    dcl_texcoord v0.xy
    dcl_texcoord1 v1
    dcl_texcoord3 v2.xyz
    dcl_texcoord4 v3.xyz
    dcl_texcoord5 v4.xyz
    dcl_color v5
    dcl_texcoord2 v6.xyz
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s1
    dcl_2d s2
    dcl_2d s10
    dcl_2d s15
    texld r1, v0, s1
    add r0.y, -r1.w, c0.x
    add r0.y, -r1.x, r0.y
    cmp r0.yz, r0.y, r1.xwyw, r1.xxyw
    dp2add r0.w, r0.yzzw, -r0.yzzw, c0.x
    add r0.yz, r0, c0.y
    mul r0.yz, r0, c0.z
    rsq r0.w, r0.w
    rcp r0.w, r0.w
    mul r1.xyz, r0.y, v3
    mad r1.xyz, v1, r0.w, r1
    mad r0.yzw, r0.z, v4.xxyz, r1.xxyz
    add r0.yzw, r0, c0.w
    nrm r31.xyz, r0.yzww
    dp3 r0.x, c14, v6
    add r0.xyz, -r0.x, -c54
    cmp r0.yzw, r0.xxyz, c3.x, c3.y
    mov r0.x, c0.x
    mad r21, r0, c110.yyyw, -r0.yzww // shadow cascade mask
    dp4 r1.x, r0, c57
    dp4 r1.y, r0, c58
    dp4 r2.x, r0, c59
    dp4 r2.y, r0, c56
    mul r0.xyz, c61.xyww, v6.y
    mad r0.xyz, v6.x, c60.xyww, r0
    mad r0.xyz, v6.z, c62.xyww, r0
    add r0.xyz, r0, c63.xyww
    mul r20.xyz, r31.y, c61.xyww
    mad r20.xyz, r31.x, c60.xyww, r20
    mad r20.xyz, r31.z, c62.xyww, r20
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
    add r0.z, r0.z, -r24.x // undo static bias
    
    mul r22.y, r22.y, c223.y // scale bias with FOV
    mad r0.xyz, r20, r22.y, r0 // normal offset bias
    
    mul r20.xy, r22.x, c53.y
    rcp r20.x, c58.x
    mul r20.x, r20.x, c57.x
    mul r20.x, r20.x, r20.y // fix filter stretching
    
    mul r20.xy, r20.xy, c218_abs.x
    
    dp4 r20.z, r21_abs, c119 // fix pixels leaking into other cascades
    dp4 r20.w, r21_abs, c120
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    mad r0.xy, r0, r1, r2
    /* removed 1.0.6.0 filter
    mov r1.y, c53.y
    mad r1.xz, r1.y, c12.xyyw, r0.xyyw
    texld r2, r1.xzzw, s15
    add r0.w, r0.z, -r2.x
    cmp r0.w, r0.w, c3.x, c3.y
    mad r1.xz, r1.y, c12.zyww, r0.xyyw
    texld r2, r1.xzzw, s15
    add r1.x, r0.z, -r2.x
    cmp r1.x, r1.x, c3.x, c3.y
    add r0.w, r0.w, r1.x
    mad r1.xz, r1.y, c11.xyyw, r0.xyyw
    texld r2, r1.xzzw, s15
    add r1.x, r0.z, -r2.x
    cmp r1.x, r1.x, c3.x, c3.y
    add r0.w, r0.w, r1.x
    mad r1.xz, r1.y, c11.zyww, r0.xyyw
    texld r2, r1.xzzw, s15
    add r1.x, r0.z, -r2.x
    cmp r1.x, r1.x, c3.x, c3.y
    add r0.w, r0.w, r1.x
    mad r1.xz, r1.y, c10.xyyw, r0.xyyw
    texld r2, r1.xzzw, s15
    add r1.x, r0.z, -r2.x
    cmp r1.x, r1.x, c3.x, c3.y
    add r0.w, r0.w, r1.x
    mad r1.xz, r1.y, c10.zyww, r0.xyyw
    texld r2, r1.xzzw, s15
    add r1.x, r0.z, -r2.x
    cmp r1.x, r1.x, c3.x, c3.y
    add r0.w, r0.w, r1.x
    mad r1.xz, r1.y, c9.xyyw, r0.xyyw
    texld r2, r1.xzzw, s15
    add r1.x, r0.z, -r2.x
    cmp r1.x, r1.x, c3.x, c3.y
    add r0.w, r0.w, r1.x
    mad r1.xz, r1.y, c9.zyww, r0.xyyw
    texld r2, r1.xzzw, s15
    add r1.x, r0.z, -r2.x
    cmp r1.x, r1.x, c3.x, c3.y
    add r0.w, r0.w, r1.x
    mad r1.xz, r1.y, c8.xyyw, r0.xyyw
    texld r2, r1.xzzw, s15
    add r1.x, r0.z, -r2.x
    cmp r1.x, r1.x, c3.x, c3.y
    add r0.w, r0.w, r1.x
    mad r1.xz, r1.y, c8.zyww, r0.xyyw
    texld r2, r1.xzzw, s15
    add r1.x, r0.z, -r2.x
    cmp r1.x, r1.x, c3.x, c3.y
    add r0.w, r0.w, r1.x
    mad r1.xz, r1.y, c7.xyyw, r0.xyyw
    mad r0.xy, r1.y, c7.zwzw, r0
    texld r2, r0, s15
    add r0.x, r0.z, -r2.x
    cmp r0.x, r0.x, c3.x, c3.y
    texld r1, r1.xzzw, s15
    add r0.y, r0.z, -r1.x
    cmp r0.y, r0.y, c3.x, c3.y
    add r0.y, r0.w, r0.y
    add r0.x, r0.x, r0.y
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
      mad r23, r23, r20.xyxy, r0.xyxy
      mad r21, r21, r20.xyxy, r0.xyxy
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
      add r25, r0.z, -r25
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
      mad r26, r27, r20.xyxy, r0.xyxy
      max r26.xz, r26, r20.z
      min r26.xz, r26, r20.w
      texldl r28, r26.xy, s15
      texldl r27, r26.zw, s15
      mov r28.y, r27.x
      mul r26, c131.xyxy, r25
      add r27.xy, r26.xzxz, r26.ywyw
      mul r26, c131.zwzw, r25
      add r27.zw, r26.xzxz, r26.ywyw
      mad r26, r27, r20.xyxy, r0.xyxy
      max r26.xz, r26, r20.z
      min r26.xz, r26, r20.w
      texldl r27, r26.xy, s15
      mov r28.z, r27.x
      texldl r27, r26.zw, s15
      mov r28.w, r27.x
      add r28, r0.z, -r28
      cmp r28, r28, c110.y, c110.w
      dp4 r29.x, r28, -c110.x
      mul r26, c132.xyxy, r25
      add r27.xy, r26.xzxz, r26.ywyw
      mul r26, c132.zwzw, r25
      add r27.zw, r26.xzxz, r26.ywyw
      mad r26, r27, r20.xyxy, r0.xyxy
      max r26.xz, r26, r20.z
      min r26.xz, r26, r20.w
      texldl r28, r26.xy, s15
      texldl r27, r26.zw, s15
      mov r28.y, r27.x
      mul r26, c133.xyxy, r25
      add r27.xy, r26.xzxz, r26.ywyw
      mul r26, c133.zwzw, r25
      add r27.zw, r26.xzxz, r26.ywyw
      mad r26, r27, r20.xyxy, r0.xyxy
      max r26.xz, r26, r20.z
      min r26.xz, r26, r20.w
      texldl r27, r26.xy, s15
      mov r28.z, r27.x
      texldl r27, r26.zw, s15
      mov r28.w, r27.x
      add r28, r0.z, -r28
      cmp r28, r28, c110.y, c110.w
      dp4 r29.y, r28, -c110.x
      mul r26, c134.xyxy, r25
      add r27.xy, r26.xzxz, r26.ywyw
      mul r26, c134.zwzw, r25
      add r27.zw, r26.xzxz, r26.ywyw
      mad r26, r27, r20.xyxy, r0.xyxy
      max r26.xz, r26, r20.z
      min r26.xz, r26, r20.w
      texldl r28, r26.xy, s15
      texldl r27, r26.zw, s15
      mov r28.y, r27.x
      mul r26, c135.xyxy, r25
      add r27.xy, r26.xzxz, r26.ywyw
      mul r26, c135.zwzw, r25
      add r27.zw, r26.xzxz, r26.ywyw
      mad r26, r27, r20.xyxy, r0.xyxy
      max r26.xz, r26, r20.z
      min r26.xz, r26, r20.w
      texldl r27, r26.xy, s15
      mov r28.z, r27.x
      texldl r27, r26.zw, s15
      mov r28.w, r27.x
      add r28, r0.z, -r28
      cmp r28, r28, c110.y, c110.w
      dp4 r29.z, r28, -c110.x
      mul r26, c136.xyxy, r25
      add r27.xy, r26.xzxz, r26.ywyw
      mul r26, c136.zwzw, r25
      add r27.zw, r26.xzxz, r26.ywyw
      mad r26, r27, r20.xyxy, r0.xyxy
      max r26.xz, r26, r20.z
      min r26.xz, r26, r20.w
      texldl r28, r26.xy, s15
      texldl r27, r26.zw, s15
      mov r28.y, r27.x
      mul r26, c137.xyxy, r25
      add r27.xy, r26.xzxz, r26.ywyw
      mul r26, c137.zwzw, r25
      add r27.zw, r26.xzxz, r26.ywyw
      mad r26, r27, r20.xyxy, r0.xyxy
      max r26.xz, r26, r20.z
      min r26.xz, r26, r20.w
      texldl r27, r26.xy, s15
      mov r28.z, r27.x
      texldl r27, r26.zw, s15
      mov r28.w, r27.x
      add r28, r0.z, -r28
      cmp r28, r28, c110.y, c110.w
      dp4 r29.w, r28, -c110.x
      dp4 r20.x, r29, -c110.x
    endif
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    add r0.yzw, c15.xxyz, -v6.xxyz
    dp3 r0.y, r0.yzww, r0.yzww
    rsq r0.y, r0.y
    rcp r0.y, r0.y
    /* removed 1.0.6.0 filter
    rcp r0.z, c53.w
    mul r0.z, r0.y, r0.z
    add r0.y, r0.y, -c53.w
    cmp r0.yw, r0.y, c6.xxzy, c6.xzzw
    mul r0.z, r0.z, r0.z
    mul r0.z, r0.z, c3.z
    mad r0.x, r0.x, c3.w, r0.z
    add r0.z, r0.w, r0.x
    cmp_sat r0.x, r0.z, r0.x, r0.y
    removed 1.0.6.0 filter */
    // -------------------------------------------------------------- Improved Fadeout --------------------------------------------------------------
    rcp r20.y, c53.w
    mul_sat r20.y, r20.y, r0.y
    mul r20.y, r20.y, r20.y
    lrp r0.x, r20.y, c110.y, r20.x // improved fadeout
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    /* move normal
    texld r1, v0, s1
    add r0.y, -r1.w, c0.x
    add r0.y, -r1.x, r0.y
    cmp r0.yz, r0.y, r1.xwyw, r1.xxyw
    dp2add r0.w, r0.yzzw, -r0.yzzw, c0.x
    add r0.yz, r0, c0.y
    mul r0.yz, r0, c0.z
    rsq r0.w, r0.w
    rcp r0.w, r0.w
    mul r1.xyz, r0.y, v3
    mad r1.xyz, v1, r0.w, r1
    mad r0.yzw, r0.z, v4.xxyz, r1.xxyz
    add r0.yzw, r0, c0.w
    nrm r1.xyz, r0.yzww
    move normal */
    mov r1.xyz, r31.xyz
    dp3 r0.y, r1, -c17
    add r0.y, r0.y, c1.x
    mul_sat r0.y, r0.y, c1.y
    mul r2.xyz, c18.w, c18
    mul r0.yzw, r0.y, r2.xxyz
    mul r0.yzw, r0.x, r0
    dp3 r1.w, v5, c74
    mul r1.w, r1.w, c39.z
    mad_sat r2.w, r1.z, c2.z, c2.w
    mov r3.xyz, c38
    mad r3.xyz, r3, r2.w, c37
    mad r0.yzw, r3.xxyz, r1.w, r0
    add r3, c19, -v6.x
    mul r4, r1.x, r3
    add r5, c20, -v6.y
    mad r4, r5, r1.y, r4
    add r6, c21, -v6.z
    mad r4, r6, r1.z, r4
    mul r7, r3, r3
    mad r7, r5, r5, r7
    mad r7, r6, r6, r7
    mov r8.x, c0.x
    mad r9, r7, -c25, r8.x
    add r7, r7, c0.w
    max r10, r9, c3.y
    mul r9, r10, r10
    mad r9, r9, r9, c4.x
    mul r10, r9, c4.y
    cmp r9, r9, r10, c3.y
    mul r4, r4, r9
    rsq r9.x, r7.x
    rsq r9.y, r7.y
    rsq r9.z, r7.z
    rsq r9.w, r7.w
    mul_sat r4, r4, r9
    mul r7, r3, -c22
    mad r7, r5, -c23, r7
    mad r7, r6, -c24, r7
    mul r7, r9, r7
    mov r10, c26
    mad_sat r7, r7, r10, c27
    mul r4, r4, r7
    dp4 r7.x, c29, r4
    dp4 r7.y, c30, r4
    dp4 r7.z, c31, r4
    add r0.yzw, r0, r7.xxyz
    add r7, c32, -v6.x
    mul r10, r1.x, r7
    add r11, c33, -v6.y
    mad r10, r11, r1.y, r10
    add r12, c34, -v6.z
    mad r10, r12, r1.z, r10
    mul r13, r7, r7
    mad r13, r11, r11, r13
    mad r13, r12, r12, r13
    mad r14, r13, -c36, r8.x
    add r13, r13, c0.w
    max r15, r14, c3.y
    mul r14, r15, r15
    mad r14, r14, r14, c4.x
    mul r15, r14, c4.y
    cmp r14, r14, r15, c3.y
    mul r10, r10, r14
    rsq r14.x, r13.x
    rsq r14.y, r13.y
    rsq r14.z, r13.z
    rsq r14.w, r13.w
    mul_sat r10, r10, r14
    mul r13, r7, -c67
    mad r13, r11, -c68, r13
    mad r13, r12, -c69, r13
    mul r13, r14, r13
    mov r15, c70
    mad_sat r13, r13, r15, c71
    mul r10, r10, r13
    dp4 r13.x, c35, r10
    dp4 r13.y, c64, r10
    dp4 r13.z, c65, r10
    add r13.xyz, r0.yzww, r13
    texld r15, v0, s0
    mul r15.xyz, r15, c66
    mul r15, r15, v5
    mov r13.w, c0.x
    mul r13, r13, r15
    mul oC0.w, r13.w, c39.x
    add r0.yzw, c0.w, v2.xxyz
    nrm r15.xyz, r0.yzww
    dp3 r0.y, -r15, r1
    add r0.y, r0.y, r0.y
    mad r0.yzw, r1.xxyz, -r0.y, -r15.xxyz
    dp3 r1.x, r15, r1
    add r1.x, -r1_abs.x, c0.x
    mul r1.x, r1.x, r1.x
    mul r1.x, r1.x, r1.x
    mad_sat r1.x, r1.x, -c0.y, -c0.y
    mul r3, r3, r0.y
    mad r3, r0.z, r5, r3
    mad r3, r0.w, r6, r3
    mul r3, r9, r3
    log r5.x, r3_abs.x
    log r5.y, r3_abs.y
    log r5.z, r3_abs.z
    log r5.w, r3_abs.w
    texld r3, v0, s2
    mul r1.y, r3.w, c73.x
    dp3 r1.z, r3, c72
    mul r1.z, r1.z, c73.x
    mul r1.z, r1.z, c2.y
    mul r1.x, r1.x, r1.z
    mul r1.z, r1.y, c2.x
    mad r1.y, r1.y, c1.w, c1.z
    mul r3, r5, r1.z
    exp r5.x, r3.x
    exp r5.y, r3.y
    exp r5.z, r3.z
    exp r5.w, r3.w
    mul r3, r4, r5
    dp4 r4.x, c29, r3
    dp4 r4.y, c30, r3
    dp4 r4.z, c31, r3
    dp3_sat r1.w, -c17, r0.yzww
    add r1.w, r1.w, c1.z
    pow r2.w, r1.w, r1.y
    mul r2.xyz, r2, r2.w
    mul r2.xyz, r0.x, r2
    mad r2.xyz, r2, c17.w, r4
    mul r3, r7, r0.y
    mad r3, r0.z, r11, r3
    mad r0, r0.w, r12, r3
    mul r0, r14, r0
    log r3.x, r0_abs.x
    log r3.y, r0_abs.y
    log r3.z, r0_abs.z
    log r3.w, r0_abs.w
    mul r0, r1.z, r3
    exp r3.x, r0.x
    exp r3.y, r0.y
    exp r3.z, r0.z
    exp r3.w, r0.w
    mul r0, r10, r3
    dp4 r3.x, c35, r0
    dp4 r3.y, c64, r0
    dp4 r3.z, c65, r0
    add r0.xyz, r2, r3
    mad r0.xyz, r1.x, r0, r13
    dp3 r0.w, r0, c5
    add r1.x, -c16.z, c16.w
    rcp r1.x, r1.x
    add r1.y, c16.w, -v1.w
    mul_sat r1.x, r1.x, r1.y
    add r1.x, -r1.x, c0.x
    add r1.yz, -r8.x, c16.xxyw
    mad r1.y, r1.x, r1.y, c0.x
    mul r1.x, r1.x, r1.z
    lrp r2.xyz, r1.y, r0, r0.w
    add r0.x, r0.w, c4.z
    pow r2.w, r0_abs.x, r1.x
    mul r0.xyz, r2, r2.w
    add r0.w, -c41.x, c41.y
    rcp r0.w, r0.w
    add r1.x, -c41.x, v1.w
    mul_sat r0.w, r0.w, r1.x
    mov r1.xyz, c43
    add r1.xyz, -r1, c42
    mad r1.xyz, r0.w, r1, c43
    mad r1.xyz, r2, -r2.w, r1
    rcp r1.w, c41.x
    mul_sat r1.w, r1.w, v1.w
    lrp r2.x, c41.w, r1.w, r0.w
    add r0.w, r2.x, c41.z
    mad oC0.xyz, r0.w, r1, r0
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

// approximately 280 instruction slots used (15 texture, 265 arithmetic)
