# GTAIV.ShaderFixesCollection
Various shader fixes and improvements for GTA IV 1.0.7.0, 1.0.8.0 and Complete Edition.

# Main features list
- Fixed z-fighting
- Fixed LOD pop-in
- Fixed soft particles
- Ported 1.0.4.0 shadow filter
- Fixed light dimming/pop-in
- Wires and bridge cables are now opaque and cast shadows
- Ported console foliage translucency
- Added a new shader exclusively for trees and tree mods to use
- Fixed broken shadows following the player at high altitudes
- Fixed invisible lamp glass at day
- Fixed improper explosion texture alpha
- Fixed volumetric light shafts
- Fixed depth of field and bloom resolution scaling
- Fixed blurry screen
- Added native FXAA
- Repurposed Definition setting into a motion blur toggle
- Console-style TLAD noise tiling
- Fixed vehicle reflections
- Fixed anisotropic filtering affecting reflection intensity
- Restored console-style vehicle reflections (intensity not affected by dirt)
- Increased ambient reflection intensity to match consoles
- Fixed disconnected shadows ("peter panning")
- Fixed stippled character eyewear
- Fixed excessively strong vertex AO and static vehicle shadows
- Added wind sway support for real tree shadows
- Fixed improper water shadow stretching
- Fixed distorted mirror reflections
- Fixed invisible gta_emissivestrong lights
- Console-style water texture tiling
- Fixed textureless water on AMD graphics cards
- Improved rain visibility
- Console-like gamma

# Notes
<b>This repository is part of [FusionFix](https://github.com/ThirteenAG/GTAIV.EFLC.FusionFix). ENBSeries or game versions prior to 1.0.7.0 are not compatible.

Special thanks to my friends [AssaultKifle47](https://github.com/akifle47/), [RaphaelK12](https://github.com/RaphaelK12), [robi29](https://github.com/robi29/) and [\_CP_](https://github.com/cpmodding) for directly contributing with their own fixes, to [Shvab](https://github.com/d3g0n-byte) for making RAGE Shader Editor and to [ThirteenAG](https://github.com/ThirteenAG) for implementing features we requested into FusionFix.

Their shader repositories, which also have lots of cool stuff:
- [GTA4-Improved-Soft-Shadows](https://github.com/RaphaelK12/GTA4-Improved-Soft-Shadows)
- [GTA-IV-Shaders](https://github.com/robi29/GTA-IV-Shaders)

# To-do:
- Fix water foam
- Fix improper emissive LOD crossfade
- Fix depth bias on lower shadow settings
- Implement multiple toggleable shadow filters
- Implement shadow cascade blending
- Port Xbox mirror shader
- Fix uncolored broken glass shards
