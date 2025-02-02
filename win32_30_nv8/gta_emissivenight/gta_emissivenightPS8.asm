// Summary: simplified transparency code
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   float4 NearFarPlane;
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
//   NearFarPlane       c128     1
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
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 2.4382593279e-43 // 174
    def c152, 0.2, 0.4, 0.6, 0.8 // c152-c154 = new stipple constants
    def c153, 0.5, 2, 1, 0
    def c154, 1.6, 0, 0, 0
    def c127, 1, 0.99, 0, 0 // LogDepth constants
    def c0, 9.99999975e-006, -0.5, 0.5, -0.25
    def c1, 1.33333337, 1, 3.99600005, 4
    def c2, 0.125, 0, -1, -0
    dcl_texcoord v0.xy
    dcl_texcoord1 v1
    dcl_color v2
    dcl vPos.xy
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s10
    texld r0, v0, s0
    mul_sat r0.w, r0.w, c154.x
    add r1.xyz, c0.x, v1
    nrm r2.xyz, r1
    mul r0.w, r0.w, v2.w
    mad_sat r1.x, r2.z, c0.y, c0.z
    mov r3.xyz, c38
    mad r1.xyz, r3, r1.x, c37
    mul r3.xyz, c18.w, c18
    dp3 r1.w, r2, -c17
    add r1.w, r1.w, c0.w
    mul_sat r1.w, r1.w, c1.x
    mul r2.xyz, r3, r1.w
    mad r1.xyz, r1, c39.z, r2
    mov r1.w, c1.y
    mul r1, r0, r1
    mul r0.w, r1.w, c39.x
    mul r20.xy, vPos.xy, c153.x
    frc r20.xy, r20.xy
    mad r20, r20.xxyy, -c153.y, c153.zwzw
    mul r20, r20.xxyy, r20.zwzw
    dp4 r20.x, r20_abs, c152.xzwy
    add r20.y, -r20.x, r0.w
    texkill r20.y
    mul r0.xyz, r0, v2
    mul r0.xyz, r0, c66.x
    mad r0.xyz, r0, c45.w, r1
    add r1.x, -c41.x, v1.w
    add r1.y, -c41.x, c41.y
    rcp r1.y, r1.y
    mul_sat r1.x, r1.x, r1.y
    add r1.yzw, -r0.xxyz, c42.xxyz
    mad oC0.xyz, r1.x, r1.yzww, r0
    mov oC0.w, r0.w
    
    // LogDepth Write (emissive)
    if_ne v9.y, c127.x
      mov r20.x, c127.y
      mad r20.x, r20.x, c128.y, -v9.w
      texkill r20.x
      rcp r20.x, c128.x
      mul r20.y, r20.x, v9.w
      mul r20.x, r20.x, c128.y
      log r20.x, r20.x
      log r20.y, r20.y
      rcp r20.x, r20.x
      mad r20.x, r20.x, r20.y, -v9.x
    else
      rcp r20.x, v9.w
      mul r20.x, r20.x, v9.z
    endif
    mov oDepth, r20.x

// approximately 45 instruction slots used (3 texture, 42 arithmetic)
