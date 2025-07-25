// Summary: added volumetric fog
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D GBufferTextureSampler3;
//   row_major float4x4 gViewInverse;
//   row_major float4x4 gWorld;
//   row_major float4x4 gWorldView;
//   row_major float4x4 gWorldViewProj;
//   float4 globalScreenSize;
//   float2 poisson12[12];
//
//
// Registers:
//
//   Name                   Reg   Size
//   ---------------------- ----- ----
//   gWorld                 c0       3
//   gWorldView             c4       3
//   gWorldViewProj         c8       4
//   gViewInverse           c12      4
//   globalScreenSize       c44      1
//   poisson12              c208    12
//   GBufferTextureSampler3 s0       1
//

    vs_3_0
    def c230, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 2.8222151072e-42 // 2014
    def c16, 0.707106769, 1, 0.5, 0.100000001
    def c17, 1, 0, 2, -0.996999979
    def c18, 0.5, -0.5, 0.0833333358, 0.00999999978
    def c140, 1e-6, 0.5, -0.0625, 0.9375
    def c141, 0.6, 4, 1, 30
    dcl_position v0
    dcl_color v1
    dcl_texcoord v2
    dcl_normal v3
    dcl_2d s0
    dcl_position o0
    dcl_texcoord9 o10 // LogDepth Interpolator
    dcl_texcoord o1.xy
    dcl_texcoord1 o2.xyz
    mov r0.xyz, v3
    add r0.xyz, -r0, v0
    dp3 r0.w, r0, r0
    rsq r0.w, r0.w
    rcp r0.w, r0.w
    mul r0.w, r0.w, c16.x
    add r1.xyz, -c15, v3
    dp3 r1.w, r1, r1
    rsq r1.w, r1.w
    rcp r1.w, r1.w
    if_lt r1.w, r0.w
      mov r2.x, c4.z
      mov r2.y, c5.z
      mov r2.z, c6.z
      dp3 r1.x, r2, r1
      slt r1.y, -r1.x, r0.w
      rcp r0.w, r0.w
      mad r0.w, -r1.x, r0.w, c16.y
      mul_sat r3.w, r0.w, c16.z
      slt r0.w, -r1.x, c16.w
      add r1.x, r1.x, c16.w
      mul r1.xzw, r2.xyyz, r1.x
      mad r3.xyz, r0.w, -r1.xzww, v0
      mad r2, v0.xyzx, c17.xxxy, c17.yyyx
      lrp r4, r1.y, r3, r2
    else
      mul r1, c9, v3.y
      mad r1, v3.x, c8, r1
      mad r1, v3.z, c10, r1
      add r1, r1, c11
      
      // LogDepth Read - Corona
      mul r19.x, r1.w, c227.x
      log r19.x, r19.x
      mul r1.z, r19.x, c227.y
      
      rcp r0.w, r1.w
      mul r1.xy, r1, r0.w
      mov r2.zw, c44
      mul r2.xy, r2.zwzw, c208
      mad r2.xy, r2, c17.z, r1
      max r2.xy, r2, c17.w
      min r2.xy, r2, -c17.w
      mad r3.xy, r2, c18, c18.x
      mov r3.zw, c17.y
      texldl r3, r3, s0
      slt r0.w, r1.z, r3.x
      mul r2.xy, r2.zwzw, c209
      mad r2.xy, r2, c17.z, r1
      max r2.xy, r2, c17.w
      min r2.xy, r2, -c17.w
      mad r3.xy, r2, c18, c18.x
      mov r3.zw, c17.y
      texldl r3, r3, s0
      slt r1.w, r1.z, r3.x
      mul r1.w, r1.w, c18.z
      mad r0.w, r0.w, c18.z, r1.w
      mul r2.xy, r2.zwzw, c210
      mad r2.xy, r2, c17.z, r1
      max r2.xy, r2, c17.w
      min r2.xy, r2, -c17.w
      mad r3.xy, r2, c18, c18.x
      mov r3.zw, c17.y
      texldl r3, r3, s0
      slt r1.w, r1.z, r3.x
      mad r0.w, r1.w, c18.z, r0.w
      mul r2.xy, r2.zwzw, c211
      mad r2.xy, r2, c17.z, r1
      max r2.xy, r2, c17.w
      min r2.xy, r2, -c17.w
      mad r3.xy, r2, c18, c18.x
      mov r3.zw, c17.y
      texldl r3, r3, s0
      slt r1.w, r1.z, r3.x
      mad r0.w, r1.w, c18.z, r0.w
      mul r2.xy, r2.zwzw, c212
      mad r2.xy, r2, c17.z, r1
      max r2.xy, r2, c17.w
      min r2.xy, r2, -c17.w
      mad r3.xy, r2, c18, c18.x
      mov r3.zw, c17.y
      texldl r3, r3, s0
      slt r1.w, r1.z, r3.x
      mad r0.w, r1.w, c18.z, r0.w
      mul r2.xy, r2.zwzw, c213
      mad r2.xy, r2, c17.z, r1
      max r2.xy, r2, c17.w
      min r2.xy, r2, -c17.w
      mad r3.xy, r2, c18, c18.x
      mov r3.zw, c17.y
      texldl r3, r3, s0
      slt r1.w, r1.z, r3.x
      mad r0.w, r1.w, c18.z, r0.w
      mul r2.xy, r2.zwzw, c214
      mad r2.xy, r2, c17.z, r1
      max r2.xy, r2, c17.w
      min r2.xy, r2, -c17.w
      mad r3.xy, r2, c18, c18.x
      mov r3.zw, c17.y
      texldl r3, r3, s0
      slt r1.w, r1.z, r3.x
      mad r0.w, r1.w, c18.z, r0.w
      mul r2.xy, r2.zwzw, c215
      mad r2.xy, r2, c17.z, r1
      max r2.xy, r2, c17.w
      min r2.xy, r2, -c17.w
      mad r3.xy, r2, c18, c18.x
      mov r3.zw, c17.y
      texldl r3, r3, s0
      slt r1.w, r1.z, r3.x
      mad r0.w, r1.w, c18.z, r0.w
      mul r2.xy, r2.zwzw, c216
      mad r2.xy, r2, c17.z, r1
      max r2.xy, r2, c17.w
      min r2.xy, r2, -c17.w
      mad r3.xy, r2, c18, c18.x
      mov r3.zw, c17.y
      texldl r3, r3, s0
      slt r1.w, r1.z, r3.x
      mad r0.w, r1.w, c18.z, r0.w
      mul r2.xy, r2.zwzw, c217
      mad r2.xy, r2, c17.z, r1
      max r2.xy, r2, c17.w
      min r2.xy, r2, -c17.w
      mad r3.xy, r2, c18, c18.x
      mov r3.zw, c17.y
      texldl r3, r3, s0
      slt r1.w, r1.z, r3.x
      mad r0.w, r1.w, c18.z, r0.w
      mul r2.xy, r2.zwzw, c218
      mad r2.xy, r2, c17.z, r1
      max r2.xy, r2, c17.w
      min r2.xy, r2, -c17.w
      mad r3.xy, r2, c18, c18.x
      mov r3.zw, c17.y
      texldl r3, r3, s0
      slt r1.w, r1.z, r3.x
      mad r0.w, r1.w, c18.z, r0.w
      mul r2.xy, r2.zwzw, c219
      mad r1.xy, r2, c17.z, r1
      max r1.xy, r1, c17.w
      min r1.xy, r1, -c17.w
      mad r2.xy, r1, c18, c18.x
      mov r2.zw, c17.y
      texldl r2, r2, s0
      slt r1.x, r1.z, r2.x
      mad r4.w, r1.x, c18.z, r0.w
      slt r0.w, c18.w, r4.w
      mad r4.xyz, r0.w, r0, v3
    endif
    mul r0, r4.y, c9
    mad r0, r4.x, c8, r0
    mad r0, r4.z, c10, r0
    add o0, r0, c11
    add o10.zw, r0, c11
    mul r0.xyz, r4.w, v1
    if_ne -c236_abs.y, c236_abs.y
      mul r1.xyz, r4.y, c1
      mad r1.xyz, r4.x, c0, r1
      mad r1.xyz, r4.z, c2, r1
      add r1.xyz, r1, c3
    
      add r20.xyz, -c15, r1
      dp3 r20.w, r20, r20
      rsq r20.w, r20.w
      mul r20.xyz, r20, r20.w
      rcp r20.w, r20.w
      
      mov r20.x, c15.z
      mul r20.xy, r20.xz, c235.y
      mul r20.x, r20.x, c235.w
      exp r20.x, -r20.x
      
      sge r21.x, r20_abs.y, c140.x
      lrp r20.y, r21.x, r20.y, c140.x
      rcp r20.z, r20.y
      mul r20.y, r20.y, r20.w
      exp r20.y, -r20.y
      add r20.y, -r20.y, c141.z
      mul r20.y, r20.y, r20.z
      
      mul r20.x, r20.x, r20.y
      mul r20.x, r20.x, c235.x
      
      exp r20.x, -r20.x
      add r20.x, -r20.x, c141.z
      pow r20.x, r20.x, c235.z
      add r20.x, -r20.x, c141.z
      mul r0.xyz, r0, r20.x
    endif
    mul o2.xyz, r0, v2.y
    mov o1.x, v2.x
    mov o1.y, v1.w
    dp3 o10.xy, c10.xyw, c10.xyw

// approximately 166 instruction slots used (24 texture, 142 arithmetic)
