//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D GBufferTextureSampler3;
//   float4 gDeferredProjParams;
//   float4 gFacetCentre;
//   row_major float4x4 gShadowMatrix;
//   float4 gShadowParam0123;
//   float4 gShadowParam14151617;
//   float4 gShadowParam4567;
//   float4 gShadowParam891113;
//   sampler2D gShadowZSamplerDir;
//   row_major float4x4 gViewInverse;
//   float4 gooDeferredLightScreenSize;
//
//
// Registers:
//
//   Name                       Reg   Size
//   -------------------------- ----- ----
//   gViewInverse               c12      4
//   gFacetCentre               c54      1
//   gShadowParam14151617       c56      1
//   gShadowParam0123           c57      1
//   gShadowParam4567           c58      1
//   gShadowParam891113         c59      1
//   gShadowMatrix              c60      4
//   gooDeferredLightScreenSize c66      1
//   gDeferredProjParams        c72      1
//   GBufferTextureSampler3     s0       1
//   gShadowZSamplerDir         s15      1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 5.7453237037e-44 // 41
    def c0, 0.50999999, 2, -1, -0
    dcl vPos.xy
    dcl_2d s0
    dcl_2d s15
    add r0.xy, c0.x, vPos
    mul r0.xy, r0, c66.zwzw
    texld r1, r0, s0
    mad r0.xy, r0, c0.y, c0.z
    mad r0.z, r1.x, c72.z, -c72.w
    mul r1, r0.y, c13
    mad r1, r0.x, c12, r1
    add r1, r1, c14
    mul r0.x, r0.z, r1.w
    rcp r0.x, r0.x
    mad r0.xyz, r1, -r0.x, c15
    mul r1.xyz, r0.y, c61.xyww
    mad r1.xyz, r0.x, c60.xyww, r1
    mad r1.xyz, r0.z, c62.xyww, r1
    dp3 r0.x, c14, r0
    add r0.xyz, -r0.x, -c54
    cmp r0.yzw, r0.xxyz, -c0.z, -c0.w
    add r1.xyz, r1, c63.xyww
    mov r0.x, -c0.z
    dp4 r2.x, r0, c57
    dp4 r2.y, r0, c58
    dp4 r3.x, r0, c59
    dp4 r3.y, r0, c56
    mad r0.xy, r1, r2, r3
    texld r0, r0, s15
    add r0.x, r1.z, -r0.x
    cmp oC0.w, r0.x, -c0.z, -c0.w
    mov oC0.xyz, -c0.wwzw

// approximately 28 instruction slots used (2 texture, 26 arithmetic)
