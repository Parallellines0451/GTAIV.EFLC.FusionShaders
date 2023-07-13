// Removed forward stipple
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D BumpSampler;
//   sampler2D SpecSampler;
//   sampler2D StippleTexture;
//   sampler2D TextureSampler;
//   float bumpiness;
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
//   specularFactor       c66      1
//   specularColorFactor  c72      1
//   specMapIntMask       c73      1
//   bumpiness            c74      1
//   TextureSampler       s0       1
//   BumpSampler          s1       1
//   SpecSampler          s2       1
//   StippleTexture       s10      1
//   gShadowZSamplerDir   s15      1
//

    ps_3_0
    def c0, -0.5, 9.99999975e-006, 0.5, 1.33333337
    def c1, 9.99999975e-005, 1.5, -0.326211989, -0.405809999
    def c2, -0.791558981, -0.597710013, 0.0833333358, -0.100000001
    def c3, 3.99600005, 4, 0.125, 0.25
    def c4, 1.11111116, 0.212500006, 0.715399981, 0.0720999986
    def c5, 1.00000001e-007, 0, 0, 0
    def c6, 0, -1, -0, 1
    def c7, 0.896420002, 0.412458003, -0.321940005, -0.932614982
    def c8, 0.185461, -0.893123984, 0.507430971, 0.0644249991
    def c9, 0.473434001, -0.480026007, 0.519456029, 0.767022014
    def c10, -0.203345001, 0.620715976, 0.962339997, -0.194983006
    def c11, -0.840143979, -0.0735799968, -0.69591397, 0.457136989
    dcl_texcoord v0.xy
    dcl_texcoord1 v1
    dcl_texcoord3 v2.xyz
    dcl_texcoord4 v3.xyz
    dcl_texcoord5 v4.xyz
    dcl_color v5.xw
    dcl_texcoord6 v6.xyz
    dcl vPos.xy
    dcl_2d s0
    dcl_2d s1
    dcl_2d s2
    dcl_2d s10
    dcl_2d s15
    texld r0, v0, s1
    add r0.z, -r0.w, c6.w
    add r0.z, -r0.x, r0.z
    cmp r0.xy, r0.z, r0.wyzw, r0
    texld r1, v0, s0
    add r0.zw, r0.xyxy, c0.x
    mul r0.zw, r0, c74.x
    dp2add r0.x, r0, -r0, c6.w
    rsq r0.x, r0.x
    rcp r0.x, r0.x
    mul r2.xyz, r0.z, v3
    mad r0.xyz, v1, r0.x, r2
    mad r0.xyz, r0.w, v4, r0
    add r0.xyz, r0, c0.y
    nrm r2.xyz, r0
    texld r0, v0, s2
    mul r2.w, r0.w, c66.x
    dp3 r0.x, r0, c73
    mul r0.x, r0.x, c72.x
    mul r1.w, r1.w, v5.w
    add r3.xyz, c0.y, v2
    nrm r4.xyz, r3
    mad_sat r0.y, r2.z, c0.x, c0.z
    mov r3.xyz, c38
    mad r3.xyz, r3, r0.y, c37
    dp3 r0.y, -r4, r2
    add r0.y, r0.y, r0.y
    mad r4.xyz, r2, -r0.y, -r4
    mul r5.xyz, c18.w, c18
    dp3 r0.y, r2, -c17
    add r0.y, r0.y, -c3.w
    mul_sat r0.y, r0.y, c0.w
    dp3_sat r0.z, -c17, r4
    add r0.z, r0.z, c1.x
    mov r6.xzw, c1
    mad r0.w, r0.w, c66.x, r6.x
    pow r3.w, r0.z, r0.w
    mul r7.xyz, c61.xyww, v6.y
    mad r7.xyz, v6.x, c60.xyww, r7
    mad r7.xyz, v6.z, c62.xyww, r7
    add r7.xyz, r7, c63.xyww
    dp3 r0.z, c14, v6
    add r8.xyz, -r0.z, -c54
    cmp r8.yzw, r8.xxyz, c6.w, c6.x
    mov r8.x, c6.w
    dp4 r6.x, r8, c57
    dp4 r6.y, r8, c58
    dp4 r9.x, r8, c59
    dp4 r9.y, r8, c56
    mad r0.zw, r7.xyxy, r6.xyxy, r9.xyxy
    add r7.xyw, c15.xyzz, -v6.xyzz
    dp3 r4.w, r7.xyww, r7.xyww
    rsq r4.w, r4.w
    rcp r4.w, r4.w
    rcp r5.w, c53.w
    mul r5.w, r4.w, r5.w
    mul r5.w, r5.w, r5.w
    mul r5.w, r5.w, c1.y
    mad r6.xy, c53.y, r6.zwzw, r0.zwzw
    texld r6, r6, s15
    add r6.x, r7.z, -r6.x
    cmp r6.x, r6.x, c6.w, c6.x
    mov r6.y, c53.y
    mad r6.zw, r6.y, c11.xyxy, r0
    texld r8, r6.zwzw, s15
    add r6.z, r7.z, -r8.x
    cmp r6.z, r6.z, c6.w, c6.x
    add r6.x, r6.x, r6.z
    mad r6.zw, r6.y, c11, r0
    texld r8, r6.zwzw, s15
    add r6.z, r7.z, -r8.x
    cmp r6.z, r6.z, c6.w, c6.x
    add r6.x, r6.x, r6.z
    mad r6.zw, r6.y, c10.xyxy, r0
    texld r8, r6.zwzw, s15
    add r6.z, r7.z, -r8.x
    cmp r6.z, r6.z, c6.w, c6.x
    add r6.x, r6.x, r6.z
    mad r6.zw, r6.y, c10, r0
    texld r8, r6.zwzw, s15
    add r6.z, r7.z, -r8.x
    cmp r6.z, r6.z, c6.w, c6.x
    add r6.x, r6.x, r6.z
    mad r6.zw, r6.y, c9.xyxy, r0
    texld r8, r6.zwzw, s15
    add r6.z, r7.z, -r8.x
    cmp r6.z, r6.z, c6.w, c6.x
    add r6.x, r6.x, r6.z
    mad r6.zw, r6.y, c9, r0
    texld r8, r6.zwzw, s15
    add r6.z, r7.z, -r8.x
    cmp r6.z, r6.z, c6.w, c6.x
    add r6.x, r6.x, r6.z
    mad r6.zw, r6.y, c8.xyxy, r0
    texld r8, r6.zwzw, s15
    add r6.z, r7.z, -r8.x
    cmp r6.z, r6.z, c6.w, c6.x
    add r6.x, r6.x, r6.z
    mad r6.zw, r6.y, c8, r0
    texld r8, r6.zwzw, s15
    add r6.z, r7.z, -r8.x
    cmp r6.z, r6.z, c6.w, c6.x
    add r6.x, r6.x, r6.z
    mad r6.zw, r6.y, c7.xyxy, r0
    texld r8, r6.zwzw, s15
    add r6.z, r7.z, -r8.x
    cmp r6.z, r6.z, c6.w, c6.x
    add r6.x, r6.x, r6.z
    mad r6.zw, r6.y, c7, r0
    texld r8, r6.zwzw, s15
    add r6.z, r7.z, -r8.x
    cmp r6.z, r6.z, c6.w, c6.x
    add r6.x, r6.x, r6.z
    mad r0.zw, r6.y, c2.xyxy, r0
    texld r8, r0.zwzw, s15
    add r0.z, r7.z, -r8.x
    cmp r0.z, r0.z, c6.w, c6.x
    add r0.z, r6.x, r0.z
    mad r0.z, r0.z, c2.z, r5.w
    add r0.w, r4.w, -c53.w
    cmp r6.xy, r0.w, c6.wyzw, c6.xzzw
    add r0.w, r0.z, r6.y
    cmp_sat r0.z, r0.w, r0.z, r6.x
    mul r6.xyz, r5, r3.w
    mul r6.xyz, r0.z, r6
    mul r5.xyz, r5, r0.y
    mul r0.yzw, r0.z, r5.xxyz
    mad r0.yzw, r3.xxyz, v5.x, r0
    mul r2.w, r2.w, c3.w
    add r3, c19, -v6.x
    add r5, c20, -v6.y
    add r7, c21, -v6.z
    mul r8, r3, r3
    mad r8, r5, r5, r8
    mad r8, r7, r7, r8
    add r9, r8, c0.y
    rsq r10.x, r9.x
    rsq r10.y, r9.y
    rsq r10.z, r9.z
    rsq r10.w, r9.w
    mov r9.yw, c6
    mad r8, r8, -c25, r9.w
    max r11, r8, c6.x
    mul r8, r11, r11
    mad r8, r8, r8, c2.w
    mul r11, r8, c4.x
    cmp r8, r8, r11, c6.x
    mul r11, r2.x, r3
    mad r11, r5, r2.y, r11
    mad r11, r7, r2.z, r11
    mul r8, r8, r11
    mul_sat r8, r10, r8
    mul r11, r3, -c22
    mad r11, r5, -c23, r11
    mad r11, r7, -c24, r11
    mul r11, r10, r11
    mov r12, c26
    mad_sat r11, r11, r12, c27
    mul r8, r8, r11
    mul r3, r4.x, r3
    mad r3, r4.y, r5, r3
    mad r3, r4.z, r7, r3
    mul r3, r10, r3
    log r4.x, r3_abs.x
    log r4.y, r3_abs.y
    log r4.z, r3_abs.z
    log r4.w, r3_abs.w
    mul r2, r2.w, r4
    exp r3.x, r2.x
    exp r3.y, r2.y
    exp r3.z, r2.z
    exp r3.w, r2.w
    mul r2, r8, r3
    dp4 r3.x, c29, r8
    dp4 r3.y, c30, r8
    dp4 r3.z, c31, r8
    dp4 r4.x, c29, r2
    dp4 r4.y, c30, r2
    dp4 r4.z, c31, r2
    add r2.xyz, r0.yzww, r3
    mad r0.yzw, r6.xxyz, c17.w, r4.xxyz
    mov r2.w, c6.w
    mul r1, r1, r2
    mad r0.xyz, r0.x, r0.yzww, r1
    mul oC0.w, r1.w, c39.x
    add r0.w, c16.w, -v1.w
    add r1.x, -c16.z, c16.w
    rcp r1.x, r1.x
    mul_sat r0.w, r0.w, r1.x
    add r0.w, -r0.w, c6.w
    add r1.xy, r9.y, c16
    mul r1.y, r0.w, r1.y
    mad r0.w, r0.w, r1.x, c6.w
    dp3 r1.x, r0, c4.yzww
    lrp r2.xyz, r0.w, r0, r1.x
    add r0.x, r1.x, c5.x
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

// approximately 236 instruction slots used (17 texture, 219 arithmetic)