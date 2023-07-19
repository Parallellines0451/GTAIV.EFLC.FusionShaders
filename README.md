# GTAIV.ShaderFixesCollection
Various shader fixes and improvements for GTA IV 1.0.7.0, 1.0.8.0 and Complete Edition.

# Main features list
- Fixed LOD fading
- Removed unnecessary stippled transparency from various objects and shadows
- Fixed volumetric light shafts
- Fixed depth of field and bloom resolution scaling
- Fixed blurry screen
- Repurposed Definition setting into a motion blur toggle
- Reduced motion blur noise
- Console-style TLAD noise tiling
- Fixed vehicle normal maps thanks to AssaultKifle47
- Fixed reduced reflection intensity while using anisotropic filtering
- Restored console-style vehicle reflections
- Increased ambient reflection intensity to match consoles
- Native FXAA and improved shadow filtering thanks to RaphaelK12
- Fixed disconnected cascaded shadow maps
- Fixed excessively strong vertex AO and static vehicle shadows
- Added wind sway support for "real" tree shadows
- Fixed water shadow stretching, disconnected night shadows and mirror reflections thanks to robi29 & \_CP_
- Fixed invisible "emissivestrong" lights
- Console-style water texture tiling
- Fixed textureless water on AMD graphics cards
- Improved rain visibility
- Fixed black water droplets on screen (although refraction isn't restored yet)
- Console-like gamma (disabled by default)
- **[Per .fxc changelog](changelog.md)**

# Screenshots
[![dof.png](https://i.postimg.cc/L4kcRwfp/dof.png)](https://postimg.cc/jC5g48Zg)
[![dof2.png](https://i.postimg.cc/KvZdYfrg/dof2.png)](https://postimg.cc/MXFsPyLW)
[![2023-06-19-38.png](https://i.postimg.cc/h4Vmpbmv/2023-06-19-38.png)](https://postimg.cc/3WJWwGnQ)
[![gammacomp2.png](https://i.postimg.cc/qRQ494FR/gammacomp2.png)](https://postimg.cc/ZB9GNt4t)
[![Grand-Theft-Auto-IV-2023-06-26-01-57.png](https://i.postimg.cc/cLyJ1X4h/Grand-Theft-Auto-IV-2023-06-26-01-57.png)](https://postimg.cc/F7pvDbSk)
[![Grand-Theft-Auto-IV-2023-06-26-06-15-1.png](https://i.postimg.cc/SNzspwqj/Grand-Theft-Auto-IV-2023-06-26-06-15-1.png)](https://postimg.cc/9rCVdgDj)
[![bloom.png](https://i.postimg.cc/pTBLRDmP/bloom.png)](https://postimg.cc/8JjSbfdY)
[![2023-06-19-31.png](https://i.postimg.cc/RVCWd1d7/2023-06-19-31.png)](https://postimg.cc/c6j14nVC)
[![2023-06-21-1.png](https://i.postimg.cc/nrn1tdN7/2023-06-21-1.png)](https://postimg.cc/ygrRmT1Y)
[![refl2.png](https://i.postimg.cc/1RYpg5Dc/refl2.png)](https://postimg.cc/bdkGWPCs)
[![2023-06-19-27.png](https://i.postimg.cc/y8xtmNG1/2023-06-19-27.png)](https://postimg.cc/QFLfsjsw)
[![2023-06-19-32.png](https://i.postimg.cc/6pyyJ9DT/2023-06-19-32.png)](https://postimg.cc/SnbycpQp)
[![2023-06-19-33.png](https://i.postimg.cc/bJtnX1F6/2023-06-19-33.png)](https://postimg.cc/343Nm0hp)
[![2023-06-19-34.png](https://i.postimg.cc/P5SY1XwM/2023-06-19-34.png)](https://postimg.cc/jDJDbrvW)

# Notes
Most shaders are commented; feel free to include any of them in your projects or to improve upon them, which there will definitely be room for. Use the C++ version of [RAGE Shader Editor](https://gtaforums.com/topic/984675-rage-shader-editor/) to reassemble them.

Special thanks to my friends AssaultKifle47, RaphaelK12, robi29 and \_CP_ for their support and contributions, to Shvab for making RAGE Shader Editor and to ThirteenAG for implementing some features we requested into FusionFix.

Their repositories, which also have lots of cool stuff:
- [GTA4-Improved-Soft-Shadows](https://github.com/RaphaelK12/GTA4-Improved-Soft-Shadows)
- [GTA-IV-Shaders](https://github.com/robi29/GTA-IV-Shaders)
- [FusionFix](https://github.com/ThirteenAG/GTAIV.EFLC.FusionFix)

# To-do:
- ~~Fix screen water droplet refraction~~ - needs code injection
- ~~Fix the broken post 1.0.6.0 tree shadows~~ - done by FusionFix
- Fix translucent wires, powerlines and bridge cables
- Fix the water foam
