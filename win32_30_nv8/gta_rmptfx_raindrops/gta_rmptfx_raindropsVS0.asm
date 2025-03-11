// Summary: added volumetric fog
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   row_major float4x4 gViewInverse;
//   row_major float4x4 gWorld;
//   float gAmbientAmount;
//   float4 gAspectRatio;
//   float4 gDepthFxParams;
//   float4 gLightAmbient0;
//   float4 gLightAmbient1;
//   float gSuperAlpha;
//   float4 globalFogColor;
//   float4 globalFogColorN;
//   float4 globalFogParams;
//   float4 globalScreenSize;
//
//
// Registers:
//
//   Name             Reg   Size
//   ---------------- ----- ----
//   gWorld           c0       4
//   gViewInverse     c12      4
//   gDepthFxParams   c16      1
//   gLightAmbient0   c37      1
//   gLightAmbient1   c38      1
//   globalFogParams  c41      1
//   globalFogColor   c42      1
//   globalFogColorN  c43      1
//   globalScreenSize c44      1
//   gAspectRatio     c47      1
//   gAmbientAmount   c64      1
//   gSuperAlpha      c65      1
//

    vs_3_0
    def c230, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 3.5803175763e-42 // 2555
    def c32, -1, 0.159154937, 0.5, 0
    def c33, 6.28318548, -3.14159274, 9.99999975e-006, 0
    def c34, -0.5, 0.5, 0, 0
    def c140, 1e-6, 0.5, -0.0625, 0.9375
    def c141, 0.6, 4, 1, 30
    def c142, 1000, 0, 0, 0
    dcl_position v0
    dcl_normal v1
    dcl_color v2
    dcl_texcoord v3
    dcl_texcoord1 v4
    dcl_texcoord2 v5
    dcl_texcoord3 v6
    dcl_position o0
    dcl_color o1
    dcl_texcoord o2
    dcl_texcoord1 o3
    dcl_texcoord2 o4
    dcl_texcoord3 o5
    dcl_texcoord4 o6
    mad r0.x, v1.z, c32.y, c32.z
    frc r0.x, r0.x
    mad r0.x, r0.x, c33.x, c33.y
    sincos r1.xy, r0.x
    mul r0.xyz, r1.yyxw, v1.yxyw
    mad r1.x, v1.x, r1.x, -r0.x
    add r1.y, r0.z, r0.y
    rcp r0.x, c44.y
    mul r0.y, r0.x, c44.x
    mov r1.z, c32.w
    mov r0.xz, -c32.x
    mad r2.xyz, r1, r0, -v0
    mul r0.xyz, r1, r0
    add r0.w, c32.x, v1.w
    sge r0.w, -r0_abs.w, r0_abs.w
    mad r1.xyz, r0.w, r2, v0
    rcp r2.x, c47.x
    rcp r2.y, c47.y
    mov r2.z, -c32.x
    mad r1.xyz, r1, r2, c33.z
    dp3 r1.x, r1, r1
    rsq r1.x, r1.x
    mul r1.x, r1.y, r1.x
    mad_sat r1.x, r1.x, c34.x, c34.y
    mov r2.xyz, c38
    mad r1.xyz, r2, r1.x, c37
    mul r1.xyz, r1, c64.x
    mul r1.xyz, r1, v2
    max r1.xyz, r1, c32.w
    add o1.xyz, r1, v2
    mul_sat o1.w, c65.x, v2.w
    add r1.x, -c16.z, c16.w
    rcp r1.x, r1.x
    mov r2.x, c32.x
    add r1.yzw, r2.x, c16.xwxy
    mul_sat r1.x, r1.x, r1.y
    add r1.x, -r1.x, -c32.x
    mad o3.zw, r1.x, r1, -c32.x
    mov r20.w, c142.x
    add r20.w, c41.x, -r20.w
    mul r20.w, r20.w, c236.y
    if_ge r20.w, r20_abs.w
      add r1.x, -c41.x, c41.y
      rcp r1.x, r1.x
      add r1.y, -r2.x, -c41.x
      mul_sat r1.x, r1.x, r1.y
      rcp_sat r1.y, c41.x
      lrp r2.x, c41.w, r1.y, r1.x
      add o5.w, r2.x, c41.z
      mov r2.xyz, c43
      add r1.yzw, -r2.xxyz, c42.xxyz
      mad o5.xyz, r1.x, r1.yzww, c43
    else
      mul r20.xyz, v0.y, c1
      mad r20.xyz, v0.x, c0, r20
      mad r20.xyz, v0.z, c2, r20
      add r20.xyz, r20, c3
    
      add r20.xyz, -c15, r20
      dp3 r20.w, r20, r20
      rsq r20.w, r20.w
      mul r20.xyz, r20, r20.w
      rcp r20.w, r20.w
      
      mov r21.xyz, c228
      mad r21.w, r20.x, c140.y, c140.y
      lrp r22.xyz, r21.w, r21, c229
      mul_sat r21.x, r20.z, c228.w
      mad r21.x, r21.x, -c229.w, c229.w
      mad r21.xyz, r22, r21.x, c234
      
      dp3 r21.w, r20, c232
      
      mad_sat r22.xy, r21.w, c140.zy, c140.wy
      mul r22.z, r22.x, r22.x
      mul r22.x, r22.x, r22.z
      mov r22.z, c141.x
      add_sat r22.z, r22.z, c232_abs.z
      mad r22.x, r22.x, -r22.z, r22.y
      mul_sat r22.x, r22.x, c140.y
      mul r22.x, r22.x, c141.y
      add_sat r22.y, c141.z, -r22.x
      
      mul r23.xyz, r22.x, c231
      mul r23.xyz, r23, r23
      mul r23.xyz, r23, r23
      mad r23.xyz, r22.x, c231, r23
      mul r23.xyz, r23, c231.w
      
      mul r21.xyz, r21, r22.y
      mul_sat r21.xyz, r21, c231.w
      
      add r21.xyz, r21, r23
      mul r21.xyz, r21, c234.w
      min r21.xyz, r21, c141.w
      
      mov r22.xyz, c43
      lrp r22.xyz, c41.w, r22, r21
      
      mov r20.x, c15.z
      mul r20.xy, r20.xz, c235.y
      mul r20.x, r20.x, c236.x
      exp r20.x, -r20.x
      
      sge r21.x, r20_abs.y, c140.x
      lrp r20.y, r21.x, r20.y, c140.x
      rcp r20.z, r20.y
      mul r20.y, r20.y, r20.w
      exp r20.y, -r20.y
      add r20.y, -r20.y, c141.z
      mul r20.y, r20.y, r20.z
      
      mul r20.x, r20.x, r20.y
      mul r20.xy, r20.xw, c235.x
      
      exp r20.x, -r20.x
      exp r20.y, -r20.y
      add r20.xy, -r20.xy, c141.z
      
      log r20.x, r20.x
      log r20.y, r20.y
      mul r20.xy, r20.xy, c235.zw
      exp r20.x, r20.x
      exp r20.y, r20.y
      
      lrp r22.xyz, r20.y, r22, c43
      mov o5.xyz, r22
      mov o5.w, r20.x
    endif
    mul o4.z, r0.w, v1.z
    mul r0.xyz, r0, r0.w
    mad r0.xyz, v0.xyxw, c32_abs.xxww, r0
    mov o0.xyz, r0
    mov o4.xy, r0
    mov o0.w, -c32.x
    mov o2, v3
    mov o3.xy, v4
    mov o4.w, v5.y
    mov o6, v6

// approximately 65 instruction slots used
