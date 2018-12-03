@echo off
::This file was created automatically by CrossIDE to compile with C51.
C:
cd "\Users\root\mcar\led_matrix\"
"C:\Program Files\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "C:\Users\root\mcar\led_matrix\led_matrix.c"
if not exist hex2mif.exe goto done
if exist led_matrix.ihx hex2mif led_matrix.ihx
if exist led_matrix.hex hex2mif led_matrix.hex
:done
echo done
echo Crosside_Action Set_Hex_File C:\Users\root\mcar\led_matrix\led_matrix.hex
