// Summary: simplified transparency code
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D StippleTexture;
//   sampler2D TextureSampler;
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
//   specularFactor      c66      1
//   specularColorFactor c72      1
//   TextureSampler      s0       1
//   StippleTexture      s10      1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 5.2548692412e-43 // 375
    def c151, 0.3125, 0, 0, 0
    def c0, -512, 9.99999975e-006, -0.5, 0.5
    def c1, -0.25, 1.33333337, 1, 3.99600005
    def c2, 9.99999975e-005, 64, 0, 0
    def c3, 4, 0.125, 0, 1
    dcl_texcoord v0.xy
    dcl_texcoord1 v1
    dcl_texcoord3 v2.xyz
    dcl_color v3.xw
    dcl vPos.xy
    dcl_2d s0
    dcl_2d s10
    add r0, c0.x, v2.z
    texkill r0
    texld r0, v0, s0
    add r1.xyz, c0.y, v1
    nrm r2.xyz, r1
    mul r0.w, r0.w, v3.w
    mad_sat r1.x, r2.z, c0.z, c0.w
    mov r3.xyz, c38
    mad r1.xyz, r3, r1.x, c37
    mul r3.xyz, c18.w, c18
    dp3 r1.w, r2, -c17
    add r1.w, r1.w, c1.x
    mul_sat r1.w, r1.w, c1.y
    mul r4.xyz, r3, r1.w
    mad r1.xyz, r1, v3.x, r4
    mov r1.w, c1.z
    mul r0, r0, r1
    add r20.x, r0.w, -c151.x
    texkill r20.x
    mul r0.w, r0.w, c39.x
    add r1.xyz, c0.y, v2
    nrm r4.xyz, r1
    dp3 r1.x, r4, r2
    add r1.x, r1.x, r1.x
    mad r1.xyz, r2, -r1.x, r4
    dp3_sat r1.x, -c17, r1
    add r1.x, r1.x, c2.x
    mov r2.x, c2.x
    add r1.y, r2.x, c66.x
    pow r2.x, r1.x, r1.y
    mul r1.xyz, r3, r2.x
    mul r1.xyz, r1, c17.w
    mad r0.xyz, c72.x, r1, r0
    add r1.x, -c41.x, v1.w
    add r1.y, -c41.x, c41.y
    rcp r1.y, r1.y
    mul_sat r1.x, r1.x, r1.y
    lrp r2.xyz, r1.x, c42, r0
    add r0.x, c2.y, -v1.w
    mul_sat r0.x, r0.x, -c1.x
    mul oC0.w, r0.w, r0.x
    mov oC0.xyz, r2

// approximately 62 instruction slots used (3 texture, 59 arithmetic)
