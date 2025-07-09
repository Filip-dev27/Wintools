@echo off
setlocal enabledelayedexpansion
set ip_list=
for /f "tokens=2 delims=:" %%A in ('ipconfig ^| findstr "IPv4 Address"') do (
    for /f "tokens=*" %%B in ("%%A") do (
        set ip=%%B
        set ip_list=!ip_list!;!ip!
    )
)
set ip_list=%ip_list:~1%
if "%ip_list%"=="" set ip_list=No IPv4 addresses found
mshta "vbscript:Execute(^
    \"msgbox \""This computer's IP address(es):\n\n%ip_list%\"", vbOKOnly + vbInformation, \""IP Information\""^
    \")(window.close)"