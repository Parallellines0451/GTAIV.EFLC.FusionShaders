// Summary: fixed stencil + simplified transparency code + fixed pop-in/added stippled transparency + stipple mask
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   float4 NearFarPlane;
//   sampler2D TextureSampler_layer0;
//   sampler2D TextureSampler_layer1;
//   float4 globalScalars;
//   float4 stencil;
//
//
// Registers:
//
//   Name                  Reg   Size
//   --------------------- ----- ----
//   NearFarPlane          c128     1
//   globalScalars         c39      1
//   stencil               c52      1
//   TextureSampler_layer0 s0       1
//   TextureSampler_layer1 s1       1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 8.4218037706e-43 // 601
    def c152, 0.2, 0.4, 0.6, 0.8 // c152-c154 = new stipple constants
    def c153, 0.5, 2, 1, 0
    def c154, 1.6, 0, 0, 0
    def c127, 1, 0.99, 0, 0 // LogDepth constants
    def c0, 0.5, 0, 1, 0.25
    def c1, 0.0156862745098, 0, 0, 0
    dcl_texcoord v0.xy
    dcl_texcoord3 v1.xy
    dcl_color v2
    dcl_color1 v3.y
    dcl_texcoord2 v4.xyz
    dcl_texcoord9 v9
    dcl vPos.xy
    dcl_2d s0
    dcl_2d s1
    mul r20.xy, vPos.xy, c153.x
    frc r20.xy, r20.xy
    mad r20, r20.xxyy, -c153.y, c153.zwzw
    mul r20, r20.xxyy, r20.zwzw
    dp4 r20.x, r20_abs, c152.xzwy
    add r20.y, -r20.x, c39.x
    texkill r20.y
    texld r0, v0, s0
    texld r1, v1, s1
    mul r0.w, r1.w, v3.y
    lrp r2.xyz, r0.w, r1, r0
    mul oC0.xyz, r2, v2
    mov oC0.w, c39.x
    mad oC1.xyz, v4, c0.x, c0.x
    mov oC1.w, c39.x
    mad oC2.xyz, v2.w, c0.yyzw, c0.ywyw
    // mov oC2.w, c39.x
    mov r20.x, -c152.w
    add r20.x, r20.x, c39.x
    cmp oC2.w, r20.x, c0.y, c0.z
    mov r0.yz, c0
    // mul oC3, r0.zyyy, c52.x
    mov oC3, c1.xwww
    
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

// approximately 12 instruction slots used (2 texture, 10 arithmetic)
