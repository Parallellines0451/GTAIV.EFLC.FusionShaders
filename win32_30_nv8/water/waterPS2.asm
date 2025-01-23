// Summary: improved shadow filter + restored normal offset bias + improved shadow fadeout + fixed water shadows + fixed shore outlines + improved water transparency + improved foam texture + fixed offset reflections
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D DepthBufferSampler;
//   sampler2D ReflectTextureSampler;
//   sampler2D SurfaceTextureSampler;
//   float4 bottomSkyColour;
//   float2 currentResolution;
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
//   float4 globalScalars;
//   float4 viewProj;
//   float4 waterColour;
//   float waterReflectionScale;
//
//
// Registers:
//
//   Name                  Reg   Size
//   --------------------- ----- ----
//   gViewInverse          c12      4
//   gDirectionalLight     c17      1
//   gDirectionalColour    c18      1
//   gLightAmbient0        c37      1
//   gLightAmbient1        c38      1
//   globalScalars         c39      1
//   globalFogColor        c42      1
//   gShadowParam18192021  c53      1
//   gFacetCentre          c54      1
//   gShadowParam14151617  c56      1
//   gShadowParam0123      c57      1
//   gShadowParam4567      c58      1
//   gShadowParam891113    c59      1
//   gShadowMatrix         c60      4
//   currentResolution     c66      1
//   waterColour           c72      1
//   bottomSkyColour       c73      1
//   waterReflectionScale  c74      1
//   viewProj              c75      1
//   SurfaceTextureSampler s0       1
//   ReflectTextureSampler s1       1
//   DepthBufferSampler    s2       1
//   gShadowZSamplerDir    s15      1
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
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 1.1953075901e-42 // 853
    def c127, 1, 0.99, 0, 0 // LogDepth constants
    def c0, 0.125, 0.00200000009, 0.0511999987, 9.99999975e-006
    def c1, 0.00039999999, 0.00111111114, 1, 0
    def c2, 0.00999999978, 0.0454545468, 0.256000012, 1.02400005
    def c3, -0.5, 0.5, 1, 0.25
    def c4, 0.116363637, 0.465454549, 1.125, 0.0199999996
    def c5, 0.0500000007, 9.99999975e-006, 1.00001001, 0.0299999993
    def c6, 1, -1, 0.00499999989, 1.33333337
    def c7, -500, 0.25, 1000, 0.5
    def c8, 9.99999975e-005, -511, 512.000122, 1.5
    def c9, 0.0833333358, 9, 10, 3
    def c10, -0.500005007, 0.5, 0.600000024, 0.200000003
    def c11, 1, 0, 9.99999975e-006, -2
    def c12, 1, -1, 0, -0
    def c13, -0.321940005, -0.932614982, -0.791558981, -0.597710013
    def c16, 0.507430971, 0.0644249991, 0.896420002, 0.412458003
    def c19, 0.519456029, 0.767022014, 0.185461, -0.893123984
    def c20, 0.962339997, -0.194983006, 0.473434001, -0.480026007
    def c21, -0.69591397, 0.457136989, -0.203345001, 0.620715976
    def c22, -0.326211989, -0.405809999, -0.840143979, -0.0735799968
    def c23, 0.4375, 0, 0, 0
    dcl_texcoord v0
    dcl_texcoord1 v1
    dcl_texcoord2 v2
    dcl_texcoord3 v3
    dcl_texcoord4 v4.xyw
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s1
    dcl_2d s2
    dcl_2d s10
    dcl_2d s15
    // mov r0.xy, v2
    mov r1, v2
    add r1.xyz, r1, -v3
    dp3 r0.w, r1, r1
    add r1.xyz, r1, c0.w
    nrm r2.xyz, r1
    mad r1.xy, r0.w, -c1, c1.z
    max r0.w, r1.x, c1.w
    // mul r0.z, r0.w, v2.z
    dp3 r1.x, c14, v2
    add r3.xyz, -v2, c15
    dp3 r0.x, r3, r3
    rsq r0.x, r0.x
    rcp r0.x, r0.x
    add r3.xyz, -r1.x, -c54
    cmp r3.yzw, r3.xxyz, c1.z, c1.w
    mov r3.x, c3.z
    mad r21, r3, c110.yyyw, -r3.yzww // shadow cascade mask
    dp4 r9.x, r3, c57
    dp4 r9.y, r3, c58
    dp4 r10.x, r3, c59
    dp4 r10.y, r3, c56
    mul r3.xyz, c61.xyww, v2.y
    mad r3.xyz, v2.x, c60.xyww, r3
    mad r3.xyz, v2.z, c62.xyww, r3
    add r8.xyz, r3, c63.xyww
    /* moved shadows to after normal
    dp4 r4.x, r3, c57
    dp4 r4.y, r3, c58
    dp4 r5.x, r3, c59
    dp4 r5.y, r3, c56
    mul r3.xyz, c61.xyww, v2.y
    mad r3.xyz, v2.x, c60.xyww, r3
    mad r3.xyz, r0.z, c62.xyww, r3
    add r3.xyz, r3, c63.xyww
    mad r0.yz, r3.xxyw, r4.xxyw, r5.xxyw
    mov r3.y, c53.y
    mad r1.xz, r3.y, c22.xyyw, r0.yyzw
    texld r4, r1.xzzw, s15
    add r1.x, r3.z, -r4.x
    cmp r1.x, r1.x, c1.z, c1.w
    mad r3.xw, r3.y, c22.zyzw, r0.yyzz
    texld r4, r3.xwzw, s15
    add r1.z, r3.z, -r4.x
    cmp r1.z, r1.z, c1.z, c1.w
    add r1.x, r1.x, r1.z
    mad r3.xw, r3.y, c21.xyzy, r0.yyzz
    texld r4, r3.xwzw, s15
    add r1.z, r3.z, -r4.x
    cmp r1.z, r1.z, c1.z, c1.w
    add r1.x, r1.x, r1.z
    mad r3.xw, r3.y, c21.zyzw, r0.yyzz
    texld r4, r3.xwzw, s15
    add r1.z, r3.z, -r4.x
    cmp r1.z, r1.z, c1.z, c1.w
    add r1.x, r1.x, r1.z
    mad r3.xw, r3.y, c20.xyzy, r0.yyzz
    texld r4, r3.xwzw, s15
    add r1.z, r3.z, -r4.x
    cmp r1.z, r1.z, c1.z, c1.w
    add r1.x, r1.x, r1.z
    mad r3.xw, r3.y, c20.zyzw, r0.yyzz
    texld r4, r3.xwzw, s15
    add r1.z, r3.z, -r4.x
    cmp r1.z, r1.z, c1.z, c1.w
    add r1.x, r1.x, r1.z
    mad r3.xw, r3.y, c19.xyzy, r0.yyzz
    texld r4, r3.xwzw, s15
    add r1.z, r3.z, -r4.x
    cmp r1.z, r1.z, c1.z, c1.w
    add r1.x, r1.x, r1.z
    mad r3.xw, r3.y, c19.zyzw, r0.yyzz
    texld r4, r3.xwzw, s15
    add r1.z, r3.z, -r4.x
    cmp r1.z, r1.z, c1.z, c1.w
    add r1.x, r1.x, r1.z
    mad r3.xw, r3.y, c16.xyzy, r0.yyzz
    texld r4, r3.xwzw, s15
    add r1.z, r3.z, -r4.x
    cmp r1.z, r1.z, c1.z, c1.w
    add r1.x, r1.x, r1.z
    mad r3.xw, r3.y, c16.zyzw, r0.yyzz
    texld r4, r3.xwzw, s15
    add r1.z, r3.z, -r4.x
    cmp r1.z, r1.z, c1.z, c1.w
    add r1.x, r1.x, r1.z
    mad r3.xw, r3.y, c13.xyzy, r0.yyzz
    mad r0.yz, r3.y, c13.xzww, r0
    texld r4, r0.yzzw, s15
    add r0.y, r3.z, -r4.x
    cmp r0.y, r0.y, c1.z, c1.w
    texld r4, r3.xwzw, s15
    add r0.z, r3.z, -r4.x
    cmp r0.z, r0.z, c1.z, c1.w
    add r0.z, r1.x, r0.z
    add r0.y, r0.y, r0.z
    rcp r0.z, c53.w
    mul r0.z, r0.x, r0.z
    add r0.x, r0.x, -c53.w
    cmp r1.xz, r0.x, c12.xyyw, c12.zyww
    mul r0.x, r0.z, r0.z
    mul r0.x, r0.x, c8.w
    mad r0.x, r0.y, c9.x, r0.x
    add r0.y, r1.z, r0.x
    cmp_sat r0.x, r0.y, r0.x, r1.x
    moved shadows to after normal */
    mul r0.yz, c0.y, v2.xxyw
    texld r3, r0.yzzw, s0
    add r3, r3.zwzw, c3.x
    mul r3, r3, c0.z
    add r0.y, -r0.w, c3.z
    mul r3, r3, r0.y
    rcp r0.y, v1.z
    mul r0.y, r0.w, r0.y
    mad r3, v1.xyxy, r0.y, r3
    mul r0.yz, c2.x, v2.xxyw
    texld r4, r0.yzzw, s0
    add r4, r4.zwzw, c3.x
    mad r3, r4, c2.zzww, r3
    mul r0.yz, c2.y, v2.xxyw
    texld r4, r0.yzzw, s0
    add r4, r4.zwzw, c3.x
    mul r4, r0.w, r4
    mul r0.y, r0.w, c5.x
    mad r3, r4, c4.xxyy, r3
    add r0.z, r1.w, -v4.w
    mad r1.xz, v1.w, c7.xyyw, c7.zyww
    mul_sat r0.z, r0.z, r1.x
    add r0.z, -r0.z, c3.z
    mul r0.z, r1.y, r0.z
    mul r0.z, r0.z, v1.w
    cmp r0.z, r1.y, r0.z, c1.w
    lrp r1.xy, r0.z, v4, r3.zwzw
    add r4.xy, r1, c0.w
    mov r4.z, c5.z
    dp3 r0.w, r4, r4
    rsq r0.w, r0.w
    mul r1.xyw, r4.xyzz, r0.w
    mul r22.xyz, r1.y, c61.xyww
    mad r22.xyz, r1.x, c60.xyww, r22
    mad r22.xyz, r1.w, c62.xyww, r22
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
    mad r8.xyz, r22, r20.x, r8 // normal offset bias
    
    rcp r20.x, c58.x
    mul r20.x, r20.x, c57.x
    mul r20.x, r20.x, r20.y // fix filter stretching
    
    dp4 r20.z, r21_abs, c119 // fix pixels leaking into other cascades
    dp4 r20.w, r21_abs, c120
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    mad r6.yz, r8.xxyw, r9.xxyw, r10.xxyw
    /* removed 1.0.6.0 filter
    mov r8.y, c53.y
    mad r7.xz, r8.y, c22.xyyw, r6.yyzw
    texld r9, r7.xzzw, s15
    add r7.x, r8.z, -r9.x
    cmp r7.x, r7.x, c1.z, c1.w
    mad r8.xw, r8.y, c22.zyzw, r6.yyzz
    texld r9, r8.xwzw, s15
    add r7.z, r8.z, -r9.x
    cmp r7.z, r7.z, c1.z, c1.w
    add r7.x, r7.x, r7.z
    mad r8.xw, r8.y, c21.xyzy, r6.yyzz
    texld r9, r8.xwzw, s15
    add r7.z, r8.z, -r9.x
    cmp r7.z, r7.z, c1.z, c1.w
    add r7.x, r7.x, r7.z
    mad r8.xw, r8.y, c21.zyzw, r6.yyzz
    texld r9, r8.xwzw, s15
    add r7.z, r8.z, -r9.x
    cmp r7.z, r7.z, c1.z, c1.w
    add r7.x, r7.x, r7.z
    mad r8.xw, r8.y, c20.xyzy, r6.yyzz
    texld r9, r8.xwzw, s15
    add r7.z, r8.z, -r9.x
    cmp r7.z, r7.z, c1.z, c1.w
    add r7.x, r7.x, r7.z
    mad r8.xw, r8.y, c20.zyzw, r6.yyzz
    texld r9, r8.xwzw, s15
    add r7.z, r8.z, -r9.x
    cmp r7.z, r7.z, c1.z, c1.w
    add r7.x, r7.x, r7.z
    mad r8.xw, r8.y, c19.xyzy, r6.yyzz
    texld r9, r8.xwzw, s15
    add r7.z, r8.z, -r9.x
    cmp r7.z, r7.z, c1.z, c1.w
    add r7.x, r7.x, r7.z
    mad r8.xw, r8.y, c19.zyzw, r6.yyzz
    texld r9, r8.xwzw, s15
    add r7.z, r8.z, -r9.x
    cmp r7.z, r7.z, c1.z, c1.w
    add r7.x, r7.x, r7.z
    mad r8.xw, r8.y, c16.xyzy, r6.yyzz
    texld r9, r8.xwzw, s15
    add r7.z, r8.z, -r9.x
    cmp r7.z, r7.z, c1.z, c1.w
    add r7.x, r7.x, r7.z
    mad r8.xw, r8.y, c16.zyzw, r6.yyzz
    texld r9, r8.xwzw, s15
    add r7.z, r8.z, -r9.x
    cmp r7.z, r7.z, c1.z, c1.w
    add r7.x, r7.x, r7.z
    mad r8.xw, r8.y, c13.xyzy, r6.yyzz
    mad r6.yz, r8.y, c13.xzww, r6
    texld r9, r6.yzzw, s15
    add r6.y, r8.z, -r9.x
    cmp r6.y, r6.y, c1.z, c1.w
    texld r9, r8.xwzw, s15
    add r6.z, r8.z, -r9.x
    cmp r6.z, r6.z, c1.z, c1.w
    add r6.z, r7.x, r6.z
    add r6.y, r6.y, r6.z
    rcp r6.z, c53.w
    mul r6.z, r0.x, r6.z
    add r6.x, r0.x, -c53.w
    cmp r7.xz, r6.x, c12.xyyw, c12.zyww
    mul r6.x, r6.z, r6.z
    mul r6.x, r6.x, c8.w
    mad r6.x, r6.y, c9.x, r6.x
    add r6.y, r7.z, r6.x
    cmp_sat r0.x, r6.y, r6.x, r7.x
    removed 1.0.6.0 filter */
    // ---------------------------------------------------------- Improved Shadow Filter ------------------------------------------------------------
    mul r21.xy, v0.xy, c44.xy
    rcp r21.z, v0.z
    mul r21.xy, r21.xy, r21.z
    mul r21.xy, r21.xy, c112.z
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
      mad r21, r23, r25.zwzw, r6.yzyz
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24, r21.xy, s15
      texldl r23, r21.zw, s15
      mov r24.y, r23.x
      mul r21, c131.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c131.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r25.zwzw, r6.yzyz
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r23, r21.xy, s15
      mov r24.z, r23.x
      texldl r23, r21.zw, s15
      mov r24.w, r23.x
      
      add r23, r24, -r8.z
      cmp r23, r23, c110.y, c110.w
      dp4 r25.x, r23, r24 // blocker sum
      dp4 r25.y, r23, c110.y // blocker count
      
      mul r21, c132.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c132.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r25.zwzw, r6.yzyz
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24, r21.xy, s15
      texldl r23, r21.zw, s15
      mov r24.y, r23.x
      mul r21, c133.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c133.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r25.zwzw, r6.yzyz
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r23, r21.xy, s15
      mov r24.z, r23.x
      texldl r23, r21.zw, s15
      mov r24.w, r23.x
      
      add r23, r24, -r8.z
      cmp r23, r23, c110.y, c110.w
      dp4 r24.x, r23, r24
      dp4 r24.y, r23, c110.y
      add r25.xy, r25.xy, r24.xy
      
      mul r21, c134.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c134.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r25.zwzw, r6.yzyz
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24, r21.xy, s15
      texldl r23, r21.zw, s15
      mov r24.y, r23.x
      mul r21, c135.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c135.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r25.zwzw, r6.yzyz
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r23, r21.xy, s15
      mov r24.z, r23.x
      texldl r23, r21.zw, s15
      mov r24.w, r23.x
      
      add r23, r24, -r8.z
      cmp r23, r23, c110.y, c110.w
      dp4 r24.x, r23, r24
      dp4 r24.y, r23, c110.y
      add r25.xy, r25.xy, r24.xy
      
      mul r21, c136.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c136.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r25.zwzw, r6.yzyz
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24, r21.xy, s15
      texldl r23, r21.zw, s15
      mov r24.y, r23.x
      mul r21, c137.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c137.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r25.zwzw, r6.yzyz
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r23, r21.xy, s15
      mov r24.z, r23.x
      texldl r23, r21.zw, s15
      mov r24.w, r23.x
      
      add r23, r24, -r8.z
      cmp r23, r23, c110.y, c110.w
      dp4 r24.x, r23, r24
      dp4 r24.y, r23, c110.y
      add r25.xy, r25.xy, r24.xy
      
      if_gt r25.y, c110.w
        rcp r25.y, r25.y
        mul r25.x, r25.x, r25.y
        add r25.y, -r25.x, c139.x
        rcp r25.y, r25.y
        add r25.x, -r8.z, r25.x
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
      mad r8.z, r25.x, r25.y, r8.z
    endif
    
    if_lt c221.x, r26.z
      mov r21.xy, c112.xy
      mul r21.xy, r21.xy, c44.xy
      rcp r22.z, v0.z
      mul r22.xy, v0.xy, r22.z
      dp2add r21.y, r22, r21, c112.w
      mad r21.y, r21.y, c111.x, c111.y
      frc r21.y, r21.y
      mad r21.y, r21.y, c111.z, c111.w
      sincos r22.xy, r21.y
      mul r21, r22.yxxy, c110.xxyz
      mul r22, r22.yxxy, c113.xxyz
      mad r21, r21, r20.xyxy, r6.yzyz
      mad r22, r22, r20.xyxy, r6.yzyz
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
      add r24, r8.z, -r24
      cmp r24, r24, c110.y, c110.w
      dp4 r20.x, r24, -c110.x
    else
      mul r21, c130.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c130.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r6.yzyz
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24, r21.xy, s15
      texldl r23, r21.zw, s15
      mov r24.y, r23.x
      mul r21, c131.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c131.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r6.yzyz
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r23, r21.xy, s15
      mov r24.z, r23.x
      texldl r23, r21.zw, s15
      mov r24.w, r23.x
      add r24, r8.z, -r24
      cmp r24, r24, c110.y, c110.w
      dp4 r25.x, r24, -c110.x
      
      mul r21, c132.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c132.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r6.yzyz
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24, r21.xy, s15
      texldl r23, r21.zw, s15
      mov r24.y, r23.x
      mul r21, c133.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c133.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r6.yzyz
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r23, r21.xy, s15
      mov r24.z, r23.x
      texldl r23, r21.zw, s15
      mov r24.w, r23.x
      add r24, r8.z, -r24
      cmp r24, r24, c110.y, c110.w
      dp4 r25.y, r24, -c110.x
      
      mul r21, c134.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c134.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r6.yzyz
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24, r21.xy, s15
      texldl r23, r21.zw, s15
      mov r24.y, r23.x
      mul r21, c135.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c135.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r6.yzyz
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r23, r21.xy, s15
      mov r24.z, r23.x
      texldl r23, r21.zw, s15
      mov r24.w, r23.x
      add r24, r8.z, -r24
      cmp r24, r24, c110.y, c110.w
      dp4 r25.z, r24, -c110.x
      
      mul r21, c136.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c136.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r6.yzyz
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r24, r21.xy, s15
      texldl r23, r21.zw, s15
      mov r24.y, r23.x
      mul r21, c137.xyxy, r22
      add r23.xy, r21.xzxz, r21.ywyw
      mul r21, c137.zwzw, r22
      add r23.zw, r21.xzxz, r21.ywyw
      mad r21, r23, r20.xyxy, r6.yzyz
      max r21.xz, r21, r20.z
      min r21.xz, r21, r20.w
      texldl r23, r21.xy, s15
      mov r24.z, r23.x
      texldl r23, r21.zw, s15
      mov r24.w, r23.x
      add r24, r8.z, -r24
      cmp r24, r24, c110.y, c110.w
      dp4 r25.w, r24, -c110.x
      
      dp4 r20.x, r25, -c110.x
    endif
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    // -------------------------------------------------------------- Improved Fadeout --------------------------------------------------------------
    rcp r20.y, c53.w
    mul_sat r20.y, r20.y, r0.x
    mul r20.y, r20.y, r20.y
    lrp r0.x, r20.y, c110.y, r20.x // improved fadeout
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    mad r0.w, r0.w, c10.x, c10.y
    mov r4.xyz, c38
    mad r4.xyz, r4, r0.w, c37
    dp3 r0.w, r2, r1.xyww
    add r0.w, r0.w, r0.w
    mad r5.xyz, r1.xyww, -r0.w, r2
    dp3 r0.w, r1.xyww, -c17
    add r0.w, r0.w, -c3.w
    mul_sat r0.w, r0.w, c6.w
    dp3_sat r1.x, -c17, r5
    add r1.x, r1.x, c8.x
    pow r1.y, r0_abs.z, c3.w
    mad r1.w, r1.y, c8.y, c8.z
    mad r1.y, r1.y, -c9.y, c9.z
    pow r2.w, r1.x, r1.w
    mul r5.xyz, c18.w, c18
    mul r6.xyz, r2.w, r5
    mul r5.xyz, r0.w, r5
    mul r5.xyz, r0.x, r5
    mul r6.xyz, r0.x, r6
    mul r6.xyz, r6, c17.w
    //rcp r0.x, c66.y
    //mov r7.y, -r0.x
    //rcp r7.xz, c66.x
    //add r7.xyz, r7, v0.xyxw
    //rcp r0.x, v0.z
    //mul r7.xyz, r7, r0.x
    //mad r7.xyz, r7, c3.xxyw, c3.y
    //texld r8, r7.zyzw, s2
    rcp r7.x, v0.z
    mul r7.xyz, r7.x, v0.xyx
    mad r7.xyz, r7, c3.xxy, c3.y
    mov r20.xy, c44.zw
    mad r7.xyz, r20.xyx, c3.y, r7
    texld r8, r7.zy, s2
    // LogDepth Read
    rcp r20.x, c128.x
    mul r20.x, r20.x, c128.y
    pow r20.x, r20.x, r8.x
    mul r0.x, r20.x, c128.x
    
    add r0.x, r0.x, -v0.z
    pow r0.w, v0_abs.z, c4.z
    mul_sat r0.w, r0.w, c4.w
    add r0.w, r0.w, c5.x
    rcp r0.w, r0.w
    mul_sat r0.w, r0.x, r0.w
    cmp r0.x, r0.x, r0.x, c1.w
    mul r0.x, r0.x, c72.w
    
    mov r20.x, c1.w
    if_eq r20.x, c222.y
      mul r0.x, r0.x, c3.w
      pow r1.x, r0_abs.x, c3.w
      add_sat r0.x, r1.x, c0.x
    else
      mul r0.x, r0.x, -c9.w
      exp r0.x, r0.x
      add_sat r0.x, c5.z, -r0.x
    endif
    
    add r0.w, -r0.w, c3.z
    mul r0.w, r0.w, r0.w
    mul r8.xyz, r2, r0.w
    mad r3.xy, r8, c3.x, r3
    mul r3.z, r8.z, c3.x
    add r3.xyz, r3, c5.yyzw
    nrm r8.xyz, r3
    mad r3.xyz, r2, c11.xxyw, c11.z
    dp3 r0.w, r2, r8
    dp3 r1.x, r3, r3
    rsq r1.x, r1.x
    mul r2.xy, r3, r1.x
    mov r2.zw, c6.xyxy
    mul r3, r8.xyyx, r2.yyxz
    mad r1.xw, r3.zyzw, r2.wyzx, r3.xyzy
    mul r2.x, c5.w, v0.z
    rcp r2.x, r2.x
    mul r2.x, r2.x, c3.y
    max r3.x, c11.w, -r2.x
    mad r2.xy, r1.xwzw, r3.x, r7
    add r1.x, c3.z, v3.w
    mad r0.y, r1.x, c3.y, r0.y
    add r0.y, r0.y, c6.z
    add r1.x, r2.y, -r0.y
    cmp r2.z, r1.x, r2.y, r0.y
    mov r2.w, c1.w
    add r2.xz, r2, c220.xy // half pixel offset
    texldl r2, r2.xzww, s1
    mul r3.xyz, r2, c74.x
    mov r1.x, c74.x
    mad r2.xyz, r2, -r1.x, c42
    mad r2.xyz, v0.w, r2, r3
    mad r1.xyw, r6.xyzz, r1.y, r2.xyzz
    rcp r0.y, r0.x
    mul r1.xyw, r1, r0.y
    mul r2.xyz, r5, c5.x
    mov r0.y, c3.y
    mul r0.y, r0.y, c73.w
    mad r2.xyz, c72, r0.y, r2
    add r0.y, r0.w, c3.z
    cmp r0.y, -r0.w, r0.y, c3.z
    mul r0.w, r0_abs.y, r0_abs.y
    mul r0.w, r0.w, r0.w
    mul r0.y, r0_abs.y, r0.w
    mad r0.y, r0.y, c10.z, c10.w
    mul r0.y, r0.x, r0.y
    mov oC0.w, r0.x
    mul r0.x, r0.y, c3.y
    mad r0.xyw, r0.x, r1, r2.xyzz
    mul r1.xy, c5.x, v2
    texld r2, r1, s0
    
    if_ne r20.x, c222.y
      mov r6.zw, c1.w
      mul r6.xy, r1, -c11.w // double frequency
      texldl r7.xy, r6, s0
      mad r2.xy, r7, c7.w, r2 // halve amplitude
      mul r6.xy, r6, -c11.w
      texldl r7.xy, r6, s0
      mad r2.xy, r7, c7.y, r2
      mul r6.xy, r6, -c11.w
      texldl r7.xy, r6, s0
      mad r2.xy, r7, c0.x, r2
      add_sat r2.xy, r2, -c23.x
    endif
    
    mad r1.xy, r2, r1.z, c3.w
    mul r1.xzw, r5.xyyz, r1.x
    mul r2.xyz, r4, r1.y
    mul r2.xyz, r2, c9.w
    mad r1.xyz, r1.xzww, c9.w, r2
    lrp r2.xyz, r0.z, r1, r0.xyww
    mul oC0.xyz, r2, c39.y
    
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

// approximately 243 instruction slots used (19 texture, 224 arithmetic)
