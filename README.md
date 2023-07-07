# GTAIV.ShaderFixesCollection
Various shader fixes and improvements for GTA IV 1.0.7.0, 1.0.8.0 and Complete Edition. The goal is to restore and fix everything from [here](https://libertycity-ru.translate.goog/gta-4/articles/4346-gta-iv-complete-edition-xbox-protiv-pc.html?_x_tr_sl=ru&amp;_x_tr_tl=en&amp;_x_tr_hl=pt-BR).

# Feature list
- Restored LOD fading from 1.0.5.0 and older versions
- Removed stippled transparency from forward rendered objects, near deferred rendered objects and shadows
- Fixed volumetric light shafts
- Improved depth of field and fixed resolution scaling
- Remade bloom shader with proper resolution scaling
- Fixed the entire screen being blurry with definition off
- Improved TLAD noise tiling
- Fixed distorted car reflections thanks to AssaultKifle47
- Fixed reduced reflection intensity caused by anisotropic filtering, especially on cars
- Restored console-style vehicle reflections (no need to edit vehicle.ide and dirt works)
- Increased ambient reflection intensity to match consoles
- Included native FXAA thanks to RaphaelK12
- Included RaphaelK12's 5x5 gaussian shadow filter
- Fixed excessively strong vertex AO and static vehicle shadows
- Improved water texture tiling (console/medium tiling for the very high setting)
- Fixed textureless water on AMD graphics cards
- Fixed invisible "emissivestrong" lights
- Improved rain intensity and made it more visible at night
- Fixed black water droplets on screen (although refraction isn't restored yet)
- Included console-like gamma in rage_postfx (disabled by default)
- Fixed disconnected shadows/excessively high depth bias for cascaded shadow maps
- Included robi29 & \_CP_'s water shadow stretching fix, disconnected night shadow fix and mirror reflection fix

# Fixed depth of field resolution scaling, fixed definition blur and added native FXAA
[![dof.png](https://i.postimg.cc/L4kcRwfp/dof.png)](https://postimg.cc/jC5g48Zg)
[![dof2.png](https://i.postimg.cc/KvZdYfrg/dof2.png)](https://postimg.cc/MXFsPyLW)
[![2023-06-19-38.png](https://i.postimg.cc/h4Vmpbmv/2023-06-19-38.png)](https://postimg.cc/3WJWwGnQ)
# Optional console-like gamma
[![gammacomp2.png](https://i.postimg.cc/qRQ494FR/gammacomp2.png)](https://postimg.cc/ZB9GNt4t)
# Fixed volumetric light shafts
[![Grand-Theft-Auto-IV-2023-06-26-01-57.png](https://i.postimg.cc/cLyJ1X4h/Grand-Theft-Auto-IV-2023-06-26-01-57.png)](https://postimg.cc/F7pvDbSk)
[![Grand-Theft-Auto-IV-2023-06-26-06-15-1.png](https://i.postimg.cc/SNzspwqj/Grand-Theft-Auto-IV-2023-06-26-06-15-1.png)](https://postimg.cc/9rCVdgDj)
# Fixed bloom resolution scaling
[![bloom.png](https://i.postimg.cc/pTBLRDmP/bloom.png)](https://postimg.cc/8JjSbfdY)
# Improved transparency across the board
[![2023-06-19-31.png](https://i.postimg.cc/RVCWd1d7/2023-06-19-31.png)](https://postimg.cc/c6j14nVC)
[![2023-06-21-1.png](https://i.postimg.cc/nrn1tdN7/2023-06-21-1.png)](https://postimg.cc/ygrRmT1Y)
# Fixed vehicle reflections
[![refl2.png](https://i.postimg.cc/1RYpg5Dc/refl2.png)](https://postimg.cc/bdkGWPCs)
[![2023-06-19-27.png](https://i.postimg.cc/y8xtmNG1/2023-06-19-27.png)](https://postimg.cc/QFLfsjsw)
# Improved water texture tiling and water droplets
[![2023-06-19-32.png](https://i.postimg.cc/6pyyJ9DT/2023-06-19-32.png)](https://postimg.cc/SnbycpQp)
[![2023-06-19-33.png](https://i.postimg.cc/bJtnX1F6/2023-06-19-33.png)](https://postimg.cc/343Nm0hp)
[![2023-06-19-34.png](https://i.postimg.cc/P5SY1XwM/2023-06-19-34.png)](https://postimg.cc/jDJDbrvW)

# Notes
Most shaders are commented; feel free to include any of them in your projects or to improve upon them, which there will definitely be room for. Use the C++ version of [RAGE Shader Editor](https://gtaforums.com/topic/984675-rage-shader-editor/) to reassemble them.

Special thanks to my friends AssaultKifle47, RaphaelK12, robi29 and \_CP_ for their support and contributions, and to Shvab for making RAGE Shader Editor.

Their repositories, which also have lots of cool stuff:
- [GTA4-Improved-Soft-Shadows](https://github.com/RaphaelK12/GTA4-Improved-Soft-Shadows)
- [GTA-IV-Shaders](https://github.com/robi29/GTA-IV-Shaders)

# To-do:
- Port the Xbox screen droplet shader to PC
- Fix the water foam, which is somehow tied to the camera height
- Either fix the fake tree shadows or add wind to trees without flag #31 in ext_veg.ide
