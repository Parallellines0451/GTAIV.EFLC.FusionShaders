@echo on
set shaders_path=%cd%/.ASM Source
set win32_30=%cd%/common/shaders/win32_30
set win32_30_atidx10=%cd%/common/shaders/win32_30_atidx10
set win32_30_nv8=%cd%/common/shaders/win32_30_nv8

for /R "%shaders_path%" %%a in (*.xml) do (
    RageShaderEditor.exe "%%a"
)

for /R "%shaders_path%" %%i in (*.fxc) do (
echo D | xcopy "%%i" "%win32_30%" /K /H /Y
echo D | xcopy "%%i" "%win32_30_atidx10%" /K /H /Y
echo D | xcopy "%%i" "%win32_30_nv8%" /K /H /Y
del "%%i"
)
