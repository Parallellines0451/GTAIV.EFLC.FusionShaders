// Depth of field downsampled blur pass
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D DOFBlurSampler;
//   float4 TexelSize;
//   float4 globalScreenSize;
//
//
// Registers:
//
//   Name                         Reg   Size
//   ---------------------------- ----- ----
//   globalScreenSize             c44      1
//   TexelSize                    c76      1
//   DOFBlurSampler               s8       1
//

    ps_3_0
    def c14, 0.000076, 0.0625, 1, 0
    def c15, 0.18993645671348536, 0.027087114076591513, -0.21261242652069953, 0.23391293246949066
    def c16, 0.04771781344140756, -0.3666840644525993, 0.297730981239584, 0.398259878229082
    def c17, -0.509063425827436, -0.06528681462854097, 0.507855152944665, -0.2875976005206389
    def c18, -0.15230616564632418, 0.6426121151781916, -0.30240170651828074, -0.5805072900736001
    def c19, 0.6978019230005561, 0.2771173334141519, -0.6990963248129052, 0.3210960724922725
    def c20, 0.3565142601623699, -0.7066415061851589, 0.266890002328106, 0.8360191043249159
    def c21, -0.7515861305520581, -0.41609876195815027, 0.9102937449894895, -0.17014527555321657
    def c22, -0.5343471434373126, 0.8058593459499529, -0.1133270115046468, -0.9490025827627441
    
    dcl_texcoord v0.xy
    dcl_2d s8
    
    rsq r20.x, c44.y
    rcp r20.x, r20.x
    mul r20.x, r20.x, c44.y
    mul r20.x, r20.x, c14.x
    mul r20, r20.x, c76.xyxy
    
    mad r22, r20, c15, v0.xyxy
    texld r21.xyz, r22.xy, s8
    texld r23.xyz, r22.zw, s8
    add r21.xyz, r21, r23
    
    mad r22, r20, c16, v0.xyxy
    texld r23.xyz, r22.xy, s8
    add r21.xyz, r21, r23
    texld r23.xyz, r22.zw, s8
    add r21.xyz, r21, r23
    
    mad r22, r20, c17, v0.xyxy
    texld r23.xyz, r22.xy, s8
    add r21.xyz, r21, r23
    texld r23.xyz, r22.zw, s8
    add r21.xyz, r21, r23
    
    mad r22, r20, c18, v0.xyxy
    texld r23.xyz, r22.xy, s8
    add r21.xyz, r21, r23
    texld r23.xyz, r22.zw, s8
    add r21.xyz, r21, r23
    
    mad r22, r20, c19, v0.xyxy
    texld r23.xyz, r22.xy, s8
    add r21.xyz, r21, r23
    texld r23.xyz, r22.zw, s8
    add r21.xyz, r21, r23
    
    mad r22, r20, c20, v0.xyxy
    texld r23.xyz, r22.xy, s8
    add r21.xyz, r21, r23
    texld r23.xyz, r22.zw, s8
    add r21.xyz, r21, r23
    
    mad r22, r20, c21, v0.xyxy
    texld r23.xyz, r22.xy, s8
    add r21.xyz, r21, r23
    texld r23.xyz, r22.zw, s8
    add r21.xyz, r21, r23
    
    mad r22, r20, c22, v0.xyxy
    texld r23.xyz, r22.xy, s8
    add r21.xyz, r21, r23
    texld r23.xyz, r22.zw, s8
    add r21.xyz, r21, r23
    
    mul oC0.xyz, r21, c14.y
    mov oC0.w, c14.z

// approximately 176 instruction slots used (14 texture, 162 arithmetic)
