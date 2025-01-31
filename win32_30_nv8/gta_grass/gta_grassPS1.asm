//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   float4 NearFarPlane;
//   sampler2D TextureGrassSampler;
//   float4 globalScalars;
//
//
// Registers:
//
//   Name                Reg   Size
//   ------------------- ----- ----
//   NearFarPlane        c128     1
//   globalScalars       c39      1
//   TextureGrassSampler s0       1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 3.7694928690e-43 // 269
    def c127, 1, 0.99, 0, 0 // LogDepth constants
    dcl_color v0
    dcl_texcoord v1.w
    dcl_texcoord1 v2.w
    dcl_texcoord9 v9
    dcl_2d s0
    mov r0.x, v1.w
    mov r0.y, v2.w
    texld r0, r0, s0
    mul r0, r0, v0
    mul oC0.xyz, r0, c39.y
    mov oC0.w, r0.w
    
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

// approximately 6 instruction slots used (1 texture, 5 arithmetic)
