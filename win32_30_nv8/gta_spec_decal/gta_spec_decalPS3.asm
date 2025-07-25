// Summary: simplified transparency code
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D SpecSampler;
//   sampler2D StippleTexture;
//   sampler2D TextureSampler;
//   float4 globalScalars;
//   float3 specMapIntMask;
//   float specularColorFactor;
//   float specularFactor;
//   float4 stencil;
//
//
// Registers:
//
//   Name                Reg   Size
//   ------------------- ----- ----
//   globalScalars       c39      1
//   stencil             c52      1
//   specularFactor      c66      1
//   specularColorFactor c72      1
//   specMapIntMask      c73      1
//   TextureSampler      s0       1
//   SpecSampler         s1       1
//   StippleTexture      s10      1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 7.8052324463e-43 // 557
    def c152, 0.2, 0.4, 0.6, 0.8 // c152-c154 = new stipple constants
    def c153, 0.5, 2, 1, 0
    def c154, 1.6, 0, 0, 0
    def c0, 0, -1, -0, 9.99999975e-006
    def c1, 3.99600005, 4, 0.125, 0.25
    def c2, 0.5, 0.001953125, 0, 0
    dcl_texcoord v0.xy
    dcl_texcoord1 v1.xyz
    dcl_color v2.xw
    dcl vPos.xy
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s1
    dcl_2d s10
    mul r20.xy, vPos.xy, c153.x
    frc r20.xy, r20.xy
    mad r20, r20.xxyy, -c153.y, c153.zwzw
    mul r20, r20.xxyy, r20.zwzw
    dp4 r20.x, r20_abs, c152.xzwy
    add r20, -r20.x, c39.x
    texkill r20
    texld r0, v0, s0
    add r1.xyz, c0.w, v1
    dp3 r1.w, r1, r1
    rsq r1.w, r1.w
    texld r2, v0, s1
    mul r2.w, r2.w, c66.x
    dp3 r2.x, r2, c73
    mul r2.x, r2.x, c72.x
    mul r0.w, r0.w, v2.w
    mad r1.xyz, r1, r1.w, -c0.y
    mul oC1.xyz, r1, c2.x
    mul oC2.x, r2.x, c2.x
    mul r1.x, r2.w, c2.y
    rsq r1.x, r1.x
    rcp oC2.y, r1.x
    mul r0.w, r0.w, c39.x
    mov oC0, r0
    mov oC1.w, r0.w
    mov oC2.z, v2.x
    mov oC2.w, r0.w
    mov r0.yz, c0
    mul oC3, -r0.yzzz, c52.x
    
    // LogDepth Write
    mul r19.x, v9.w, c209.x
    log r19.x, r19.x
    mul r19.x, r19.x, c209.y
    rcp r19.y, v9.w
    mul r19.y, r19.y, v9.z
    cmp oDepth, -v9_abs.y, r19.y, r19.x

// approximately 38 instruction slots used (4 texture, 34 arithmetic)
