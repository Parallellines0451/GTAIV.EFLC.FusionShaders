// Summary: removed unnecessary stipple + improved shadow filter + restored normal offset bias + improved shadow fadeout + sped up forward fading
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D BumpSampler;
//   samplerCUBE EnvironmentSampler;
//   sampler2D SpecSampler;
//   sampler2D StippleTexture;
//   sampler2D TextureSampler;
//   float bumpiness;
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
//   float reflectivePower;
//   float3 specMapIntMask;
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
//   specMapIntMask       c73      1
//   bumpiness            c74      1
//   reflectivePower      c75      1
//   TextureSampler       s0       1
//   BumpSampler          s1       1
//   SpecSampler          s2       1
//   EnvironmentSampler   s4       1
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
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 4.9886225330e-43 // 356
    def c127, 0.9999999, 1, 0, 0 // LogDepth constants
    def c0, 1, -0.5, 9.99999975e-006, -0.00999999978
    def c1, 100, -0.5, 0.5, -0.25
    def c2, 1.33333337, 1, 0, 1.5
    def c3, 4, 0.125, 9.99999975e-005, 0
    def c4, 0.0833333358, -0.100000001, 1.11111116, 3.99600005
    def c5, 1, -1, 0, -0
    def c6, -0.321940005, -0.932614982, -0.791558981, -0.597710013
    def c7, 0.507430971, 0.0644249991, 0.896420002, 0.412458003
    def c8, 0.519456029, 0.767022014, 0.185461, -0.893123984
    def c9, 0.962339997, -0.194983006, 0.473434001, -0.480026007
    def c10, -0.69591397, 0.457136989, -0.203345001, 0.620715976
    def c11, -0.326211989, -0.405809999, -0.840143979, -0.0735799968
    def c46, 2, 0, 0, 0
    dcl_texcoord v0.xy
    dcl_texcoord1 v1.xyz
    dcl_texcoord3 v2.xyz
    dcl_texcoord4 v3.xyz
    dcl_texcoord5 v4.xyz
    dcl_color v5
    dcl_texcoord6 v6.xyz
    dcl vPos.xy
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s1
    dcl_2d s2
    dcl_cube s4
    dcl_2d s10
    dcl_2d s15
    mov r31.w, c39.x
    mul_sat r31.w, r31.w, c46.x
    texld r0, v0, s1
    add r0.z, -r0.w, c0.x
    add r0.z, -r0.x, r0.z
    cmp r0.xy, r0.z, r0.wyzw, r0
    texld r1, v0, s0
    add r0.zw, r0.xyxy, c0.y
    mul r0.zw, r0, c74.x
    dp2add r0.x, r0, -r0, c0.x
    rsq r0.x, r0.x
    rcp r0.x, r0.x
    mul r2.xyz, r0.z, v3
    mad r0.xyz, v1, r0.x, r2
    mad r0.xyz, r0.w, v4, r0
    add r0.xyz, r0, c0.z
    nrm r2.xyz, r0
    texld r0, v0, s2
    dp3 r0.x, r0, c73
    mul r0.x, r0.x, c72.x
    add r3.xyz, c0.z, v2
    nrm r4.xyz, r3
    dp3 r0.y, -r4, r2
    add r0.y, r0.y, r0.y
    mad r3.xyz, r2, -r0.y, -r4
    add r4.xyz, r3.xzyw, c0.z
    dp3 r0.y, r4, r4
    rsq r0.y, r0.y
    mul r4.xyz, r4, r0.y
    texld r4, r4, s4
    mul r4.xyz, r0.x, r4
    mul r4.xyz, r4, c75.x
    mul r5, r1, v5
    mad r0.y, r1.w, v5.w, c0.w
    rcp r0.z, r5.w
    cmp r0.y, r0.y, r0.z, c1.x
    mad r5.xyz, r4, r0.y, r5
    mad_sat r0.y, r2.z, c1.y, c1.z
    mov r1.xyz, c38
    mad r1.xyz, r1, r0.y, c37
    mul r4.xyz, c18.w, c18
    dp3 r0.y, r2, -c17
    mul r22.xyz, r2.y, c61.xyww
    mad r22.xyz, r2.x, c60.xyww, r22
    mad r22.xyz, r2.z, c62.xyww, r22
    add r0.y, r0.y, c1.w
    mul_sat r0.y, r0.y, c2.x
    mul r6.xyz, c61.xyww, v6.y
    mad r6.xyz, v6.x, c60.xyww, r6
    mad r6.xyz, v6.z, c62.xyww, r6
    add r6.xyz, r6, c63.xyww
    dp3 r0.z, c14, v6
    add r7.xyz, -r0.z, -c54
    cmp r7.yzw, r7.xxyz, c2.y, c2.z
    mov r7.x, c0.x
    mad r21, r7, c110.yyyw, -r7.yzww // shadow cascade mask
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
    mul r24.x, r24.x, c218_abs.z
    rcp r24.y, r24.x
    add r24.x, r23.x, -r24.x
    add r24.x, v9.w, -r24.x
    mul_sat r22.w, r24.x, r24.y // blending factor
    
    rcp r23.w, r23.x
    mul r23.w, r23.y, r23.w
    mov r23.z, c110.y
    
    lrp r20.xy, r22.w, r23.yw, r23.xz
    
    mul r26.y, r20.y, r23.x
    rcp r26.y, r26.y
    mul r26.y, r26.y, r26.x
    
    mul r20.xy, r20.xy, c53.z // scale bias and blur with resolution
    
    mul r20.x, r20.x, c218_abs.y
    mul r20.x, r20.x, c223.y // scale bias with FOV
    mad r6.xyz, r22.xyz, r20.x, r6 // normal offset bias
    
    rcp r20.x, c58.x
    mul r20.x, r20.x, c57.x
    mul r20.x, r20.x, r20.y // fix filter stretching
    
    dp4 r20.z, r21_abs, c119 // fix pixels leaking into other cascades
    dp4 r20.w, r21_abs, c120
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    dp4 r8.x, r7, c57
    dp4 r8.y, r7, c58
    dp4 r9.x, r7, c59
    dp4 r9.y, r7, c56
    mad r6.xy, r6, r8, r9
    add r7.xyz, c15, -v6
    dp3 r0.z, r7, r7
    rsq r0.z, r0.z
    rcp r0.z, r0.z
    /* removed 1.0.6.0 filter
    rcp r1.w, c53.w
    mul r1.w, r0.z, r1.w
    mul r1.w, r1.w, r1.w
    mul r1.w, r1.w, c2.w
    mov r7.y, c53.y
    mad r7.xz, r7.y, c11.xyyw, r6.xyyw
    texld r8, r7.xzzw, s15
    add r2.w, r6.z, -r8.x
    cmp r2.w, r2.w, c2.y, c2.z
    mad r7.xz, r7.y, c11.zyww, r6.xyyw
    texld r8, r7.xzzw, s15
    add r3.w, r6.z, -r8.x
    cmp r3.w, r3.w, c2.y, c2.z
    add r2.w, r2.w, r3.w
    mad r7.xz, r7.y, c10.xyyw, r6.xyyw
    texld r8, r7.xzzw, s15
    add r3.w, r6.z, -r8.x
    cmp r3.w, r3.w, c2.y, c2.z
    add r2.w, r2.w, r3.w
    mad r7.xz, r7.y, c10.zyww, r6.xyyw
    texld r8, r7.xzzw, s15
    add r3.w, r6.z, -r8.x
    cmp r3.w, r3.w, c2.y, c2.z
    add r2.w, r2.w, r3.w
    mad r7.xz, r7.y, c9.xyyw, r6.xyyw
    texld r8, r7.xzzw, s15
    add r3.w, r6.z, -r8.x
    cmp r3.w, r3.w, c2.y, c2.z
    add r2.w, r2.w, r3.w
    mad r7.xz, r7.y, c9.zyww, r6.xyyw
    texld r8, r7.xzzw, s15
    add r3.w, r6.z, -r8.x
    cmp r3.w, r3.w, c2.y, c2.z
    add r2.w, r2.w, r3.w
    mad r7.xz, r7.y, c8.xyyw, r6.xyyw
    texld r8, r7.xzzw, s15
    add r3.w, r6.z, -r8.x
    cmp r3.w, r3.w, c2.y, c2.z
    add r2.w, r2.w, r3.w
    mad r7.xz, r7.y, c8.zyww, r6.xyyw
    texld r8, r7.xzzw, s15
    add r3.w, r6.z, -r8.x
    cmp r3.w, r3.w, c2.y, c2.z
    add r2.w, r2.w, r3.w
    mad r7.xz, r7.y, c7.xyyw, r6.xyyw
    texld r8, r7.xzzw, s15
    add r3.w, r6.z, -r8.x
    cmp r3.w, r3.w, c2.y, c2.z
    add r2.w, r2.w, r3.w
    mad r7.xz, r7.y, c7.zyww, r6.xyyw
    texld r8, r7.xzzw, s15
    add r3.w, r6.z, -r8.x
    cmp r3.w, r3.w, c2.y, c2.z
    add r2.w, r2.w, r3.w
    mad r7.xz, r7.y, c6.xyyw, r6.xyyw
    texld r8, r7.xzzw, s15
    add r3.w, r6.z, -r8.x
    cmp r3.w, r3.w, c2.y, c2.z
    add r2.w, r2.w, r3.w
    mad r6.xy, r7.y, c6.zwzw, r6
    texld r7, r6, s15
    add r3.w, r6.z, -r7.x
    cmp r3.w, r3.w, c2.y, c2.z
    add r2.w, r2.w, r3.w
    mad r1.w, r2.w, c4.x, r1.w
    add r0.z, r0.z, -c53.w
    cmp r6.xy, r0.z, c5, c5.zwzw
    add r0.z, r1.w, r6.y
    cmp_sat r0.z, r0.z, r1.w, r6.x
    removed 1.0.6.0 filter */
    // ---------------------------------------------------------- Improved Shadow Filter ------------------------------------------------------------
    mul r21.xy, vPos.xy, c112.z
    texldl r21, r21, s10
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
      mad r21, r23, r25.zwzw, r6.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24, r21.xy, s15
      texldl r23, r21.zw, s15
      mov r24.y, r23.x
      mul r21, c131.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c131.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r25.zwzw, r6.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r23, r21.xy, s15
      mov r24.z, r23.x
      texldl r23, r21.zw, s15
      mov r24.w, r23.x
      
      add r23, r24, -r6.z
      cmp r23, r23, c110.y, c110.w
      dp4 r25.x, r23, r24 // blocker sum
      dp4 r25.y, r23, c110.y // blocker count
      
      mul r21, c132.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c132.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r25.zwzw, r6.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24, r21.xy, s15
      texldl r23, r21.zw, s15
      mov r24.y, r23.x
      mul r21, c133.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c133.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r25.zwzw, r6.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r23, r21.xy, s15
      mov r24.z, r23.x
      texldl r23, r21.zw, s15
      mov r24.w, r23.x
      
      add r23, r24, -r6.z
      cmp r23, r23, c110.y, c110.w
      dp4 r24.x, r23, r24
      dp4 r24.y, r23, c110.y
      add r25.xy, r25.xy, r24.xy
      
      mul r21, c134.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c134.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r25.zwzw, r6.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24, r21.xy, s15
      texldl r23, r21.zw, s15
      mov r24.y, r23.x
      mul r21, c135.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c135.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r25.zwzw, r6.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r23, r21.xy, s15
      mov r24.z, r23.x
      texldl r23, r21.zw, s15
      mov r24.w, r23.x
      
      add r23, r24, -r6.z
      cmp r23, r23, c110.y, c110.w
      dp4 r24.x, r23, r24
      dp4 r24.y, r23, c110.y
      add r25.xy, r25.xy, r24.xy
      
      mul r21, c136.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c136.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r25.zwzw, r6.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24, r21.xy, s15
      texldl r23, r21.zw, s15
      mov r24.y, r23.x
      mul r21, c137.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c137.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r25.zwzw, r6.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r23, r21.xy, s15
      mov r24.z, r23.x
      texldl r23, r21.zw, s15
      mov r24.w, r23.x
      
      add r23, r24, -r6.z
      cmp r23, r23, c110.y, c110.w
      dp4 r24.x, r23, r24
      dp4 r24.y, r23, c110.y
      add r25.xy, r25.xy, r24.xy
      
      if_gt r25.y, c110.w
        rcp r25.y, r25.y
        mul r25.x, r25.x, r25.y
        add r25.y, -r25.x, c139.x
        rcp r25.y, r25.y
        add r25.x, -r6.z, r25.x
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
      mad r6.z, r25.x, r25.y, r6.z
    endif
    
    if_lt c221.x, r26.z
      dp2add r21.y, vPos, c112.xy, c112.w
      mad r21.y, r21.y, c111.x, c111.y
      frc r21.y, r21.y
      mad r21.y, r21.y, c111.z, c111.w
      sincos r22.xy, r21.y
      mul r21, r22.yxxy, c110.xxyz
      mul r22, r22.yxxy, c113.xxyz
      mad r21, r21, r20.xyxy, r6.xyxy
      mad r22, r22, r20.xyxy, r6.xyxy
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
      add r24, r6.z, -r24
      cmp r24, r24, c110.y, c110.w
      dp4 r20.x, r24, -c110.x
    else
      mul r21, c130.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c130.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r6.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24, r21.xy, s15
      texldl r23, r21.zw, s15
      mov r24.y, r23.x
      mul r21, c131.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c131.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r6.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r23, r21.xy, s15
      mov r24.z, r23.x
      texldl r23, r21.zw, s15
      mov r24.w, r23.x
      add r24, r6.z, -r24
      cmp r24, r24, c110.y, c110.w
      dp4 r25.x, r24, -c110.x
      
      mul r21, c132.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c132.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r6.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24, r21.xy, s15
      texldl r23, r21.zw, s15
      mov r24.y, r23.x
      mul r21, c133.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c133.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r6.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r23, r21.xy, s15
      mov r24.z, r23.x
      texldl r23, r21.zw, s15
      mov r24.w, r23.x
      add r24, r6.z, -r24
      cmp r24, r24, c110.y, c110.w
      dp4 r25.y, r24, -c110.x
      
      mul r21, c134.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c134.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r6.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24, r21.xy, s15
      texldl r23, r21.zw, s15
      mov r24.y, r23.x
      mul r21, c135.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c135.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r6.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r23, r21.xy, s15
      mov r24.z, r23.x
      texldl r23, r21.zw, s15
      mov r24.w, r23.x
      add r24, r6.z, -r24
      cmp r24, r24, c110.y, c110.w
      dp4 r25.z, r24, -c110.x
      
      mul r21, c136.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c136.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r6.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24, r21.xy, s15
      texldl r23, r21.zw, s15
      mov r24.y, r23.x
      mul r21, c137.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c137.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r6.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r23, r21.xy, s15
      mov r24.z, r23.x
      texldl r23, r21.zw, s15
      mov r24.w, r23.x
      add r24, r6.z, -r24
      cmp r24, r24, c110.y, c110.w
      dp4 r25.w, r24, -c110.x
      
      dp4 r20.x, r25, -c110.x
    endif
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    // -------------------------------------------------------------- Improved Fadeout --------------------------------------------------------------
    rcp r20.y, c53.w
    mul_sat r20.y, r20.y, r0.z
    mul r20.y, r20.y, r20.y
    lrp r0.z, r20.y, c110.y, r20.x // improved fadeout
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    mul r6.xyz, r4, r0.y
    mul r6.xyz, r0.z, r6
    mad r1.xyz, r1, v5.x, r6
    add r6, c19, -v6.x
    add r7, c20, -v6.y
    add r8, c21, -v6.z
    mul r9, r6, r6
    mad r9, r7, r7, r9
    mad r9, r8, r8, r9
    add r10, r9, c0.z
    rsq r11.x, r10.x
    rsq r11.y, r10.y
    rsq r11.z, r10.z
    rsq r11.w, r10.w
    mov r10.x, c0.x
    mad r9, r9, -c25, r10.x
    max r12, r9, c2.z
    mul r9, r12, r12
    mad r9, r9, r9, c4.y
    mul r12, r9, c4.z
    cmp r9, r9, r12, c2.z
    mul r12, r2.x, r6
    mad r12, r7, r2.y, r12
    mad r12, r8, r2.z, r12
    mul r9, r9, r12
    mul_sat r9, r11, r9
    mul r12, r6, -c22
    mad r12, r7, -c23, r12
    mad r12, r8, -c24, r12
    mul r12, r11, r12
    mov r13, c26
    mad_sat r12, r12, r13, c27
    mul r9, r9, r12
    dp4 r12.x, c29, r9
    dp4 r12.y, c30, r9
    dp4 r12.z, c31, r9
    add r1.xyz, r1, r12
    add r12, c32, -v6.x
    add r13, c33, -v6.y
    add r14, c34, -v6.z
    mul r15, r12, r12
    mad r15, r13, r13, r15
    mad r15, r14, r14, r15
    add r16, r15, c0.z
    rsq r17.x, r16.x
    rsq r17.y, r16.y
    rsq r17.z, r16.z
    rsq r17.w, r16.w
    mad r10, r15, -c36, r10.x
    max r15, r10, c2.z
    mul r10, r15, r15
    mad r10, r10, r10, c4.y
    mul r15, r10, c4.z
    cmp r10, r10, r15, c2.z
    mul r15, r2.x, r12
    mad r15, r13, r2.y, r15
    mad r2, r14, r2.z, r15
    mul r2, r10, r2
    mul_sat r2, r17, r2
    mul r10, r12, -c67
    mad r10, r13, -c68, r10
    mad r10, r14, -c69, r10
    mul r10, r17, r10
    mov r15, c70
    mad_sat r10, r10, r15, c71
    mul r2, r2, r10
    dp4 r10.x, c35, r2
    dp4 r10.y, c64, r2
    dp4 r10.z, c65, r2
    add r1.xyz, r1, r10
    mov r1.w, c0.x
    mul r1, r5, r1
    mul r0.y, r1.w, r31.w
    /* removed stipple
    mov_sat r1.w, r0.y
    mul r1.w, r1.w, c4.w
    frc r3.w, r1.w
    mul r4.w, r3.w, c3.x
    frc r5.x, r4.w
    add r5.x, r4.w, -r5.x
    add r5.y, r1.w, -r3.w
    mul r5.zw, c3.y, vPos.xyxy
    frc r5.zw, r5_abs
    cmp r5.zw, vPos.xyxy, r5, -r5
    mul r5.zw, r5, -c1.w
    mad r5.xy, r5, -c1.w, r5.zwzw
    mov r5.zw, c2.z
    texldl r5, r5, s10
    cmp r5, -r5.y, -c2.y, -c2.z
    texkill r5
    removed stipple */
    mul r1.w, r0.w, c66.x
    dp3_sat r3.w, -c17, r3
    add r3.w, r3.w, c3.z
    mov r5.z, c3.z
    mad r0.w, r0.w, c66.x, r5.z
    pow r4.w, r3.w, r0.w
    mul r4.xyz, r4, r4.w
    mul r4.xyz, r0.z, r4
    mul r0.z, r1.w, -c1.w
    mul r5, r3.x, r6
    mad r5, r3.y, r7, r5
    mad r5, r3.z, r8, r5
    mul r5, r11, r5
    log r6.x, r5_abs.x
    log r6.y, r5_abs.y
    log r6.z, r5_abs.z
    log r6.w, r5_abs.w
    mul r5, r0.z, r6
    exp r6.x, r5.x
    exp r6.y, r5.y
    exp r6.z, r5.z
    exp r6.w, r5.w
    mul r5, r9, r6
    dp4 r6.x, c29, r5
    dp4 r6.y, c30, r5
    dp4 r6.z, c31, r5
    mad r4.xyz, r4, c17.w, r6
    mul r5, r3.x, r12
    mad r5, r3.y, r13, r5
    mad r3, r3.z, r14, r5
    mul r3, r17, r3
    log r5.x, r3_abs.x
    log r5.y, r3_abs.y
    log r5.z, r3_abs.z
    log r5.w, r3_abs.w
    mul r3, r0.z, r5
    exp r5.x, r3.x
    exp r5.y, r3.y
    exp r5.z, r3.z
    exp r5.w, r3.w
    mul r2, r2, r5
    dp4 r3.x, c35, r2
    dp4 r3.y, c64, r2
    dp4 r3.z, c65, r2
    add r2.xyz, r4, r3
    mad oC0.xyz, r0.x, r2, r1
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

// approximately 272 instruction slots used (18 texture, 254 arithmetic)
