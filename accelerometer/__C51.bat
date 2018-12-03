@echo off
::This file was created automatically by CrossIDE to compile with C51.
D:
cd "\School\Elec 291\Project 2\mcar\accelerometer\"
"D:\School\Programs\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c"
if not exist hex2mif.exe goto done
if exist accelerometer.ihx hex2mif accelerometer.ihx
if exist accelerometer.hex hex2mif accelerometer.hex
:done
echo done
echo Crosside_Action Set_Hex_File D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.hex
