//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D TextureSampler_layer0;
//   float4 gDepthFxParams;
//   float4 gDirectionalColour;
//   float4 gDirectionalLight;
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
//   float4 globalFogColor;
//   float4 globalFogColorN;
//   float4 globalFogParams;
//   float4 globalScalars;
//
//
// Registers:
//
//   Name                  Reg   Size
//   --------------------- ----- ----
//   gDepthFxParams        c16      1
//   gDirectionalLight     c17      1
//   gDirectionalColour    c18      1
//   gLightPosX            c19      1
//   gLightPosY            c20      1
//   gLightPosZ            c21      1
//   gLightDirX            c22      1
//   gLightDirY            c23      1
//   gLightDirZ            c24      1
//   gLightFallOff         c25      1
//   gLightConeScale       c26      1
//   gLightConeOffset      c27      1
//   gLightColR            c29      1
//   gLightColG            c30      1
//   gLightColB            c31      1
//   gLightPointPosX       c32      1
//   gLightPointPosY       c33      1
//   gLightPointPosZ       c34      1
//   gLightPointColR       c35      1
//   gLightPointFallOff    c36      1
//   gLightAmbient0        c37      1
//   gLightAmbient1        c38      1
//   globalScalars         c39      1
//   globalFogParams       c41      1
//   globalFogColor        c42      1
//   globalFogColorN       c43      1
//   gLightPointColG       c64      1
//   gLightPointColB       c65      1
//   gLightDir2X           c67      1
//   gLightDir2Y           c68      1
//   gLightDir2Z           c69      1
//   gLightConeScale2      c70      1
//   gLightConeOffset2     c71      1
//   TextureSampler_layer0 s0       1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 8.3937778013e-43 // 599
    def c127, 1, 0.99, 0, 0 // LogDepth constants
    def c0, -0.5, 0.5, -0.25, 1.33333337
    def c1, 9.99999975e-006, 1, 0, -0.100000001
    def c2, 1.11111116, 0.212500006, 0.715399981, 0.0720999986
    def c3, 1.00000001e-007, 0, 0, 0
    dcl_texcoord v0.xyw
    dcl_color v1
    dcl_texcoord2 v2.xyz
    dcl_texcoord3 v3.xyz
    dcl_texcoord9 v9
    dcl_2d s0
    add r0, c19, -v2.x
    mul r1, r0, r0
    add r2, c20, -v2.y
    mad r1, r2, r2, r1
    add r3, c21, -v2.z
    mad r1, r3, r3, r1
    mov r4.y, c1.y
    mad r5, r1, -c25, r4.y
    add r1, r1, c1.x
    max r6, r5, c1.z
    mul r5, r6, r6
    mad r5, r5, r5, c1.w
    mul r6, r5, c2.x
    mul r7, r0, v3.x
    mul r0, r0, -c22
    mad r0, r2, -c23, r0
    mad r2, r2, v3.y, r7
    mad r2, r3, v3.z, r2
    mad r0, r3, -c24, r0
    mul r2, r6, r2
    rsq r3.x, r1.x
    rsq r3.y, r1.y
    rsq r3.z, r1.z
    rsq r3.w, r1.w
    mul r1, r2, r3
    mul r0, r0, r3
    mov r2, c26
    mad_sat r0, r0, r2, c27
    cmp_sat r1, r5, r1, c1.z
    mul r0, r0, r1
    dp4 r1.x, c29, r0
    dp4 r1.y, c30, r0
    dp4 r1.z, c31, r0
    dp3 r0.x, v3, -c17
    add r0.x, r0.x, c0.z
    mul_sat r0.x, r0.x, c0.w
    mad_sat r0.y, v3.z, c0.x, c0.y
    mov r2.xyz, c38
    mad r0.yzw, r2.xxyz, r0.y, c37.xxyz
    mul r2.xyz, c18.w, c18
    mad r0.xyz, r2, r0.x, r0.yzww
    add r0.xyz, r1, r0
    add r1, c32, -v2.x
    mul r2, r1, r1
    add r3, c33, -v2.y
    mad r2, r3, r3, r2
    add r5, c34, -v2.z
    mad r2, r5, r5, r2
    mad r6, r2, -c36, r4.y
    add r2, r2, c1.x
    max r7, r6, c1.z
    mul r6, r7, r7
    mad r6, r6, r6, c1.w
    mul r7, r6, c2.x
    mul r8, r1, v3.x
    mul r1, r1, -c67
    mad r1, r3, -c68, r1
    mad r3, r3, v3.y, r8
    mad r3, r5, v3.z, r3
    mad r1, r5, -c69, r1
    mul r3, r7, r3
    rsq r5.x, r2.x
    rsq r5.y, r2.y
    rsq r5.z, r2.z
    rsq r5.w, r2.w
    mul r2, r3, r5
    mul r1, r1, r5
    mov r3, c70
    mad_sat r1, r1, r3, c71
    cmp_sat r2, r6, r2, c1.z
    mul r1, r1, r2
    dp4 r2.x, c35, r1
    dp4 r2.y, c64, r1
    dp4 r2.z, c65, r1
    add r0.xyz, r0, r2
    mul r1.w, c39.x, v1.w
    mov r1.xyz, v1
    mov r0.w, c1.y
    mul r0, r0, r1
    texld r1, v0, s0
    mul r2, r0, r1
    dp3 r0.w, r2, c2.yzww
    mov oC0.w, r2.w
    mad r0.xyz, r0, r1, -r0.w
    add r1.x, -c16.z, c16.w
    rcp r1.x, r1.x
    add r1.y, c16.w, -v0.w
    mul_sat r1.x, r1.x, r1.y
    add r1.x, -r1.x, c1.y
    add r1.yz, -r4.y, c16.xxyw
    mad r1.y, r1.x, r1.y, c1.y
    mul r1.x, r1.x, r1.z
    mad r0.xyz, r1.y, r0, r0.w
    add r0.w, r0.w, c3.x
    pow r2.x, r0_abs.w, r1.x
    mul r1.xyz, r0, r2.x
    add r0.w, -c41.x, c41.y
    rcp r0.w, r0.w
    add r1.w, -c41.x, v0.w
    mul_sat r0.w, r0.w, r1.w
    mov r3.xyz, c43
    add r2.yzw, -r3.xxyz, c42.xxyz
    mad r2.yzw, r0.w, r2, c43.xxyz
    mad r0.xyz, r0, -r2.x, r2.yzww
    rcp r1.w, c41.x
    mul_sat r1.w, r1.w, v0.w
    lrp r2.x, c41.w, r1.w, r0.w
    add r0.w, r2.x, c41.z
    mad r0.xyz, r0.w, r0, r1
    mul oC0.xyz, r0, c39.y
    
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

// approximately 112 instruction slots used (1 texture, 111 arithmetic)
