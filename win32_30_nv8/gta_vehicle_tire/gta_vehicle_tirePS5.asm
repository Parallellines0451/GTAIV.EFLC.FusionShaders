// Disabled PC parameters that cause the dirt level in vehicle.ide to affect reflection intensity
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D BumpSampler;
//   sampler2D DirtSampler;
//   float3 LuminanceConstants;
//   sampler2D SpecSampler;
//   sampler2D TextureSampler;
//   float3 dirtColor;
//   float dirtLevel;
//   float4 globalScalars;
//   float3 matDiffuseColor;
//   float4 matDiffuseColor2;
//   float reflectivePowerED;
//   float3 specMapIntMask;
//   float4 stencil;
//
//
// Registers:
//
//   Name               Reg   Size
//   ------------------ ----- ----
//   globalScalars      c39      1
//   stencil            c52      1
//   matDiffuseColor    c66      1
//   matDiffuseColor2   c72      1
//   dirtLevel          c73      1
//   dirtColor          c74      1
//   specMapIntMask     c75      1
//   reflectivePowerED  c76      1
//   LuminanceConstants c77      1
//   TextureSampler     s0       1
//   DirtSampler        s1       1
//   BumpSampler        s2       1
//   SpecSampler        s4       1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 1.0383621621e-42 // 741
    def c127, 0.9999999, 1, 0, 0	// LogDepth constants
    def c0, 1, -0.5, 3, 9.99999975e-006
    def c1, 1.39999998, 0, 1, 0.09765625
    dcl_texcoord v0.xy
    dcl_texcoord1 v1.xyz
    dcl_texcoord4 v2.xyz
    dcl_texcoord5 v3.xyz
    dcl_color v4
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s1
    dcl_2d s2
    dcl_2d s4
    texld r0, v0, s2
    add r0.z, -r0.w, c0.x
    add r0.z, -r0.x, r0.z
    cmp r0.xy, r0.z, r0.wyzw, r0
    texld r1, v0, s0
    add r0.zw, r0.xyxy, c0.y
    mul r0.zw, r0, c0.z
    dp2add r0.x, r0, -r0, c0.x
    rsq r0.x, r0.x
    rcp r0.x, r0.x
    mul r2.xyz, r0.z, v2
    mad r0.xyz, v1, r0.x, r2
    mad r0.xyz, r0.w, v3, r0
    add r0.xyz, r0, c0.w
    dp3 r0.w, r0, r0
    rsq r0.w, r0.w
    texld r2, v0, s4
    mul r2.w, r2.w, c0.x
    mul r2.w, r2.w, c72.w
    dp3 r2.x, r2, c75
    mul r2.x, r2.x, c0.x
    mul r2.x, r2.x, c1.x
    mul r1.xyz, r1, c66
    mul r1, r1, v4
    dp3 r2.y, v4, c77
    mul oC2.z, r2.y, c39.z
    mov r2.yz, c1
    if_lt -c73.x, r2.y
      texld r3, v0, s1
      mul r3.y, r3.x, c73.x
      mov r4.x, c0.x
      mad r4.x, r3.x, -c73.x, r4.x
      lrp r4.yzw, r3.y, c74.xxyz, r1.xxyz
      mad r5, r1.xxyz, c1.yzzz, c1.zyyy
      cmp r3, -r3.x, r5, r4
      mov r1.xyz, r3.yzww
    else
      mov r3.x, c0.x
    endif
    mul r2.x, r2.x, r3.x
    mul r2.x, r2.x, c72.w
    mad r0.xyz, r0, r0.w, c0.x
    mul oC1.xyz, r0, -c0.y
    mul oC2.x, r2.x, -c0.y
    mul r0.x, r2.w, c1.w
    rsq r0.x, r0.x
    rcp oC2.y, r0.x
    mul r1.w, r1.w, c39.x
    mov oC0, r1
    mov oC1.w, r1.w
    mov oC2.w, r1.w
    mul oC3, r2.zyyy, c52.x
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

// approximately 55 instruction slots used (4 texture, 51 arithmetic)
