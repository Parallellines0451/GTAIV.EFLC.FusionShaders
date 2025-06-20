# GTAIV.EFLC.FusionShaders
Shaders repository of [FusionFix](https://github.com/ThirteenAG/GTAIV.EFLC.FusionFix).

Grand Theft Auto IV on PC is a very subpar port to say the least. Countless graphical effects were broken, removed or changed for the worse compared to the console releases and even previous versions of the game on PC. This repository seeks to fix as many of these issues as possible, as well as add some new features while staying true to the original art direction.

#### Recommended additions:
- [DXVK](https://github.com/doitsujin/dxvk/) to improve performance
- [Console Visuals](https://github.com/Tomasak/Console-Visuals) to restore trees, suits, animations and several other features from consoles
- [Various Fixes](https://github.com/valentyn-l/GTAIV.EFLC.Various.Fixes) to fix hundreds of bugs and oversights around the map
- [Ash_735's Workshop](https://gtaforums.com/topic/887527-ash_735s-workshop/) to faithfully improve the texture quality of various game assets
- [_AG's repositories](https://github.com/gennariarmando) for interface improvements and other interesting features
- [Radio Restorer](https://github.com/Tomasak/GTA-Downgraders/releases/tag/iv-latest) to bring back the game's removed songs

## Feature list
#### General
- Fixed z-fighting
- Fixed object pop-in caused by version 1.0.6.0
- Improved screen door transparency
#### Lighting
- Fixed volumetric lights occlusion
- Improved light volume transparency
- Restored XBOX foliage translucency
- Improved PC foliage lighting
- Fixed mismatched intensity of shadow casting lights causing visible pop-in
- Fixed lights that were made invisible with version 1.0.6.0
- Fixed black normal map halos on several surfaces such as asphalt, sidewalks and rocks
- Added support to disable the directional lighting clamp
#### Shadows
- Restored rotated disk filter from versions prior to 1.0.6.0
- Fixed large shadow artifacts visible from high altitudes
- Fixed shadowmap being erroneously blurred before the lighting pass
- Fixed shadows stretching at certain camera angles
- Fixed shadow view distance being lower than the actual rendered distance
- Fixed cutoff penumbras of distant shadows
- Restored normal offset bias from versions prior to 1.0.6.0
- Added contact hardening shadows
- Fixed disconnected night shadows
- Fixed blur artifacts between shadow cascades under some conditions
- Added "pseudo" shadow cascade blending to reduce the disparity between cascades
- Fixed pitch black static vehicle shadows
- Added wind sway for dynamic tree shadows
- Fixed incorrectly offset shadows on water
- Fixed flickering when shadows of transparent objects overlap
- Added parameters to control shadow softness and bias
#### Post processing
- Split depth of field, motion blur and stippling filter into separate passes to prevent overlap
- Fixed color banding, most noticeably in the sky
- Added a mask to selectively filter screen door transparency
- Fixed depth of field and bloom not scaling correctly at resolutions higher than 720p
- Improved bloom weights and stability in motion
- Added optional circular bloom
- Fixed excessively blurry screen compared to consoles caused by leftover anti aliasing code
- Restored console bloom and auto exposure
- Fixed flickering auto exposure
- Fixed motion blur losing intensity at high framerates
- Fixed incorrect TLAD noise tiling on water quality levels other than medium
- Fixed TLAD noise aspect ratio
- Added an XBOX gamma toggle
- Added radial height based exponential fog
- Added tone mapping
#### Reflections
- Restored console behavior for tree and terrain reflections
- Fixed excessive specularity of several meshes in Alderney
- Fixed distorted vehicle reflections
- Restored corona depth test in water reflections
- Added fading to coronas in paraboloid reflections
- Fixed anisotropic filtering affecting vehicle reflection intensity
- Restored console vehicle reflection behavior relative to dirt level
- Restored console environment reflection intensity
- Fixed distorted mirror reflections at certain camera angles
#### Particles
- Fixed soft particles
- Fixed stuttery particle animations caused by version 1.0.5.0
- Fixed rain being almost invisible, especially at night
- Fixed rain streaks becoming shorter at high framerates
#### Water
- Fixed flickering outlines around shores and thin objects
- Fixed offset water reflections
- Fixed invisible water foam
- Improved shallow water transparency and improved foam texture
- Fixed incorrect water texture tiling on quality levels other than medium
- Fixed flat, mirror-like water surface on AMD graphics cards
#### Misc
- Added optional toggle for alternative cloud shading
- Fixed outlines around objects when using DXVK
- Fixed terrain pop-in
- Partially fixed building windows visible near the far plane if emissive depth write is disabled
- Restored fence mipmap bias from versions prior to 1.0.6.0
- Fixed incorrect texture filtering used in several shaders
- Added a parameter to control the alpha threshold of tree leaves
- Added AO to gta_normal_spec_reflect_emissive if emissivity is 0 so it can be used to disable night shadows for certain objects
- Partially fixed mirror depth
- Added support to instantaneously turn lamppost bulbs on or off

## Conclusion
Special thanks to [RaphaelK12](https://github.com/RaphaelK12), [AssaultKifle47](https://github.com/akifle47/), [robi29](https://github.com/robi29/), [\_CP_](https://github.com/cpmodding), [Shvab](https://github.com/d3g0n-byte), [ThirteenAG](https://github.com/ThirteenAG) and [brokensymmetry](https://github.com/sTc2201) for helping make it all possible.

Tools and resources used:
- [Rage Shader Editor](https://gtaforums.com/topic/984675-rage-shader-editor/)
- [ShadowResFix](https://github.com/RaphaelK12/ShadowResFix)
- [Logarithmic Depth Buffer](https://github.com/Parallellines0451/GTAIV.EFLC.LogDepth)
