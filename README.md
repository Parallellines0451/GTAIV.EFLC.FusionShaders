# GTAIV.EFLC.FusionShaders
Various shader fixes and improvements for GTA IV FusionFix.

Special thanks to my friends [AssaultKifle47](https://github.com/akifle47/), [robi29](https://github.com/robi29/) and [\_CP_](https://github.com/cpmodding) for directly contributing fixes, to [RaphaelK12](https://github.com/RaphaelK12) for fixes and for making a [realtime shader editor](https://github.com/RaphaelK12/ShadowResFix), to [Shvab](https://github.com/d3g0n-byte) for making RAGE Shader Editor, to [ThirteenAG](https://github.com/ThirteenAG) for implementing features we requested into FusionFix and to everyone else from the Fusion Team for their support.

# General
- [Fixed z-fighting](https://www.youtube.com/watch?v=sAfKfvAIsXw) by implementing a logarithmic depth buffer
- Fixed LOD pop-in
- Removed unnecessary stippled transparency from hundreds of shaders
- Added 256 tile stipple support
# Lighting
- Fixed volumetric light shafts occlusion
- Ported console foliage translucency
- Fixed orange glow under trees
- Added tree vertex AO toggle
- Fixed light dimming/pop-in
# Shadows
- Ported 1.0.4.0 shadow filter and improved its sample count
- Improved night shadow filter
- Fixed broken shadows following the player at high altitudes
- Fixed broken shadows cast by finely detailed objects like fences
- Added percentage closer soft shadows
- Fixed disconnected shadows/peter panning and implemented slope scale depth bias
- Reduced shadow cascade disparity
- Slightly improved shadow fadeout
- Fixed excessively strong vertex AO and static vehicle shadows
- Added wind sway for tree shadows
- Fixed improper water shadow stretching
# Post processing
- Added a mask for the dithering filter to only smooth out stippled objects instead of the whole screen
- Fixed depth of field and bloom resolution scaling
- Fixed excessively blurred screen compared to consoles
- Ported console bloom and auto exposure
- Fixed instantaneous auto exposure delay in some weathers
- Fixed motion blur framerate scaling
- Split depth of field and motion blur into dedicated settings
- Fixed TLAD noise being affected by water quality and corrected its aspect ratio
- Restored console gamma
# Reflections
- Fixed excessive wetness/specularity of various surfaces
- Fixed blocky vehicle reflections
- Reduced corona reflection intensity
- Fixed anisotropic filtering affecting reflection intensity
- Removed influence of vehicle.ide on vehicle reflection intensity
- Increased global reflection intensity to match consoles
- Fixed distorted mirror reflections at certain camera angles
- Restored console mirror filter
# Particles
- Fixed particle seams/restored soft particles
- Improved rain visibility
- Fixed rain framerate scaling
# Water
- Fixed water texture tiling
- Fixed textureless water on AMD graphics cards
# Misc
- Improved mirror depth/placement
- Fixed invisible gta_emissivestrong lights like in the Rotterdam Tower
- Improved window crossfade
- Added lamppost on/off toggle support
# Screenshots
[![pic1.png](https://i.postimg.cc/kgjksBM7/pic1.png)](https://postimg.cc/18qC5RNd)
[![pic2.png](https://i.postimg.cc/fLdpMCcb/pic2.png)](https://postimg.cc/njH0kvw8)
[![pic3.png](https://i.postimg.cc/HxbZqxmc/pic3.png)](https://postimg.cc/bDN9bqsp)
[![pic4.png](https://i.postimg.cc/W1fHrCS3/pic4.png)](https://postimg.cc/hXTsRCkW)
[![pic5.png](https://i.postimg.cc/PJz7wqFs/pic5.png)](https://postimg.cc/PvJKGdj2)
[![pic6.png](https://i.postimg.cc/KcnwV9cq/pic6.png)](https://postimg.cc/z3GxHFgK)
[![treefx.png](https://i.postimg.cc/KY6ppT6h/treefx.png)](https://postimg.cc/bGRRsZYm)
[![pcss.png](https://i.postimg.cc/SQ71VJVH/pcss.png)](https://postimg.cc/vDTvZ8Jv)
[![amdwater.png](https://i.postimg.cc/t40bP1gw/amdwater.png)](https://postimg.cc/ykT2C8cy)
[![cars.png](https://i.postimg.cc/BQRSgYmh/cars.png)](https://postimg.cc/zVSYDjZW)
[![depthbias.png](https://i.postimg.cc/ZKWY6txB/depthbias.png)](https://postimg.cc/Xp000Ph4)
[![depthbias2.png](https://i.postimg.cc/V6NP1n7r/depthbias2.png)](https://postimg.cc/d7gxjkcw)
[![dof.png](https://i.postimg.cc/0NJGHyRT/dof.png)](https://postimg.cc/3yYDk7w1)
[![emissivestrong.png](https://i.postimg.cc/HkQgtpcx/emissivestrong.png)](https://postimg.cc/pmX4WMBb)
[![forwardstipple.png](https://i.postimg.cc/52tWzZdY/forwardstipple.png)](https://postimg.cc/JGSFVYhM)
[![shadowfilter.png](https://i.postimg.cc/5tgWZnmW/shadowfilter.png)](https://postimg.cc/zLyQhwMx)
[![shadowseams.png](https://i.postimg.cc/pTS4H7h4/shadowseams.png)](https://postimg.cc/DJqBQxcP)
[![softparticles.png](https://i.postimg.cc/Qt6sW0BJ/softparticles.png)](https://postimg.cc/5YFDh5SX)
[![vertexao.png](https://i.postimg.cc/L8kc1Nwg/vertexao.png)](https://postimg.cc/LJXQdBHm)
[![volumetrics.png](https://i.postimg.cc/bNnczzRT/volumetrics.png)](https://postimg.cc/GHbSKnV8)
[![wetness.png](https://i.postimg.cc/mrb0N7WX/wetness.png)](https://postimg.cc/K1HqmkzB)

# To-do:
- Fix shore foam