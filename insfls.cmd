@echo off
SET cf=%~dp0

net session >nul 2>&1
    if %errorLevel% == 0 (
        echo admin ok
    ) else (
        echo no admin
        timeout 3
        exit 1
    )

md C:\Windows\system32\Macromed\Flash
md C:\Windows\system32\Macromed\Temp
md C:\Windows\SysWOW64\Macromed\Flash
md C:\Windows\SysWOW64\Macromed\Temp

copy /y %cf%64\* C:\Windows\system32\Macromed\Flash\
copy /y %cf%32\* C:\Windows\SysWOW64\Macromed\Flash\
copy /y %cf%cpl32\* C:\Windows\SysWOW64\
reg import %cf%fls.reg

timeout 3
echo done