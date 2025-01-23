//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   float4 stencil;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   stencil      c52      1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 3.8535707769e-43 // 275
    def c127, 1, 0.99, 0, 0 // LogDepth constants
    def c0, 0, 0.00392156886, 1, 0
    dcl_texcoord9 v9
    mov oC0, c0.xxxy
    mov oC1, c0.x
    mov oC2, c0.x
    mov r0.xz, c0
    mul oC3, r0.zxxx, c52.x
    
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

// approximately 5 instruction slots used
