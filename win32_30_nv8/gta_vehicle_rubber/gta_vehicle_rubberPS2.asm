// Summary: improved cascaded shadows + added volumetric fog
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   float4 NearFarPlane;
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
//   float specularColorFactor;
//   float specularFactor;
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
//   matDiffuseColor      c66      1
//   gLightDir2X          c67      1
//   gLightDir2Y          c68      1
//   gLightDir2Z          c69      1
//   gLightConeScale2     c70      1
//   gLightConeOffset2    c71      1
//   dirtLevel            c72      1
//   dirtColor            c73      1
//   specularFactor       c74      1
//   specularColorFactor  c75      1
//   specMapIntMask       c76      1
//   reflectivePowerED    c77      1
//   LuminanceConstants   c78      1
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
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 1.0173426851e-42 // 726
    def c127, 1, 0.99, 0, 0 // LogDepth constants
    def c140, 1e-6, 0.5, -0.0625, 0.9375
    def c141, 0.6, 4, 1, 30
    def c142, 1000, 0, 0, 0
    def c0, 9.99999975e-006, 0, 1, -0.25
    def c1, -0.5, 0.5, 1.33333337, 9.99999975e-005
    def c2, 1.5, -0.326211989, -0.405809999, 0.0833333358
    def c3, -0.791558981, -0.597710013, -0.100000001, 1.11111116
    def c4, 0.212500006, 0.715399981, 0.0720999986, 1.00000001e-007
    def c5, 1, -1, 0, -0
    def c6, 0.896420002, 0.412458003, -0.321940005, -0.932614982
    def c7, 0.185461, -0.893123984, 0.507430971, 0.0644249991
    def c8, 0.473434001, -0.480026007, 0.519456029, 0.767022014
    def c9, -0.203345001, 0.620715976, 0.962339997, -0.194983006
    def c10, -0.840143979, -0.0735799968, -0.69591397, 0.457136989
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
    dcl_2d s10 // added noise texture
    dcl_2d s15
    texld r0, v0, s0
    add r1.xyz, c0.x, v1
    nrm r2.xyz, r1
    texld r1, v0, s2
    mul r1.w, r1.w, c74.x
    mul r2.w, r1.w, c77.x
    dp3 r1.x, r1, c76
    mul r1.x, r1.x, c75.x
    mul r1.x, r1.x, c77.x
    mul r0.xyz, r0, c66
    mul r0, r0, v3
    dp3 r1.y, v3, c78
    mul r1.y, r1.y, c39.z
    mov r3.yz, c0
    if_lt -c72.x, r3.y
      texld r4, v0, s1
      mul r1.z, r4.x, c72.x
      mad r5.x, r4.x, -c72.x, r3.z
      lrp r5.yzw, r1.z, c73.xxyz, r0.xxyz
      mad r6, r0.xxyz, c0.yzzz, c0.zyyy
      cmp r4, -r4.x, r6, r5
      mov r0.xyz, r4.yzww
    else
      mov r4.x, c0.z
    endif
    mul r1.x, r1.x, r4.x
    add r3.xyw, c0.x, v2.xyzz
    nrm r4.xyz, r3.xyww
    mad_sat r1.z, r2.z, c1.x, c1.y
    mov r5.xyz, c38
    mad r3.xyw, r5.xyzz, r1.z, c37.xyzz
    dp3 r1.z, -r4, r2
    add r1.z, r1.z, r1.z
    mad r5.xyz, r2, -r1.z, -r4
    mul r6.xyz, c18.w, c18
    dp3 r1.z, r2, -c17
    mul r22.xyz, r2.y, c61.xyww
    mad r22.xyz, r2.x, c60.xyww, r22
    mad r22.xyz, r2.z, c62.xyww, r22
    add r1.z, r1.z, c0.w
    mul_sat r1.z, r1.z, c1.z
    dp3_sat r4.w, -c17, r5
    add r4.w, r4.w, c1.w
    mov r5.w, c1.w
    mad r1.w, r1.w, c77.x, r5.w
    pow r5.w, r4.w, r1.w
    mul r7.xyz, c61.xyww, v4.y
    mad r7.xyz, v4.x, c60.xyww, r7
    mad r7.xyz, v4.z, c62.xyww, r7
    add r7.xyz, r7, c63.xyww
    dp3 r1.w, c14, v4
    add r8.xyz, -r1.w, -c54
    cmp r8.yzw, r8.xxyz, c0.z, c0.y
    mov r8.x, c0.z
    mad r21, r8, c110.yyyw, -r8.yzww // shadow cascade mask
    // ---------------------------------------------------------------- Shadow Fixes -----------------------------------------------------------------
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
    
    mad r7.z, r7.z, -c139.x, c139.y
    
    rcp r20.x, c58.x
    mul r20.x, r20.x, c57.x
    mul r20.x, r20.x, r20.y // fix filter stretching
    
    dp4 r20.z, r21_abs, c119 // fix pixels leaking into other cascades
    dp4 r20.w, r21_abs, c120
    mov r21.x, c53.z
    mul r21.x, r21.x, -c110.x
    add r20.w, r20.w, -r21.x
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
    
    if_eq -c217_abs.w, c217_abs.w
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
      texldl r24.x, r21.xy, s15.x
      texldl r24.y, r21.zw, s15.x
      mul r21, c131.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c131.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r25.zwzw, r7.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.z, r21.xy, s15.x
      texldl r24.w, r21.zw, s15.x
      
      add r23, r7.z, -r24
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
      texldl r24.x, r21.xy, s15.x
      texldl r24.y, r21.zw, s15.x
      mul r21, c133.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c133.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r25.zwzw, r7.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.z, r21.xy, s15.x
      texldl r24.w, r21.zw, s15.x
      
      add r23, r7.z, -r24
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
      texldl r24.x, r21.xy, s15.x
      texldl r24.y, r21.zw, s15.x
      mul r21, c135.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c135.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r25.zwzw, r7.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.z, r21.xy, s15.x
      texldl r24.w, r21.zw, s15.x
      
      add r23, r7.z, -r24
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
      texldl r24.x, r21.xy, s15.x
      texldl r24.y, r21.zw, s15.x
      mul r21, c137.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c137.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r25.zwzw, r7.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.z, r21.xy, s15.x
      texldl r24.w, r21.zw, s15.x
      
      add r23, r7.z, -r24
      cmp r23, r23, c110.y, c110.w
      dp4 r24.x, r23, r24
      dp4 r24.y, r23, c110.y
      add r25.xy, r25.xy, r24.xy
      
      if_gt r25.y, c110.w
        rcp r25.y, r25.y
        mul r25.x, r25.x, r25.y
        rcp r25.y, r25.x
        add r25.x, r7.z, -r25.x
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
      mad r7.z, r25.x, r25.y, r7.z
    endif
    
    if_eq -c221_abs.x, c221_abs.x
      dp2add r21.y, vPos, c112.xy, c112.w
      mad r21.y, r21.y, c111.x, c111.y
      frc r21.y, r21.y
      mad r21.y, r21.y, c111.z, c111.w
      sincos r22.xy, r21.y
      
      mul r21, r22.yxxy, c110.xxyz
      mad r21, r21, r20.xyxy, r7.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r23.x, r21.xy, s15.x
      texldl r23.y, r21.zw, s15.x
      
      mul r21, r22.yxxy, c113.xxyz
      mad r21, r21, r20.xyxy, r7.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r23.z, r21.xy, s15.x
      texldl r23.w, r21.zw, s15.x
      
      add r23, r23, -r7.z
      cmp r23, r23, c110.y, c110.w
      dp4 r20.x, r23, -c110.x
    else
      mul r21, c130.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c130.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r7.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.x, r21.xy, s15.x
      texldl r24.y, r21.zw, s15.x
      mul r21, c131.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c131.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r7.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.z, r21.xy, s15.x
      texldl r24.w, r21.zw, s15.x
      add r24, r24, -r7.z
      cmp r24, r24, c110.y, c110.w
      dp4 r25.x, r24, -c110.x
      
      mul r21, c132.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c132.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r7.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.x, r21.xy, s15.x
      texldl r24.y, r21.zw, s15.x
      mul r21, c133.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c133.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r7.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.z, r21.xy, s15.x
      texldl r24.w, r21.zw, s15.x
      add r24, r24, -r7.z
      cmp r24, r24, c110.y, c110.w
      dp4 r25.y, r24, -c110.x
      
      mul r21, c134.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c134.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r7.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.x, r21.xy, s15.x
      texldl r24.y, r21.zw, s15.x
      mul r21, c135.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c135.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r7.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.z, r21.xy, s15.x
      texldl r24.w, r21.zw, s15.x
      add r24, r24, -r7.z
      cmp r24, r24, c110.y, c110.w
      dp4 r25.z, r24, -c110.x
      
      mul r21, c136.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c136.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r7.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.x, r21.xy, s15.x
      texldl r24.y, r21.zw, s15.x
      mul r21, c137.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c137.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r7.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.z, r21.xy, s15.x
      texldl r24.w, r21.zw, s15.x
      add r24, r24, -r7.z
      cmp r24, r24, c110.y, c110.w
      dp4 r25.w, r24, -c110.x
      
      dp4 r20.x, r25, -c110.x
    endif
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    // -------------------------------------------------------------- Improved Fadeout --------------------------------------------------------------
    rcp r20.y, c53.w
    mul_sat r20.y, r20.y, r1.w
    mul r20.y, r20.y, r20.y
    lrp r1.w, r20.y, c110.y, r20.x
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    mul r7.xyz, r6, r5.w
    mul r7.xyz, r1.w, r7
    mul r6.xyz, r6, r1.z
    mul r6.xyz, r1.w, r6
    mad r1.yzw, r3.xxyw, r1.y, r6.xxyz
    mul r2.w, r2.w, -c0.w
    add r6, c19, -v4.x
    add r8, c20, -v4.y
    add r9, c21, -v4.z
    mul r10, r6, r6
    mad r10, r8, r8, r10
    mad r10, r9, r9, r10
    add r11, r10, c0.x
    rsq r12.x, r11.x
    rsq r12.y, r11.y
    rsq r12.z, r11.z
    rsq r12.w, r11.w
    mad r10, r10, -c25, r3.z
    max r11, r10, c0.y
    mul r10, r11, r11
    mad r10, r10, r10, c3.z
    mul r11, r10, c3.w
    cmp r10, r10, r11, c0.y
    mul r11, r2.x, r6
    mad r11, r8, r2.y, r11
    mad r11, r9, r2.z, r11
    mul r10, r10, r11
    mul_sat r10, r12, r10
    mul r11, r6, -c22
    mad r11, r8, -c23, r11
    mad r11, r9, -c24, r11
    mul r11, r12, r11
    mov r13, c26
    mad_sat r11, r11, r13, c27
    mul r10, r10, r11
    mul r6, r5.x, r6
    mad r6, r5.y, r8, r6
    mad r6, r5.z, r9, r6
    mul r6, r12, r6
    log r8.x, r6_abs.x
    log r8.y, r6_abs.y
    log r8.z, r6_abs.z
    log r8.w, r6_abs.w
    mul r6, r2.w, r8
    exp r8.x, r6.x
    exp r8.y, r6.y
    exp r8.z, r6.z
    exp r8.w, r6.w
    mul r6, r10, r8
    dp4 r8.x, c29, r10
    dp4 r8.y, c30, r10
    dp4 r8.z, c31, r10
    dp4 r9.x, c29, r6
    dp4 r9.y, c30, r6
    dp4 r9.z, c31, r6
    add r1.yzw, r1, r8.xxyz
    mad r3.xyw, r7.xyzz, c17.w, r9.xyzz
    add r6, c32, -v4.x
    add r7, c33, -v4.y
    add r8, c34, -v4.z
    mul r9, r6, r6
    mad r9, r7, r7, r9
    mad r9, r8, r8, r9
    add r10, r9, c0.x
    rsq r11.x, r10.x
    rsq r11.y, r10.y
    rsq r11.z, r10.z
    rsq r11.w, r10.w
    mad r9, r9, -c36, r3.z
    max r10, r9, c0.y
    mul r9, r10, r10
    mad r9, r9, r9, c3.z
    mul r10, r9, c3.w
    cmp r9, r9, r10, c0.y
    mul r10, r2.x, r6
    mad r10, r7, r2.y, r10
    mad r10, r8, r2.z, r10
    mul r9, r9, r10
    mul_sat r9, r11, r9
    mul r10, r6, -c67
    mad r10, r7, -c68, r10
    mad r10, r8, -c69, r10
    mul r10, r11, r10
    mov r12, c70
    mad_sat r10, r10, r12, c71
    mul r9, r9, r10
    mul r6, r5.x, r6
    mad r6, r5.y, r7, r6
    mad r5, r5.z, r8, r6
    mul r5, r11, r5
    log r6.x, r5_abs.x
    log r6.y, r5_abs.y
    log r6.z, r5_abs.z
    log r6.w, r5_abs.w
    mul r5, r2.w, r6
    exp r6.x, r5.x
    exp r6.y, r5.y
    exp r6.z, r5.z
    exp r6.w, r5.w
    mul r5, r9, r6
    dp4 r6.x, c35, r9
    dp4 r6.y, c64, r9
    dp4 r6.z, c65, r9
    dp4 r7.x, c35, r5
    dp4 r7.y, c64, r5
    dp4 r7.z, c65, r5
    add r5.xyz, r1.yzww, r6
    add r1.yzw, r3.xxyw, r7.xxyz
    dp3 r2.x, r4, r2
    add r2.x, -r2_abs.x, c0.z
    mul r2.x, r2.x, r2.x
    mul r2.x, r2.x, r2.x
    mad_sat r2.x, r2.x, c1.y, c1.y
    mul r1.x, r1.x, r2.x
    mov r5.w, c0.z
    mul r0, r0, r5
    mad r0.xyz, r1.x, r1.yzww, r0
    mul oC0.w, r0.w, c39.x
    add r0.w, c16.w, -v1.w
    add r1.x, -c16.z, c16.w
    rcp r1.x, r1.x
    mul_sat r0.w, r0.w, r1.x
    add r0.w, -r0.w, c0.z
    add r1.xy, -r3.z, c16
    mul r1.y, r0.w, r1.y
    mad r0.w, r0.w, r1.x, c0.z
    dp3 r1.x, r0, c4
    lrp r2.xyz, r0.w, r0, r1.x
    add r0.x, r1.x, c4.w
    pow r2.w, r0_abs.x, r1.y
    mul r0.xyz, r2, r2.w
    mov r20.w, c142.x
    add r20.w, c41.x, -r20.w
    mul r20.w, r20.w, c210.y
    if_ge r20.w, r20_abs.w
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
    else
      add r20.xyz, -c15, v4
      dp3 r20.w, r20, r20
      rsq r20.w, r20.w
      mul r20.xyz, r20, r20.w
      rcp r20.w, r20.w
      
      mov r21.xyz, c212
      mad r21.w, r20.x, c140.y, c140.y
      lrp r22.xyz, r21.w, r21, c213
      mul_sat r21.x, r20.z, c212.w
      mad r21.x, r21.x, -c213.w, c213.w
      mad r21.xyz, r22, r21.x, c214
      
      dp3 r21.w, r20, c216
      
      mad_sat r22.xy, r21.w, c140.zy, c140.wy
      mul r22.z, r22.x, r22.x
      mul r22.x, r22.x, r22.z
      mov r22.z, c141.x
      add_sat r22.z, r22.z, c216_abs.z
      mad r22.x, r22.x, -r22.z, r22.y
      mul_sat r22.x, r22.x, c140.y
      mul r22.x, r22.x, c141.y
      add_sat r22.y, c141.z, -r22.x
      
      mul r23.xyz, r22.x, c215
      mul r23.xyz, r23, r23
      mul r23.xyz, r23, r23
      mad r23.xyz, r22.x, c215, r23
      mul r23.xyz, r23, c215.w
      
      mul r21.xyz, r21, r22.y
      mul_sat r21.xyz, r21, c215.w
      
      add r21.xyz, r21, r23
      mul r21.xyz, r21, c214.w
      min r21.xyz, r21, c141.w
      
      mov r22.xyz, c43
      lrp r22.xyz, c41.w, r22, r21
      
      mov r20.x, c15.z
      mul r20.xy, r20.xz, c211.y
      mul r20.x, r20.x, c210.x
      exp r20.x, -r20.x
      
      add r20.z, r20_abs.y, -c140.x
      cmp r20.y, r20.z, r20.y, c140.x
      rcp r20.z, r20.y
      mul r20.y, r20.y, r20.w
      exp r20.y, -r20.y
      add r20.y, -r20.y, c141.z
      mul r20.y, r20.y, r20.z
      
      mul r20.x, r20.x, r20.y
      mul r20.xy, r20.xw, c211.x
      
      exp r20.x, -r20.x
      exp r20.y, -r20.y
      add r20.xy, -r20.xy, c141.z
      
      log r20.x, r20.x
      log r20.y, r20.y
      mul r20.xy, r20.xy, c211.zw
      exp r20.x, r20.x
      exp r20.y, r20.y
      
      lrp r22.xyz, r20.y, r22, c43
      lrp oC0.xyz, r20.x, r22, r0
    endif
    
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

// approximately 283 instruction slots used (15 texture, 268 arithmetic)
