# GTAIV.EFLC.FusionShaders
Various shader fixes and improvements for [GTAIV.EFLC.FusionFix](https://github.com/ThirteenAG/GTAIV.EFLC.FusionFix).

Special thanks to my friends [AssaultKifle47](https://github.com/akifle47/), [RaphaelK12](https://github.com/RaphaelK12), [robi29](https://github.com/robi29/) and [\_CP_](https://github.com/cpmodding) for directly contributing with fixes, to [Shvab](https://github.com/d3g0n-byte) for making RAGE Shader Editor and to [ThirteenAG](https://github.com/ThirteenAG) for implementing features we requested into FusionFix.

# General
- Fixed z-fighting by implementing a logarithmic depth buffer
- Fixed LOD pop-in
- Removed unnecessary stippled transparency from hundreds of shaders
- Added 256 tile stipple for smoother transparency and LOD transitions
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
- Added experimental support for simultaneous headlight and vehicle shadows
# Post processing
- Added a mask for the dithering filter to only smooth out stippled objects instead of the whole screen
- Fixed depth of field and bloom resolution scaling
- Fixed excessively blurred screen compared to consoles
- Added native anti aliasing
- Ported console bloom and auto exposure
- Fixed motion blur framerate scaling
- Increased motion blur quality (reduced noisiness)
- Split depth of field and motion blur into dedicated settings
- Restored console TLAD noise effect
- Restored console gamma
# Reflections
- Fixed excessive wetness/specularity of various surfaces
- Fixed blocky vehicle reflections
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
- Added optional opaque wires and bridge cables
- Added a new shader exclusively for trees

# To-do:
- Fix water foam
- Implement shadow cascade blending
- Fix uncolored broken glass shards
- Fix color/sky banding