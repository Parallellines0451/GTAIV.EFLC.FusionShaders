// Summary: removed unnecessary stipple + improved cascaded shadows + remapped shadowmap depth
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   float4 NearFarPlane;
//   sampler2D StippleTexture;
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
//
//
// Registers:
//
//   Name                 Reg   Size
//   -------------------- ----- ----
//   NearFarPlane         c128     1
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
//   gLightDir2X          c67      1
//   gLightDir2Y          c68      1
//   gLightDir2Z          c69      1
//   gLightConeScale2     c70      1
//   gLightConeOffset2    c71      1
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
    
    // def c114, 0.14, 0.24, 0.5, 0.75
    // def c115, 0.24, 0.44, 1.1, 1.15
    // def c116, 0.3, 0.54, 1.1, 0.95
    // def c117, 0.64, 1.04, 2.2, 2.3
    
    def c118, 0.06711056, 0.00583715, 52.9829189, 0
    
    def c119, -1, 0.25, 0.5, 0.75
    def c120, 0.25, 0.5, 0.75, 2
    
    def c130, 0.18993645671348536, 0.027087114076591513, -0.21261242652069953, 0.23391293246949066
    def c131, 0.04771781344140756, -0.3666840644525993, 0.297730981239584, 0.398259878229082
    def c132, -0.509063425827436, -0.06528681462854097, 0.507855152944665, -0.2875976005206389
    def c133, -0.15230616564632418, 0.6426121151781916, -0.30240170651828074, -0.5805072900736001
    def c134, 0.6978019230005561, 0.2771173334141519, -0.6990963248129052, 0.3210960724922725
    def c135, 0.3565142601623699, -0.7066415061851589, 0.266890002328106, 0.8360191043249159
    def c136, -0.7515861305520581, -0.41609876195815027, 0.9102937449894895, -0.17014527555321657
    def c137, -0.5343471434373126, 0.8058593459499529, -0.1133270115046468, -0.9490025827627441
    
    def c139, 0.0005, 0.5, 0, 0
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 2.0739217272e-43 // 148
    def c127, 1, 0.99, 0, 0 // LogDepth constants
    def c0, -0.5, 0.5, 1.33333337, 1.5
    def c1, 0.0833333358, -0.100000001, 1.11111116, 1.00000001e-007
    def c2, 0, -1, -0, 9.99999975e-006
    def c3, 3.99600005, 4, 0.125, 0.25
    def c4, 0.212500006, 0.715399981, 0.0720999986, 0
    def c5, 1, -1, 0, -0
    def c6, -0.321940005, -0.932614982, -0.791558981, -0.597710013
    def c7, 0.507430971, 0.0644249991, 0.896420002, 0.412458003
    def c8, 0.519456029, 0.767022014, 0.185461, -0.893123984
    def c9, 0.962339997, -0.194983006, 0.473434001, -0.480026007
    def c10, -0.69591397, 0.457136989, -0.203345001, 0.620715976
    def c11, -0.326211989, -0.405809999, -0.840143979, -0.0735799968
    dcl_texcoord v0.xy
    dcl_texcoord1 v1
    dcl_color v2.xw
    dcl_texcoord6 v3.xyz
    dcl vPos.xy
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s10
    dcl_2d s15
    /* removed stipple
    mov_sat r0.x, c39.x
    mul r0.x, r0.x, c3.x
    frc r0.y, r0.x
    mul r0.z, r0.y, c3.y
    frc r0.w, r0.z
    add r1.xy, r0.zxzw, -r0.wyzw
    mul r0.xy, c3.z, vPos
    frc r0.xy, r0_abs
    cmp r0.xy, vPos, r0, -r0
    mul r0.xy, r0, c3.w
    mad r0.xy, r1, c3.w, r0
    mov r0.zw, c2.x
    texldl r0, r0, s10
    cmp r0, -r0.y, c2.y, c2.z
    texkill r0
    removed stipple */
    texld r0, v0, s0
    add r1.xyz, c2.w, v1
    nrm r2.xyz, r1
    mul r0.w, r0.w, v2.w
    mad_sat r1.x, r2.z, c0.x, c0.y
    mov r3.xyz, c38
    mad r1.xyz, r3, r1.x, c37
    mul r3.xyz, c18.w, c18
    dp3 r1.w, r2, -c17
    mul r22.xyz, r2.y, c61.xyww
    mad r22.xyz, r2.x, c60.xyww, r22
    mad r22.xyz, r2.z, c62.xyww, r22
    add r1.w, r1.w, -c3.w
    mul_sat r1.w, r1.w, c0.z
    mul r4.xyz, c61.xyww, v3.y
    mad r4.xyz, v3.x, c60.xyww, r4
    mad r4.xyz, v3.z, c62.xyww, r4
    add r4.xyz, r4, c63.xyww
    dp3 r2.w, c14, v3
    add r5.xyz, -r2.w, -c54
    cmp r5.yzw, r5.xxyz, -c2.y, -c2.z
    mov r5.x, -c2.y
    mad r21, r5, c110.yyyw, -r5.yzww // shadow cascade mask
    // ---------------------------------------------------------------- Shadow Fixes -----------------------------------------------------------------
    // m4x4 r20, r21_abs, c114
    // dp4 r20.x, r20, shadow_quality_mask
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
    mad r4.xyz, r22, r20.x, r4 // normal offset bias
    
    mad r4.z, r4.z, -c139.x, c139.y
    
    rcp r20.x, c58.x
    mul r20.x, r20.x, c57.x
    mul r20.x, r20.x, r20.y // fix filter stretching
    
    dp4 r20.z, r21_abs, c119 // fix pixels leaking into other cascades
    dp4 r20.w, r21_abs, c120
    mov r21.x, c53.z
    mul r21.x, r21.x, -c110.x
    add r20.w, r20.w, -r21.x
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    dp4 r6.x, r5, c57
    dp4 r6.y, r5, c58
    dp4 r7.x, r5, c59
    dp4 r7.y, r5, c56
    mad r4.xy, r4, r6, r7
    add r5.xyz, c15, -v3
    dp3 r2.w, r5, r5
    rsq r2.w, r2.w
    rcp r2.w, r2.w
    /* removed 1.0.6.0 filter
    rcp r3.w, c53.w
    mul r3.w, r2.w, r3.w
    mul r3.w, r3.w, r3.w
    mul r3.w, r3.w, c0.w
    mov r5.y, c53.y
    mad r5.xz, r5.y, c11.xyyw, r4.xyyw
    texld r6, r5.xzzw, s15
    add r4.w, r4.z, -r6.x
    cmp r4.w, r4.w, -c2.y, -c2.z
    mad r5.xz, r5.y, c11.zyww, r4.xyyw
    texld r6, r5.xzzw, s15
    add r5.x, r4.z, -r6.x
    cmp r5.x, r5.x, -c2.y, -c2.z
    add r4.w, r4.w, r5.x
    mad r5.xz, r5.y, c10.xyyw, r4.xyyw
    texld r6, r5.xzzw, s15
    add r5.x, r4.z, -r6.x
    cmp r5.x, r5.x, -c2.y, -c2.z
    add r4.w, r4.w, r5.x
    mad r5.xz, r5.y, c10.zyww, r4.xyyw
    texld r6, r5.xzzw, s15
    add r5.x, r4.z, -r6.x
    cmp r5.x, r5.x, -c2.y, -c2.z
    add r4.w, r4.w, r5.x
    mad r5.xz, r5.y, c9.xyyw, r4.xyyw
    texld r6, r5.xzzw, s15
    add r5.x, r4.z, -r6.x
    cmp r5.x, r5.x, -c2.y, -c2.z
    add r4.w, r4.w, r5.x
    mad r5.xz, r5.y, c9.zyww, r4.xyyw
    texld r6, r5.xzzw, s15
    add r5.x, r4.z, -r6.x
    cmp r5.x, r5.x, -c2.y, -c2.z
    add r4.w, r4.w, r5.x
    mad r5.xz, r5.y, c8.xyyw, r4.xyyw
    texld r6, r5.xzzw, s15
    add r5.x, r4.z, -r6.x
    cmp r5.x, r5.x, -c2.y, -c2.z
    add r4.w, r4.w, r5.x
    mad r5.xz, r5.y, c8.zyww, r4.xyyw
    texld r6, r5.xzzw, s15
    add r5.x, r4.z, -r6.x
    cmp r5.x, r5.x, -c2.y, -c2.z
    add r4.w, r4.w, r5.x
    mad r5.xz, r5.y, c7.xyyw, r4.xyyw
    texld r6, r5.xzzw, s15
    add r5.x, r4.z, -r6.x
    cmp r5.x, r5.x, -c2.y, -c2.z
    add r4.w, r4.w, r5.x
    mad r5.xz, r5.y, c7.zyww, r4.xyyw
    texld r6, r5.xzzw, s15
    add r5.x, r4.z, -r6.x
    cmp r5.x, r5.x, -c2.y, -c2.z
    add r4.w, r4.w, r5.x
    mad r5.xz, r5.y, c6.xyyw, r4.xyyw
    texld r6, r5.xzzw, s15
    add r5.x, r4.z, -r6.x
    cmp r5.x, r5.x, -c2.y, -c2.z
    add r4.w, r4.w, r5.x
    mad r4.xy, r5.y, c6.zwzw, r4
    texld r5, r4, s15
    add r4.x, r4.z, -r5.x
    cmp r4.x, r4.x, -c2.y, -c2.z
    add r4.x, r4.w, r4.x
    mad r3.w, r4.x, c1.x, r3.w
    add r2.w, r2.w, -c53.w
    cmp r4.xy, r2.w, c5, c5.zwzw
    add r2.w, r3.w, r4.y
    cmp_sat r2.w, r2.w, r3.w, r4.x
    removed 1.0.6.0 filter */
    // ---------------------------------------------------------- Improved Shadow Filter ------------------------------------------------------------
    // dp2add r21.x, vPos.xy, c118.xy, c118.w
    // frc r21.x, r21.x
    // mul r21.x, r21.x, c118.z
    // frc r21.x, r21.x
    mul r21.xy, vPos.xy, c112.z
    texld r21.x, r21.xy, s10.z
    mul r21.x, r21.x, c111.z
    sincos r22.xy, r21.x
    mul r22, r22.xyyx, c110.yzyy
    
    mov r26.w, c110.w
    
    if_eq c217.w, r26.w
      mul r20.xy, r20.xy, c218_abs.x
    else
      mul r25.zw, r20.xyxy, c217_abs.x
      mul r25.zw, r25, r26.y
      
      mul r21, c130.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c130.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r25.zwzw, r4.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.x, r21.xy, s15.x
      texldl r24.y, r21.zw, s15.x
      mul r21, c131.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c131.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r25.zwzw, r4.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.z, r21.xy, s15.x
      texldl r24.w, r21.zw, s15.x
      
      add r23, r4.z, -r24
      cmp r23, r23, c110.y, c110.w
      dp4 r25.x, r23, r24 // blocker sum
      dp4 r25.y, r23, c110.y // blocker count
      
      mul r21, c132.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c132.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r25.zwzw, r4.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.x, r21.xy, s15.x
      texldl r24.y, r21.zw, s15.x
      mul r21, c133.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c133.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r25.zwzw, r4.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.z, r21.xy, s15.x
      texldl r24.w, r21.zw, s15.x
      
      add r23, r4.z, -r24
      cmp r23, r23, c110.y, c110.w
      dp4 r24.x, r23, r24
      dp4 r24.y, r23, c110.y
      add r25.xy, r25.xy, r24.xy
      
      mul r21, c134.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c134.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r25.zwzw, r4.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.x, r21.xy, s15.x
      texldl r24.y, r21.zw, s15.x
      mul r21, c135.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c135.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r25.zwzw, r4.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.z, r21.xy, s15.x
      texldl r24.w, r21.zw, s15.x
      
      add r23, r4.z, -r24
      cmp r23, r23, c110.y, c110.w
      dp4 r24.x, r23, r24
      dp4 r24.y, r23, c110.y
      add r25.xy, r25.xy, r24.xy
      
      mul r21, c136.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c136.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r25.zwzw, r4.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.x, r21.xy, s15.x
      texldl r24.y, r21.zw, s15.x
      mul r21, c137.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c137.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r25.zwzw, r4.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.z, r21.xy, s15.x
      texldl r24.w, r21.zw, s15.x
      
      add r23, r4.z, -r24
      cmp r23, r23, c110.y, c110.w
      dp4 r24.x, r23, r24
      dp4 r24.y, r23, c110.y
      add r25.xy, r25.xy, r24.xy
      
      if_gt r25.y, c110.w
        rcp r25.y, r25.y
        mul r25.x, r25.x, r25.y
        rcp r25.y, r25.x
        add r25.x, r4.z, -r25.x
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
      mul r25.y, r25.y, -c217_abs.z
      mul r25.y, r25.y, c223.y
      mad r4.z, r25.x, r25.y, r4.z
    endif
    
    if_eq c221.x, r26.w
      dp2add r21.y, vPos, c112.xy, c112.w
      mad r21.y, r21.y, c111.x, c111.y
      frc r21.y, r21.y
      mad r21.y, r21.y, c111.z, c111.w
      sincos r22.xy, r21.y
      
      mul r21, r22.yxxy, c110.xxyz
      mad r21, r21, r20.xyxy, r4.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r23.x, r21.xy, s15.x
      texldl r23.y, r21.zw, s15.x
      
      mul r21, r22.yxxy, c113.xxyz
      mad r21, r21, r20.xyxy, r4.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r23.z, r21.xy, s15.x
      texldl r23.w, r21.zw, s15.x
      
      add r23, r23, -r4.z
      cmp r23, r23, c110.y, c110.w
      dp4 r20.x, r23, -c110.x
    else
      mul r21, c130.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c130.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r4.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.x, r21.xy, s15.x
      texldl r24.y, r21.zw, s15.x
      mul r21, c131.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c131.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r4.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.z, r21.xy, s15.x
      texldl r24.w, r21.zw, s15.x
      add r24, r24, -r4.z
      cmp r24, r24, c110.y, c110.w
      dp4 r25.x, r24, -c110.x
      
      mul r21, c132.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c132.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r4.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.x, r21.xy, s15.x
      texldl r24.y, r21.zw, s15.x
      mul r21, c133.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c133.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r4.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.z, r21.xy, s15.x
      texldl r24.w, r21.zw, s15.x
      add r24, r24, -r4.z
      cmp r24, r24, c110.y, c110.w
      dp4 r25.y, r24, -c110.x
      
      mul r21, c134.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c134.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r4.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.x, r21.xy, s15.x
      texldl r24.y, r21.zw, s15.x
      mul r21, c135.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c135.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r4.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.z, r21.xy, s15.x
      texldl r24.w, r21.zw, s15.x
      add r24, r24, -r4.z
      cmp r24, r24, c110.y, c110.w
      dp4 r25.z, r24, -c110.x
      
      mul r21, c136.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c136.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r4.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.x, r21.xy, s15.x
      texldl r24.y, r21.zw, s15.x
      mul r21, c137.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c137.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r4.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.z, r21.xy, s15.x
      texldl r24.w, r21.zw, s15.x
      add r24, r24, -r4.z
      cmp r24, r24, c110.y, c110.w
      dp4 r25.w, r24, -c110.x
      
      dp4 r20.x, r25, -c110.x
    endif
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    // -------------------------------------------------------------- Improved Fadeout --------------------------------------------------------------
    rcp r20.y, c53.w
    mul_sat r20.y, r20.y, r2.w
    mul r20.y, r20.y, r20.y
    lrp r2.w, r20.y, c110.y, r20.x // improved fadeout
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    mul r3.xyz, r3, r1.w
    mul r3.xyz, r2.w, r3
    mad r1.xyz, r1, v2.x, r3
    add r3, c19, -v3.x
    add r4, c20, -v3.y
    add r5, c21, -v3.z
    mul r6, r3, r3
    mad r6, r4, r4, r6
    mad r6, r5, r5, r6
    add r7, r6, c2.w
    rsq r8.x, r7.x
    rsq r8.y, r7.y
    rsq r8.z, r7.z
    rsq r8.w, r7.w
    mov r7.y, c2.y
    mad r6, r6, -c25, -r7.y
    max r9, r6, c2.x
    mul r6, r9, r9
    mad r6, r6, r6, c1.y
    mul r9, r6, c1.z
    cmp r6, r6, r9, c2.x
    mul r9, r2.x, r3
    mad r9, r4, r2.y, r9
    mad r9, r5, r2.z, r9
    mul r6, r6, r9
    mul_sat r6, r8, r6
    mul r3, r3, -c22
    mad r3, r4, -c23, r3
    mad r3, r5, -c24, r3
    mul r3, r8, r3
    mov r4, c26
    mad_sat r3, r3, r4, c27
    mul r3, r6, r3
    dp4 r4.x, c29, r3
    dp4 r4.y, c30, r3
    dp4 r4.z, c31, r3
    add r1.xyz, r1, r4
    add r3, c32, -v3.x
    add r4, c33, -v3.y
    add r5, c34, -v3.z
    mul r6, r3, r3
    mad r6, r4, r4, r6
    mad r6, r5, r5, r6
    add r8, r6, c2.w
    rsq r9.x, r8.x
    rsq r9.y, r8.y
    rsq r9.z, r8.z
    rsq r9.w, r8.w
    mad r6, r6, -c36, -r7.y
    max r8, r6, c2.x
    mul r6, r8, r8
    mad r6, r6, r6, c1.y
    mul r8, r6, c1.z
    cmp r6, r6, r8, c2.x
    mul r8, r2.x, r3
    mad r8, r4, r2.y, r8
    mad r2, r5, r2.z, r8
    mul r2, r6, r2
    mul_sat r2, r9, r2
    mul r3, r3, -c67
    mad r3, r4, -c68, r3
    mad r3, r5, -c69, r3
    mul r3, r9, r3
    mov r4, c70
    mad_sat r3, r3, r4, c71
    mul r2, r2, r3
    dp4 r3.x, c35, r2
    dp4 r3.y, c64, r2
    dp4 r3.z, c65, r2
    add r1.xyz, r1, r3
    mov r1.w, -c2.y
    mul r2, r0, r1
    mul oC0.w, r2.w, c39.x
    add r0.w, c16.w, -v1.w
    add r1.w, -c16.z, c16.w
    rcp r1.w, r1.w
    mul_sat r0.w, r0.w, r1.w
    add r0.w, -r0.w, -c2.y
    add r3.xy, r7.y, c16
    mul r1.w, r0.w, r3.y
    mad r0.w, r0.w, r3.x, -c2.y
    dp3 r2.x, r2, c4
    mad r0.xyz, r0, r1, -r2.x
    mad r0.xyz, r0.w, r0, r2.x
    add r0.w, r2.x, c1.w
    pow r2.x, r0_abs.w, r1.w
    mul r1.xyz, r0, r2.x
    rcp r0.w, c41.x
    mul_sat r0.w, r0.w, v1.w
    add r1.w, -c41.x, v1.w
    add r2.y, -c41.x, c41.y
    rcp r2.y, r2.y
    mul_sat r1.w, r1.w, r2.y
    lrp r2.y, c41.w, r0.w, r1.w
    add r0.w, r2.y, c41.z
    mov r3.xyz, c43
    add r2.yzw, -r3.xxyz, c42.xxyz
    mad r2.yzw, r1.w, r2, c43.xxyz
    mad r0.xyz, r0, -r2.x, r2.yzww
    mad oC0.xyz, r0.w, r0, r1
    
    // LogDepth Write
    if_ne v9.y, c127.x
      rcp r20.x, c128.x
      mul r20.y, r20.x, v9.w
      mul r20.x, r20.x, c128.y
      log r20.x, r20.x
      log r20.y, r20.y
      rcp r20.x, r20.x
      mul r20.x, r20.x, r20.y
    else
      rcp r20.x, v9.w
      mul r20.x, r20.x, v9.z
    endif
    mov oDepth, r20.x

// approximately 217 instruction slots used (15 texture, 202 arithmetic)
