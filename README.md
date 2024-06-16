# GTAIV.EFLC.FusionShaders
Various shader fixes and improvements for GTA IV FusionFix.

Special thanks to my friends [AssaultKifle47](https://github.com/akifle47/), [robi29](https://github.com/robi29/) and [\_CP_](https://github.com/cpmodding) for directly contributing fixes, to [RaphaelK12](https://github.com/RaphaelK12) for fixes and for making a [realtime shader editor](https://github.com/RaphaelK12/ShadowResFix), to [Shvab](https://github.com/d3g0n-byte) for making RAGE Shader Editor, to [ThirteenAG](https://github.com/ThirteenAG) for implementing features we requested into FusionFix and to everyone else from the Fusion Team for their support.

# General
- Fixed z-fighting
- Fixed LOD pop-in
- Improved screen door transparency
# Lighting
- Fixed volumetric lights occlusion
- Ported console foliage translucency
- Added a new tree lighting mode faithful to PC with fixed orange glow and AO
- Fixed mismatched intensity of shadow casting lights
# Shadows
- Ported shadow filter from patches prior to 1.0.6.0
- Added a custom shadow filter for new definition modes
- Fixed shadow artifacts visible at high altitudes
- Fixed shadows being erroneously blurred before the lighting pass
- Fixed shadows stretching at certain camera angles
- Improved shadow view distance and fixed cutoff penumbras of distant shadows
- Fixed disconnected shadows on all graphics settings
- Fixed cuts between shadow cascades under some conditions
- Added "pseudo" shadow cascade blending
- Fixed pitch black vehicle shadows
- Added wind sway for tree shadows
- Fixed incorrectly offset shadows on water
- Fixed flickering when shadows of transparent objects overlap
# Post processing
- Split depth of field, motion blur and stipple filter into separate passes to prevent overlap
- Fixed color banding, most noticeably in the sky
- Added new "definition" modes using a mask to selectively filter transparency
- Fixed depth of field and bloom not scaling correctly at resolutions higher than 720p
- Fixed excessively blurry screen compared to consoles caused by leftover anti aliasing code
- Ported console bloom and auto exposure
- Fixed instantaneous auto exposure in some weathers
- Fixed motion blur not scaling properly at high framerates
- Fixed TLAD noise being affected by water quality and corrected its aspect ratio
- Added console-like gamma
# Reflections
- Fixed excessive specularity of several surfaces, especially when it rains
- Fixed blocky vehicle reflections
- Reduced corona intensity in reflections
- Fixed anisotropic filtering affecting reflection intensity
- Restored console vehicle reflection intensity relative to dirt level
- Increased global reflection intensity to match consoles
- Fixed distorted mirror reflections at certain camera angles
- Restored console mirror blur
# Particles
- Restored soft particles
- Improved rain visibility, especially at night
- Fixed rain streaks becoming shorter at high framerates
# Water
- Fixed water texture tiling on all quality settings
- Fixed flat water surface on AMD graphics cards
# Misc
- Fixed normal map halos on several surfaces such as asphalt, sidewalks and rocks
- Partially fixed building windows glowing through the fog at very long distances if emissive depth write is disabled
- Adjusted tree mipmap bias to improve texture detail at long distances
- Ported fence mipmap bias from consoles and previous patches
- Added parameters to control shadow softness, shadow bias and tree transparency
- Fixed wrong texture filtering used in several shaders
- Added AO to gta_normal_spec_reflect_emissive if emissivity is 0 so it can be used to disable night shadows for certain objects
- Partially fixed mirror depth
- Fixed lights that were made invisible with patch 1.0.6.0
- Added support to instantaneously toggle lampposts alongside their lighting
# Screenshots
[![pic1.png](https://i.postimg.cc/kgjksBM7/pic1.png)](https://postimg.cc/18qC5RNd)
[![pic2.png](https://i.postimg.cc/fLdpMCcb/pic2.png)](https://postimg.cc/njH0kvw8)
[![pic3.png](https://i.postimg.cc/HxbZqxmc/pic3.png)](https://postimg.cc/bDN9bqsp)
[![pic4.png](https://i.postimg.cc/W1fHrCS3/pic4.png)](https://postimg.cc/hXTsRCkW)
[![pic5.png](https://i.postimg.cc/PJz7wqFs/pic5.png)](https://postimg.cc/PvJKGdj2)
[![pic6.png](https://i.postimg.cc/KcnwV9cq/pic6.png)](https://postimg.cc/z3GxHFgK)
[![treefx.png](https://i.postimg.cc/KY6ppT6h/treefx.png)](https://postimg.cc/bGRRsZYm)
[![amdwater.png](https://i.postimg.cc/t40bP1gw/amdwater.png)](https://postimg.cc/ykT2C8cy)
[![cars.png](https://i.postimg.cc/BQRSgYmh/cars.png)](https://postimg.cc/zVSYDjZW)
[![depthbias.png](https://i.postimg.cc/ZKWY6txB/depthbias.png)](https://postimg.cc/Xp000Ph4)
[![depthbias2.png](https://i.postimg.cc/V6NP1n7r/depthbias2.png)](https://postimg.cc/d7gxjkcw)
[![dof.png](https://i.postimg.cc/0NJGHyRT/dof.png)](https://postimg.cc/3yYDk7w1)
[![emissivestrong.png](https://i.postimg.cc/HkQgtpcx/emissivestrong.png)](https://postimg.cc/pmX4WMBb)
[![forwardstipple.png](https://i.postimg.cc/52tWzZdY/forwardstipple.png)](https://postimg.cc/JGSFVYhM)
[![softparticles.png](https://i.postimg.cc/Qt6sW0BJ/softparticles.png)](https://postimg.cc/5YFDh5SX)
[![vertexao.png](https://i.postimg.cc/L8kc1Nwg/vertexao.png)](https://postimg.cc/LJXQdBHm)
[![volumetrics.png](https://i.postimg.cc/bNnczzRT/volumetrics.png)](https://postimg.cc/GHbSKnV8)
[![wetness.png](https://i.postimg.cc/mrb0N7WX/wetness.png)](https://postimg.cc/K1HqmkzB)