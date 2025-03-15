// Summary: removed unnecessary stipple + added volumetric fog
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
//   float4 globalFogColorN;
//   row_major float4x4 gViewInverse;
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
//   gViewInverse        c12      1
//   gDirectionalLight   c17      1
//   gDirectionalColour  c18      1
//   gLightAmbient0      c37      1
//   gLightAmbient1      c38      1
//   globalScalars       c39      1
//   globalFogParams     c41      1
//   globalFogColor      c42      1
//   globalFogColorN     c43      1
//   gDayNightEffects    c45      1
//   emissiveMultiplier  c66      1
//   specularFactor      c72      1
//   specularColorFactor c73      1
//   TextureSampler      s0       1
//   StippleTexture      s10      1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 5.4230250569e-43 // 387
    def c127, 1, 0.99, 0, 0 // LogDepth constants
    def c140, 1e-6, 0.5, -0.0625, 0.9375
    def c141, 0.6, 4, 1, 30
    def c142, 1000, 0, 0, 0
    def c0, 0, -1, -0, 9.99999975e-006
    def c1, -0.5, 0.5, 1.33333337, 9.99999975e-005
    def c2, 3.99600005, 4, 0.125, 0.25
    dcl_texcoord v0.xy
    dcl_texcoord1 v1
    dcl_texcoord3 v2.xyz
    dcl_color v3
    dcl vPos.xy
    dcl_texcoord6 v4.xyz
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s10
    texld r0, v0, s0
    add r1.xyz, c0.w, v1
    nrm r2.xyz, r1
    mul r1, r0, v3
    add r3.xyz, c0.w, v2
    nrm r4.xyz, r3
    mad_sat r2.w, r2.z, c1.x, c1.y
    mov r3.xyz, c38
    mad r3.xyz, r3, r2.w, c37
    dp3 r2.w, r4, r2
    add r2.w, r2.w, r2.w
    mad r4.xyz, r2, -r2.w, r4
    mul r5.xyz, c18.w, c18
    dp3 r2.x, r2, -c17
    add r2.x, r2.x, -c2.w
    mul_sat r2.x, r2.x, c1.z
    dp3_sat r2.y, -c17, r4
    add r2.y, r2.y, c1.w
    mov r2.w, c1.w
    add r2.z, r2.w, c72.x
    pow r3.w, r2.y, r2.z
    mul r2.yzw, r5.xxyz, r3.w
    mul r4.xyz, r5, r2.x
    mul r2.xyz, r2.yzww, c17.w
    mad r3.xyz, r3, c39.z, r4
    mov r0.w, r1.w
    mov r3.w, -c0.y
    mul r0, r3, r0
    mad r0.xyz, c73.x, r2, r0
    mul r1.xyz, r1, c66.x
    mad r0.xyz, r1, c45.w, r0
    mul oC0.w, r0.w, c39.x
    if_eq -c210_abs.y, c210_abs.y
      add r0.w, -c41.x, v1.w
      add r1.x, -c41.x, c41.y
      rcp r1.x, r1.x
      mul_sat r0.w, r0.w, r1.x
      add r1.xyz, -r0, c42
      mad oC0.xyz, r0.w, r1, r0
    else
      add r20.xyz, -c15, v4.xyz
      dp3 r20.w, r20, r20
      rsq r20.w, r20.w
      mul r20.xyz, r20, r20.w
      rcp r20.w, r20.w
      
      mov r21.xyz, c212
      mad r21.w, r20.x, c140.y, c140.y
      lrp r22.xyz, r21.w, r21, c213
      mul_sat r21.x, r20.z, c212.w
      mad r21.x, r21.x, -c213.w, c213.w
      mad r21.xyz, r22, r21.x, c214
      
      dp3 r21.w, r20, c216
      
      mad_sat r22.xy, r21.w, c140.zy, c140.wy
      mul r22.z, r22.x, r22.x
      mul r22.x, r22.x, r22.z
      mov r22.z, c141.x
      add_sat r22.z, r22.z, c216_abs.z
      mad r22.x, r22.x, -r22.z, r22.y
      mul_sat r22.x, r22.x, c140.y
      mul r22.x, r22.x, c141.y
      add_sat r22.y, c141.z, -r22.x
      
      mul r23.xyz, r22.x, c215
      mul r23.xyz, r23, r23
      mul r23.xyz, r23, r23
      mad r23.xyz, r22.x, c215, r23
      mul r23.xyz, r23, c215.w
      
      mul r21.xyz, r21, r22.y
      mul_sat r21.xyz, r21, c215.w
      
      add r21.xyz, r21, r23
      mul r21.xyz, r21, c214.w
      min r21.xyz, r21, c141.w
      
      mov r22.xyz, c43
      lrp r22.xyz, c41.w, r22, r21
      
      mov r20.x, -c15.z
      mul r20.xy, r20.xz, c211.y
      mul r20.x, r20.x, c210.x
      exp r20.x, -r20.x
      
      add r20.z, r20_abs.y, -c140.x
      cmp r20.y, r20.z, r20.y, c140.x
      rcp r20.z, r20.y
      mul r20.y, r20.y, r20.w
      exp r20.y, -r20.y
      add r20.y, -r20.y, c141.z
      mul r20.y, r20.y, r20.z
      
      mul r20.x, r20.x, r20.y
      mul r20.x, r20.x, c211.x
      
      exp r20.x, -r20.x
      add r20.x, -r20.x, c141.z
      
      pow r20.x, r20.x, c211.z
      
      lrp oC0.xyz, r20.x, r22, r0
    endif
    
    // LogDepth Write (emissive)
    if_ne v9.y, c127.x
      mov r20.x, c127.y
      mad r20.x, r20.x, c209.y, -v9.w
      texkill r20.x
      rcp r20.x, c209.x
      mul r20.y, r20.x, v9.w
      mul r20.x, r20.x, c209.y
      log r20.x, r20.x
      log r20.y, r20.y
      rcp r20.x, r20.x
      mad r20.x, r20.x, r20.y, -v9.x
    else
      rcp r20.x, v9.w
      mul r20.x, r20.x, v9.z
    endif
    mov oDepth, r20.x

// approximately 60 instruction slots used (3 texture, 57 arithmetic)
