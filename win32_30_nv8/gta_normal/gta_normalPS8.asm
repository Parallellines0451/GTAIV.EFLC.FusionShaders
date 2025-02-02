// Summary: simplified transparency code
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   float4 NearFarPlane;
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
//   NearFarPlane        c128     1
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
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 6.0536093659e-43 // 432
    def c152, 0.2, 0.4, 0.6, 0.8 // c152-c154 = new stipple constants
    def c153, 0.5, 2, 1, 0
    def c154, 1.6, 0, 0, 0
    def c127, 1, 0.99, 0, 0 // LogDepth constants
    def c0, 9.99999975e-006, -0.5, 0.5, -0.25
    def c1, 1.33333337, 1, 3.99600005, 4
    def c2, 9.99999975e-005, 0, 0, 0
    def c3, 0.125, 0, -1, -0
    dcl_texcoord v0.xy
    dcl_texcoord1 v1
    dcl_texcoord3 v2.xyz
    dcl_color v3.xw
    dcl vPos.xy
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s10
    texld r0, v0, s0
    mul_sat r0.w, r0.w, c154.x
    add r1.xyz, c0.x, v1
    nrm r2.xyz, r1
    mul r0.w, r0.w, v3.w
    mad_sat r1.x, r2.z, c0.y, c0.z
    mov r3.xyz, c38
    mad r1.xyz, r3, r1.x, c37
    mul r3.xyz, c18.w, c18
    dp3 r1.w, r2, -c17
    add r1.w, r1.w, c0.w
    mul_sat r1.w, r1.w, c1.x
    mul r4.xyz, r3, r1.w
    mad r1.xyz, r1, v3.x, r4
    mov r1.w, c1.y
    mul r0, r0, r1
    mul r0.w, r0.w, c39.x
    mul r20.xy, vPos.xy, c153.x
    frc r20.xy, r20.xy
    mad r20, r20.xxyy, -c153.y, c153.zwzw
    mul r20, r20.xxyy, r20.zwzw
    dp4 r20.x, r20_abs, c152.xzwy
    add r20.y, -r20.x, r0.w
    texkill r20.y
    add r1.xyz, c0.x, v2
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
    add r1.yzw, -r0.xxyz, c42.xxyz
    mad oC0.xyz, r1.x, r1.yzww, r0
    mov oC0.w, r0.w
    
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

// approximately 58 instruction slots used (3 texture, 55 arithmetic)
