// 256 state stipple + removed unnecessary stipple + console-like ambient reflection intensity
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D BumpSampler;
//   sampler2D EnvironmentSampler;
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
//   reflectivePower      c75      1
//   TextureSampler       s0       1
//   BumpSampler          s1       1
//   SpecSampler          s2       1
//   EnvironmentSampler   s4       1
//   StippleTexture       s10      1
//   gShadowZSamplerDir   s15      1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 5.2969081951e-43 // 378
    def c150, 15.996, 16, 0.0625, 0.0625	// 256 state stipple constants
    def c127, 0.9999999, 1, 0, 0	// LogDepth constants
    def c0, 0, -1, -0, 1
    def c1, -0.5, 9.99999975e-006, -0.00999999978, 100
    def c2, -0.5, 0.5, 1.33333337, 9.99999975e-005
    def c3, 1.5, -0.326211989, -0.405809999, 0.0833333358
    def c4, -0.791558981, -0.597710013, -0.100000001, 1.11111116
    def c5, 3.99600005, 4, 0.125, 0.25
    def c6, 0.212500006, 0.715399981, 0.0720999986, 1.00000001e-007
    def c7, 0.896420002, 0.412458003, -0.321940005, -0.932614982
    def c8, 0.185461, -0.893123984, 0.507430971, 0.0644249991
    def c9, 0.473434001, -0.480026007, 0.519456029, 0.767022014
    def c10, -0.203345001, 0.620715976, 0.962339997, -0.194983006
    def c11, -0.840143979, -0.0735799968, -0.69591397, 0.457136989
	def c100, 1.6666667, 0, 0, 0	// Reflection intensity multiplier
    dcl_texcoord v0.xy
    dcl_texcoord1 v1
    dcl_texcoord3 v2.xyz
    dcl_texcoord4 v3.xyz
    dcl_texcoord5 v4.xyz
    dcl_color v5.xw
    dcl_texcoord6 v6.xyz
    dcl vPos.xy
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s1
    dcl_2d s2
    dcl_2d s4
    dcl_2d s10
    dcl_2d s15
    /*mov_sat r0.x, c39.x
    mul r0.x, r0.x, c150.x
    frc r0.y, r0.x
    mul r0.z, r0.y, c150.y
    frc r0.w, r0.z
    add r1.xy, r0.zxzw, -r0.wyzw
    mul r0.xy, c150.z, vPos
    frc r0.xy, r0_abs
    cmp r0.xy, vPos, r0, -r0
    mul r0.xy, r0, c150.w
    mad r0.xy, r1, c150.w, r0
    mov r0.zw, c0.x
    texldl r0, r0, s10
    cmp r0, -r0.y, c0.y, c0.z
    texkill r0*/
    texld r0, v0, s1
    add r0.z, -r0.w, c0.w
    add r0.z, -r0.x, r0.z
    cmp r0.xy, r0.z, r0.wyzw, r0
    texld r1, v0, s0
    add r0.zw, r0.xyxy, c1.x
    mul r0.zw, r0, c74.x
    dp2add r0.x, r0, -r0, c0.w
    rsq r0.x, r0.x
    rcp r0.x, r0.x
    mul r2.xyz, r0.z, v3
    mad r0.xyz, v1, r0.x, r2
    mad r0.xyz, r0.w, v4, r0
    add r0.xyz, r0, c1.y
    nrm r2.xyz, r0
    texld r0, v0, s2
    mul r2.w, r0.w, c66.x
    dp3 r0.x, r0, c73
    mul r0.x, r0.x, c72.x
    add r3.xyz, c1.y, v2
    nrm r4.xyz, r3
    dp3 r0.y, -r4, r2
    add r0.y, r0.y, r0.y
    mad r3.xyz, r2, -r0.y, -r4
    add r4.xyz, r3, c1.y
    dp3 r0.y, r4, r4
    rsq r0.y, r0.y
    mad r0.yz, r4.xxzw, r0.y, c0.w
    mul r0.yz, r0, c1.x
    texld r4, r0.yzzw, s4
	mul r4, r4, c100.x
    mul r4.xyz, r0.x, r4
    mul r4.xyz, r4, c75.x
    mul r5.w, r1.w, v5.w
    mad r0.y, r1.w, v5.w, c1.z
    rcp r0.z, r5.w
    cmp r0.y, r0.y, r0.z, c1.w
    mad r5.xyz, r4, r0.y, r1
    mad_sat r0.y, r2.z, c2.x, c2.y
    mov r1.xyz, c38
    mad r1.xyz, r1, r0.y, c37
    mul r4.xyz, c18.w, c18
    dp3 r0.y, r2, -c17
    add r0.y, r0.y, -c5.w
    mul_sat r0.y, r0.y, c2.z
    dp3_sat r0.z, -c17, r3
    add r0.z, r0.z, c2.w
    mov r1.w, c2.w
    mad r0.w, r0.w, c66.x, r1.w
    pow r1.w, r0.z, r0.w
    mul r6.xyz, c61.xyww, v6.y
    mad r6.xyz, v6.x, c60.xyww, r6
    mad r6.xyz, v6.z, c62.xyww, r6
    add r6.xyz, r6, c63.xyww
    dp3 r0.z, c14, v6
    add r7.xyz, -r0.z, -c54
    cmp r7.yzw, r7.xxyz, c0.w, c0.x
    mov r7.x, c0.w
    dp4 r8.x, r7, c57
    dp4 r8.y, r7, c58
    dp4 r9.x, r7, c59
    dp4 r9.y, r7, c56
    mad r0.zw, r6.xyxy, r8.xyxy, r9.xyxy
    add r6.xyw, c15.xyzz, -v6.xyzz
    dp3 r3.w, r6.xyww, r6.xyww
    rsq r3.w, r3.w
    rcp r3.w, r3.w
    rcp r4.w, c53.w
    mul r4.w, r3.w, r4.w
    mul r4.w, r4.w, r4.w
    mul r4.w, r4.w, c3.x
    mov r6.y, c53.y
    mad r6.xw, r6.y, c3.yyzz, r0.zyzw
    texld r7, r6.xwzw, s15
    add r6.x, r6.z, -r7.x
    cmp r6.x, r6.x, c0.w, c0.x
    mad r7.xy, r6.y, c11, r0.zwzw
    texld r7, r7, s15
    add r6.w, r6.z, -r7.x
    cmp r6.w, r6.w, c0.w, c0.x
    add r6.x, r6.x, r6.w
    mad r7.xy, r6.y, c11.zwzw, r0.zwzw
    texld r7, r7, s15
    add r6.w, r6.z, -r7.x
    cmp r6.w, r6.w, c0.w, c0.x
    add r6.x, r6.x, r6.w
    mad r7.xy, r6.y, c10, r0.zwzw
    texld r7, r7, s15
    add r6.w, r6.z, -r7.x
    cmp r6.w, r6.w, c0.w, c0.x
    add r6.x, r6.x, r6.w
    mad r7.xy, r6.y, c10.zwzw, r0.zwzw
    texld r7, r7, s15
    add r6.w, r6.z, -r7.x
    cmp r6.w, r6.w, c0.w, c0.x
    add r6.x, r6.x, r6.w
    mad r7.xy, r6.y, c9, r0.zwzw
    texld r7, r7, s15
    add r6.w, r6.z, -r7.x
    cmp r6.w, r6.w, c0.w, c0.x
    add r6.x, r6.x, r6.w
    mad r7.xy, r6.y, c9.zwzw, r0.zwzw
    texld r7, r7, s15
    add r6.w, r6.z, -r7.x
    cmp r6.w, r6.w, c0.w, c0.x
    add r6.x, r6.x, r6.w
    mad r7.xy, r6.y, c8, r0.zwzw
    texld r7, r7, s15
    add r6.w, r6.z, -r7.x
    cmp r6.w, r6.w, c0.w, c0.x
    add r6.x, r6.x, r6.w
    mad r7.xy, r6.y, c8.zwzw, r0.zwzw
    texld r7, r7, s15
    add r6.w, r6.z, -r7.x
    cmp r6.w, r6.w, c0.w, c0.x
    add r6.x, r6.x, r6.w
    mad r7.xy, r6.y, c7, r0.zwzw
    texld r7, r7, s15
    add r6.w, r6.z, -r7.x
    cmp r6.w, r6.w, c0.w, c0.x
    add r6.x, r6.x, r6.w
    mad r7.xy, r6.y, c7.zwzw, r0.zwzw
    texld r7, r7, s15
    add r6.w, r6.z, -r7.x
    cmp r6.w, r6.w, c0.w, c0.x
    add r6.x, r6.x, r6.w
    mad r0.zw, r6.y, c4.xyxy, r0
    texld r7, r0.zwzw, s15
    add r0.z, r6.z, -r7.x
    cmp r0.z, r0.z, c0.w, c0.x
    add r0.z, r6.x, r0.z
    mad r0.z, r0.z, c3.w, r4.w
    add r0.w, r3.w, -c53.w
    cmp r6.xy, r0.w, c0.wyzw, c0.xzzw
    add r0.w, r0.z, r6.y
    cmp_sat r0.z, r0.w, r0.z, r6.x
    mul r6.xyz, r4, r1.w
    mul r6.xyz, r0.z, r6
    mul r4.xyz, r4, r0.y
    mul r0.yzw, r0.z, r4.xxyz
    mad r0.yzw, r1.xxyz, v5.x, r0
    mul r1.x, r2.w, c5.w
    add r4, c19, -v6.x
    add r7, c20, -v6.y
    add r8, c21, -v6.z
    mul r9, r4, r4
    mad r9, r7, r7, r9
    mad r9, r8, r8, r9
    add r10, r9, c1.y
    rsq r11.x, r10.x
    rsq r11.y, r10.y
    rsq r11.z, r10.z
    rsq r11.w, r10.w
    mov r1.yw, c0
    mad r9, r9, -c25, r1.w
    max r10, r9, c0.x
    mul r9, r10, r10
    mad r9, r9, r9, c4.z
    mul r10, r9, c4.w
    cmp r9, r9, r10, c0.x
    mul r10, r2.x, r4
    mad r10, r7, r2.y, r10
    mad r2, r8, r2.z, r10
    mul r2, r9, r2
    mul_sat r2, r11, r2
    mul r9, r4, -c22
    mad r9, r7, -c23, r9
    mad r9, r8, -c24, r9
    mul r9, r11, r9
    mov r10, c26
    mad_sat r9, r9, r10, c27
    mul r2, r2, r9
    mul r4, r3.x, r4
    mad r4, r3.y, r7, r4
    mad r3, r3.z, r8, r4
    mul r3, r11, r3
    log r4.x, r3_abs.x
    log r4.y, r3_abs.y
    log r4.z, r3_abs.z
    log r4.w, r3_abs.w
    mul r3, r1.x, r4
    exp r4.x, r3.x
    exp r4.y, r3.y
    exp r4.z, r3.z
    exp r4.w, r3.w
    mul r3, r2, r4
    dp4 r4.x, c29, r2
    dp4 r4.y, c30, r2
    dp4 r4.z, c31, r2
    dp4 r2.x, c29, r3
    dp4 r2.y, c30, r3
    dp4 r2.z, c31, r3
    add r3.xyz, r0.yzww, r4
    mad r0.yzw, r6.xxyz, c17.w, r2.xxyz
    mov r3.w, c0.w
    mul r2, r5, r3
    mad r0.xyz, r0.x, r0.yzww, r2
    mul oC0.w, r2.w, c39.x
    add r0.w, c16.w, -v1.w
    add r1.x, -c16.z, c16.w
    rcp r1.x, r1.x
    mul_sat r0.w, r0.w, r1.x
    add r0.w, -r0.w, c0.w
    add r1.xy, r1.y, c16
    mul r1.y, r0.w, r1.y
    mad r0.w, r0.w, r1.x, c0.w
    dp3 r1.x, r0, c6
    lrp r2.xyz, r0.w, r0, r1.x
    add r0.x, r1.x, c6.w
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

// approximately 248 instruction slots used (18 texture, 230 arithmetic)
