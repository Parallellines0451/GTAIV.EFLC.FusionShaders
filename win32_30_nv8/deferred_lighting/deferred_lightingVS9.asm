// Summary: added volumetric fog
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   float4 gDeferredLightColourAndIntensity;
//   float3 gDeferredLightDirection;
//   float3 gDeferredLightPosition;
//   float gDeferredLightRadius;
//   float4 gDeferredLightShaftParams;
//   float3 gDeferredLightTangent;
//   float4 gDirectionalLight;
//   row_major float4x4 gViewInverse;
//   row_major float4x4 gWorldViewProj;
//
//
// Registers:
//
//   Name                             Reg   Size
//   -------------------------------- ----- ----
//   gWorldViewProj                   c8       4
//   gViewInverse                     c12      4
//   gDirectionalLight                c17      1
//   gDeferredLightPosition           c208     1
//   gDeferredLightDirection          c209     1
//   gDeferredLightTangent            c210     1
//   gDeferredLightRadius             c211     1
//   gDeferredLightColourAndIntensity c212     1
//   gDeferredLightShaftParams        c213     1
//

    vs_3_0
    def c230, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 2.8194125102e-42 // 2012
    def c0, -0.5, 0.25, 0, 0
    def c140, 1e-6, 0.5, -0.0625, 0.9375
    def c141, 0.6, 4, 1, 30
    def c142, 0.003, 0.015, 0.7, 0.5 // density, height falloff, altitude compensation, color mixing
    def c143, 1000, 0, 0, 0
    dcl_position v0
    dcl_position o0
    dcl_texcoord9 o10
    dcl_texcoord o1
    dcl_texcoord1 o2.xyz
    dcl_texcoord2 o3.xyz
    mov r0.xyz, c209
    add r1.xyz, -r0, c210
    add r2.xy, c0.x, v0
    mad r0.xyz, r0, r2.x, c208
    mad r0.xyz, r1, r2.y, r0
    mul r0.w, c211.x, v0.z
    mad r0.xyz, c17, r0.w, r0
    add o2.xyz, r0, -c15
    mov r1.xyz, c15
    add o1.xyz, r1, -c208
    mov r0.w, c212.w
    mul r0.w, r0.w, c0.y
    mov r20.x, c143.x
    add r20.x, c41.x, -r20.x
    mul r20.x, r20.x, c236.y
    if_lt r20.x, r20_abs.x
      add r20.xyz, -r1, c208
      dp3 r20.w, r20, r20
      rsq r20.w, r20.w
      mul r20.xyz, r20, r20.w
      rcp r20.w, r20.w
      
      mov r20.x, c15.z
      mul r20.xy, r20.xz, c235.y
      mul r20.x, r20.x, c235.z
      exp r20.x, -r20.x
      
      sge r21.x, r20_abs.y, c140.x
      lrp r20.y, r21.x, r20.y, c140.x
      rcp r20.z, r20.y
      mul r20.y, r20.y, r20.w
      exp r20.y, -r20.y
      add r20.y, -r20.y, c141.z
      mul r20.y, r20.y, r20.z
      
      mul r20.x, r20.x, r20.y
      mul r20.x, r20.x, c235.x
      
      exp r20.x, -r20.x
      mul r0.w, r0.w, r20.x
    endif
    mul r1.xyz, r0.w, c212
    mul o3.xyz, r1, c213.x
    mul r1, r0.y, c9
    mad r1, r0.x, c8, r1
    mad r0, r0.z, c10, r1
    add r0, r0, c11
    mov o0, r0
    mov o10.zw, r0
    mov o1.w, r0.w
    mov r20.x, c8.w
    add r20.x, r20.x, c9.w
    add r20.x, r20.x, c10.w
    add o10.y, r20.x, c11.w
    
// approximately 20 instruction slots used
