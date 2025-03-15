// Summary: removed unnecessary stipple
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D StippleTexture;
//   sampler2D TextureSampler;
//   float emissiveMultiplier;
//   float4 gDayNightEffects;
//   float4 gDirectionalColour;
//   float4 gDirectionalLight;
//   float4 gLightAmbient0;
//   float4 gLightAmbient1;
//   float4 globalFogColor;
//   float4 globalFogParams;
//   float4 globalScalars;
//   float specularColorFactor;
//   float specularFactor;
//
//
// Registers:
//
//   Name                Reg   Size
//   ------------------- ----- ----
//   gDirectionalLight   c17      1
//   gDirectionalColour  c18      1
//   gLightAmbient0      c37      1
//   gLightAmbient1      c38      1
//   globalScalars       c39      1
//   globalFogParams     c41      1
//   globalFogColor      c42      1
//   gDayNightEffects    c45      1
//   emissiveMultiplier  c66      1
//   specularFactor      c72      1
//   specularColorFactor c73      1
//   TextureSampler      s0       1
//   StippleTexture      s10      1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 5.4090120723e-43 // 386
    def c0, -512, 3.99600005, 4, 0.125
    def c1, 9.99999975e-006, -0.5, 0.5, 1.33333337
    def c2, 9.99999975e-005, 64, 0, 0
    def c3, 0.25, 0, -1, -0
    dcl_texcoord v0.xy
    dcl_texcoord1 v1
    dcl_texcoord3 v2.xyz
    dcl_color v3
    dcl vPos.xy
    dcl_2d s0
    dcl_2d s10
    add r0, c0.x, v2.z
    texkill r0
    texld r0, v0, s0
    add r1.xyz, c1.x, v1
    nrm r2.xyz, r1
    mul r1, r0, v3
    add r3.xyz, c1.x, v2
    nrm r4.xyz, r3
    mad_sat r2.w, r2.z, c1.y, c1.z
    mov r3.xyz, c38
    mad r3.xyz, r3, r2.w, c37
    dp3 r2.w, r4, r2
    add r2.w, r2.w, r2.w
    mad r4.xyz, r2, -r2.w, r4
    mul r5.xyz, c18.w, c18
    dp3 r2.x, r2, -c17
    add r2.x, r2.x, -c3.x
    mul_sat r2.x, r2.x, c1.w
    dp3_sat r2.y, -c17, r4
    add r2.y, r2.y, c2.x
    mov r4.x, c2.x
    add r2.z, r4.x, c72.x
    pow r3.w, r2.y, r2.z
    mul r2.yzw, r5.xxyz, r3.w
    mul r4.xyz, r5, r2.x
    mul r2.xyz, r2.yzww, c17.w
    mad r3.xyz, r3, c39.z, r4
    mov r0.w, r1.w
    mov r3.w, -c3.z
    mul r0, r3, r0
    mad r0.xyz, c73.x, r2, r0
    mul r1.xyz, r1, c66.x
    mad r0.xyz, r1, c45.w, r0
    mul r0.w, r0.w, c39.x
    add r1.x, -c41.x, v1.w
    add r1.y, -c41.x, c41.y
    rcp r1.y, r1.y
    mul_sat r1.x, r1.x, r1.y
    lrp r2.xyz, r1.x, c42, r0
    add r0.x, c2.y, -v1.w
    mul_sat r0.x, r0.x, c3.x
    mul oC0.w, r0.w, r0.x
    mov oC0.xyz, r2

// approximately 65 instruction slots used (3 texture, 62 arithmetic)
