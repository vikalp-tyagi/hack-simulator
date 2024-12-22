@echo off
setlocal enabledelayedexpansion

:start
color a
title HACK SIMULATOR

set /p user_input=^>^>^> Scan the network (Y/N)? :
if /i %user_input%==S1309 goto SecretMenu
if /i %user_input%==Y goto ChooseTarget
if /i %user_input%==N (goto Exit) else (goto Invalid)

:SecretMenu
cls
color 4e
echo ^>^>^>[SECRET MENU ACTIVATED]
echo ^>^>^>Advanced options unlocked:  
echo 1) Erase all server logs
echo 2) Deploy counter-intelligence bots
echo 3) ^Shutdown target servers
echo 4) Return to main menu
echo.
set /p secret_choice=^>^>^>Choose an advanced action (1-4): 
echo.
if %secret_choice%==1 echo ^>^>^>Erasing logs... && timeout /t 2 >nul && goto DeleteLogs
if %secret_choice%==2 echo ^>^>^>Deploying bots... && timeout /t 2 >nul && goto start
if %secret_choice%==3 echo ^>^>^>Shutting down servers... && timeout /t 2 >nul && goto start
if %secret_choice%==4 goto start

:ChooseTarget
timeout /t 2 >nul
echo.
set /p target=^>^>^> Choose your target (Server/Local): 
if %target%==Server goto HackServer
if %target%==Local goto HackLocal
goto Invalid

:HackServer
timeout /t 3 >nul
echo.
call :SelectServer
timeout /t 2 >nul
call :RandomPassword
timeout /t 2 >nul
echo ^>^> Breaching server %selected_server%...
timeout /t 2 >nul
call :FakeLogs
goto HackingProcess

:HackLocal
timeout /t 2 >nul
echo.
call :RandomPassword
timeout /t 2 >nul
echo ^>^>^> Attempting to breach the local system...
timeout /t 2 >nul
call :FakeLogs

:HackingProcess
echo.
set /p hack_process=^>^>^> Choose hacking process (Spy/Delete/Copy): 
if /i %hack_process%==Spy goto Spy
if /i %hack_process%==Delete goto Delete
if /i %hack_process%==Copy (goto Copy) else (goto Invalid)

:Spy
timeout /t 2 >nul
echo.
echo ^>^>^> Spying on target... Collecting sensitive data...
timeout /t 2 >nul
call :FakeObstacles

:Delete
timeout /t 2 >nul
echo.
echo ^>^>^> Deleting sensitive files on the target...
timeout /t 3 >nul
echo ^>^>^> All data deleted successfully...
timeout /t 2 >nul
goto DeleteLogs

:Copy
timeout /t 2 >nul
echo.
echo ^>^>^> Copying critical data from the target...
timeout /t 3 >nul
call :CreateDummyFiles 

:DeleteLogs
timeout /t 2 >nul
echo.
set /p delete_choice=^>^>^> Would you like to delete evidence of the hack (Y/N)? :
if /i %delete_choice%==Y echo ^>^>^> Deleting hack traces... && timeout /t 2 >nul
if /i %delete_choice%==N echo^>^>^> Leaving traces for tracking... && timeout /t 2 >nul
goto RandomCrash

:RandomCrash
set /a crash_counter+=1
if %crash_counter% GEQ 5 (
    call :FakeCrash
    set /a crash_counter=0
)
goto CounterHacking

:CounterHacking
set /a counterhack_trigger=!random! %% 5
if !counterhack_trigger! EQU 0 (
    cls
    color c
    echo ^>^>^> Counter-hack detected! Attempting to secure your system...
    timeout /t 3 >nul
)
goto StartAgain

:StartAgain
cls
color a
timeout /t 2 >nul
echo ^>^>^> Operation complete. Would you like to restart? (Y/N):
set /p restart_choice=
if /i %restart_choice%==Y goto start
goto Exit

:FakeLogs
echo.
echo [INFO] Scanning target network...
timeout /t 2 >nul
echo [INFO] Vulnerabilities found: CVE-2023-XYZ, CVE-2024-ABC
timeout /t 2 >nul
echo [WARNING] Suspicious activity detected on port 443...
timeout /t 2 >nul
echo [INFO] Secure connection established.
timeout /t 2 >nul
goto HackingProcess

:FakeCrash
cls
color c
echo ^>^>^> ERROR: System crash detected! Attempting recovery...
timeout /t 5 >nul
cls
color a
echo ^>^>^> System successfully recovered. Resuming operations...
timeout /t 5 >nul
goto StartAgain

:FakeObstacles
set /a obstacle=%random% %% 3
if %obstacle%==0 echo ^>^>^> Firewall detected. Bypassing...
if %obstacle%==1 echo ^>^>^> Server dropped connection. Reconnecting...
if %obstacle%==2 echo ^>^>^> Intrusion detection system triggered! Deploying stealth mode...
timeout /t 2 >nul
goto DeleteLogs

:CreateDummyFiles
echo Confidential_Report.txt ^> "Downloaded_Files\Confidential_Report.txt"
echo Target_Logs.log ^> "Downloaded_Files\Target_Logs.log"
timeout /t 1 >nul
echo ^>^>^> Files saved to "Downloaded_Files".
timeout /t 2 >nul
goto DeleteLogs

:SelectServer
set servers[0]=Alpha-01
set servers[1]=Bravo-22
set servers[2]=Gamma-03
set servers[3]=Delta-04
set servers[4]=Omega-99
set /a index=%random% %% 5
set selected_server=!servers[%index%]!
goto :eof

:RandomPassword
set passwords[0]=admin123
set passwords[1]=root@2024
set passwords[2]=secureKey!
set passwords[3]=qwerty$#
set passwords[4]=hunter2
set /a pass_index=%random% %% 5
set selected_password=!passwords[%pass_index%]!
timeout /t 2 >nul
echo ^>^>^> Attempting login with password: !selected_password!...
goto :eof

:Exit
cls
echo ^>^>^> Exiting the simulation...
timeout /t 2 >nul
exit

:Invalid
echo.
echo ^>^>^> Invalid input! Please try again.
timeout /t 2 >nul
cls
goto start
