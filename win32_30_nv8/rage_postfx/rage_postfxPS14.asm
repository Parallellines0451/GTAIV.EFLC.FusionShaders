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
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 1.1448608454e-42 // 817
    def c0, 58.1640015, 47.1300011, 3.20000005, 1.79999995
    def c1, 0, 0.212500006, 0.715399981, 0.0720999986
    def c2, 0.25, 1, 0.5, 0
    def c3, 0, 2, 4, 8
    def c4, -0.5, -1.5, 1.5, 0.5
    def c5, 2, -1, 0.125, 0
    def c6, 1.10000002, 0, 0, 0
    
    def c11, 1.15, 0.003921568627, 0.0019607843137, 0
    
    def c22, 1.60475004, -0.531080008, -0.0736699998, 1
    def c23, 0.0759999976, 0.908339977, 0.0156599991, 0.0245785993
    def c24, 0.0284000002, 0.133829996, 0.837769985, -9.05370034e-005
    def c25, 0.983729005, 0.432951003, 0.238080993, 0.454545468
    def c26, 2.20000005, 0.597190022, 0.354579985, 0.0482299998
    def c27, -0.102080002, 1.10812998, -0.00604999997, 0
    def c28, -0.00326999999, -0.0727600008, 1.07602, 0
    
    def c118, 0.06711056, 0.00583715, 52.9829189, 0
    
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
    texld r3, v0, s2
    
    // motion blur
    if_ne -c222_abs.w, c222_abs.w
      texld r0, v0, s1
      
      // LogDepth Read
      rcp r20.x, c128.x
      mul r20.x, r20.x, c128.y
      pow r20.x, r20.x, r0.x
      mul r0.y, r20.x, c128.x
      
      mad r4.xyz, v0.yxyw, c5.x, c5.y
      mul r0.z, r4.y, c77.z
      mul r0.z, r0.y, r0.z
      mul r1.w, -r4.x, c77.w
      mul r1.w, r0.y, r1.w
      mul r5.xyz, r1.w, c73
      mad r5.xyz, r0.z, c72, r5
      mad r5.xyz, -r0.y, c74, r5
      add r5.xyz, r5, c75
      mul r0.y, -r5.z, c77.z
      rcp r0.y, r0.y
      mul r6.x, r5.x, r0.y
      mul r0.y, r5.z, c77.w
      rcp r0.y, r0.y
      mul r6.y, r5.y, r0.y
      add r0.yz, -r4, r6.xxyw
      mov r20.x, c221.z
      mul_sat r20.x, r20.x, c80.x
      mul r0.yz, r0, r20.x // fix motion blur at high fps
      mul r4.xy, r0.yzzw, c5.z
      texld r5, v0, s7
      add r1.w, r5.x, -c86.x
      mul r4.zw, c0.xyxy, v0.xyxy
      mad r8.xy, r3.xyxy, c3.w, r4.zw
      mov r8.zw, c1.x
      texldl r5, r8, s6
      add r2.w, r5.x, c4.x
      mad r4.zw, r4.xyxy, r2.w, v0.xyxy
      mov r5.xyz, r3
      mov r2.w, c2.y
      mov r3.w, c2.y
      rep i0
        mad r8.xy, r4, r3.w, r4.zwzw
        texldl r7, r8, s7
        add r5.w, r7.x, -c86.x
        cmp r5.w, r5.w, c2.w, c2.y
        texldl r6, r8, s2
        mad r5.xyz, r6, r5.w, r5
        add r2.w, r2.w, r5.w
        add r3.w, r3.w, c2.y
      endrep
      rcp r2.w, r2.w
      mul r0.yz, r0, c44.xxyw
      dp2add r0.y, r0.yzzw, r0.yzzw, c1.x
      rsq r0.y, r0.y
      rcp r0.y, r0.y
      mul_sat r0.x, r0.y, c4.w
      mad r4.xyz, r5, r2.w, -r3
      mad r0.xyz, r0.x, r4, r3
      cmp r3.xyz, r1.w, r3, r0
    endif
    
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
      mov r1.x, c2.y
      if_eq c220.z, r1.x // modified Reinhard
        mul r1.xyz, r0, r0
        mul r1.xyz, r1, r1
        mad r1.xyz, r1, r1, c2.y
        log r1.x, r1.x
        log r1.y, r1.y
        log r1.z, r1.z
        mul r1.xyz, r1, -c5.z
        exp r1.x, r1.x
        exp r1.y, r1.y
        exp r1.z, r1.z
        mul r0.xyz, r0, r1
      else // https://github.com/TheRealMJP/BakingLab/blob/master/BakingLab/ACES.hlsl
        log r0.x, r0.x
        log r0.y, r0.y
        log r0.z, r0.z
        mul r0.xyz, r0, c26.x
        exp r1.x, r0.x
        exp r1.y, r0.y
        exp r1.z, r0.z
        add r0.xyz, r1, r1
        dp3 r1.x, c26.yzww, r0
        dp3 r1.y, c23, r0
        dp3 r1.z, c24, r0
        add r0.xyz, r1, c23.w
        mad r0.xyz, r1, r0, c24.w
        mad r2.xyz, r1, c25.x, c25.y
        mad r1.xyz, r1, r2, c25.z
        rcp r2.x, r1.x
        rcp r2.y, r1.y
        rcp r2.z, r1.z
        mul r0.xyz, r0, r2
        dp3_sat r0.w, c22, r0
        log r1.x, r0.w
        dp3_sat r0.w, c27, r0
        dp3_sat r0.x, c28, r0
        log r1.z, r0.x
        log r1.y, r0.w
        mul r0.xyz, r1, c25.w
        exp r0.x, r0.x
        exp r0.y, r0.y
        exp r0.z, r0.z
      endif
    endif
    
    // XBOX-like gamma, just an approximation
    if_ne -c222_abs.z, c222_abs.z
      mov_sat r0.xyz, r0.xyz
      log r1.x, r0.x
      log r1.y, r0.y
      log r1.z, r0.z
      mul r1.xyz, r1, c11.x
      exp r1.x, r1.x
      exp r1.y, r1.y
      exp r1.z, r1.z
      add r2.xyz, c2.y, -r0
      mul r2.xyz, r2, r2
      mul r2.xyz, r2, r2
      mad r2.xyz, r2, -r2, c2.y
      mul r0.xyz, r1, r2
    endif
    
    // dithering
    mul r1.xy, v0.xy, c44.xy
    dp2add r1.x, r1.xy, c118.xy, c118.w
    frc r1.x, r1.x
    mul r1.x, r1.x, c118.z
    frc r1.x, r1.x
    mad r1.x, r1.x, c11.y, -c11.z
    add_sat oC0.xyz, r0, r1.x
    mov oC0.w, c2.y

// approximately 176 instruction slots used (14 texture, 162 arithmetic)
