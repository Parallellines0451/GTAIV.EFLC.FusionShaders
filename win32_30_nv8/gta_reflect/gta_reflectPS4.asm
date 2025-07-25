// Summary: removed unnecessary stipple
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D EnvironmentSampler;
//   sampler2D StippleTexture;
//   sampler2D TextureSampler;
//   float4 globalScalars;
//   float reflectivePower;
//   float4 stencil;
//
//
// Registers:
//
//   Name               Reg   Size
//   ------------------ ----- ----
//   globalScalars      c39      1
//   stencil            c52      1
//   reflectivePower    c66      1
//   TextureSampler     s0       1
//   EnvironmentSampler s1       1
//   StippleTexture     s10      1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 7.3988558916e-43 // 528
    def c0, 0, -1, -0, 9.99999975e-006
    def c1, -0.5, 0.5, 0, 0
    def c2, 3.99600005, 4, 0.125, 0.25
    def c3, 0, 1, 0.25, 0
    dcl_texcoord v0.xy
    dcl_texcoord1 v1.xyz
    dcl_texcoord3 v2.xyz
    dcl_color v3.xw
    dcl vPos.xy
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s1
    dcl_2d s10
    texld r0, v0, s0
    add r1.xyz, c0.w, v1
    dp3 r1.w, r1, r1
    rsq r1.w, r1.w
    mul r2.xyz, r1, r1.w
    add r3.xyz, c0.w, v2
    nrm r4.xyz, r3
    dp3 r2.w, -r4, r2
    add r2.w, r2.w, r2.w
    mad r2.xyz, r2, -r2.w, -r4
    add r2.xyz, r2, c0.w
    dp3 r2.y, r2, r2
    rsq r2.y, r2.y
    mad r2.xy, r2.xzzw, r2.y, -c0.y
    mul r2.xy, r2, c1.x
    texld r2, r2, s1
    mul r0.w, r0.w, v3.w
    mad oC0.xyz, r2, c66.x, r0
    mad r0.xyz, r1, r1.w, -c0.y
    mul oC1.xyz, r0, c1.y
    mul r0.x, r0.w, c39.x
    mov oC0.w, r0.x
    mov oC1.w, r0.x
    mad oC2.xyz, v3.x, c3.xxyw, c3.xzxw
    mov oC2.w, r0.x
    mov r0.yz, c0
    mul oC3, -r0.yzzz, c52.x
    
    // LogDepth Write
    mul r19.x, v9.w, c209.x
    log r19.x, r19.x
    mul r19.x, r19.x, c209.y
    rcp r19.y, v9.w
    mul r19.y, r19.y, v9.z
    cmp oDepth, -v9_abs.y, r19.y, r19.x

// approximately 45 instruction slots used (4 texture, 41 arithmetic)
