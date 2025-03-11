// Summary: added volumetric fog
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   row_major float4x4 gWorld;
//   float4 gDepthFxParams;
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
//   gDepthFxParams   c16      1
//   globalFogParams  c41      1
//   globalFogColor   c42      1
//   globalFogColorN  c43      1
//   globalScreenSize c44      1
//   gSuperAlpha      c64      1
//

    vs_3_0
    def c230, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 3.5621006963e-42 // 2542
    def c32, -1, 0.159154937, 0.5, 1
    def c33, 6.28318548, -3.14159274, 0, 1
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
    mov r0.x, c32.w
    mul r0.xy, r1, r0
    add r0.z, c32.x, v1.w
    sge r0.z, -r0_abs.z, r0_abs.z
    mul r0.xy, r0, r0.z
    mov r0.z, c33.z
    mad o0.xyz, v0.xyxw, c33.wwzw, r0
    mul_sat o1.w, c64.x, v2.w
    add r0.x, -c16.z, c16.w
    rcp r0.x, r0.x
    mov r1.xw, c32
    add r0.yzw, r1.x, c16.xwxy
    mul_sat r0.x, r0.x, r0.y
    add r0.x, -r0.x, c32.w
    mad o3.zw, r0.x, r0, c32.w
    mov r20.w, c142.x
    add r20.w, c41.x, -r20.w
    mul r20.w, r20.w, c236.y
    if_ge r20.w, r20_abs.w
      add r0.x, -c41.x, c41.y
      rcp r0.x, r0.x
      add r0.y, r1.w, -c41.x
      mul_sat r0.x, r0.x, r0.y
      rcp_sat r0.y, c41.x
      lrp r1.x, c41.w, r0.y, r0.x
      add o5.w, r1.x, c41.z
      mov r1.xyz, c43
      add r0.yzw, -r1.xxyz, c42.xxyz
      mad o5.xyz, r0.x, r0.yzww, c43
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
    mov o0.w, c32.w
    mov o1.xyz, v2
    mov o2, v3
    mov o3.xy, v4
    mul o4, c33.wzzz, v5.z
    mov o6, v6

// approximately 47 instruction slots used
