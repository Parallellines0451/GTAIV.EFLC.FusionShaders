# GTAIV.ShaderFixesCollection
Various shader fixes and improvements for GTA IV 1.0.7.0, 1.0.8.0 and Complete Edition. The goal is to restore and fix everything from [here](https://libertycity-ru.translate.goog/gta-4/articles/4346-gta-iv-complete-edition-xbox-protiv-pc.html?_x_tr_sl=ru&amp;_x_tr_tl=en&amp;_x_tr_hl=pt-BR).

# Feature list
- Restored stippled transparency/LOD fading from 1.0.5.0 and older versions, and reduced the stippling effect on vegetation and fences
- Restored volumetric light shafts thanks to Vaani
- Improved depth of field and fixed resolution scaling
- Remade bloom shader with proper resolution scaling
- Fixed the entire screen being blurry with definition off
- Fixed distorted car reflections thanks to AssaultKifle47 and increased their intensity to match consoles
- Included native FXAA thanks to RaphaelK12
- Included RaphaelK12's 5x5 gaussian [shadow filter](https://github.com/RaphaelK12/GTA4-Improved-Soft-Shadows)
- Fixed excessively strong vertex AO and static vehicle shadows; also includes uncompressed textures for them
- Improved water texture tiling (console/medium tiling for the very high setting)
- Fixed textureless water on AMD graphics cards
- Fixed "emissivestrong" lights
- Increased rain and splash intensity to mostly match consoles
- Fixed black water droplets on screen (although refraction isn't restored yet)
- Included console-like gamma in rage_postfx, disabled by default; also includes console timecycles and vehicle.ide's for reflections
- Fixed disconnected shadows/excessively high depth bias for cascaded shadow maps
- Fixed improper reflection mipmap dimming which made ambient reflections weaker than they're supposed to be
- Reduced z-fighting/clipping on some objects like the BAWSAQ sign and glass (disabled by default to avoid more issues)

# Improved depth of field, fixed definition blur and added native FXAA
[![dof.png](https://i.postimg.cc/L4kcRwfp/dof.png)](https://postimg.cc/jC5g48Zg)
[![dof2.png](https://i.postimg.cc/KvZdYfrg/dof2.png)](https://postimg.cc/MXFsPyLW)
[![2023-06-19-38.png](https://i.postimg.cc/h4Vmpbmv/2023-06-19-38.png)](https://postimg.cc/3WJWwGnQ)
# Optional console-like gamma
[![gammacomp2.png](https://i.postimg.cc/qRQ494FR/gammacomp2.png)](https://postimg.cc/ZB9GNt4t)
# Fixed volumetric light shafts
[![volume.png](https://i.postimg.cc/wBLBbKHy/volume.png)](https://postimg.cc/Lq4RnbJ2)
# Scalable bloom
[![bloom.png](https://i.postimg.cc/pTBLRDmP/bloom.png)](https://postimg.cc/8JjSbfdY)
# Restored and improved stippled transparency
[![2023-06-19-31.png](https://i.postimg.cc/RVCWd1d7/2023-06-19-31.png)](https://postimg.cc/c6j14nVC)
[![2023-06-21-1.png](https://i.postimg.cc/nrn1tdN7/2023-06-21-1.png)](https://postimg.cc/ygrRmT1Y)
# Fixed vehicle reflections
[![refl2.png](https://i.postimg.cc/1RYpg5Dc/refl2.png)](https://postimg.cc/bdkGWPCs)
[![refl.png](https://i.postimg.cc/0j3mhc9H/refl.png)](https://postimg.cc/SY6JML2W)
[![2023-06-19-27.png](https://i.postimg.cc/y8xtmNG1/2023-06-19-27.png)](https://postimg.cc/QFLfsjsw)
# Improved water texture tiling and water droplets
[![2023-06-19-32.png](https://i.postimg.cc/6pyyJ9DT/2023-06-19-32.png)](https://postimg.cc/SnbycpQp)
[![2023-06-19-33.png](https://i.postimg.cc/bJtnX1F6/2023-06-19-33.png)](https://postimg.cc/343Nm0hp)
[![2023-06-19-34.png](https://i.postimg.cc/P5SY1XwM/2023-06-19-34.png)](https://postimg.cc/jDJDbrvW)

# Notes
Most shaders are commented; feel free to include any of them in your projects or to improve upon them, which there will definitely be room for. Use the C++ version of [RAGE Shader Editor](https://gtaforums.com/topic/984675-rage-shader-editor/) to reassemble the shaders.<br>

Special thanks to my friends Vaani, AssaultKifle47 and RaphaelK12 for their support and contributions, and to Shvab for making RAGE Shader Editor.

# To-do:
- Port the Xbox screen droplet shader to PC
- Fix the water foam, which is somehow tied to the camera height
- Fix the 1.0.7.0+ fake tree shadows, which move according to the sun angle instead of stretching (ideally they'd behave like the 1.0.4.0 fake tree shadows)
