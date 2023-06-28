// Fixed blocky car reflections and reflection intensity (disabled anisotropic filtering for SpecularTex in xml)
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D DirtSampler;
//   float3 LuminanceConstants;
//   sampler2D SpecSampler;
//   sampler2D TextureSampler;
//   sampler2D TextureSampler2;
//   float3 dirtColor;
//   float dirtLevel;
//   float4 gDirectionalLight;
//   float4 globalScalars;
//   float3 matDiffuseColor;
//   float4 matDiffuseColor2;
//   float reflectivePowerED;
//   float3 specMapIntMask;
//   float3 specular2Color;
//   float specular2ColorIntensityED;
//   float specular2FactorED;
//   float specularColorFactorED;
//   float specularFactorED;
//   float4 stencil;
//
//
// Registers:
//
//   Name                      Reg   Size
//   ------------------------- ----- ----
//   gDirectionalLight         c17      1
//   globalScalars             c39      1
//   stencil                   c52      1
//   matDiffuseColor           c66      1
//   matDiffuseColor2          c72      1
//   dirtLevel                 c73      1
//   dirtColor                 c74      1
//   specularFactorED          c75      1
//   specularColorFactorED     c76      1
//   specMapIntMask            c77      1
//   specular2FactorED         c78      1
//   specular2ColorIntensityED c79      1
//   specular2Color            c80      1
//   reflectivePowerED         c81      1
//   LuminanceConstants        c82      1
//   TextureSampler            s0       1
//   TextureSampler2           s1       1
//   DirtSampler               s2       1
//   SpecSampler               s4       1
//

    ps_3_0
    def c0, 9.99999975e-006, 190, 0.150000006, 0
    def c1, 1, 0, 6.80000019, 9.99999975e-005
    def c2, 0.0078125, 0.5, 0.001953125, 0
    def c3, -13.2877121, 64, 8, 4
    def c4, 32, 4, 1, 0.00392156886
    dcl_texcoord v0
    dcl_texcoord1 v1.xyz
    dcl_texcoord3 v2.xyz
    dcl_color v3
    dcl_2d s0
    dcl_2d s1
    dcl_2d s2
    dcl_2d s4
    texld r0, v0, s0
    texld r1, v0.zwzw, s1
    add r2.xyz, c0.x, v1
    dp3 r2.w, r2, r2
    rsq r2.w, r2.w
    mul r3.xyz, r2, r2.w
    texld r4, v0, s4
    mul r3.w, r4.w, c81.x
    mul r3.w, r3.w, c0.y
    dp3 r4.x, r4, c77
    mul r4.x, r4.x, c81.x
    mul r4.x, r4.x, c0.z
    mul r4.yzw, r0.xxyz, c66.xxyz
    mul r1, r1, c72
    lrp r0.xyz, r1.w, r1, r4.yzww
    mul r0, r0, v3
    dp3 r1.x, v3, c82
    mul oC2.z, r1.x, c39.z
    mov r1.yzw, c0
    if_lt -c73.x, r1.w
      texld r5, v0, s2
      mul r1.x, r5.x, c73.x
      mov r6.x, c1.x
      mad r6.x, r5.x, -c73.x, r6.x
      lrp r6.yzw, r1.x, c74.xxyz, r0.xxyz
      mad r7, r0.xxyz, c1.yxxx, c1.xyyy
      cmp r5, -r5.x, r7, r6
      mov r0.xyz, r5.yzww
    else
      mov r5.x, c1.x
    endif
    mul r1.x, r4.x, r5.x
    mov r5.xyz, c1
    mul r1.w, r5.z, c78.x
    mul r1.y, r1.y, c75.x
    rcp r1.y, r1.y
    mul r1.y, r3.w, r1.y
    mul r1.z, r1.z, c76.x
    rcp r1.z, r1.z
    mul r1.z, r4.x, r1.z
    mul r1.y, r1.w, r1.y
    mul r1.w, c79.x, c79.x
    mul r1.z, r1.z, r1.w
    add r4.xyz, c0.x, v2
    nrm r6.xyz, r4
    mul r4.xyz, r1.z, c80
    dp3 r1.z, -r6, r3
    add r1.z, r1.z, r1.z
    mad r3.xyz, r3, -r1.z, -r6
    dp3 r1.z, -c17, r3
    add r1.w, r1.z, c1.w
    log r1.w, r1.w
    cmp r1.z, r1.z, r1.w, c3.x
    mul r1.y, r1.y, r1.z
    exp r1.y, r1.y
    mad r1.yzw, r4.xxyz, r1.y, r0.xxyz
    cmp oC0.xyz, -c79.x, r0, r1.yzww
    mul r0.x, r1.x, c72.w
    mul r0.y, r3.w, c72.w
    mad r1.xyz, r2, r2.w, c1.x
    mul r2.xyz, r1, c3.y
    frc r3.xyz, r2
    add r2.xyz, r2, -r3
    mad r1.xyz, r1, c3.y, -r2
    mul r1.xyz, r1, c3.zzww
    frc r3.xyz, r1
    add r1.xyz, r1, -r3
    dp3 r0.z, r1, c4
	
	// fixed distorted reflections thanks to AssaultKifle47
    mov oC1.w, c1.y
    mad oC1.xyz, v1.xyzz, c2.y, c2.y
	
    mul oC2.x, r0.x, c2.y
    mul r0.x, r0.y, c2.z
    rsq r0.x, r0.x
    rcp oC2.y, r0.x
    mul oC0.w, r0.w, c39.x
    mov oC2.w, c1.x
    mul oC3, r5.xyyy, c52.x

// approximately 81 instruction slots used (4 texture, 77 arithmetic)
