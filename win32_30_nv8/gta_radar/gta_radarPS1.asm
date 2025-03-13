//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   float4 NearFarPlane;
//   sampler2D TextureSampler;
//   float4 diffuseCol;
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   NearFarPlane   c128     1
//   diffuseCol     c66      1
//   TextureSampler s0       1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 7.1886611220e-43 // 513
    def c127, 1, 0.99, 0, 0 // LogDepth constants
    dcl_color v0
    dcl_texcoord v1.xy
    dcl_texcoord9 v9
    dcl_2d s0
    texld r0, v1, s0
    mul r0, r0, v0
    mul oC0, r0, c66
    
    // LogDepth Write
    if_ne v9.y, c127.x
      rcp r20.x, c209.x
      mul r20.y, r20.x, v9.w
      mul r20.x, r20.x, c209.y
      log r20.x, r20.x
      log r20.y, r20.y
      rcp r20.x, r20.x
      mul r20.x, r20.x, r20.y
    else
      rcp r20.x, v9.w
      mul r20.x, r20.x, v9.z
    endif
    mov oDepth, r20.x

// approximately 3 instruction slots used (1 texture, 2 arithmetic)
