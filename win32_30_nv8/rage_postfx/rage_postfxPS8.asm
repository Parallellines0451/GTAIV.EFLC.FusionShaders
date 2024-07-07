// Summary: Scalable Vanilla Bloom
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D HDRSampler;
//   float4 TexelSize;
//   float4 globalScreenSize;
//
//
// Registers:
//
//   Name               Reg   Size
//   ------------------ ----- ----
//   globalScreenSize   c44      1
//   TexelSize          c66      1
//   HDRSampler         s0       1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 1.1364530546e-42 // 811
    def c0, 0.966, 0.933, 0.900, 0
    def c1, 0.866, 0.833, 0.800, 0
    def c2, 0.766, 0.733, 0.700, 0
    def c10, 1, 2, 3, 0
    def c11, 4, 5, 6, 0
    def c12, 7, 8, 9, 0
    def c20, 0.0625234, 0.0004629, 0, 0
    dcl_texcoord v0.xy
    dcl_2d s0
    texld r0, v0, s0 // center
    mov r1, c66.y
    mov r2.w, v0.x
    mul r1, r1, c44.y
    mul r1, r1, c20.y
    
    mad r2.xyz, r1, c10, v0.y
    texld r3, r2.wx, s0
    add r3, r3, -r0
    max r3, r3, c20.z
    mul r4, r3, c0.x
    texld r3, r2.wy, s0
    add r3, r3, -r0
    max r3, r3, c20.z
    mul r3, r3, c0.y
    add r4, r4, r3
    texld r3, r2.wz, s0
    add r3, r3, -r0
    max r3, r3, c20.z
    mul r3, r3, c0.z
    add r4, r4, r3
    mad r2.xyz, r1, -c10, v0.y
    texld r3, r2.wx, s0
    add r3, r3, -r0
    max r3, r3, c20.z
    mul r3, r3, c0.x
    add r4, r4, r3
    texld r3, r2.wy, s0
    add r3, r3, -r0
    max r3, r3, c20.z
    mul r3, r3, c0.y
    add r4, r4, r3
    texld r3, r2.wz, s0
    add r3, r3, -r0
    max r3, r3, c20.z
    mul r3, r3, c0.z
    add r4, r4, r3
    
    mad r2.xyz, r1, c11, v0.y
    texld r3, r2.wx, s0
    add r3, r3, -r0
    max r3, r3, c20.z
    mul r3, r3, c1.x
    add r4, r4, r3
    texld r3, r2.wy, s0
    add r3, r3, -r0
    max r3, r3, c20.z
    mul r3, r3, c1.y
    add r4, r4, r3
    texld r3, r2.wz, s0
    add r3, r3, -r0
    max r3, r3, c20.z
    mul r3, r3, c1.z
    add r4, r4, r3
    mad r2.xyz, r1, -c11, v0.y
    texld r3, r2.wx, s0
    add r3, r3, -r0
    max r3, r3, c20.z
    mul r3, r3, c1.x
    add r4, r4, r3
    texld r3, r2.wy, s0
    add r3, r3, -r0
    max r3, r3, c20.z
    mul r3, r3, c1.y
    add r4, r4, r3
    texld r3, r2.wz, s0
    add r3, r3, -r0
    max r3, r3, c20.z
    mul r3, r3, c1.z
    add r4, r4, r3
    
    mad r2.xyz, r1, c12, v0.y
    texld r3, r2.wx, s0
    add r3, r3, -r0
    max r3, r3, c20.z
    mul r3, r3, c2.x
    add r4, r4, r3
    texld r3, r2.wy, s0
    add r3, r3, -r0
    max r3, r3, c20.z
    mul r3, r3, c2.y
    add r4, r4, r3
    texld r3, r2.wz, s0
    add r3, r3, -r0
    max r3, r3, c20.z
    mul r3, r3, c2.z
    add r4, r4, r3
    mad r2.xyz, r1, -c12, v0.y
    texld r3, r2.wx, s0
    add r3, r3, -r0
    max r3, r3, c20.z
    mul r3, r3, c2.x
    add r4, r4, r3
    texld r3, r2.wy, s0
    add r3, r3, -r0
    max r3, r3, c20.z
    mul r3, r3, c2.y
    add r4, r4, r3
    texld r3, r2.wz, s0
    add r3, r3, -r0
    max r3, r3, c20.z
    mul r3, r3, c2.z
    add r4, r4, r3
    
    mad oC0.xyz, r4, c20.x, r0
    mov oC0.w, c10.x

// approximately 40 instruction slots used (7 texture, 33 arithmetic)
