// Fixed blocky car reflections & disabled PC parameters that cause the dirt level in vehicle.ide to affect reflection intensity
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D DirtSampler;
//   float3 LuminanceConstants;
//   sampler2D SpecSampler;
//   sampler2D TextureSampler;
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
//   DirtSampler               s1       1
//   SpecSampler               s2       1
//

    ps_3_0
    def c127, 0.9999999, 1, 0, 0	// LogDepth constants
    def c0, 9.99999975e-006, 190, 0.150000006, 0
    def c1, 1, 0, 6.80000019, 9.99999975e-005
    def c2, 0.0078125, 0.5, 0.001953125, 0
    def c3, -13.2877121, 64, 8, 4
    def c4, 32, 4, 1, 0.00392156886
    dcl_texcoord v0.xy
    dcl_texcoord1 v1.xyz
    dcl_texcoord3 v2.xyz
    dcl_color v3
    dcl_texcoord7 v4.xy
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s1
    dcl_2d s2
    texld r0, v0, s0
    add r1.xyz, c0.x, v1
    dp3 r1.w, r1, r1
    rsq r1.w, r1.w
    mul r2.xyz, r1, r1.w
    texld r3, v0, s2
    mul r2.w, r3.w, c1.x
    mul r2.w, r2.w, c0.y
    dp3 r3.x, r3, c77
    mul r3.x, r3.x, c1.x
    mul r3.x, r3.x, c0.z
    mul r0.xyz, r0, c66
    mul r0, r0, v3
    dp3 r3.y, v3, c82
    mul oC2.z, r3.y, c39.z
    mov r3.yzw, c0
    if_lt -c73.x, r3.w
      texld r4, v4, s1
      mul r3.w, r4.x, c73.x
      mov r5.x, c1.x
      mad r5.x, r4.x, -c73.x, r5.x
      lrp r5.yzw, r3.w, c74.xxyz, r0.xxyz
      mad r6, r0.xxyz, c1.yxxx, c1.xyyy
      cmp r4, -r4.x, r6, r5
      mov r0.xyz, r4.yzww
    else
      mov r4.x, c1.x
    endif
    mul r3.w, r3.x, r4.x
    mov r4.xyz, c1
    mul r4.z, r4.z, c1.x
    mul r3.y, r3.y, c1.x
    rcp r3.y, r3.y
    mul r3.y, r2.w, r3.y
    mul r3.z, r3.z, c1.x
    rcp r3.z, r3.z
    mul r3.x, r3.x, r3.z
    mul r3.y, r4.z, r3.y
    mul r3.z, c1.x, c1.x
    mul r3.x, r3.x, r3.z
    add r5.xyz, c0.x, v2
    nrm r6.xyz, r5
    mul r5.xyz, r3.x, c80
    dp3 r3.x, -r6, r2
    add r3.x, r3.x, r3.x
    mad r2.xyz, r2, -r3.x, -r6
    dp3 r2.x, -c17, r2
    add r2.y, r2.x, c1.w
    log r2.y, r2.y
    cmp r2.x, r2.x, r2.y, c3.x
    mul r2.x, r3.y, r2.x
    exp r2.x, r2.x
    mad r2.xyz, r5, r2.x, r0
    cmp oC0.xyz, -c1.x, r0, r2
    mul r0.x, r3.w, c72.w
    mul r0.y, r2.w, c72.w
    mad r1.xyz, r1, r1.w, c1.x
    mul r2.xyz, r1, c3.y
    frc r3.xyz, r2
    add r2.xyz, r2, -r3
    mad r1.xyz, r1, c3.y, -r2
    mul r1.xyz, r1, c3.zzww
    frc r3.xyz, r1
    add r1.xyz, r1, -r3
    dp3 r0.z, r1, c4
	// --------------------------------------------------------------- Fixed Normals ----------------------------------------------------------------
    mov oC1.w, c1.y
    mad oC1.xyz, v1.xyzz, c2.y, c2.y
	// ----------------------------------------------------------------------------------------------------------------------------------------------
    mul oC2.x, r0.x, c2.y
    mul r0.x, r0.y, c2.z
    rsq r0.x, r0.x
    rcp oC2.y, r0.x
    mul oC0.w, r0.w, c39.x
    mov oC2.w, c1.x
    mul oC3, r4.xyyy, c52.x
	// ----------------------------------------------------------------- Linear2Log -----------------------------------------------------------------
	if_ne v9.y, c127.y
		rcp r20.z, c128.x
		mul r20.x, v9.w, r20.z
		mul r20.y, c128.y, r20.z
		log r20.x, r20.x
		log r20.y, r20.y
		rcp r20.y, r20.y
	else
		mov r20.x, v9.z
		rcp r20.y, v9.w
	endif
	mul oDepth, r20.x, r20.y
	// ----------------------------------------------------------------------------------------------------------------------------------------------

// approximately 78 instruction slots used (3 texture, 75 arithmetic)
