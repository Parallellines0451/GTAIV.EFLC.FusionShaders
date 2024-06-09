// Summary: removed unnecessary stipple + console-like ambient reflection intensity + improved shadow filter + restored normal offset bias + improved shadow fadeout
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D EnvironmentSampler;
//   sampler2D SpecSampler;
//   sampler2D StippleTexture;
//   sampler2D TextureSampler;
//   float4 gDepthFxParams;
//   float4 gDirectionalColour;
//   float4 gDirectionalLight;
//   float4 gFacetCentre;
//   float4 gLightAmbient0;
//   float4 gLightAmbient1;
//   float4 gLightColB;
//   float4 gLightColG;
//   float4 gLightColR;
//   float4 gLightConeOffset;
//   float4 gLightConeOffset2;
//   float4 gLightConeScale;
//   float4 gLightConeScale2;
//   float4 gLightDir2X;
//   float4 gLightDir2Y;
//   float4 gLightDir2Z;
//   float4 gLightDirX;
//   float4 gLightDirY;
//   float4 gLightDirZ;
//   float4 gLightFallOff;
//   float4 gLightPointColB;
//   float4 gLightPointColG;
//   float4 gLightPointColR;
//   float4 gLightPointFallOff;
//   float4 gLightPointPosX;
//   float4 gLightPointPosY;
//   float4 gLightPointPosZ;
//   float4 gLightPosX;
//   float4 gLightPosY;
//   float4 gLightPosZ;
//   row_major float4x4 gShadowMatrix;
//   float4 gShadowParam0123;
//   float4 gShadowParam14151617;
//   float4 gShadowParam18192021;
//   float4 gShadowParam4567;
//   float4 gShadowParam891113;
//   sampler2D gShadowZSamplerDir;
//   row_major float4x4 gViewInverse;
//   float4 globalFogColor;
//   float4 globalFogColorN;
//   float4 globalFogParams;
//   float4 globalScalars;
//   float reflectivePower;
//   float3 specMapIntMask;
//   float specularColorFactor;
//   float specularFactor;
//
//
// Registers:
//
//   Name                 Reg   Size
//   -------------------- ----- ----
//   gViewInverse         c12      4
//   gDepthFxParams       c16      1
//   gDirectionalLight    c17      1
//   gDirectionalColour   c18      1
//   gLightPosX           c19      1
//   gLightPosY           c20      1
//   gLightPosZ           c21      1
//   gLightDirX           c22      1
//   gLightDirY           c23      1
//   gLightDirZ           c24      1
//   gLightFallOff        c25      1
//   gLightConeScale      c26      1
//   gLightConeOffset     c27      1
//   gLightColR           c29      1
//   gLightColG           c30      1
//   gLightColB           c31      1
//   gLightPointPosX      c32      1
//   gLightPointPosY      c33      1
//   gLightPointPosZ      c34      1
//   gLightPointColR      c35      1
//   gLightPointFallOff   c36      1
//   gLightAmbient0       c37      1
//   gLightAmbient1       c38      1
//   globalScalars        c39      1
//   globalFogParams      c41      1
//   globalFogColor       c42      1
//   globalFogColorN      c43      1
//   gShadowParam18192021 c53      1
//   gFacetCentre         c54      1
//   gShadowParam14151617 c56      1
//   gShadowParam0123     c57      1
//   gShadowParam4567     c58      1
//   gShadowParam891113   c59      1
//   gShadowMatrix        c60      4
//   gLightPointColG      c64      1
//   gLightPointColB      c65      1
//   specularFactor       c66      1
//   gLightDir2X          c67      1
//   gLightDir2Y          c68      1
//   gLightDir2Z          c69      1
//   gLightConeScale2     c70      1
//   gLightConeOffset2    c71      1
//   specularColorFactor  c72      1
//   specMapIntMask       c73      1
//   reflectivePower      c74      1
//   TextureSampler       s0       1
//   SpecSampler          s1       1
//   EnvironmentSampler   s2       1
//   StippleTexture       s10      1
//   gShadowZSamplerDir   s15      1
//

    ps_3_0
	// ----------------------------------------------------- Improved Shadow Filter Constants -------------------------------------------------------
    def c110, -0.25, 1, -1, 0
    def c111, 0.159154937, 0.5, 6.28318548, -3.14159274
    def c112, 3, 7.13800001, 0.00390625, 0
    def c113, 0.75, -0.5, 0.5, 0
	
    def c114, 0.1, 0.22, 0.5, 0.8 // c114-c117 = biases for each cascade of each quality setting
    def c115, 0.22, 0.42, 1.07, 1.22
    def c116, 0.28, 0.53, 0.98, 1.08
    def c117, 0.5, 0.8, 1.35, 1.5
	
	def c118, 4, 3, 2, 1 // quality ID's
	def c119, 0.16, 0.08, 0.04, 0 // 1/blend_distance
	
	def c120, 0, 0.25, 0.5, 0.75 // UV clamps
	def c121, 0.2499, 0.4999, 0.7499, 1
	
	def c130, 0.18993645671348536, 0.027087114076591513, -0.21261242652069953, 0.23391293246949066
	def c131, 0.04771781344140756, -0.3666840644525993, 0.297730981239584, 0.398259878229082
	def c132, -0.509063425827436, -0.06528681462854097, 0.507855152944665, -0.2875976005206389
	def c133, -0.15230616564632418, 0.6426121151781916, -0.30240170651828074, -0.5805072900736001
	def c134, 0.6978019230005561, 0.2771173334141519, -0.6990963248129052, 0.3210960724922725
	def c135, 0.3565142601623699, -0.7066415061851589, 0.266890002328106, 0.8360191043249159
	def c136, -0.7515861305520581, -0.41609876195815027, 0.9102937449894895, -0.17014527555321657
	def c137, -0.5343471434373126, 0.8058593459499529, -0.1133270115046468, -0.9490025827627441
	// ----------------------------------------------------------------------------------------------------------------------------------------------
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 7.9313493081e-43 // 566
    def c99, 0.1, 0, 0, 0 // normal offset bias magnitude
    def c127, 0.9999999, 1, 0, 0	// LogDepth constants
    def c0, -0.5, -0.00999999978, 100, 0.5
    def c1, 1.33333337, 9.99999975e-005, 1.5, 0.0833333358
    def c2, 0, -1, -0, 9.99999975e-006
    def c3, -0.100000001, 1.11111116, 1.00000001e-007, 0
    def c4, 3.99600005, 4, 0.125, 0.25
    def c5, 0.212500006, 0.715399981, 0.0720999986, 0
    def c6, 1, -1, 0, -0
    def c7, -0.321940005, -0.932614982, -0.791558981, -0.597710013
    def c8, 0.507430971, 0.0644249991, 0.896420002, 0.412458003
    def c9, 0.519456029, 0.767022014, 0.185461, -0.893123984
    def c10, 0.962339997, -0.194983006, 0.473434001, -0.480026007
    def c11, -0.69591397, 0.457136989, -0.203345001, 0.620715976
    def c12, -0.326211989, -0.405809999, -0.840143979, -0.0735799968
	def c100, 1.6666667, 0, 0, 0	// Reflection intensity multiplier
    dcl_texcoord v0.xy
    dcl_texcoord1 v1
    dcl_texcoord3 v2.xyz
    dcl_color v3.xw
    dcl_texcoord6 v4.xyz
    dcl vPos.xy
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s1
    dcl_2d s2
    dcl_2d s10
    dcl_2d s15
    /* removed stipple
    mov_sat r0.x, c39.x
    mul r0.x, r0.x, c4.x
    frc r0.y, r0.x
    mul r0.z, r0.y, c4.y
    frc r0.w, r0.z
    add r1.xy, r0.zxzw, -r0.wyzw
    mul r0.xy, c4.z, vPos
    frc r0.xy, r0_abs
    cmp r0.xy, vPos, r0, -r0
    mul r0.xy, r0, c4.w
    mad r0.xy, r1, c4.w, r0
    mov r0.zw, c2.x
    texldl r0, r0, s10
    cmp r0, -r0.y, c2.y, c2.z
    texkill r0
    removed stipple */
    texld r0, v0, s0
    add r1.xyz, c2.w, v1
    nrm r2.xyz, r1
    texld r1, v0, s1
    mul r2.w, r1.w, c66.x
    dp3 r1.x, r1, c73
    mul r1.x, r1.x, c72.x
    add r3.xyz, c2.w, v2
    nrm r4.xyz, r3
    dp3 r1.y, -r4, r2
    add r1.y, r1.y, r1.y
    mad r3.xyz, r2, -r1.y, -r4
    add r4.xyz, r3, c2.w
    dp3 r1.y, r4, r4
    rsq r1.y, r1.y
    mad r1.yz, r4.xxzw, r1.y, -c2.y
    mul r1.yz, r1, c0.x
    texld r4, r1.yzzw, s2
	mul r4, r4, c100.x
    mul r4.xyz, r1.x, r4
    mul r4.xyz, r4, c74.x
    mul r5.w, r0.w, v3.w
    mad r0.w, r0.w, v3.w, c0.y
    rcp r1.y, r5.w
    cmp r0.w, r0.w, r1.y, c0.z
    mad r5.xyz, r4, r0.w, r0
    mad_sat r0.x, r2.z, c0.x, c0.w
    mov r4.xyz, c38
    mad r0.xyz, r4, r0.x, c37
    mul r4.xyz, c18.w, c18
    dp3 r0.w, r2, -c17
    mul r20.xyz, r2.y, c61.xyww
    mad r20.xyz, r2.x, c60.xyww, r20
    mad r20.xyz, r2.z, c62.xyww, r20
    add r0.w, r0.w, -c4.w
    mul_sat r0.w, r0.w, c1.x
    dp3_sat r1.y, -c17, r3
    add r1.y, r1.y, c1.y
    mov r6.y, c1.y
    mad r1.z, r1.w, c66.x, r6.y
    pow r3.w, r1.y, r1.z
    mul r1.yzw, c61.xxyw, v4.y
    mad r1.yzw, v4.x, c60.xxyw, r1
    mad r1.yzw, v4.z, c62.xxyw, r1
    add r1.yzw, r1, c63.xxyw
    dp3 r4.w, c14, v4
    add r6.xyz, -r4.w, -c54
    cmp r6.yzw, r6.xxyz, -c2.y, -c2.z
    mov r6.x, -c2.y
    mad r21, r6, c110.yyyw, -r6.yzww // shadow cascade mask
    mad r1.yzw, r20.xxyz, c99.x, r1 // normal offset bias
    dp4 r7.x, r6, c57
    dp4 r7.y, r6, c58
    dp4 r8.x, r6, c59
    dp4 r8.y, r6, c56
    mad r1.yz, r1, r7.xxyw, r8.xxyw
    add r6.xyz, c15, -v4
    dp3 r4.w, r6, r6
    rsq r4.w, r4.w
    rcp r4.w, r4.w
    /* removed 1.0.6.0 filter
    rcp r6.x, c53.w
    mul r6.x, r4.w, r6.x
    mul r6.x, r6.x, r6.x
    mul r6.x, r6.x, c1.z
    mov r6.y, c53.y
    mad r6.zw, r6.y, c12.xyxy, r1.xyyz
    texld r7, r6.zwzw, s15
    add r6.z, r1.w, -r7.x
    cmp r6.z, r6.z, -c2.y, -c2.z
    mad r7.xy, r6.y, c12.zwzw, r1.yzzw
    texld r7, r7, s15
    add r6.w, r1.w, -r7.x
    cmp r6.w, r6.w, -c2.y, -c2.z
    add r6.z, r6.z, r6.w
    mad r7.xy, r6.y, c11, r1.yzzw
    texld r7, r7, s15
    add r6.w, r1.w, -r7.x
    cmp r6.w, r6.w, -c2.y, -c2.z
    add r6.z, r6.z, r6.w
    mad r7.xy, r6.y, c11.zwzw, r1.yzzw
    texld r7, r7, s15
    add r6.w, r1.w, -r7.x
    cmp r6.w, r6.w, -c2.y, -c2.z
    add r6.z, r6.z, r6.w
    mad r7.xy, r6.y, c10, r1.yzzw
    texld r7, r7, s15
    add r6.w, r1.w, -r7.x
    cmp r6.w, r6.w, -c2.y, -c2.z
    add r6.z, r6.z, r6.w
    mad r7.xy, r6.y, c10.zwzw, r1.yzzw
    texld r7, r7, s15
    add r6.w, r1.w, -r7.x
    cmp r6.w, r6.w, -c2.y, -c2.z
    add r6.z, r6.z, r6.w
    mad r7.xy, r6.y, c9, r1.yzzw
    texld r7, r7, s15
    add r6.w, r1.w, -r7.x
    cmp r6.w, r6.w, -c2.y, -c2.z
    add r6.z, r6.z, r6.w
    mad r7.xy, r6.y, c9.zwzw, r1.yzzw
    texld r7, r7, s15
    add r6.w, r1.w, -r7.x
    cmp r6.w, r6.w, -c2.y, -c2.z
    add r6.z, r6.z, r6.w
    mad r7.xy, r6.y, c8, r1.yzzw
    texld r7, r7, s15
    add r6.w, r1.w, -r7.x
    cmp r6.w, r6.w, -c2.y, -c2.z
    add r6.z, r6.z, r6.w
    mad r7.xy, r6.y, c8.zwzw, r1.yzzw
    texld r7, r7, s15
    add r6.w, r1.w, -r7.x
    cmp r6.w, r6.w, -c2.y, -c2.z
    add r6.z, r6.z, r6.w
    mad r7.xy, r6.y, c7, r1.yzzw
    texld r7, r7, s15
    add r6.w, r1.w, -r7.x
    cmp r6.w, r6.w, -c2.y, -c2.z
    add r6.z, r6.z, r6.w
    mad r1.yz, r6.y, c7.xzww, r1
    texld r7, r1.yzzw, s15
    add r1.y, r1.w, -r7.x
    cmp r1.y, r1.y, -c2.y, -c2.z
    add r1.y, r6.z, r1.y
    mad r1.y, r1.y, c1.w, r6.x
    add r1.z, r4.w, -c53.w
    cmp r1.zw, r1.z, c6.xyxy, c6
    add r1.w, r1.y, r1.w
    cmp_sat r1.y, r1.w, r1.y, r1.z
    removed 1.0.6.0 filter */
// ---------------------------------------------------------- Improved Shadow Filter ------------------------------------------------------------
	mov r20.xy, c53.y
	rcp r20.z, c58.x
	mul r20.z, r20.z, c57.x
	mul r20.x, r20.x, r20.z // fix filter stretching
	
	add r22, c54.w, -c54
	add r22, c53.w, -r22 // cascade distances
	dp4 r23.x, r21_abs, r22
	dp4 r23.y, r21_abs, r22.xxyz
	dp4 r23.z, r21_abs, c119.xxyz
	add r23.w, v9.w, -r23.y
	mul_sat r23.z, r23.z, r23.w
	rcp r23.x, r23.x
	mul r23.w, r23.x, r23.y
	lrp r20.z, r23.z, c110.y, r23.w
	mul r20.xy, r20.xy, r20.z // apply pseudo cascade blending
	
	mov r24, c118
	add r24, r24, -c221.y
	add_sat r24, c110.y, -r24_abs
	m4x4 r25, r21_abs, c114
	dp4 r25.x, r25, r24
	add r1.w, r1.w, -r25.x // apply per cascade bias
	
	dp4 r20.z, r21_abs, c120 // fix pixels leaking into other cascades
	dp4 r20.w, r21_abs, c121
	
	mov r21.x, c110.y
	if_lt c223.y, r21.x
		dp2add r21.y, vPos, c112.xy, c112.w
		mad r21.y, r21.y, c111.x, c111.y
		frc r21.y, r21.y
		mad r21.y, r21.y, c111.z, c111.w
		sincos r22.xy, r21.y
		mul r23, r22.yxxy, c110.xxyz
		mul r21, r22.yxxy, c113.xxyz
		mul r20.xy, r20.xy, c112.x
		mad r23, r23, r20.xyxy, r1.yzyz
		mad r21, r21, r20.xyxy, r1.yzyz
		max r23.xz, r23, r20.z
		min r23.xz, r23, r20.w
		max r21.xz, r21, r20.z
		min r21.xz, r21, r20.w
		texldl r25, r23.xy, s15
		texldl r24, r21.zw, s15
		mov r25.y, r24.x
		texldl r24, r21.xy, s15
		mov r25.z, r24.x
		texldl r24, r23.zw, s15
		mov r25.w, r24.x
		add r25, r1.w, -r25
		cmp r25, r25, c110.y, c110.w
		dp4 r20.x, r25, -c110.x
	else
		mul r24.xy, vPos.xy, c112.z
		texldl r24, r24, s10
		mul r24.x, r24.z, c111.z
		sincos r25.xy, r24.x
		mul r25, r25.xyyx, c110.yzyy
		mul r20.xy, r20.xy, c112.x
		mul r26, c130.xyxy, r25
		add r27.xy, r26.xzxz, r26.ywyw
		mul r26, c130.zwzw, r25
		add r27.zw, r26.xzxz, r26.ywyw
		mad r26, r27, r20.xyxy, r1.yzyz
		max r26.xz, r26, r20.z
		min r26.xz, r26, r20.w
		texldl r28, r26.xy, s15
		texldl r27, r26.zw, s15
		mov r28.y, r27.x
		mul r26, c131.xyxy, r25
		add r27.xy, r26.xzxz, r26.ywyw
		mul r26, c131.zwzw, r25
		add r27.zw, r26.xzxz, r26.ywyw
		mad r26, r27, r20.xyxy, r1.yzyz
		max r26.xz, r26, r20.z
		min r26.xz, r26, r20.w
		texldl r27, r26.xy, s15
		mov r28.z, r27.x
		texldl r27, r26.zw, s15
		mov r28.w, r27.x
		add r28, r1.w, -r28
		cmp r28, r28, c110.y, c110.w
		dp4 r29.x, r28, -c110.x
		mul r26, c132.xyxy, r25
		add r27.xy, r26.xzxz, r26.ywyw
		mul r26, c132.zwzw, r25
		add r27.zw, r26.xzxz, r26.ywyw
		mad r26, r27, r20.xyxy, r1.yzyz
		max r26.xz, r26, r20.z
		min r26.xz, r26, r20.w
		texldl r28, r26.xy, s15
		texldl r27, r26.zw, s15
		mov r28.y, r27.x
		mul r26, c133.xyxy, r25
		add r27.xy, r26.xzxz, r26.ywyw
		mul r26, c133.zwzw, r25
		add r27.zw, r26.xzxz, r26.ywyw
		mad r26, r27, r20.xyxy, r1.yzyz
		max r26.xz, r26, r20.z
		min r26.xz, r26, r20.w
		texldl r27, r26.xy, s15
		mov r28.z, r27.x
		texldl r27, r26.zw, s15
		mov r28.w, r27.x
		add r28, r1.w, -r28
		cmp r28, r28, c110.y, c110.w
		dp4 r29.y, r28, -c110.x
		mul r26, c134.xyxy, r25
		add r27.xy, r26.xzxz, r26.ywyw
		mul r26, c134.zwzw, r25
		add r27.zw, r26.xzxz, r26.ywyw
		mad r26, r27, r20.xyxy, r1.yzyz
		max r26.xz, r26, r20.z
		min r26.xz, r26, r20.w
		texldl r28, r26.xy, s15
		texldl r27, r26.zw, s15
		mov r28.y, r27.x
		mul r26, c135.xyxy, r25
		add r27.xy, r26.xzxz, r26.ywyw
		mul r26, c135.zwzw, r25
		add r27.zw, r26.xzxz, r26.ywyw
		mad r26, r27, r20.xyxy, r1.yzyz
		max r26.xz, r26, r20.z
		min r26.xz, r26, r20.w
		texldl r27, r26.xy, s15
		mov r28.z, r27.x
		texldl r27, r26.zw, s15
		mov r28.w, r27.x
		add r28, r1.w, -r28
		cmp r28, r28, c110.y, c110.w
		dp4 r29.z, r28, -c110.x
		mul r26, c136.xyxy, r25
		add r27.xy, r26.xzxz, r26.ywyw
		mul r26, c136.zwzw, r25
		add r27.zw, r26.xzxz, r26.ywyw
		mad r26, r27, r20.xyxy, r1.yzyz
		max r26.xz, r26, r20.z
		min r26.xz, r26, r20.w
		texldl r28, r26.xy, s15
		texldl r27, r26.zw, s15
		mov r28.y, r27.x
		mul r26, c137.xyxy, r25
		add r27.xy, r26.xzxz, r26.ywyw
		mul r26, c137.zwzw, r25
		add r27.zw, r26.xzxz, r26.ywyw
		mad r26, r27, r20.xyxy, r1.yzyz
		max r26.xz, r26, r20.z
		min r26.xz, r26, r20.w
		texldl r27, r26.xy, s15
		mov r28.z, r27.x
		texldl r27, r26.zw, s15
		mov r28.w, r27.x
		add r28, r1.w, -r28
		cmp r28, r28, c110.y, c110.w
		dp4 r29.w, r28, -c110.x
		dp4 r20.x, r29, -c110.x
	endif
	// ----------------------------------------------------------------------------------------------------------------------------------------------
    // -------------------------------------------------------------- Improved Fadeout --------------------------------------------------------------
    rcp r20.y, c53.w
    mul_sat r20.y, r20.y, r4.w
    mul r20.y, r20.y, r20.y
    lrp r1.y, r20.y, c110.y, r20.x // improved fadeout
	// ----------------------------------------------------------------------------------------------------------------------------------------------
    mul r6.xyz, r4, r3.w
    mul r6.xyz, r1.y, r6
    mul r4.xyz, r4, r0.w
    mul r1.yzw, r1.y, r4.xxyz
    mad r0.xyz, r0, v3.x, r1.yzww
    mul r0.w, r2.w, c4.w
    add r4, c19, -v4.x
    add r7, c20, -v4.y
    add r8, c21, -v4.z
    mul r9, r4, r4
    mad r9, r7, r7, r9
    mad r9, r8, r8, r9
    add r10, r9, c2.w
    rsq r11.x, r10.x
    rsq r11.y, r10.y
    rsq r11.z, r10.z
    rsq r11.w, r10.w
    mov r1.y, c2.y
    mad r9, r9, -c25, -r1.y
    max r10, r9, c2.x
    mul r9, r10, r10
    mad r9, r9, r9, c3.x
    mul r10, r9, c3.y
    cmp r9, r9, r10, c2.x
    mul r10, r2.x, r4
    mad r10, r7, r2.y, r10
    mad r10, r8, r2.z, r10
    mul r9, r9, r10
    mul_sat r9, r11, r9
    mul r10, r4, -c22
    mad r10, r7, -c23, r10
    mad r10, r8, -c24, r10
    mul r10, r11, r10
    mov r12, c26
    mad_sat r10, r10, r12, c27
    mul r9, r9, r10
    mul r4, r3.x, r4
    mad r4, r3.y, r7, r4
    mad r4, r3.z, r8, r4
    mul r4, r11, r4
    log r7.x, r4_abs.x
    log r7.y, r4_abs.y
    log r7.z, r4_abs.z
    log r7.w, r4_abs.w
    mul r4, r0.w, r7
    exp r7.x, r4.x
    exp r7.y, r4.y
    exp r7.z, r4.z
    exp r7.w, r4.w
    mul r4, r9, r7
    dp4 r7.x, c29, r9
    dp4 r7.y, c30, r9
    dp4 r7.z, c31, r9
    dp4 r8.x, c29, r4
    dp4 r8.y, c30, r4
    dp4 r8.z, c31, r4
    add r0.xyz, r0, r7
    mad r4.xyz, r6, c17.w, r8
    add r6, c32, -v4.x
    add r7, c33, -v4.y
    add r8, c34, -v4.z
    mul r9, r6, r6
    mad r9, r7, r7, r9
    mad r9, r8, r8, r9
    add r10, r9, c2.w
    rsq r11.x, r10.x
    rsq r11.y, r10.y
    rsq r11.z, r10.z
    rsq r11.w, r10.w
    mad r9, r9, -c36, -r1.y
    max r10, r9, c2.x
    mul r9, r10, r10
    mad r9, r9, r9, c3.x
    mul r10, r9, c3.y
    cmp r9, r9, r10, c2.x
    mul r10, r2.x, r6
    mad r10, r7, r2.y, r10
    mad r2, r8, r2.z, r10
    mul r2, r9, r2
    mul_sat r2, r11, r2
    mul r9, r6, -c67
    mad r9, r7, -c68, r9
    mad r9, r8, -c69, r9
    mul r9, r11, r9
    mov r10, c70
    mad_sat r9, r9, r10, c71
    mul r2, r2, r9
    mul r6, r3.x, r6
    mad r6, r3.y, r7, r6
    mad r3, r3.z, r8, r6
    mul r3, r11, r3
    log r6.x, r3_abs.x
    log r6.y, r3_abs.y
    log r6.z, r3_abs.z
    log r6.w, r3_abs.w
    mul r3, r0.w, r6
    exp r6.x, r3.x
    exp r6.y, r3.y
    exp r6.z, r3.z
    exp r6.w, r3.w
    mul r3, r2, r6
    dp4 r6.x, c35, r2
    dp4 r6.y, c64, r2
    dp4 r6.z, c65, r2
    dp4 r2.x, c35, r3
    dp4 r2.y, c64, r3
    dp4 r2.z, c65, r3
    add r0.xyz, r0, r6
    add r2.xyz, r4, r2
    mov r0.w, -c2.y
    mul r0, r5, r0
    mad r0.xyz, r1.x, r2, r0
    mul oC0.w, r0.w, c39.x
    add r0.w, c16.w, -v1.w
    add r1.x, -c16.z, c16.w
    rcp r1.x, r1.x
    mul_sat r0.w, r0.w, r1.x
    add r0.w, -r0.w, -c2.y
    add r1.xy, r1.y, c16
    mul r1.y, r0.w, r1.y
    mad r0.w, r0.w, r1.x, -c2.y
    dp3 r1.x, r0, c5
    lrp r2.xyz, r0.w, r0, r1.x
    add r0.x, r1.x, c3.z
    pow r2.w, r0_abs.x, r1.y
    mul r0.xyz, r2, r2.w
    rcp r0.w, c41.x
    mul_sat r0.w, r0.w, v1.w
    add r1.x, -c41.x, v1.w
    add r1.y, -c41.x, c41.y
    rcp r1.y, r1.y
    mul_sat r1.x, r1.x, r1.y
    lrp r3.x, c41.w, r0.w, r1.x
    add r0.w, r3.x, c41.z
    mov r3.xyz, c43
    add r1.yzw, -r3.xxyz, c42.xxyz
    mad r1.xyz, r1.x, r1.yzww, c43
    mad r1.xyz, r2, -r2.w, r1
    mad oC0.xyz, r0.w, r1, r0
	// ----------------------------------------------------------------- Linear2Log -----------------------------------------------------------------
	if_ne v9.y, c127.y
		rcp r20.z, c128.x
		mul r20.x, v9.w, r20.z
		mul r20.y, c128.y, r20.z
		log r20.x, r20.x
		log r20.y, r20.y
		rcp r20.y, r20.y
	else
		mov r20.x, v9.z
		rcp r20.y, v9.w
	endif
	mul oDepth, r20.x, r20.y
	// ----------------------------------------------------------------------------------------------------------------------------------------------

// approximately 286 instruction slots used (17 texture, 269 arithmetic)
