//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   float4 NearFarPlane;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   NearFarPlane c128     1
//
    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 5.1147393948e-43 // 365
    def c127, 1, 0.99, 0, 0 // LogDepth constants
    def c0, 0, 0, 0, 0
    dcl_texcoord9 v9
    mov oC0, c0.x
    
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

// approximately 1 instruction slot used
