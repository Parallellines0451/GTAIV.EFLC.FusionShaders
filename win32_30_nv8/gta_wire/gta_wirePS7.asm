// 256 state stipple & changed stipple channel
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
//   TextureSampler     s0       1
//   StippleTexture     s10      1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 1.0607829375e-42 // 757
    def c150, 15.996, 16, 0.0625, 0.0625	// 256 state stipple constants
    def c0, -512, 3.99600005, 4, 0.125
    def c1, 9.99999975e-006, -0.5, 0.5, 1.33333337
    def c2, 64, 0, 0, 0
    def c3, 0.25, 0, -1, -0
    dcl_texcoord v0.xy
    dcl_texcoord1 v1
    dcl_texcoord3 v2.z
    dcl_color v3.xw
    dcl vPos.xy
    dcl_2d s0
    dcl_2d s10
    add r0, c0.x, v2.z
    texkill r0
    mov_sat r0.x, c39.x
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
    mov r0.zw, c3.y
    texldl r0, r0, s10
    cmp r0, -r0.x, c3.z, c3.w
    texkill r0
    texld r0, v0, s0
    add r1.xyz, c1.x, v1
    nrm r2.xyz, r1
    mul r0.w, r0.w, v3.w
    mad_sat r1.x, r2.z, c1.y, c1.z
    mov r3.xyz, c38
    mad r1.xyz, r3, r1.x, c37
    mul r3.xyz, c18.w, c18
    dp3 r1.w, r2, -c17
    add r1.w, r1.w, -c3.x
    mul_sat r1.w, r1.w, c1.w
    mul r2.xyz, r3, r1.w
    mad r1.xyz, r1, v3.x, r2
    mov r1.w, -c3.z
    mul r2, r0, r1
    mul r0.w, r2.w, c39.x
    add r1.w, -c41.x, v1.w
    add r2.w, -c41.x, c41.y
    rcp r2.w, r2.w
    mul_sat r1.w, r1.w, r2.w
    mad r0.xyz, r0, -r1, c42
    mad r0.xyz, r1.w, r0, r2
    add r1.x, c2.x, -v1.w
    mul_sat r1.x, r1.x, c3.x
    mul oC0.w, r0.w, r1.x
    mov oC0.xyz, r0

// approximately 46 instruction slots used (3 texture, 43 arithmetic)
