//
// Generated by Microsoft (R) HLSL Shader Compiler 9.29.952.3111
//
// Parameters:
//
//   float4 Acceleration_Delta;
//   float4 EmitterParamLifeAndSpeed;
//   float3 EmitterParamPos;
//   float3 EmitterParamPosRange;
//   float EmitterParamProbablityPhase2;
//   row_major float4x4 EmitterTransform;
//   float3 EmitterVelocityBoxPos;
//   float4 EmitterVelocityBoxRange;
//   sampler2D InitPositionTexSampler;
//   sampler2D InitVelocityTexSampler;
//   sampler2D NoiseTexSampler;
//   sampler2D ParticlePosXYTexSampler;
//   sampler2D ParticlePosZWTexSampler;
//   float2 gCollisionLifeModifier;
//   float3 gCollisionVelocityModifier;
//   float4 gDispersalSettings;
//   bool gFirstTimeUpdate;
//   float4 gHitPlane;
//
//
// Registers:
//
//   Name                         Reg   Size
//   ---------------------------- ----- ----
//   gFirstTimeUpdate             b0       1
//   EmitterTransform             c64      4
//   Acceleration_Delta           c68      1
//   EmitterParamPos              c69      1
//   EmitterParamPosRange         c70      1
//   EmitterParamLifeAndSpeed     c71      1
//   EmitterParamProbablityPhase2 c72      1
//   EmitterVelocityBoxPos        c73      1
//   EmitterVelocityBoxRange      c74      1
//   gHitPlane                    c75      1
//   gCollisionVelocityModifier   c76      1
//   gCollisionLifeModifier       c77      1
//   gDispersalSettings           c78      1
//   ParticlePosXYTexSampler      s0       1
//   ParticlePosZWTexSampler      s1       1
//   NoiseTexSampler              s2       1
//   InitPositionTexSampler       s3       1
//   InitVelocityTexSampler       s4       1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 7.4268818609e-44 // 53
    def c0, 0.200000003, 0.999499977, 0, 0
    def c1, 0.0625, 2, -1, 0
    dcl_texcoord v0.xy
    dcl_2d s0
    dcl_2d s1
    dcl_2d s2
    dcl_2d s3
    dcl_2d s4
    if b0
      texld r0, v0, s3
      texld r1, v0, s4
      mov r2.x, r0.w
    else
      texld r0, v0, s0
      texld r1, v0, s1
      mov r2.x, r0.w
    endif
    add r2.x, r2.x, -c68.w
    mad r2.zw, r0.xyxz, c1.x, v0.xyxy
    texld r3, r2.zwzw, s2
    texld r4, v0, s2
    mad r4.yzw, r4.xxyz, c1.y, c1.z
    mov r5.xyz, c74
    mad r5.xyz, r5, r4.yzww, c73
    mad r3.xyz, r3.wzyw, c1.y, c1.z
    mov r6.xyz, c70
    mad r3.xyz, r6, r3, c69
    mul r4.yzw, r3.y, c65.xxyz
    mad r4.yzw, r3.x, c64.xxyz, r4
    mad r3.xyz, r3.z, c66, r4.yzww
    add r6.y, r3.y, c67.y
    dp2add r0.w, r3.xzzw, r3.xzzw, c1.w
    rsq r0.w, r0.w
    rcp r0.w, r0.w
    add r0.w, r0.w, -c78.x
    mov r2.yz, c1.xwzw
    mad r2.z, r0.w, c78.y, -r2.z
    cmp r0.w, r0.w, r2.z, -c1.z
    mad r6.xz, r3, r0.w, c67
    mad r3.xyz, r5, -c0.x, r6
    mad r6.x, c71.z, r3.w, c71.w
    add r0.w, r4.x, -c72.x
    cmp r6.y, r0.w, c1_abs.w, c1_abs.z
    mov r5.w, c1.w
    cmp r1, -r2.x, r5, r1
    cmp r0.xyz, -r2.x, r3, r0
    cmp r2.xw, -r2.x, r6.yyzx, r2.yyzx
    mad r0.xyz, r1, c68.w, r0
    mov r0.w, -c1.z
    dp4 r0.w, r0, c75
    cmp r3.x, r0.w, c1_abs.w, c1_abs.z
    add r3.x, r2.x, r3.x
    mad r4.xyz, c75, -r0.w, r0
    mul r5.xyz, r1, c76
    mad r0.w, r2.w, c77.x, c77.y
    cmp r4.w, -r1_abs.w, r0.w, r2.w
    add r5.w, r1.w, -c1.z
    mov r2.xyz, r0
    cmp oC0, -r3.x, r2, r4
    cmp r0, -r3.x, r1, r5
    mov r1.y, c0.y
    cmp r1.xyz, -r0.w, r1.y, c76
    mad r0.xyz, c68, c68.w, r0
    mul oC1.xyz, r1, r0
    mov oC1.w, r0.w

// approximately 60 instruction slots used (6 texture, 54 arithmetic)
