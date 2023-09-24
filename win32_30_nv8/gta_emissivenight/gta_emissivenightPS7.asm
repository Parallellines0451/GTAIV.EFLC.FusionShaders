// 256 state stipple
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
//
//
// Registers:
//
//   Name               Reg   Size
//   ------------------ ----- ----
//   gDirectionalLight  c17      1
//   gDirectionalColour c18      1
//   gLightAmbient0     c37      1
//   gLightAmbient1     c38      1
//   globalScalars      c39      1
//   globalFogParams    c41      1
//   globalFogColor     c42      1
//   gDayNightEffects   c45      1
//   emissiveMultiplier c66      1
//   TextureSampler     s0       1
//   StippleTexture     s10      1
//

    ps_3_0
    def c150, 15.996, 16, 0.0625, 0.0625	// 256 state stipple constants
    def c0, -512, 9.99999975e-006, -0.5, 0.5
    def c1, -0.25, 1.33333337, 1, 3.99600005
    def c2, 4, 0.125, 0, 1
    def c3, 64, 0, 0, 0
    dcl_texcoord v0.xy
    dcl_texcoord1 v1
    dcl_texcoord3 v2.z
    dcl_color v3
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
    mul r2.xyz, r3, r1.w
    mad r1.xyz, r1, c39.z, r2
    mov r1.w, c1.z
    mul r1, r0, r1
    mul r0.w, r1.w, c39.x
    mov_sat r1.w, r0.w
    mul r1.w, r1.w, c150.x
    frc r2.x, r1.w
    mul r2.y, r2.x, c150.y
    frc r2.z, r2.y
    add r3.x, r2.y, -r2.z
    add r3.y, r1.w, -r2.x
    mul r2.xy, c150.z, vPos
    frc r2.xy, r2_abs
    cmp r2.xy, vPos, r2, -r2
    mul r2.xy, r2, c150.w
    mad r2.xy, r3, c150.w, r2
    mov r2.zw, c2.z
    texldl r2, r2, s10
    cmp r2, -r2.y, -c2.w, -c2.z
    texkill r2
    mul r0.xyz, r0, v3
    mul r0.xyz, r0, c66.x
    mad r0.xyz, r0, c45.w, r1
    add r1.x, -c41.x, v1.w
    add r1.y, -c41.x, c41.y
    rcp r1.y, r1.y
    mul_sat r1.x, r1.x, r1.y
    lrp r2.xyz, r1.x, c42, r0
    add r0.x, c3.x, -v1.w
    mul_sat r0.x, r0.x, -c1.x
    mul oC0.w, r0.w, r0.x
    mov oC0.xyz, r2

// approximately 49 instruction slots used (3 texture, 46 arithmetic)
