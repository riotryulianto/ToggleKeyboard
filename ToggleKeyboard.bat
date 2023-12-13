@echo off
setlocal enabledelayedexpansion

REM Check the current status of the keyboard
sc query i8042prt | find "STATE" | find "RUNNING" > nul
if !errorlevel! == 0 (
    REM If the keyboard is running, disable it
    sc config i8042prt start= disabled
    echo Keyboard disabled.
) else (
    REM If the keyboard is disabled, enable it
    sc config i8042prt start= auto
    echo Keyboard enabled.
)

REM Delay for a moment to allow the service to take effect
timeout /t 2 > nul

REM Reboot the computer
shutdown /r /t 0
