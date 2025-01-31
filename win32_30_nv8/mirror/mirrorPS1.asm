// Summary: fixed distorted mirror reflections thanks to nukie
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   float4 NearFarPlane;
//   sampler2D ReflectTextureSampler;
//   float gInvColorExpBias;
//   float4 globalScalars;
//
//
// Registers:
//
//   Name                  Reg   Size
//   --------------------- ----- ----
//   NearFarPlane          c128     1
//   globalScalars         c39      1
//   gInvColorExpBias      c46      1
//   ReflectTextureSampler s0       1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 1.0691907283e-42 // 763
    def c127, 1, 0.99, 0, 0 // LogDepth constants
    def c0, -1.75, -0.5, -0.285714298, 0.5
    dcl_texcoord v0.xyw
    dcl_texcoord9 v9
    dcl_2d s0
    rcp r0.x, v0_abs.w
    mul r0.x, r0.x, c0.y
    mad r0.xy, v0, r0.x, c0.w
    texld r0, r0, s0
    mul oC0.xyz, r0, c39.y
    mov oC0.w, c46.x
    
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

// approximately 8 instruction slots used (1 texture, 7 arithmetic)
