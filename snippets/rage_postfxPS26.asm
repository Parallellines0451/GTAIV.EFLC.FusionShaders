// Replaced unneeded code and reorganized some sections to help with modularity. Leftover anti aliasing code and the definition toggle were removed.
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
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 1.1616764269e-42 // 829
    def c0, 58.1640015, 47.1300011, 3.20000005, 1.79999995
    def c1, 0, 0.212500006, 0.715399981, 0.0720999986
    def c2, 0.25, 1, 0.5, 0
    def c3, 0, 2, 4, 8
    def c4, -0.5, -1.5, 1.5, 0.5
    def c5, 2, -1, 0.125, 0
    def c6, 1.10000002, 0, 0, 0
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
    // depth used by DOF and motion blur
    texld r0, v0, s1
    
    // LogDepth Read
    rcp r20.x, c128.x
    mul r20.x, r20.x, c128.y
    pow r20.x, r20.x, r0.x
    mul r0.y, r20.x, c128.x
    
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
    add r1.w, -r0.y, c78.w // cutscene
    mad r1.w, c78.y, -r3.w, r1.w // cutscene
    max r2.w, r1.w, c1.x // cutscene
    add r0.x, r0.y, -c78.w
    mad r0.x, c78.y, -r3.w, r0.x
    max r1.w, r0.x, c1.x
    rcp r0.x, c78.x // cutscene
    mul r0.x, r2.w, r0.x // cutscene
    lrp r2.w, r0.x, c79.x, c79.y // cutscene
    min r0.x, c79.x, r2.w // cutscene
    rcp r0.z, c78.z
    mul r0.z, r1.w, r0.z
    lrp r1.w, r0.z, c79.z, c79.y
    min r0.z, c79.z, r1.w
    max r0.z, r0.x, r0.z // cutscene
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
    cmp r0.x, r0.x, c2.y, r1.w // replace with "cmp r0.xw, r0.x, c2.yzzz, c2.wyyy" if DOF is removed
    
    // depth of field and stipple filter average
    add r3.xyz, r3, r4
    add r3.xyz, r3, r5
    add r3.xyz, r3, r6
    mul r3.xyz, r3, c2.x
    lrp r3.xyz, r0.x, r3, r7 // replace "r0.x" with "r1.w" if the stipple filter is removed
    
    // motion blur, add "texld r3, v0, s2" if DOF and stipple filter are removed
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
    mul r0.yz, r0, c80.x
    mul r4.xy, r0.yzzw, c5.z
    texld r5, v0, s7
    add r1.w, r5.x, -c86.x
    mul r4.zw, c0.xyxy, v0.xyxy
    mad r4.zw, r3.xyxy, c3.w, r4
    texld r5, r4.zwzw, s6
    add r2.w, r5.x, c4.x
    mad r4.zw, r4.xyxy, r2.w, v0.xyxy
    mov r5.xyz, r3
    mov r2.w, c2.y
    mov r3.w, c2.y
    rep i0
      mad r6.xy, r4, r3.w, r4.zwzw
      texld r7, r6, s7
      add r5.w, r7.x, -c86.x
      cmp r5.w, r5.w, c2.w, c2.y
      texld r6, r6, s2
      mad r5.xyz, r6, r5.w, r5
      add r2.w, r2.w, r5.w
      add r3.w, r3.w, c2.y
    endrep
    rcp r2.w, r2.w
    mul r0.yz, r0, c44.xxyw
    dp2add r0.y, r0.yzzw, r0.yzzw, c1.x
    rsq r0.y, r0.y
    rcp r0.y, r0.y
    mul r0.y, r0.y, c4.w // replace the following four instructions with "mul_sat r0.x, r0.y, c4.w" if DOF and stipple filter are removed
    add r0.x, r0.x, c2.y // or the following three with "mul_sat r0.x, r0.y, r0.w" if just DOF is removed
    rcp r0.x, r0.x
    mul_sat r0.x, r0.y, r0.x
    mad r4.xyz, r5, r2.w, -r3
    mad r0.xyz, r0.x, r4, r3
    cmp r3.xyz, r1.w, r3, r0
    
    // TLAD noise
    mov r1.zw, c0
    mad r1.xy, v0, r1.zwzw, c85
    frc r1.xy, r1
    texld r1, r1, s3
    add r0.w, r1.z, c4.x
    mul r0.w, r0.w, c85.z
    mad r3.xyz, r0.w, c6.x, r3
    
    // tonemap and color correction
    texld r1, c1.x, s5
    rcp r0.w, r1.x
    mul r0.w, r0.w, c81.y
    
    // bloom, to remove replace with "mul r0.xyz, r3, c66.x"
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
    mul oC0.xyz, r0, r2.x
    mov oC0.w, c2.y

// approximately 176 instruction slots used (14 texture, 162 arithmetic)
