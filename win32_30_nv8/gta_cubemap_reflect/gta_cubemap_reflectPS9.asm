// Summary: removed unnecessary stipple + improved cascaded shadows
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   float4 NearFarPlane;
//   samplerCUBE EnvironmentSampler;
//   sampler2D StippleTexture;
//   sampler2D TextureSampler;
//   float4 gDepthFxParams;
//   float4 gDirectionalColour;
//   float4 gDirectionalLight;
//   float4 gFacetCentre;
//   float4 gLightAmbient0;
//   float4 gLightAmbient1;
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
//   float reflectivePower;
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
//   reflectivePower      c66      1
//   TextureSampler       s0       1
//   EnvironmentSampler   s1       1
//   StippleTexture       s10      1
//   gShadowZSamplerDir   s15      1
//

    ps_3_0
    // -------------------------------------------------------------- Shadow Constants --------------------------------------------------------------
    def c110, -0.25, 1, -1, 0
    def c111, 0.159154937, 0.5, 6.28318548, -3.14159274
    def c112, 3, 7.13800001, 0.03125, 0
    def c113, 0.75, -0.5, 0.5, 0.0008
    
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
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 1.0649868329e-43 // 76
    def c127, 1, 0.99, 0, 0 // LogDepth constants
    def c0, 0, -1, -0, 9.99999975e-006
    def c1, -0.00999999978, 100, -0.5, 0.5
    def c2, 1.33333337, 1.5, -0.326211989, -0.405809999
    def c3, -0.791558981, -0.597710013, 0.0833333358, 1.00000001e-007
    def c4, 3.99600005, 4, 0.125, 0.25
    def c5, 0.212500006, 0.715399981, 0.0720999986, 0
    def c6, 1, -1, 0, -0
    def c7, 0.896420002, 0.412458003, -0.321940005, -0.932614982
    def c8, 0.185461, -0.893123984, 0.507430971, 0.0644249991
    def c9, 0.473434001, -0.480026007, 0.519456029, 0.767022014
    def c10, -0.203345001, 0.620715976, 0.962339997, -0.194983006
    def c11, -0.840143979, -0.0735799968, -0.69591397, 0.457136989
    dcl_texcoord v0.xy
    dcl_texcoord1 v1
    dcl_texcoord3 v2.xyz
    dcl_color v3.xw
    dcl_texcoord6 v4.xyz
    dcl vPos.xy
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_cube s1
    dcl_2d s10
    dcl_2d s15
    texld r0, v0, s0
    add r1.xyz, c0.w, v1
    nrm r2.xyz, r1
    add r1.xyz, c0.w, v2.xzyw
    dp3 r1.w, r1, r1
    rsq r1.w, r1.w
    mul r1.xyz, r1, r1.w
    dp3 r1.w, -r1.xzyw, r2
    add r1.w, r1.w, r1.w
    mad r1.xyz, r2.xzyw, -r1.w, -r1
    add r1.xyz, r1, c0.w
    dp3 r1.w, r1, r1
    rsq r1.w, r1.w
    mul r1.xyz, r1, r1.w
    texld r1, r1, s1
    mul r1.xyz, r1, c66.x
    mul r3.w, r0.w, v3.w
    mad r0.w, r0.w, v3.w, c1.x
    rcp r1.w, r3.w
    cmp r0.w, r0.w, r1.w, c1.y
    mad r3.xyz, r1, r0.w, r0
    mad_sat r0.x, r2.z, c1.z, c1.w
    mov r1.xyz, c38
    mad r0.xyz, r1, r0.x, c37
    mul r1.xyz, c18.w, c18
    dp3 r0.w, r2, -c17
    mul r22.xyz, r2.y, c61.xyww
    mad r22.xyz, r2.x, c60.xyww, r22
    mad r22.xyz, r2.z, c62.xyww, r22
    add r0.w, r0.w, -c4.w
    mul_sat r0.w, r0.w, c2.x
    mul r2.xyz, c61.xyww, v4.y
    mad r2.xyz, v4.x, c60.xyww, r2
    mad r2.xyz, v4.z, c62.xyww, r2
    add r2.xyz, r2, c63.xyww
    dp3 r1.w, c14, v4
    add r4.xyz, -r1.w, -c54
    cmp r4.yzw, r4.xxyz, -c0.y, -c0.z
    mov r4.x, -c0.y
    mad r21, r4, c110.yyyw, -r4.yzww // shadow cascade mask
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
    mad r2.xyz, r22, r20.x, r2 // normal offset bias
    
    mad r2.z, r2.z, -c139.x, c139.y
    
    rcp r20.x, c58.x
    mul r20.x, r20.x, c57.x
    mul r20.x, r20.x, r20.y // fix filter stretching
    
    dp4 r20.z, r21_abs, c119 // fix pixels leaking into other cascades
    dp4 r20.w, r21_abs, c120
    mov r21.x, c53.z
    mul r21.x, r21.x, -c110.x
    add r20.w, r20.w, -r21.x
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    dp4 r5.x, r4, c57
    dp4 r5.y, r4, c58
    dp4 r6.x, r4, c59
    dp4 r6.y, r4, c56
    mad r2.xy, r2, r5, r6
    add r4.xyz, c15, -v4
    dp3 r1.w, r4, r4
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
      mad r21, r23, r25.zwzw, r2.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.x, r21.xy, s15.x
      texldl r24.y, r21.zw, s15.x
      mul r21, c131.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c131.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r25.zwzw, r2.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.z, r21.xy, s15.x
      texldl r24.w, r21.zw, s15.x
      
      add r23, r2.z, -r24
      cmp r23, r23, c110.y, c110.w
      dp4 r25.x, r23, r24 // blocker sum
      dp4 r25.y, r23, c110.y // blocker count
      
      mul r21, c132.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c132.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r25.zwzw, r2.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.x, r21.xy, s15.x
      texldl r24.y, r21.zw, s15.x
      mul r21, c133.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c133.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r25.zwzw, r2.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.z, r21.xy, s15.x
      texldl r24.w, r21.zw, s15.x
      
      add r23, r2.z, -r24
      cmp r23, r23, c110.y, c110.w
      dp4 r24.x, r23, r24
      dp4 r24.y, r23, c110.y
      add r25.xy, r25.xy, r24.xy
      
      mul r21, c134.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c134.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r25.zwzw, r2.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.x, r21.xy, s15.x
      texldl r24.y, r21.zw, s15.x
      mul r21, c135.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c135.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r25.zwzw, r2.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.z, r21.xy, s15.x
      texldl r24.w, r21.zw, s15.x
      
      add r23, r2.z, -r24
      cmp r23, r23, c110.y, c110.w
      dp4 r24.x, r23, r24
      dp4 r24.y, r23, c110.y
      add r25.xy, r25.xy, r24.xy
      
      mul r21, c136.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c136.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r25.zwzw, r2.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.x, r21.xy, s15.x
      texldl r24.y, r21.zw, s15.x
      mul r21, c137.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c137.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r25.zwzw, r2.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.z, r21.xy, s15.x
      texldl r24.w, r21.zw, s15.x
      
      add r23, r2.z, -r24
      cmp r23, r23, c110.y, c110.w
      dp4 r24.x, r23, r24
      dp4 r24.y, r23, c110.y
      add r25.xy, r25.xy, r24.xy
      
      if_gt r25.y, c110.w
        rcp r25.y, r25.y
        mul r25.x, r25.x, r25.y
        rcp r25.y, r25.x
        add r25.x, r2.z, -r25.x
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
      mul r25.y, r25.y, -c113.w
      mul r25.y, r25.y, c223.y
      mad r2.z, r25.x, r25.y, r2.z
    endif
    
    if_eq -c221_abs.x, c221_abs.x
      dp2add r21.y, vPos, c112.xy, c112.w
      mad r21.y, r21.y, c111.x, c111.y
      frc r21.y, r21.y
      mad r21.y, r21.y, c111.z, c111.w
      sincos r22.xy, r21.y
      
      mul r21, r22.yxxy, c110.xxyz
      mad r21, r21, r20.xyxy, r2.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r23.x, r21.xy, s15.x
      texldl r23.y, r21.zw, s15.x
      
      mul r21, r22.yxxy, c113.xxyz
      mad r21, r21, r20.xyxy, r2.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r23.z, r21.xy, s15.x
      texldl r23.w, r21.zw, s15.x
      
      add r23, r23, -r2.z
      cmp r23, r23, c110.y, c110.w
      dp4 r20.x, r23, -c110.x
    else
      mul r21, c130.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c130.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r2.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.x, r21.xy, s15.x
      texldl r24.y, r21.zw, s15.x
      mul r21, c131.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c131.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r2.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.z, r21.xy, s15.x
      texldl r24.w, r21.zw, s15.x
      add r24, r24, -r2.z
      cmp r24, r24, c110.y, c110.w
      dp4 r25.x, r24, -c110.x
      
      mul r21, c132.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c132.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r2.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.x, r21.xy, s15.x
      texldl r24.y, r21.zw, s15.x
      mul r21, c133.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c133.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r2.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.z, r21.xy, s15.x
      texldl r24.w, r21.zw, s15.x
      add r24, r24, -r2.z
      cmp r24, r24, c110.y, c110.w
      dp4 r25.y, r24, -c110.x
      
      mul r21, c134.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c134.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r2.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.x, r21.xy, s15.x
      texldl r24.y, r21.zw, s15.x
      mul r21, c135.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c135.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r2.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.z, r21.xy, s15.x
      texldl r24.w, r21.zw, s15.x
      add r24, r24, -r2.z
      cmp r24, r24, c110.y, c110.w
      dp4 r25.z, r24, -c110.x
      
      mul r21, c136.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c136.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r2.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.x, r21.xy, s15.x
      texldl r24.y, r21.zw, s15.x
      mul r21, c137.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c137.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r2.xyxy
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.z, r21.xy, s15.x
      texldl r24.w, r21.zw, s15.x
      add r24, r24, -r2.z
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
    mul r1.xyz, r1, r0.w
    mul r1.xyz, r1.w, r1
    mad r0.xyz, r0, v3.x, r1
    mov r0.w, -c0.y
    mul r1, r3, r0
    mul oC0.w, r1.w, c39.x
    add r0.w, c16.w, -v1.w
    add r1.w, -c16.z, c16.w
    rcp r1.w, r1.w
    mul_sat r0.w, r0.w, r1.w
    add r0.w, -r0.w, -c0.y
    mov r2.y, c0.y
    add r2.xy, r2.y, c16
    mul r1.w, r0.w, r2.y
    mad r0.w, r0.w, r2.x, -c0.y
    dp3 r1.x, r1, c5
    mad r0.xyz, r3, r0, -r1.x
    mad r0.xyz, r0.w, r0, r1.x
    add r0.w, r1.x, c3.w
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

// approximately 168 instruction slots used (16 texture, 152 arithmetic)
