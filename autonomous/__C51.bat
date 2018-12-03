@echo off
::This file was created automatically by CrossIDE to compile with C51.
D:
cd "\School\Elec 291\Project 2\mcar\autonomous_firmware\"
"D:\School\Programs\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "D:\School\Elec 291\Project 2\mcar\autonomous_firmware\Autonomous Tracker.c"
if not exist hex2mif.exe goto done
if exist Autonomous Tracker.ihx hex2mif Autonomous Tracker.ihx
if exist Autonomous Tracker.hex hex2mif Autonomous Tracker.hex
:done
echo done
echo Crosside_Action Set_Hex_File D:\School\Elec 291\Project 2\mcar\autonomous_firmware\Autonomous Tracker.hex
