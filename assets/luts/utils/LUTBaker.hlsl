// Linear <-> SRGB

float LinearToSRGB( float v )
{
    return ( v <= 0.0031308f ) ? 12.92f * v : 1.055f * pow( abs( v ), 1.0f / 2.4f ) - 0.055f;
}

float3 LinearToSRGB( float3 v )
{
    return float3( LinearToSRGB( v.x ), LinearToSRGB( v.y ), LinearToSRGB( v.z ) );
}

float SRGBToLinear( float v )
{
	return ( v <= 0.04045f ) ? v / 12.92f : pow( ( v + 0.055f ) / 1.055f, 2.4f );
}

float3 SRGBToLinear( float3 v )
{
    return float3( SRGBToLinear( v.x ), SRGBToLinear( v.y ), SRGBToLinear( v.z ) );
}

// Linear <-> PQ
// https://www.ea.com/frostbite/news/high-dynamic-range-color-grading-and-display-in-frostbite

static const float PQ_constant_N = (2610.0 / 4096.0 / 4.0);
static const float PQ_constant_M = (2523.0 / 4096.0 * 128.0);
static const float PQ_constant_C1 = (3424.0 / 4096.0);
static const float PQ_constant_C2 = (2413.0 / 4096.0 * 32.0);
static const float PQ_constant_C3 = (2392.0 / 4096.0 * 32.0);

// PQ (Perceptual Quantiser; ST.2084) encode/decode used for HDR TV and grading
float3 linearToPQ(float3 linearCol, const float maxPqValue)
{
    linearCol /= maxPqValue;

    float3 colToPow = pow(linearCol, PQ_constant_N);
    float3 numerator = PQ_constant_C1 + PQ_constant_C2*colToPow;
    float3 denominator = 1.0 + PQ_constant_C3*colToPow;
    float3 pq = pow(numerator / denominator, PQ_constant_M);

    return pq;
}

float3 PQtoLinear(float3 linearCol, const float maxPqValue)
{
    float3 colToPow = pow(linearCol, 1.0 / PQ_constant_M);
    float3 numerator = max(colToPow - PQ_constant_C1, 0.0);
    float3 denominator = PQ_constant_C2 - (PQ_constant_C3 * colToPow);
    float3 linearColor = pow(numerator / denominator, 1.0 / PQ_constant_N);

    linearColor *= maxPqValue;

    return linearColor;
}

// Draw LUT
// https://github.com/Fubaxiusz/shadron-shaders/blob/master/Shaders/Neutral%20LUT.shadron
#define Size 32.0
float3 DisplayLutPS(float2 TexCoord)
{
	// Generate pattern UV
	float2 Gradient;
	Gradient.x = TexCoord.x * Size;
	Gradient.y = TexCoord.y;
	// Convert pattern to RGB LUT
	float3 LUT;
	LUT.rg = frac(Gradient) - 0.5 / Size;
	LUT.rg /= 1.0 - 1.0 / Size;
	LUT.b = floor(Gradient.r) / (Size - 1.0);
	// Display LUT texture
	return LUT;
}

// Example tonemap: ACES fit by Stephen Hill
// https://github.com/TheRealMJP/BakingLab/blob/master/BakingLab/ACES.hlsl

// sRGB => XYZ => D65_2_D60 => AP1 => RRT_SAT
static const float3x3 ACESInputMat =
{
    {0.59719, 0.35458, 0.04823},
    {0.07600, 0.90834, 0.01566},
    {0.02840, 0.13383, 0.83777}
};

// ODT_SAT => XYZ => D60_2_D65 => sRGB
static const float3x3 ACESOutputMat =
{
    { 1.60475, -0.53108, -0.07367},
    {-0.10208,  1.10813, -0.00605},
    {-0.00327, -0.07276,  1.07602}
};

float3 RRTAndODTFit(float3 v)
{
    float3 a = v * (v + 0.0245786f) - 0.000090537f;
    float3 b = v * (0.983729f * v + 0.4329510f) + 0.238081f;
    return a / b;
}

float3 ACESFitted(float3 color)
{
    color = mul(ACESInputMat, color);

    // Apply RRT and ODT
    color = RRTAndODTFit(color);

    color = mul(ACESOutputMat, color);

    // Clamp to [0, 1]
    color = saturate(color);

    return color;
}

// Main function

float4 main(float4 pos : SV_Position, float4 uv : TEXCOORD0) : SV_Target0
{
	float3 color = DisplayLutPS(uv.xy);

	color = PQtoLinear(color, 100);
    
	color = ACESFitted(color);
    
    color = LinearToSRGB(color);

    return float4(color, 1.0);
}
