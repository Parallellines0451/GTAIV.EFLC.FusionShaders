// Summary: Improved shadow filter + restored normal offset bias + improved shadow fadeout + console-like ambient reflection intensity + console tree lighting thanks to AssaultKifle47 + fixed trees' orange glow
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D GBufferStencilTextureSampler;
//   sampler2D GBufferTextureSampler0;
//   sampler2D GBufferTextureSampler1;
//   sampler2D GBufferTextureSampler2;
//   sampler2D GBufferTextureSampler3;
//   sampler2D ParabSampler;
//   float4 dReflectionParams;
//   float4 gDeferredProjParams;
//   float4 gDirectionalColour;
//   float4 gDirectionalLight;
//   float4 gFacetCentre;
//   float4 gLightAmbient0;
//   float4 gLightAmbient1;
//   row_major float4x4 gShadowMatrix;
//   float4 gShadowParam0123;
//   float4 gShadowParam14151617;
//   float4 gShadowParam18192021;
//   float4 gShadowParam4567;
//   float4 gShadowParam891113;
//   sampler2D gShadowZSamplerDir;
//   row_major float4x4 gViewInverse;
//   float4 globalScalars;
//
//
// Registers:
//
//   Name                         Reg   Size
//   ---------------------------- ----- ----
//   gViewInverse                 c12      4
//   gDirectionalLight            c17      1
//   gDirectionalColour           c18      1
//   gLightAmbient0               c37      1
//   gLightAmbient1               c38      1
//   globalScalars                c39      1
//   gShadowParam18192021         c53      1
//   gFacetCentre                 c54      1
//   gShadowParam14151617         c56      1
//   gShadowParam0123             c57      1
//   gShadowParam4567             c58      1
//   gShadowParam891113           c59      1
//   gShadowMatrix                c60      4
//   gDeferredProjParams          c66      1
//   dReflectionParams            c72      1
//   GBufferTextureSampler0       s0       1
//   GBufferTextureSampler1       s1       1
//   GBufferTextureSampler2       s2       1
//   GBufferTextureSampler3       s4       1
//   ParabSampler                 s5       1
//   GBufferStencilTextureSampler s6       1
//   gShadowZSamplerDir           s15      1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 8.4077907859e-45 // 6
    def c99, 0.1, 0, 0, 0 // normal offset bias magnitude
    def c127, 0.9999999, 1, 0, 0	// LogDepth constants
    def c0, 512, 0.99609375, 7.96875, 63.75
    def c1, 0.25, 256, -127.999992, 9.99999975e-006
    def c2, 1.33333337, 9.99999975e-005, 512, 1
    def c3, 1, 0, 1.5, 0.0833333358
    def c4, -0.5, 0.5, 0.0199999996, 0.00999999978
    def c5, 4, 0.75, 0.25, 5
    def c6, 10, 0, 0, 0
    def c7, 1, -1, 0, -0
    def c8, -0.321940005, -0.932614982, -0.791558981, -0.597710013
    def c9, 0.507430971, 0.0644249991, 0.896420002, 0.412458003
    def c10, 0.519456029, 0.767022014, 0.185461, -0.893123984
    def c11, 0.962339997, -0.194983006, 0.473434001, -0.480026007
    def c12, -0.69591397, 0.457136989, -0.203345001, 0.620715976
    def c13, -0.326211989, -0.405809999, -0.840143979, -0.0735799968
	def c20, 1.6666667, 0, 0, 0	// Reflection intensity multiplier
	def c21, 3, 2, 1, 0	// Console tree lighting constants
	def c22, 0.012156862745098, 0.023921568627451, 0.027843137254902, 0 // 3.1, 6.1, 7.1, 0.0
	def c23, 0.0007843137254902, 0, 0, 0 // 0.2
    def c24, 0.212500006, 0.715399981, 0.0720999986, 0.35
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
    dcl_texcoord v0.xy
    dcl_texcoord1 v1
    dcl_2d s0
    dcl_2d s1
    dcl_2d s2
    dcl_2d s4
    dcl_2d s5
	dcl_2d s6
    dcl_2d s10
    dcl_2d s15
    texld r1, v0, s1
    mul r2.xyz, r1.w, c0.yzww
    frc r2.xyz, r2
    add r3.xyz, r2, r2
    mad r3.xy, r2.yzzw, -c1.x, r3
    mad r1.xyz, r1, c1.y, r3
    add r1.xyz, r1, c1.z
    nrm r31.xyz, r1
    texld r0, v0, s4
	// ----------------------------------------------------------------- Log2Linear -----------------------------------------------------------------
	if_ne r0.x, c127.y
		rcp r20.x, c128.x
		mul r20.x, r20.x, c128.y
		pow r20.x, r20.x, r0.x
		mul r20.x, r20.x, c128.x	// W_clip
		
		add r20.y, r20.x, -c128.x
		add r20.z, c128.y, -c128.x
		mul r20.y, r20.y, c128.y
		mul r20.z, r20.z, r20.x
		rcp r20.z, r20.z
		mul r20.w, r20.y, r20.z		// Linear depth
		
		min r0, r20.w, c127.x		// FP error hack
	endif
	// ----------------------------------------------------------------------------------------------------------------------------------------------
    mad r0.x, r0.x, c66.z, -c66.w
    mul r0.x, r0.x, v1.w
    rcp r0.x, r0.x
    mad r0.yzw, v1.xxyz, -r0.x, c15.xxyz
    dp3 r1.x, c14, r0.yzww
    add r1.xyz, -r1.x, -c54
    cmp r1.yzw, r1.xxyz, c3.x, c3.y
    mov r1.x, c2.w
    mad r21, r1, c110.yyyw, -r1.yzww // shadow cascade mask
    dp4 r2.x, r1, c57
    dp4 r2.y, r1, c58
    dp4 r3.x, r1, c59
    dp4 r3.y, r1, c56
    mul r1.xyz, r0.z, c61.xyww
    mad r1.xyz, r0.y, c60.xyww, r1
    mad r1.xyz, r0.w, c62.xyww, r1
    add r0.yzw, -r0, c15.xxyz
    dp3 r0.y, r0.yzww, r0.yzww
    rsq r0.y, r0.y
    rcp r0.y, r0.y
    add r1.xyz, r1, c63.xyww
    mul r20.xyz, r31.y, c61.xyww
    mad r20.xyz, r31.x, c60.xyww, r20
    mad r20.xyz, r31.z, c62.xyww, r20
    mad r1.xyz, r20, c99.x, r1 // normal offset bias
    mad r0.zw, r1.xyxy, r2.xyxy, r3.xyxy
    /* removed 1.0.6.0 filter
    mov r1.y, c53.y
    mad r1.xw, r1.y, c13.xyzy, r0.zyzw
    texld r2, r1.xwzw, s15
    add r1.x, r1.z, -r2.x
    cmp r1.x, r1.x, c3.x, c3.y
    mad r2.xy, r1.y, c13.zwzw, r0.zwzw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c3.x, c3.y
    add r1.x, r1.x, r1.w
    mad r2.xy, r1.y, c12, r0.zwzw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c3.x, c3.y
    add r1.x, r1.x, r1.w
    mad r2.xy, r1.y, c12.zwzw, r0.zwzw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c3.x, c3.y
    add r1.x, r1.x, r1.w
    mad r2.xy, r1.y, c11, r0.zwzw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c3.x, c3.y
    add r1.x, r1.x, r1.w
    mad r2.xy, r1.y, c11.zwzw, r0.zwzw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c3.x, c3.y
    add r1.x, r1.x, r1.w
    mad r2.xy, r1.y, c10, r0.zwzw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c3.x, c3.y
    add r1.x, r1.x, r1.w
    mad r2.xy, r1.y, c10.zwzw, r0.zwzw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c3.x, c3.y
    add r1.x, r1.x, r1.w
    mad r2.xy, r1.y, c9, r0.zwzw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c3.x, c3.y
    add r1.x, r1.x, r1.w
    mad r2.xy, r1.y, c9.zwzw, r0.zwzw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c3.x, c3.y
    add r1.x, r1.x, r1.w
    mad r2.xy, r1.y, c8, r0.zwzw
    mad r0.zw, r1.y, c8, r0
    texld r3, r0.zwzw, s15
    add r0.z, r1.z, -r3.x
    cmp r0.z, r0.z, c3.x, c3.y
    texld r2, r2, s15
    add r0.w, r1.z, -r2.x
    cmp r0.w, r0.w, c3.x, c3.y
    add r0.w, r1.x, r0.w
    add r0.z, r0.z, r0.w
    rcp r0.w, c53.w
    mul r0.w, r0.y, r0.w
    add r0.y, r0.y, -c53.w
    cmp r1.xy, r0.y, c7, c7.zwzw
    mul r0.y, r0.w, r0.w
    mul r0.y, r0.y, c3.z
    mad r0.y, r0.z, c3.w, r0.y
    add r0.z, r1.y, r0.y
    cmp_sat r0.y, r0.z, r0.y, r1.x
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
	add r23.w, r0.x, -r23.y
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
	add r1.z, r1.z, -r25.x // apply per cascade bias
	
	dp4 r20.z, r21_abs, c120 // fix pixels leaking into other cascades
	dp4 r20.w, r21_abs, c121
	
	mov r21.x, c110.y
	if_lt c223.y, r21.x
		mov r21.xy, c112.xy
		mul r21.xy, r21.xy, c44.xy
		dp2add r21.y, v0, r21, c112.w
		mad r21.y, r21.y, c111.x, c111.y
		frc r21.y, r21.y
		mad r21.y, r21.y, c111.z, c111.w
		sincos r22.xy, r21.y
		mul r23, r22.yxxy, c110.xxyz
		mul r21, r22.yxxy, c113.xxyz
		mul r20.xy, r20.xy, c112.x
		mad r23, r23, r20.xyxy, r0.zwzw
		mad r21, r21, r20.xyxy, r0.zwzw
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
		add r25, r1.z, -r25
		cmp r25, r25, c110.y, c110.w
		dp4 r20.x, r25, -c110.x
	else
		mul r24.xy, c44.xy, v0.xy
		mul r24.xy, r24.xy, c112.z
		texldl r24, r24, s10
		mul r24.x, r24.z, c111.z
		sincos r25.xy, r24.x
		mul r25, r25.xyyx, c110.yzyy
		mul r20.xy, r20.xy, c112.x
		mul r26, c130.xyxy, r25
		add r27.xy, r26.xzxz, r26.ywyw
		mul r26, c130.zwzw, r25
		add r27.zw, r26.xzxz, r26.ywyw
		mad r26, r27, r20.xyxy, r0.zwzw
		max r26.xz, r26, r20.z
		min r26.xz, r26, r20.w
		texldl r28, r26.xy, s15
		texldl r27, r26.zw, s15
		mov r28.y, r27.x
		mul r26, c131.xyxy, r25
		add r27.xy, r26.xzxz, r26.ywyw
		mul r26, c131.zwzw, r25
		add r27.zw, r26.xzxz, r26.ywyw
		mad r26, r27, r20.xyxy, r0.zwzw
		max r26.xz, r26, r20.z
		min r26.xz, r26, r20.w
		texldl r27, r26.xy, s15
		mov r28.z, r27.x
		texldl r27, r26.zw, s15
		mov r28.w, r27.x
		add r28, r1.z, -r28
		cmp r28, r28, c110.y, c110.w
		dp4 r29.x, r28, -c110.x
		mul r26, c132.xyxy, r25
		add r27.xy, r26.xzxz, r26.ywyw
		mul r26, c132.zwzw, r25
		add r27.zw, r26.xzxz, r26.ywyw
		mad r26, r27, r20.xyxy, r0.zwzw
		max r26.xz, r26, r20.z
		min r26.xz, r26, r20.w
		texldl r28, r26.xy, s15
		texldl r27, r26.zw, s15
		mov r28.y, r27.x
		mul r26, c133.xyxy, r25
		add r27.xy, r26.xzxz, r26.ywyw
		mul r26, c133.zwzw, r25
		add r27.zw, r26.xzxz, r26.ywyw
		mad r26, r27, r20.xyxy, r0.zwzw
		max r26.xz, r26, r20.z
		min r26.xz, r26, r20.w
		texldl r27, r26.xy, s15
		mov r28.z, r27.x
		texldl r27, r26.zw, s15
		mov r28.w, r27.x
		add r28, r1.z, -r28
		cmp r28, r28, c110.y, c110.w
		dp4 r29.y, r28, -c110.x
		mul r26, c134.xyxy, r25
		add r27.xy, r26.xzxz, r26.ywyw
		mul r26, c134.zwzw, r25
		add r27.zw, r26.xzxz, r26.ywyw
		mad r26, r27, r20.xyxy, r0.zwzw
		max r26.xz, r26, r20.z
		min r26.xz, r26, r20.w
		texldl r28, r26.xy, s15
		texldl r27, r26.zw, s15
		mov r28.y, r27.x
		mul r26, c135.xyxy, r25
		add r27.xy, r26.xzxz, r26.ywyw
		mul r26, c135.zwzw, r25
		add r27.zw, r26.xzxz, r26.ywyw
		mad r26, r27, r20.xyxy, r0.zwzw
		max r26.xz, r26, r20.z
		min r26.xz, r26, r20.w
		texldl r27, r26.xy, s15
		mov r28.z, r27.x
		texldl r27, r26.zw, s15
		mov r28.w, r27.x
		add r28, r1.z, -r28
		cmp r28, r28, c110.y, c110.w
		dp4 r29.z, r28, -c110.x
		mul r26, c136.xyxy, r25
		add r27.xy, r26.xzxz, r26.ywyw
		mul r26, c136.zwzw, r25
		add r27.zw, r26.xzxz, r26.ywyw
		mad r26, r27, r20.xyxy, r0.zwzw
		max r26.xz, r26, r20.z
		min r26.xz, r26, r20.w
		texldl r28, r26.xy, s15
		texldl r27, r26.zw, s15
		mov r28.y, r27.x
		mul r26, c137.xyxy, r25
		add r27.xy, r26.xzxz, r26.ywyw
		mul r26, c137.zwzw, r25
		add r27.zw, r26.xzxz, r26.ywyw
		mad r26, r27, r20.xyxy, r0.zwzw
		max r26.xz, r26, r20.z
		min r26.xz, r26, r20.w
		texldl r27, r26.xy, s15
		mov r28.z, r27.x
		texldl r27, r26.zw, s15
		mov r28.w, r27.x
		add r28, r1.z, -r28
		cmp r28, r28, c110.y, c110.w
		dp4 r29.w, r28, -c110.x
		dp4 r20.x, r29, -c110.x
	endif
    
    rcp r20.y, c53.w
    mul_sat r20.y, r20.y, r0.y
    mul r20.y, r20.y, r20.y
    lrp r0.y, r20.y, c110.y, r20.x // improved fadeout
	// ----------------------------------------------------------------------------------------------------------------------------------------------
    /* moved normal
    texld r1, v0, s1
    mul r2.xyz, r1.w, c0.yzww
    frc r2.xyz, r2
    add r3.xyz, r2, r2
    mad r3.xy, r2.yzzw, -c1.x, r3
    mad r1.xyz, r1, c1.y, r3
    add r1.xyz, r1, c1.z
    nrm r2.xyz, r1
    moved normal */
    mov r2.xyz, r31.xyz
    mad r1.xyz, v1, -r0.x, c1.w
	// ----------------------------------------------------------- Console Tree Lighting ------------------------------------------------------------
	texld r21, v0, s6
	add r21.yz, r21.x, -c22
	add_sat r21.yz, -r21_abs, c23.x
	add r21.x, r21.y, r21.z
	mov r21.y, c223.x
	add r21.y, r21.y, -c21.y
	cmp r21.y, -r21_abs.y, r21.x, c3.y	// Console tree lighting toggle
	if_eq r21.y, c3.y
		mul r0.xzw, r0.x, v1.xyyz
		nrm r3.xyz, r1
		dp3 r1.x, r3, r2
		add r1.y, r1.x, r1.x
		add r1.x, -r1_abs.x, c2.w
		mul r1.x, r1.x, r1.x
		mul r1.x, r1.x, r1.x
		mad r1.x, r1.x, c5.y, c5.z
		mad r1.yzw, r2.xxyz, -r1.y, r3.xxyz
		dp3_sat r2.w, -c17, r1.yzww
		add r2.w, r2.w, c2.y
		texld r4, v0, s2
		mul r3.w, r4.y, r4.y
		mad r4.y, r3.w, c2.z, c2.y
		mul r3.w, r3.w, c0.x
		mul_sat r3.w, r3.w, c72.x
		mad r5.w, r3.w, -c5.x, c5.x
		pow r3.w, r2.w, r4.y
		mul r6.xyz, c18.w, c18
		mul r7.xyz, r3.w, r6
		mul r7.xyz, r0.y, r7
		dp3 r0.x, r3, -r0.xzww
		mul_sat r0.xz, r0.x, c4.zyww
		mad r1.yzw, r3.xxyz, r0.x, r1
		add r0.x, -r0.z, c2.w
		add r1.yzw, r1, c1.w
		nrm r3.xyz, r1.yzww
		mul_sat r0.z, r3.z, c5.w
		mov_sat r0.w, r3.z
		add r0.w, r0.w, c2.w
		add r0.w, r0.w, r0.w
		rcp r0.w, r0.w
		mad r1.yz, r3.xxyw, r0.w, c4.y
		add r5.xy, -r1.yzzw, c2.w
		mov r5.z, c3.y
		texldl r3, r5, s5
		mul r3, r3, c20.x	// reflection intensity tweak
		mul r1.yzw, r0.z, r3.xxyz
		mul r0.xzw, r0.x, r1.yyzw
		mul r0.xzw, r4.z, r0
		mul r0.xzw, r0, c39.w
		mul r0.xzw, r1.x, r0
		mul r0.xzw, r0, c6.x
		add r1.x, c17.w, c17.w
		mad r0.xzw, r7.xyyz, r1.x, r0
		add r1.x, r4.x, r4.x
		mul r0.xzw, r0, r1.x
		dp3 r1.x, r2, -c17
		mad_sat r1.y, r2.z, c4.x, c4.y
		mov r2.xyz, c38
		mad r1.yzw, r2.xxyz, r1.y, c37.xxyz
		
		mul r21.x, r21.x, c223.x
		dp3 r10.x, r1.yzw, c24
		lrp r11.yzw, c24.w, r1, r10.x
		cmp r1.yzw, -r21_abs.x, r1, r11 // Tree orange glow tweak
		
		mul r1.yzw, r4.z, r1
		add r1.x, r1.x, -c1.x
		mul_sat r1.x, r1.x, c2.x
		mul r2.xyz, r6, r1.x
		mad r1.xyz, r2, r0.y, r1.yzww
		texld r2, v0, s0
		mad oC0.xyz, r2, r1, r0.xzww
		mov oC0.w, c2.w
	else
		mov r8.x, r0.y
		
		nrm r3.xyz, r1
		
		//dot(viewDir, normal)
		dp3 r4.y, r3.xyz, r2.xyz
		//saturate(viewDir.z)
		mov_sat r4.x, r3.z
		//                 (3, 2, 1)
		add r0.xyz, r4.yxy, c21.xyz
		
		add r1.y, r0.y, r4.x
		rcp r1.y, r1.y
		//                        0.5
		mad r1.yz, r3.yxyx, r1.y, c4.yy
		//                    1
		add r1.yz, -r1.yzyz, c3.x
		
		mov r1.xy, r1.zy
		//0
		mov r1.z, c3.y
		//4
		mov r1.w, c5.x
		texldl r4.xyz, r1, s5
		
		//viewDir.z * -0.5 + 0.5
		mad_sat r1.y, r3.z, c4.x, c4.y
		
		mul r6.xyz, c18.xyz, c18.w
		//dot(normal, -dirLight) * dirLightColor
		dp3_sat r0.w, r2.xyz, -c17.xyz
		mul r5.xyz, r6, r0.w
		
		//saturate(viewDir.z * 2)
		add_sat r0.w, r3.z, r3.z
		
		//remappedViewDir.z * ambient1 + ambient0
		mov r8.yzw, c38.xxyz
		mad r1.yzw, r1.y, r8.yyzw, c37.xxyz
		
		//paraboloid - ambient
		add r4.xyz, -r1.yzw, r4.xyz
		
		//        0.25
		mul r2.w, c1.x, r0.x
		
		//parabAmbient * saturate(viewDir.z * 2) + ambient
		mad r4.xyz, r4.xyz, r0.w, r1.yzw
		
		max r1.yzw, r4.xxyz, r1.yyzw
		//        0.25
		mul r0.w, c1.x, r0.z
		
		mul r0.xyz, r2.w, r1.yzw
		//diffuseLight * shadow + r0
		mad r0.xyz, r5.xyz, r8.x, r0.xyz
		
		//diffuse * r0
		texld r2.xyz, v0, s0
		mul r0.xyz, r0.xyz, r2.xyz
		
		mul r0.w, r0.w, r0.w
		
		mad oC0.xyz, r0.w, r1.yzw, r0.xyz
		mov oC0.w, c2.w
	endif
	// ----------------------------------------------------------------------------------------------------------------------------------------------

// approximately 167 instruction slots used (18 texture, 149 arithmetic)
