// Summary: improved shadow filter + restored normal offset bias + improved shadow fadeout
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D DirtSampler;
//   float3 LuminanceConstants;
//   sampler2D SpecSampler;
//   sampler2D TextureSampler;
//   float3 dirtColor;
//   float dirtLevel;
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
//   matDiffuseColor      c66      1
//   dirtLevel            c72      1
//   dirtColor            c73      1
//   specMapIntMask       c74      1
//   reflectivePowerED    c75      1
//   LuminanceConstants   c76      1
//   TextureSampler       s0       1
//   DirtSampler          s1       1
//   SpecSampler          s2       1
//   gShadowZSamplerDir   s15      1
//

    ps_3_0
    // -------------------------------------------------------------- Shadow Constants --------------------------------------------------------------
    def c110, -0.25, 1, -1, 0
    def c111, 0.159154937, 0.5, 6.28318548, -3.14159274
    def c112, 3, 7.13800001, 0.03125, 0
    def c113, 0.75, -0.5, 0.5, 0
    
    // def c114, 0.14, 0.24, 0.5, 0.75
    // def c115, 0.24, 0.44, 1.1, 1.15
    // def c116, 0.3, 0.54, 1.1, 0.95
    // def c117, 0.64, 1.04, 2.2, 2.3
    
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
    
    def c139, 1000, 0, 0, 0 // shadowmap depth offset
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 9.7530373117e-43 // 696
    def c127, 0.9999999, 1, 0, 0 // LogDepth constants
    def c0, 190, 9.99999975e-005, 1.5, 0.0833333358
    def c1, 9.99999975e-006, 47.5, 0.150000006, 0
    def c2, -0.5, 0.5, 1.33333337, 9.99999975e-005
    def c3, 1, 0, -0, -0.25
    def c4, -0.100000001, 1.11111116, 1.00000001e-007, 0
    def c5, 0.212500006, 0.715399981, 0.0720999986, 0
    def c6, 1, -1, 0, -0
    def c7, -0.321940005, -0.932614982, -0.791558981, -0.597710013
    def c8, 0.507430971, 0.0644249991, 0.896420002, 0.412458003
    def c9, 0.519456029, 0.767022014, 0.185461, -0.893123984
    def c10, 0.962339997, -0.194983006, 0.473434001, -0.480026007
    def c11, -0.69591397, 0.457136989, -0.203345001, 0.620715976
    def c12, -0.326211989, -0.405809999, -0.840143979, -0.0735799968
    // def c75, 1, 1, 1, 1 // disable IDE dirt influence
    dcl vPos.xy
    dcl_texcoord v0.xy
    dcl_texcoord1 v1
    dcl_texcoord3 v2.xyz
    dcl_color v3
    dcl_texcoord2 v4.xyz
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s1
    dcl_2d s2
    dcl_2d s10
    dcl_2d s15
    texld r0, v0, s0
    add r1.xyz, c1.x, v1
    nrm r2.xyz, r1
    texld r1, v0, s2
    mul r1.w, r1.w, c75.x
    mul r2.w, r1.w, c1.y
    dp3 r1.x, r1, c74
    mul r1.x, r1.x, c75.x
    mul r1.x, r1.x, c1.z
    mul r0.xyz, r0, c66
    mul r0, r0, v3
    dp3 r1.y, v3, c76
    mul r1.y, r1.y, c39.z
    mov r3.w, c1.w
    if_lt -c72.x, r3.w
      texld r3, v0, s1
      mul r1.z, r3.x, c72.x
      mov r4.x, c3.x
      mad r4.x, r3.x, -c72.x, r4.x
      lrp r4.yzw, r1.z, c73.xxyz, r0.xxyz
      mad r5, r0.xxyz, c3.yxxx, c3.xzzz
      cmp r3, -r3.x, r5, r4
      mov r0.xyz, r3.yzww
    else
      mov r3.x, c3.x
    endif
    mul r1.x, r1.x, r3.x
    add r3.xyz, c1.x, v2
    nrm r4.xyz, r3
    mad_sat r1.z, r2.z, c2.x, c2.y
    mov r3.xyz, c38
    mad r3.xyz, r3, r1.z, c37
    dp3 r1.z, -r4, r2
    add r1.z, r1.z, r1.z
    mad r5.xyz, r2, -r1.z, -r4
    mul r6.xyz, c18.w, c18
    dp3 r1.z, r2, -c17
    mul r22.xyz, r2.y, c61.xyww
    mad r22.xyz, r2.x, c60.xyww, r22
    mad r22.xyz, r2.z, c62.xyww, r22
    add r1.z, r1.z, c3.w
    mul_sat r1.z, r1.z, c2.z
    dp3_sat r3.w, -c17, r5
    add r3.w, r3.w, c2.w
    mad r1.w, r1.w, c0.x, c0.y
    pow r4.w, r3.w, r1.w
    mul r7.xyz, c61.xyww, v4.y
    mad r7.xyz, v4.x, c60.xyww, r7
    mad r7.xyz, v4.z, c62.xyww, r7
    add r7.xyz, r7, c63.xyww
    dp3 r1.w, c14, v4
    add r8.xyz, -r1.w, -c54
    cmp r8.yzw, r8.xxyz, c3.x, c3.y
    mov r8.x, c3.x
    mad r21, r8, c110.yyyw, -r8.yzww // shadow cascade mask
    // ---------------------------------------------------------------- Shadow Fixes -----------------------------------------------------------------
    // m4x4 r20, r21_abs, c114
    // dp4 r20.x, r20, c220
    // add r1.z, r1.z, -r20.x
    
    add r26, c54.w, -c54
    add r26, c53.w, -r26 // cascade ranges
    dp4 r23.x, r21_abs, r26
    dp4 r23.y, r21_abs, r26.yzww
    
    mad r24, r26.xxyz, -c110.wyyy, r26
    dp4 r24.x, r21_abs, r24 // curr_range - prev_range
    mul r24.xy, r24.x, c218_abs.zw
    rcp r24.z, r24.x
    rcp r24.w, r24.y
    add r24.xy, r23.x, -r24.xy
    add r24.xy, v9.w, -r24.xy
    mul_sat r24.xy, r24.xy, r24.zw // blending factor
    
    rcp r23.w, r23.x
    mul r23.w, r23.y, r23.w
    mov r23.z, c110.y
    
    lrp r20.xy, r24.xy, r23.yw, r23.xz
    
    mul r26.y, r20.y, r23.x
    rcp r26.y, r26.y
    mul r26.y, r26.y, r26.x
    
    mul r20.xy, r20.xy, c53.z // scale bias and blur with resolution
    
    mul r20.x, r20.x, c218_abs.y
    mul r20.x, r20.x, c223.y // scale bias with FOV
    mad r7.xyz, r22, r20.x, r7 // normal offset bias
    
    rcp r20.x, c58.x
    mul r20.x, r20.x, c57.x
    mul r20.x, r20.x, r20.y // fix filter stretching
    
    dp4 r20.z, r21_abs, c119 // fix pixels leaking into other cascades
    dp4 r20.w, r21_abs, c120
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    dp4 r9.x, r8, c57
    dp4 r9.y, r8, c58
    dp4 r10.x, r8, c59
    dp4 r10.y, r8, c56
    mad r7.xy, r7, r9, r10
    add r8.xyz, c15, -v4
    dp3 r1.w, r8, r8
    rsq r1.w, r1.w
    rcp r1.w, r1.w
    /* removed 1.0.6.0 filter
    rcp r3.w, c53.w
    mul r3.w, r1.w, r3.w
    mul r3.w, r3.w, r3.w
    mul r3.w, r3.w, c0.z
    mov r8.y, c53.y
    mad r8.xz, r8.y, c12.xyyw, r7.xyyw
    texld r9, r8.xzzw, s15
    add r5.w, r7.z, -r9.x
    cmp r5.w, r5.w, c3.x, c3.y
    mad r8.xz, r8.y, c12.zyww, r7.xyyw
    texld r9, r8.xzzw, s15
    add r6.w, r7.z, -r9.x
    cmp r6.w, r6.w, c3.x, c3.y
    add r5.w, r5.w, r6.w
    mad r8.xz, r8.y, c11.xyyw, r7.xyyw
    texld r9, r8.xzzw, s15
    add r6.w, r7.z, -r9.x
    cmp r6.w, r6.w, c3.x, c3.y
    add r5.w, r5.w, r6.w
    mad r8.xz, r8.y, c11.zyww, r7.xyyw
    texld r9, r8.xzzw, s15
    add r6.w, r7.z, -r9.x
    cmp r6.w, r6.w, c3.x, c3.y
    add r5.w, r5.w, r6.w
    mad r8.xz, r8.y, c10.xyyw, r7.xyyw
    texld r9, r8.xzzw, s15
    add r6.w, r7.z, -r9.x
    cmp r6.w, r6.w, c3.x, c3.y
    add r5.w, r5.w, r6.w
    mad r8.xz, r8.y, c10.zyww, r7.xyyw
    texld r9, r8.xzzw, s15
    add r6.w, r7.z, -r9.x
    cmp r6.w, r6.w, c3.x, c3.y
    add r5.w, r5.w, r6.w
    mad r8.xz, r8.y, c9.xyyw, r7.xyyw
    texld r9, r8.xzzw, s15
    add r6.w, r7.z, -r9.x
    cmp r6.w, r6.w, c3.x, c3.y
    add r5.w, r5.w, r6.w
    mad r8.xz, r8.y, c9.zyww, r7.xyyw
    texld r9, r8.xzzw, s15
    add r6.w, r7.z, -r9.x
    cmp r6.w, r6.w, c3.x, c3.y
    add r5.w, r5.w, r6.w
    mad r8.xz, r8.y, c8.xyyw, r7.xyyw
    texld r9, r8.xzzw, s15
    add r6.w, r7.z, -r9.x
    cmp r6.w, r6.w, c3.x, c3.y
    add r5.w, r5.w, r6.w
    mad r8.xz, r8.y, c8.zyww, r7.xyyw
    texld r9, r8.xzzw, s15
    add r6.w, r7.z, -r9.x
    cmp r6.w, r6.w, c3.x, c3.y
    add r5.w, r5.w, r6.w
    mad r8.xz, r8.y, c7.xyyw, r7.xyyw
    texld r9, r8.xzzw, s15
    add r6.w, r7.z, -r9.x
    cmp r6.w, r6.w, c3.x, c3.y
    add r5.w, r5.w, r6.w
    mad r7.xy, r8.y, c7.zwzw, r7
    texld r8, r7, s15
    add r6.w, r7.z, -r8.x
    cmp r6.w, r6.w, c3.x, c3.y
    add r5.w, r5.w, r6.w
    mad r3.w, r5.w, c0.w, r3.w
    add r1.w, r1.w, -c53.w
    cmp r7.xy, r1.w, c6, c6.zwzw
    add r1.w, r3.w, r7.y
    cmp_sat r1.w, r1.w, r3.w, r7.x
    removed 1.0.6.0 filter */
    // ---------------------------------------------------------- Improved Shadow Filter ------------------------------------------------------------
    mul r21.xy, vPos.xy, c112.z
    texld r21, r21, s10
    mul r21.x, r21.z, c111.z
    sincos r22.xy, r21.x
    mul r22, r22.xyyx, c110.yzyy
    
    mov r26.z, c110.y
    if_lt c217.w, r26.z
      mul r20.xy, r20.xy, c218_abs.x
    else
      mul r25.zw, r20.xyxy, c217_abs.x
      mul r25.zw, r25, r26.y
      
      mul r21, c130.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c130.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r25.zwzw, r7.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24, r21.xy, s15
      texldl r23, r21.zw, s15
      mov r24.y, r23.x
      mul r21, c131.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c131.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r25.zwzw, r7.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r23, r21.xy, s15
      mov r24.z, r23.x
      texldl r23, r21.zw, s15
      mov r24.w, r23.x
      
      add r23, r24, -r7.z
      cmp r23, r23, c110.y, c110.w
      dp4 r25.x, r23, r24 // blocker sum
      dp4 r25.y, r23, c110.y // blocker count
      
      mul r21, c132.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c132.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r25.zwzw, r7.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24, r21.xy, s15
      texldl r23, r21.zw, s15
      mov r24.y, r23.x
      mul r21, c133.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c133.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r25.zwzw, r7.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r23, r21.xy, s15
      mov r24.z, r23.x
      texldl r23, r21.zw, s15
      mov r24.w, r23.x
      
      add r23, r24, -r7.z
      cmp r23, r23, c110.y, c110.w
      dp4 r24.x, r23, r24
      dp4 r24.y, r23, c110.y
      add r25.xy, r25.xy, r24.xy
      
      mul r21, c134.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c134.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r25.zwzw, r7.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24, r21.xy, s15
      texldl r23, r21.zw, s15
      mov r24.y, r23.x
      mul r21, c135.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c135.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r25.zwzw, r7.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r23, r21.xy, s15
      mov r24.z, r23.x
      texldl r23, r21.zw, s15
      mov r24.w, r23.x
      
      add r23, r24, -r7.z
      cmp r23, r23, c110.y, c110.w
      dp4 r24.x, r23, r24
      dp4 r24.y, r23, c110.y
      add r25.xy, r25.xy, r24.xy
      
      mul r21, c136.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c136.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r25.zwzw, r7.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24, r21.xy, s15
      texldl r23, r21.zw, s15
      mov r24.y, r23.x
      mul r21, c137.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c137.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r25.zwzw, r7.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r23, r21.xy, s15
      mov r24.z, r23.x
      texldl r23, r21.zw, s15
      mov r24.w, r23.x
      
      add r23, r24, -r7.z
      cmp r23, r23, c110.y, c110.w
      dp4 r24.x, r23, r24
      dp4 r24.y, r23, c110.y
      add r25.xy, r25.xy, r24.xy
      
      if_gt r25.y, c110.w
        rcp r25.y, r25.y
        mul r25.x, r25.x, r25.y
        add r25.y, -r25.x, c139.x
        rcp r25.y, r25.y
        add r25.x, -r7.z, r25.x
        mul r25.x, r25.x, r25.y
        mul r25.x, r25_abs.x, c217_abs.y
      else
        mov r25.x, c110.w
      endif
      
      add r25.x, r25.x, c218_abs.x
      min r25.y, r25.x, c217_abs.x
      mul r25.x, r25.y, r26.y
      max r25.x, r25.x, c218_abs.x
      mul r20.xy, r20.xy, r25.x
      
      add r25.x, r25.y, -c218_abs.x
      mul r25.y, r26.x, c53.z
      mul r25.y, r25.y, c217_abs.z
      mul r25.y, r25.y, c223.y
      mad r7.z, r25.x, r25.y, r7.z
    endif
    
    if_lt c221.x, r26.z
      dp2add r21.y, vPos, c112.xy, c112.w
      mad r21.y, r21.y, c111.x, c111.y
      frc r21.y, r21.y
      mad r21.y, r21.y, c111.z, c111.w
      sincos r22.xy, r21.y
      mul r21, r22.yxxy, c110.xxyz
      mul r22, r22.yxxy, c113.xxyz
      mad r21, r21, r20.xyxy, r7.xyxy
      mad r22, r22, r20.xyxy, r7.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      max r22.xz, r22, r20.z
      min r22.xz, r22, r20.w
      texldl r24, r21.xy, s15
      texldl r23, r22.zw, s15
      mov r24.y, r23.x
      texldl r23, r22.xy, s15
      mov r24.z, r23.x
      texldl r23, r21.zw, s15
      mov r24.w, r23.x
      add r24, r7.z, -r24
      cmp r24, r24, c110.y, c110.w
      dp4 r20.x, r24, -c110.x
    else
      mul r21, c130.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c130.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r7.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24, r21.xy, s15
      texldl r23, r21.zw, s15
      mov r24.y, r23.x
      mul r21, c131.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c131.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r7.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r23, r21.xy, s15
      mov r24.z, r23.x
      texldl r23, r21.zw, s15
      mov r24.w, r23.x
      add r24, r7.z, -r24
      cmp r24, r24, c110.y, c110.w
      dp4 r25.x, r24, -c110.x
      
      mul r21, c132.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c132.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r7.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24, r21.xy, s15
      texldl r23, r21.zw, s15
      mov r24.y, r23.x
      mul r21, c133.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c133.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r7.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r23, r21.xy, s15
      mov r24.z, r23.x
      texldl r23, r21.zw, s15
      mov r24.w, r23.x
      add r24, r7.z, -r24
      cmp r24, r24, c110.y, c110.w
      dp4 r25.y, r24, -c110.x
      
      mul r21, c134.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c134.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r7.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24, r21.xy, s15
      texldl r23, r21.zw, s15
      mov r24.y, r23.x
      mul r21, c135.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c135.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r7.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r23, r21.xy, s15
      mov r24.z, r23.x
      texldl r23, r21.zw, s15
      mov r24.w, r23.x
      add r24, r7.z, -r24
      cmp r24, r24, c110.y, c110.w
      dp4 r25.z, r24, -c110.x
      
      mul r21, c136.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c136.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r7.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24, r21.xy, s15
      texldl r23, r21.zw, s15
      mov r24.y, r23.x
      mul r21, c137.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c137.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r7.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r23, r21.xy, s15
      mov r24.z, r23.x
      texldl r23, r21.zw, s15
      mov r24.w, r23.x
      add r24, r7.z, -r24
      cmp r24, r24, c110.y, c110.w
      dp4 r25.w, r24, -c110.x
      
      dp4 r20.x, r25, -c110.x
    endif
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    // -------------------------------------------------------------- Improved Fadeout --------------------------------------------------------------
    rcp r20.y, c53.w
    mul_sat r20.y, r20.y, r1.w
    mul r20.y, r20.y, r20.y
    lrp r1.w, r20.y, c110.y, r20.x // improved fadeout
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    mul r7.xyz, r6, r4.w
    mul r7.xyz, r1.w, r7
    mul r6.xyz, r6, r1.z
    mul r6.xyz, r1.w, r6
    mad r1.yzw, r3.xxyz, r1.y, r6.xxyz
    add r3, c19, -v4.x
    add r6, c20, -v4.y
    add r8, c21, -v4.z
    mul r9, r3, r3
    mad r9, r6, r6, r9
    mad r9, r8, r8, r9
    add r10, r9, c1.x
    rsq r11.x, r10.x
    rsq r11.y, r10.y
    rsq r11.z, r10.z
    rsq r11.w, r10.w
    mov r10.x, c3.x
    mad r9, r9, -c25, r10.x
    max r12, r9, c1.w
    mul r9, r12, r12
    mad r9, r9, r9, c4.x
    mul r12, r9, c4.y
    cmp r9, r9, r12, c1.w
    mul r12, r2.x, r3
    mad r12, r6, r2.y, r12
    mad r12, r8, r2.z, r12
    mul r9, r9, r12
    mul_sat r9, r11, r9
    mul r12, r3, -c22
    mad r12, r6, -c23, r12
    mad r12, r8, -c24, r12
    mul r12, r11, r12
    mov r13, c26
    mad_sat r12, r12, r13, c27
    mul r9, r9, r12
    mul r3, r5.x, r3
    mad r3, r5.y, r6, r3
    mad r3, r5.z, r8, r3
    mul r3, r11, r3
    log r5.x, r3_abs.x
    log r5.y, r3_abs.y
    log r5.z, r3_abs.z
    log r5.w, r3_abs.w
    mul r3, r2.w, r5
    exp r5.x, r3.x
    exp r5.y, r3.y
    exp r5.z, r3.z
    exp r5.w, r3.w
    mul r3, r9, r5
    dp4 r5.x, c29, r9
    dp4 r5.y, c30, r9
    dp4 r5.z, c31, r9
    dp4 r6.x, c29, r3
    dp4 r6.y, c30, r3
    dp4 r6.z, c31, r3
    add r3.xyz, r1.yzww, r5
    mad r1.yzw, r7.xxyz, c17.w, r6.xxyz
    dp3 r2.x, r4, r2
    add r2.x, -r2_abs.x, c3.x
    mul r2.x, r2.x, r2.x
    mul r2.x, r2.x, r2.x
    mad_sat r2.x, r2.x, c2.y, c2.y
    mul r1.x, r1.x, r2.x
    mov r3.w, c3.x
    mul r0, r0, r3
    mad r0.xyz, r1.x, r1.yzww, r0
    mul oC0.w, r0.w, c39.x
    add r0.w, c16.w, -v1.w
    add r1.x, -c16.z, c16.w
    rcp r1.x, r1.x
    mul_sat r0.w, r0.w, r1.x
    add r0.w, -r0.w, c3.x
    add r1.xy, -r10.x, c16
    mul r1.y, r0.w, r1.y
    mad r0.w, r0.w, r1.x, c3.x
    dp3 r1.x, r0, c5
    lrp r2.xyz, r0.w, r0, r1.x
    add r0.x, r1.x, c4.z
    pow r2.w, r0_abs.x, r1.y
    mul r0.xyz, r2, r2.w
    rcp r0.w, c41.x
    mul_sat r0.w, r0.w, v1.w
    add r1.x, -c41.x, v1.w
    add r1.y, -c41.x, c41.y
    rcp r1.y, r1.y
    mul_sat r1.x, r1.x, r1.y
    lrp r3.x, c41.w, r0.w, r1.x
    add r0.w, r3.x, c41.z
    mov r3.xyz, c43
    add r1.yzw, -r3.xxyz, c42.xxyz
    mad r1.xyz, r1.x, r1.yzww, c43
    mad r1.xyz, r2, -r2.w, r1
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

// approximately 232 instruction slots used (15 texture, 217 arithmetic)
