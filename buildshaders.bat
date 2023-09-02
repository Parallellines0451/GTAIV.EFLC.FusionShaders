@echo on
set shaders_path=%cd%/win32_30_nv8
set win32_30=%cd%/.Build/common/shaders/win32_30
set win32_30_atidx10=%cd%/.Build/common/shaders/win32_30_atidx10
set win32_30_nv8=%cd%/.Build/common/shaders/win32_30_nv8

for /R "%shaders_path%" %%a in (*.xml) do (
    RageShaderEditor.exe "%%a"
)

for /R "%shaders_path%" %%i in (*.fxc) do (
echo D | xcopy "%%i" "%win32_30%" /K /H /Y
echo D | xcopy "%%i" "%win32_30_atidx10%" /K /H /Y
echo D | xcopy "%%i" "%win32_30_nv8%" /K /H /Y
del "%%i"
)

echo D | xcopy "%cd%\other_assets\Improved Stipple" "%cd%\.Build" /K /H /Y /S
echo D | xcopy "%cd%\other_assets\Opaque Wires" "%cd%\.Build" /K /H /Y /S