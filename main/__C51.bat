@echo off
::This file was created automatically by CrossIDE to compile with C51.
D:
cd "\School\Elec 291\Project 2\mcar\main\"
"D:\School\Programs\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c"
if not exist hex2mif.exe goto done
if exist Robot_integrated.ihx hex2mif Robot_integrated.ihx
if exist Robot_integrated.hex hex2mif Robot_integrated.hex
:done
echo done
echo Crosside_Action Set_Hex_File D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.hex
