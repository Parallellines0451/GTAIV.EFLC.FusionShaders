// Summary: improved cascaded shadows + console tree lighting thanks to AssaultKifle47 + improved PC tree lighting + remapped shadowmap depth
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   float4 NearFarPlane;
//   sampler2D GBufferStencilTextureSampler;
//   sampler2D GBufferTextureSampler0;
//   sampler2D GBufferTextureSampler1;
//   sampler2D GBufferTextureSampler2;
//   sampler2D GBufferTextureSampler3;
//   sampler2D ParabSampler;
//   float4 dReflectionParams;
//   float4 gDeferredProjParams;
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
//   float4 globalScalars;
//
//
// Registers:
//
//   Name                         Reg   Size
//   ---------------------------- ----- ----
//   NearFarPlane                 c128     1
//   gViewInverse                 c12      4
//   gDirectionalLight            c17      1
//   gDirectionalColour           c18      1
//   gLightAmbient0               c37      1
//   gLightAmbient1               c38      1
//   globalScalars                c39      1
//   gShadowParam18192021         c53      1
//   gFacetCentre                 c54      1
//   gShadowParam14151617         c56      1
//   gShadowParam0123             c57      1
//   gShadowParam4567             c58      1
//   gShadowParam891113           c59      1
//   gShadowMatrix                c60      4
//   gDeferredProjParams          c66      1
//   dReflectionParams            c72      1
//   GBufferTextureSampler0       s0       1
//   GBufferTextureSampler1       s1       1
//   GBufferTextureSampler2       s2       1
//   GBufferTextureSampler3       s4       1
//   GBufferStencilTextureSampler s5       1
//   ParabSampler                 s6       1
//   gShadowZSamplerDir           s15      1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 9.8090892503e-45 // 7
    def c0, 0, 512, 4096, 0.00200000009
    def c1, 0.99609375, 7.96875, 63.75, 0.25
    def c2, 256, -127.999992, 0.000392156857, 4
    def c3, 2, 0.5, 1, 9.99999975e-006
    def c4, 1.33333337, 9.99999975e-005, 1, 0
    def c5, 1.5, -0.326211989, -0.405809999, 0.0833333358
    def c6, -0.791558981, -0.597710013, -0.5, 0.5
    def c7, 0.0199999996, 0.00999999978, 0.75, 0.25
    def c8, 5, 10, 0, 0
    def c9, 1, -1, 0, -0
    def c10, 0.896420002, 0.412458003, -0.321940005, -0.932614982
    def c11, 0.185461, -0.893123984, 0.507430971, 0.0644249991
    def c12, 0.473434001, -0.480026007, 0.519456029, 0.767022014
    def c13, -0.203345001, 0.620715976, 0.962339997, -0.194983006
    def c16, -0.840143979, -0.0735799968, -0.69591397, 0.457136989
    def c20, 1.6666667, 0, 0, 0 // reflection intensity multiplier
    def c21, 3, 2, 1, 0 // Console tree lighting constants
    def c22, 0.012156862745098, 0.0007843137254902, 0, 0 // 3.1, 0.2
    def c24, 0.212500006, 0.715399981, 0.0720999986, 0.5
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
    dcl_texcoord v0.xy
    dcl_texcoord1 v1
    dcl_2d s0
    dcl_2d s1
    dcl_2d s2
    dcl_2d s4
    dcl_2d s5
    dcl_2d s6
    dcl_2d s10
    dcl_2d s15
    texld r1, v0, s1
    mul r2.xyz, r1.w, c1
    frc r2.xyz, r2
    add r3.xyz, r2, r2
    mad r3.xy, r2.yzzw, -c1.w, r3
    mad r1.xyz, r1, c2.x, r3
    add r1.xyz, r1, c2.y
    nrm r31.xyz, r1
    texld r0, v0, s4
    
    // LogDepth Read
    rcp r20.x, c128.x
    mul r20.x, r20.x, c128.y
    pow r20.x, r20.x, r0.x
    mul r0.x, r20.x, c128.x
    
    mad r0.yzw, v1.xxyz, -r0.x, c15.xxyz
    dp3 r1.x, c14, r0.yzww
    add r1.xyz, -r1.x, -c54
    cmp r1.yzw, r1.xxyz, c4.z, c4.w
    mov r1.x, c3.z
    mad r21, r1, c110.yyyw, -r1.yzww // shadow cascade mask
    dp4 r2.x, r1, c57
    dp4 r2.y, r1, c58
    dp4 r3.x, r1, c59
    dp4 r3.y, r1, c56
    mul r1.xyz, r0.z, c61.xyww
    mad r1.xyz, r0.y, c60.xyww, r1
    mad r1.xyz, r0.w, c62.xyww, r1
    add r0.yzw, -r0, c15.xxyz
    dp3 r0.y, r0.yzww, r0.yzww
    rsq r0.y, r0.y
    rcp r0.y, r0.y
    add r1.xyz, r1, c63.xyww
    mul r22.xyz, r31.y, c61.xyww
    mad r22.xyz, r31.x, c60.xyww, r22
    mad r22.xyz, r31.z, c62.xyww, r22
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
    add r24.xy, r0.x, -r24.xy
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
    mad r1.xyz, r22, r20.x, r1 // normal offset bias
    
    mad r1.z, r1.z, -c139.x, c139.y
    
    rcp r20.x, c58.x
    mul r20.x, r20.x, c57.x
    mul r20.x, r20.x, r20.y // fix filter stretching
    
    dp4 r20.z, r21_abs, c119 // fix pixels leaking into other cascades
    dp4 r20.w, r21_abs, c120
    mov r21.x, c53.z
    mul r21.x, r21.x, -c110.x
    add r20.w, r20.w, -r21.x
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    mad r0.zw, r1.xyxy, r2.xyxy, r3.xyxy
    /* removed 1.0.6.0 filter
    mov r1.y, c53.y
    mad r1.xw, r1.y, c5.yyzz, r0.zyzw
    texld r2, r1.xwzw, s15
    add r1.x, r1.z, -r2.x
    cmp r1.x, r1.x, c4.z, c4.w
    mad r2.xy, r1.y, c16, r0.zwzw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c4.z, c4.w
    add r1.x, r1.x, r1.w
    mad r2.xy, r1.y, c16.zwzw, r0.zwzw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c4.z, c4.w
    add r1.x, r1.x, r1.w
    mad r2.xy, r1.y, c13, r0.zwzw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c4.z, c4.w
    add r1.x, r1.x, r1.w
    mad r2.xy, r1.y, c13.zwzw, r0.zwzw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c4.z, c4.w
    add r1.x, r1.x, r1.w
    mad r2.xy, r1.y, c12, r0.zwzw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c4.z, c4.w
    add r1.x, r1.x, r1.w
    mad r2.xy, r1.y, c12.zwzw, r0.zwzw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c4.z, c4.w
    add r1.x, r1.x, r1.w
    mad r2.xy, r1.y, c11, r0.zwzw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c4.z, c4.w
    add r1.x, r1.x, r1.w
    mad r2.xy, r1.y, c11.zwzw, r0.zwzw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c4.z, c4.w
    add r1.x, r1.x, r1.w
    mad r2.xy, r1.y, c10, r0.zwzw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c4.z, c4.w
    add r1.x, r1.x, r1.w
    mad r2.xy, r1.y, c10.zwzw, r0.zwzw
    mad r0.zw, r1.y, c6.xyxy, r0
    texld r3, r0.zwzw, s15
    add r0.z, r1.z, -r3.x
    cmp r0.z, r0.z, c4.z, c4.w
    texld r2, r2, s15
    add r0.w, r1.z, -r2.x
    cmp r0.w, r0.w, c4.z, c4.w
    add r0.w, r1.x, r0.w
    add r0.z, r0.z, r0.w
    rcp r0.w, c53.w
    mul r0.w, r0.y, r0.w
    add r0.y, r0.y, -c53.w
    cmp r1.xy, r0.y, c9, c9.zwzw
    mul r0.y, r0.w, r0.w
    mul r0.y, r0.y, c5.x
    mad r0.y, r0.z, c5.w, r0.y
    add r0.z, r1.y, r0.y
    cmp_sat r0.y, r0.z, r0.y, r1.x
    removed 1.0.6.0 filter */
    // ---------------------------------------------------------- Improved Shadow Filter ------------------------------------------------------------
    mul r21.xy, c44.xy, v0.xy
    // dp2add r21.x, r21.xy, c118.xy, c118.w
    // frc r21.x, r21.x
    // mul r21.x, r21.x, c118.z
    // frc r21.x, r21.x
    mul r21.xy, r21.xy, c112.z
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
      mad r21, r23, r25.zwzw, r0.zwzw
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.x, r21.xy, s15.x
      texldl r24.y, r21.zw, s15.x
      mul r21, c131.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c131.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r25.zwzw, r0.zwzw
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.z, r21.xy, s15.x
      texldl r24.w, r21.zw, s15.x
      
      add r23, r1.z, -r24
      cmp r23, r23, c110.y, c110.w
      dp4 r25.x, r23, r24 // blocker sum
      dp4 r25.y, r23, c110.y // blocker count
      
      mul r21, c132.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c132.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r25.zwzw, r0.zwzw
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.x, r21.xy, s15.x
      texldl r24.y, r21.zw, s15.x
      mul r21, c133.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c133.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r25.zwzw, r0.zwzw
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.z, r21.xy, s15.x
      texldl r24.w, r21.zw, s15.x
      
      add r23, r1.z, -r24
      cmp r23, r23, c110.y, c110.w
      dp4 r24.x, r23, r24
      dp4 r24.y, r23, c110.y
      add r25.xy, r25.xy, r24.xy
      
      mul r21, c134.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c134.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r25.zwzw, r0.zwzw
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.x, r21.xy, s15.x
      texldl r24.y, r21.zw, s15.x
      mul r21, c135.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c135.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r25.zwzw, r0.zwzw
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.z, r21.xy, s15.x
      texldl r24.w, r21.zw, s15.x
      
      add r23, r1.z, -r24
      cmp r23, r23, c110.y, c110.w
      dp4 r24.x, r23, r24
      dp4 r24.y, r23, c110.y
      add r25.xy, r25.xy, r24.xy
      
      mul r21, c136.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c136.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r25.zwzw, r0.zwzw
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.x, r21.xy, s15.x
      texldl r24.y, r21.zw, s15.x
      mul r21, c137.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c137.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r25.zwzw, r0.zwzw
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.z, r21.xy, s15.x
      texldl r24.w, r21.zw, s15.x
      
      add r23, r1.z, -r24
      cmp r23, r23, c110.y, c110.w
      dp4 r24.x, r23, r24
      dp4 r24.y, r23, c110.y
      add r25.xy, r25.xy, r24.xy
      
      if_gt r25.y, c110.w
        rcp r25.y, r25.y
        mul r25.x, r25.x, r25.y
        rcp r25.y, r25.x
        add r25.x, r1.z, -r25.x
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
      mad r1.z, r25.x, r25.y, r1.z
    endif
    
    if_eq c221.x, r26.w
      mov r21.xy, c112.xy
      mul r21.xy, r21.xy, c44.xy
      dp2add r21.y, v0, r21, c112.w
      mad r21.y, r21.y, c111.x, c111.y
      frc r21.y, r21.y
      mad r21.y, r21.y, c111.z, c111.w
      sincos r22.xy, r21.y
      
      mul r21, r22.yxxy, c110.xxyz
      mad r21, r21, r20.xyxy, r0.zwzw
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r23.x, r21.xy, s15.x
      texldl r23.y, r21.zw, s15.x
      
      mul r21, r22.yxxy, c113.xxyz
      mad r21, r21, r20.xyxy, r0.zwzw
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r23.z, r21.xy, s15.x
      texldl r23.w, r21.zw, s15.x
      
      add r23, r23, -r1.z
      cmp r23, r23, c110.y, c110.w
      dp4 r20.x, r23, -c110.x
    else
      mul r21, c130.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c130.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r0.zwzw
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.x, r21.xy, s15.x
      texldl r24.y, r21.zw, s15.x
      mul r21, c131.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c131.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r0.zwzw
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.z, r21.xy, s15.x
      texldl r24.w, r21.zw, s15.x
      add r24, r24, -r1.z
      cmp r24, r24, c110.y, c110.w
      dp4 r25.x, r24, -c110.x
      
      mul r21, c132.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c132.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r0.zwzw
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.x, r21.xy, s15.x
      texldl r24.y, r21.zw, s15.x
      mul r21, c133.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c133.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r0.zwzw
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.z, r21.xy, s15.x
      texldl r24.w, r21.zw, s15.x
      add r24, r24, -r1.z
      cmp r24, r24, c110.y, c110.w
      dp4 r25.y, r24, -c110.x
      
      mul r21, c134.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c134.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r0.zwzw
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.x, r21.xy, s15.x
      texldl r24.y, r21.zw, s15.x
      mul r21, c135.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c135.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r0.zwzw
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.z, r21.xy, s15.x
      texldl r24.w, r21.zw, s15.x
      add r24, r24, -r1.z
      cmp r24, r24, c110.y, c110.w
      dp4 r25.z, r24, -c110.x
      
      mul r21, c136.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c136.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r0.zwzw
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.x, r21.xy, s15.x
      texldl r24.y, r21.zw, s15.x
      mul r21, c137.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c137.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r0.zwzw
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24.z, r21.xy, s15.x
      texldl r24.w, r21.zw, s15.x
      add r24, r24, -r1.z
      cmp r24, r24, c110.y, c110.w
      dp4 r25.w, r24, -c110.x
      
      dp4 r20.x, r25, -c110.x
    endif
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    // -------------------------------------------------------------- Improved Fadeout --------------------------------------------------------------
    rcp r20.y, c53.w
    mul_sat r20.y, r20.y, r0.y
    mul r20.y, r20.y, r20.y
    lrp r0.y, r20.y, c110.y, r20.x // improved fadeout
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    /* moved normal
    texld r1, v0, s1
    mul r2.xyz, r1.w, c1
    frc r2.xyz, r2
    add r3.xyz, r2, r2
    mad r3.xy, r2.yzzw, -c1.w, r3
    mad r1.xyz, r1, c2.x, r3
    add r1.xyz, r1, c2.y
    nrm r2.xyz, r1
    moved normal */
    mov r2.xyz, r31.xyz
    mad r1.xyz, v1, -r0.x, c3.w
    // ----------------------------------------------------------- Console Tree Lighting ------------------------------------------------------------
    texld r4, v0, s5
    add r21.x, r4.x, -c22.x
    add_sat r21.x, -r21_abs.x, c22.y
    mov r21.y, c223.x
    add r21.y, r21.y, -c21.y
    cmp r21.y, -r21_abs.y, r21.x, c4.w // Console tree lighting toggle
    if_eq r21.y, c4.w
      mul r0.xzw, r0.x, v1.xyyz
      nrm r3.xyz, r1
      dp3 r1.x, r3, r2
      add r1.y, r1.x, r1.x
      add r1.x, -r1_abs.x, c3.z
      mul r1.x, r1.x, r1.x
      mul r1.x, r1.x, r1.x
      mad r1.x, r1.x, c7.z, c7.w
      mad r1.yzw, r2.xxyz, -r1.y, r3.xxyz
      dp3_sat r2.w, -c17, r1.yzww
      add r2.w, r2.w, c4.y
      mul r3.w, r2.z, c2.w
      mov_sat r3.w, r3.w
      mul r3.w, r3.w, c72.y
      // texld r4, v0, s5 sample stencil before
      add r4.x, -r4.x, c2.z
      cmp r3.w, r4.x, r3.w, c0.x
      texld r4, v0, s2
      mul r4.y, r4.y, r4.y
      mul r5.xy, r4.y, c0.yzzw
      min r4.w, r5.y, c2.x
      mad r4.y, r4.y, -c0.y, r4.w
      mad r4.y, r3.w, r4.y, r5.x
      max r6.x, r5.x, r4.y
      add r4.y, r6.x, c4.y
      pow r5.x, r2.w, r4.y
      mul r5.yzw, c18.w, c18.xxyz
      mul r6.yzw, r5.x, r5
      mul r6.yzw, r0.y, r6
      dp3 r0.x, r3, -r0.xzww
      mul_sat r0.xz, r0.x, c7.xyyw
      add r0.z, -r0.z, c3.z
      mad r1.yzw, r3.xxyz, r0.x, r1
      add r1.yzw, r1, c3.w
      nrm r3.xyz, r1.yzww
      mul_sat r0.x, r3.z, c8.x
      mov_sat r0.w, r3.z
      add r0.w, r0.w, c3.z
      add r0.w, r0.w, r0.w
      rcp r0.w, r0.w
      mad r1.yz, r3.xxyw, r0.w, c3.y
      add r7.xy, -r1.yzzw, c3.z
      mul_sat r0.w, r6.x, c72.x
      mul r1.y, r6.x, c0.w
      min r2.w, r1.y, c1.w
      mad r1.y, r4.x, -c3.x, r2.w
      mad r7.w, r0.w, -c2.w, c2.w
      mov r7.z, c0.x
      texldl r7, r7, s6
      mul r3.xyz, r0.x, r7
      mul r0.xzw, r0.z, r3.xyyz
      mul r0.xzw, r4.z, r0
      mul r0.xzw, r0, c39.w
      // mul r0.xzw, r0, c20.x // boost reflection intensity
      mul r0.xzw, r1.x, r0
      mul r0.xzw, r0, c8.y
      add r1.x, c17.w, c17.w
      mad r0.xzw, r6.yyzw, r1.x, r0
      add r1.x, r4.x, r4.x
      mad r1.y, r3.w, r1.y, r1.x
      mad r1.z, r3.w, -c3.y, c3.z
      max r2.w, r1.x, r1.y
      mul r0.xzw, r0, r2.w
      dp3 r1.x, r2, -c17
      mad_sat r1.y, r2.z, c6.z, c6.w
      mov r2.xyz, c38
      
      dp3 r21.y, r2, c24
      lrp r22.xyz, c24.w, r2, r21.y
      mul r21.x, r21.x, c223.x
      cmp r2.xyz, -r21_abs.x, r2, r22 // tree ambient desaturation toggle
      mad_sat r21.y, r1.x, c3.y, c3.y
      mul r21.y, r21.y, r21.y
      
      mad r2.xyz, r2, r1.y, c37
      mul r2.xyz, r4.z, r2
      add r1.x, r1.x, -c1.w
      mul_sat r1.x, r1.x, c4.x
      cmp r1.x, -r21_abs.x, r1.x, r21.y // tree half lambert toggle
      mul r1.xyw, r5.yzzw, r1.x
      mad r1.xyw, r1, r0.y, r2.xyzz
      texld r2, v0, s0
      mul r2.xyz, r1.z, r2
      mad oC0.xyz, r2, r1.xyww, r0.xzww
      mov oC0.w, c3.z
    else
      mov r8.x, r0.y
      
      nrm r3.xyz, r1
      
      //dot(viewDir, normal)
      dp3 r4.y, r3.xyz, r2.xyz
      //saturate(viewDir.z)
      mov_sat r4.x, r3.z
      //                 (3, 2, 1)
      add r0.xyz, r4.yxy, c21.xyz
      
      add r1.y, r0.y, r4.x
      rcp r1.y, r1.y
      //                        0.5
      mad r1.yz, r3.yxyx, r1.y, c3.yy
      //                    1
      add r1.yz, -r1.yzyz, c3.z
      
      mov r1.xy, r1.zy
      //0
      mov r1.z, c4.w
      //4
      mov r1.w, c2.w
      texldl r4.xyz, r1, s6
      
      //viewDir.z * -0.5 + 0.5
      mad_sat r1.y, r3.z, c6.z, c6.w
      
      mul r6.xyz, c18.xyz, c18.w
      //dot(normal, -dirLight) * dirLightColor
      dp3_sat r0.w, r2.xyz, -c17.xyz
      mul r5.xyz, r6, r0.w
      
      //saturate(viewDir.z * 2)
      add_sat r0.w, r3.z, r3.z
      
      //remappedViewDir.z * ambient1 + ambient0
      mov r8.yzw, c38.xxyz
      mad r1.yzw, r1.y, r8.yyzw, c37.xxyz
      
      //paraboloid - ambient
      add r4.xyz, -r1.yzw, r4.xyz
      
      //        0.25
      mul r2.w, c1.w, r0.x
      
      //parabAmbient * saturate(viewDir.z * 2) + ambient
      mad r4.xyz, r4.xyz, r0.w, r1.yzw
      
      max r1.yzw, r4.xxyz, r1.yyzw
      //        0.25
      mul r0.w, c1.w, r0.z
      
      mul r0.xyz, r2.w, r1.yzw
      //diffuseLight * shadow + r0
      mad r0.xyz, r5.xyz, r8.x, r0.xyz
      
      //diffuse * r0
      texld r2.xyz, v0, s0
      mul r0.xyz, r0.xyz, r2.xyz
      
      mul r0.w, r0.w, r0.w
      
      mad oC0.xyz, r0.w, r1.yzw, r0.xyz
      mov oC0.w, c4.z
    endif
    // ----------------------------------------------------------------------------------------------------------------------------------------------

// approximately 184 instruction slots used (19 texture, 165 arithmetic)
