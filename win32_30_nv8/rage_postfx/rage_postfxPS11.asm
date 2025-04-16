// Summary: changes derived from PS26
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   float4 NearFarPlane;
//   sampler2D AdapLumSampler;
//   sampler2D BloomSampler;
//   sampler2D BlurSampler;
//   float4 ColorCorrect;
//   float4 ColorShift;
//   float Exposure;
//   sampler2D GBufferTextureSampler2;
//   sampler2D GBufferTextureSampler3;
//   sampler2D HDRSampler;
//   sampler2D JitterSampler;
//   float4 NoiseParams;
//   float PLAYER_MASK;
//   sampler2D StencilCopySampler;
//   float4 TexelSize;
//   float4 ToneMapParams;
//   float4 deSatContrastGamma;
//   float4 dofBlur;
//   float4 dofDist;
//   float4 dofProj;
//   float gDirectionalMotionBlurLength;
//   float4 globalScreenSize;
//   row_major float4x4 motionBlurMatrix;
//
//
// Registers:
//
//   Name                         Reg   Size
//   ---------------------------- ----- ----
//   NearFarPlane                 c128     1
//   globalScreenSize             c44      1
//   Exposure                     c66      1
//   motionBlurMatrix             c72      4
//   TexelSize                    c76      1
//   dofProj                      c77      1
//   dofDist                      c78      1
//   dofBlur                      c79      1
//   gDirectionalMotionBlurLength c80      1
//   ToneMapParams                c81      1
//   deSatContrastGamma           c82      1
//   ColorCorrect                 c83      1
//   ColorShift                   c84      1
//   NoiseParams                  c85      1
//   PLAYER_MASK                  c86      1
//   GBufferTextureSampler2       s0       1
//   GBufferTextureSampler3       s1       1
//   HDRSampler                   s2       1
//   BlurSampler                  s3       1
//   BloomSampler                 s4       1
//   AdapLumSampler               s5       1
//   JitterSampler                s6       1
//   StencilCopySampler           s7       1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 1.1406569500e-42 // 814
    def c0, 58.1640015, 47.1300011, 3.20000005, 1.79999995
    def c1, 0, 0.212500006, 0.715399981, 0.0720999986
    def c2, 0.25, 1, 0.5, 0
    def c3, 0, 2, 4, 8
    def c4, -0.5, -1.5, 1.5, 0.5
    def c5, 2, -1, 0.125, 0
    def c6, 1.10000002, 0, 0, 0
    
    def c10, 31, 0.5, 0.0009765625, 0.03125
    def c11, 0.003921568627, 0.0019607843137, 0.996078, 0.00196078
    def c12, 1.13813, 13.74594, 6.60102, 0.315889
    def c13, 0.546024, 0, 0, 0
    
    def c14, 0.94786729, 0.0521327, 2.4, 0.07739938
    def c15, -0.04045, 0.41666666, 1.055, -0.055
    def c16, 12.92, -0.0031308, 0, 0
    
    def c20, 0.59719, 0.35458, 0.04823, 0.0245786
    def c21, 0.07600, 0.90834, 0.01566, -0.000090537
    def c22, 0.02840, 0.13383, 0.83777, 0.238081
    def c23, 1.60475, -0.53108, -0.07367, 0
    def c24, -0.10208, 1.10813, -0.00605, 0
    def c25, -0.00327, -0.07276, 1.07602, 0
    def c26, 0.983729, 0.4329510, 1.8, 0
    
    def c118, 0.75487766, 0.56984029, 0, 0
    
    defi i0, 7, 0, 0, 0
    dcl_texcoord v0.xy
    dcl_2d s0
    dcl_2d s1
    dcl_2d s2
    dcl_2d s3
    dcl_2d s4
    dcl_2d s5
    dcl_2d s6
    dcl_2d s7
    // dcl_2d s10 // StippleTexture
    // depth used by DOF
    texld r0, v0, s1
    
    // LogDepth Read
    rcp r20.x, c209.x
    mul r20.x, r20.x, c209.y
    pow r20.x, r20.x, r0.x
    mul r0.y, r20.x, c209.x
    
    // samples used by DOF and stipple filter
    mov r3, c4
    mad r4, c76.xyxy, r3.xyzx, v0.xyxy
    mad r6, c76.xyxy, r3.wzyw, v0.xyxy
    texld r7.xyz, v0, s2
    texld r3.xyz, r4.xy, s2
    texld r4.xyz, r4.zw, s2
    texld r5.xyz, r6.xy, s2
    texld r6.xyz, r6.zw, s2
    
    // depth of field
    add r0.x, r0.y, -c78.w
    mad r0.x, c78.y, -r3.w, r0.x
    max r1.w, r0.x, c1.x
    rcp r0.z, c78.z
    mul r0.z, r1.w, r0.z
    lrp r1.w, r0.z, c79.z, c79.y
    min r0.z, c79.z, r1.w
    mul r1.w, r0.z, r0.z
    
    // stipple filter
    dp3 r0.x, r7, c1.yzww
    dp3 r8.x, r3, c1.yzww
    dp3 r8.y, r4, c1.yzww
    dp3 r8.z, r5, c1.yzww
    dp3 r8.w, r6, c1.yzww
    dp4 r0.z, r8, c2.x
    add r8, r8, -r0.z
    dp4 r2.w, r8, r8
    add r0.x, r0.x, -r0.z
    mad r0.x, r0.x, r0.x, -r2.w
    cmp r0.x, r0.x, c2.y, r1.w
    
    // depth of field and stipple filter average
    add r3.xyz, r3, r4
    add r3.xyz, r3, r5
    add r3.xyz, r3, r6
    mul r3.xyz, r3, c2.x
    lrp r3.xyz, r0.x, r3, r7
    
    // tonemap and color correction
    texld r1, c1.x, s5
    rcp r0.w, r1.x
    mul r0.w, r0.w, c81.y
    
    // bloom
    rcp r1.x, r0.w
    mul r1.x, r1.x, c81.x
    texld r2, v0, s4
    mad r1.xyz, r2, c66.x, -r1.x
    mul r2.xyz, r1, c81.z
    mul r2.xyz, r2, c2.x
    cmp r1.xyz, r1, r2, c1.x
    mad r0.xyz, r3, c66.x, r1
    
    // tonemap and color correction
    mul r1.xyz, r0.w, r0
    dp3 r1.x, r1, c1.yzww
    mad r0.xyz, r0, r0.w, -r1.x
    mad r0.xyz, c82.x, r0, r1.x
    mul r0.w, r1.x, c84.w
    mul r1.yzw, r0.w, c84.xxyz
    mov_sat r2.x, r0.w
    mad r0.xyz, c84, -r0.w, r0
    mad r0.xyz, r2.x, r0, r1.yzww
    mul r0.xyz, r0, c83
    add r0.xyz, r0, r0
    mov_sat r1.x, r1.x
    mov r8.y, c2.y
    add r0.w, -r8.y, c82.z
    pow r2.x, r1.x, r0.w
    mul r0.xyz, r0, r2.x
    
    if_ne -c220_abs.z, c220_abs.z
      mov r20.x, c2.y
      mad r1.xyz, r0, c14.x, c14.y
      log r1.x, r1.x
      log r1.y, r1.y
      log r1.z, r1.z
      mul r1.xyz, r1, c14.z
      exp r1.x, r1.x
      exp r1.y, r1.y
      exp r1.z, r1.z
      mul r2.xyz, r0, c14.w
      add r0.xyz, r0, c15.x
      cmp r0.xyz, r0, r1, r2
      if_eq c220.z, r20.x // jodieRoboTonemap from: https://www.shadertoy.com/view/4dBcD1
        dp3 r0.w, r0, c1.yzw
        mad r1, r0, r0, c2.y
        rsq r1.x, r1.x
        rsq r1.y, r1.y
        rsq r1.z, r1.z
        rsq r1.w, r1.w
        mul r2.xyz, r0, r1
        mul r1.xyz, r0, r1.w
        lrp_sat r0.xyz, r2, r2, r1
      else // ACES from: https://github.com/TheRealMJP/BakingLab/blob/master/BakingLab/ACES.hlsl
        mul r0.xyz, r0.xyz, c26.z
        m3x3 r1.xyz, r0, c20
        add r0.xyz, r1, c20.w
        mad r0.xyz, r0, r1, c21.w
        mad r2.xyz, r1, c26.x, c26.y
        mad r1.xyz, r1, r2, c22.w
        rcp r1.x, r1.x
        rcp r1.y, r1.y
        rcp r1.z, r1.z
        mul r1.xyz, r0, r1
        m3x3_sat r0.xyz, r1, c23
      endif
      log r1.x, r0.x
      log r1.y, r0.y
      log r1.z, r0.z
      mul r1.xyz, r1, c15.y
      exp r1.x, r1.x
      exp r1.y, r1.y
      exp r1.z, r1.z
      mad r1.xyz, r1, c15.z, c15.w
      mul r2.xyz, r0, c16.x
      add r0.xyz, r0, c16.y
      cmp r0.xyz, r0, r1, r2
    endif
    
    mov_sat r0.xyz, r0
    
    // XBOX Color Curve: https://www.desmos.com/calculator/z1ezuvkg9v
    if_ne -c222_abs.z, c222_abs.z
      log r1.x, r0.x
      log r1.y, r0.y
      log r1.z, r0.z
      mul r1.xyz, r1, c12.x
      exp r1.x, r1.x
      exp r1.y, r1.y
      exp r1.z, r1.z
      mul r2.xyz, r0, -c12.y
      exp r2.x, r2.x
      exp r2.y, r2.y
      exp r2.z, r2.z
      mad r1.xyz, r1, -r2, r1
      mad_sat r2.xyz, r0, c12.z, c12.w
      mul r3.xyz, r0, c13.x
      lrp_sat r0.xyz, r2, r1, r3
      
      // 1D Lookup table
      // mov r1.w, c1.x
      // mad r1.xyz, r0, c11.z, c11.w
      // texldl r0.x, r1.xwww, s10.x
      // texldl r0.y, r1.ywww, s10.x
      // texldl r0.z, r1.zwww, s10.x
    endif
    
    // 3D Lookup table, requires changing StippleTexture to linear clamp in gta_im
    // mad r1.xy, r0, c10.x, c10.y
    // mul r1.xy, r1, c10.zw
    // mul r1.z, r0.z, c10.x
    // frc r1.w, r1.z
    // add r1.z, r1.z, -r1.w
    // mad r1.x, r1.z, c10.w, r1.x
    // texld r2.xyz, r1.xy, s10
    // add r1.x, r1.x, c10.w
    // texld r1.xyz, r1.xy, s10
    // lrp r0.xyz, r1.w, r1, r2
    
    // dithering
    mul r1.xy, v0.xy, c44.xy
    dp2add r1.x, r1.xy, c118.xy, c118.w
    frc r1.x, r1.x
    mad r1.x, r1.x, c11.x, -c11.y
    add oC0.xyz, r0, r1.x
    mov oC0.w, c2.y

// approximately 176 instruction slots used (14 texture, 162 arithmetic)
