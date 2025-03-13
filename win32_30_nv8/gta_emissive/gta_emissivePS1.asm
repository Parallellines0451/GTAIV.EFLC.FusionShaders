// Summary: removed unnecessary stipple
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   float4 NearFarPlane;
//   sampler2D StippleTexture;
//   sampler2D TextureSampler;
//   float4 colorize;
//   float emissiveMultiplier;
//   float4 globalScalars;
//
//
// Registers:
//
//   Name               Reg   Size
//   ------------------ ----- ----
//   NearFarPlane       c128     1
//   globalScalars      c39      1
//   colorize           c51      1
//   emissiveMultiplier c66      1
//   TextureSampler     s0       1
//   StippleTexture     s10      1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 2.5083242511e-43 // 179
    def c127, 1, 0.99, 0, 0 // LogDepth constants
    def c0, 0, -1, -0, 1
    def c1, 3.99600005, 4, 0.125, 0.25
    dcl_texcoord v0.xy
    dcl_color v1
    dcl vPos.xy
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s10
    texld r0, v0, s0
    mul r0, r0, v1
    mul r1.xyz, r0, c66.x
    mov r2.w, c0.w
    add r0.x, r2.w, -c39.x
    mad r0.x, r0.x, r0.w, c0.y
    rcp r0.x, r0.x
    mul r0.y, r0.x, -c39.x
    mad r0.x, -c39.x, -r0.x, c39.x
    mad r0.x, c39.y, r0.x, r0.y
    mul r1.w, r0.w, r0.x
    mul oC0, r1, c51
    
    // LogDepth Write (emissive)
    if_ne v9.y, c127.x
      mov r20.x, c127.y
      mad r20.x, r20.x, c209.y, -v9.w
      texkill r20.x
      rcp r20.x, c209.x
      mul r20.y, r20.x, v9.w
      mul r20.x, r20.x, c209.y
      log r20.x, r20.x
      log r20.y, r20.y
      rcp r20.x, r20.x
      mad r20.x, r20.x, r20.y, -v9.x
    else
      rcp r20.x, v9.w
      mul r20.x, r20.x, v9.z
    endif
    mov oDepth, r20.x

// approximately 28 instruction slots used (3 texture, 25 arithmetic)
