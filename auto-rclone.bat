@echo off
:::::::::::::::: AUTORCLONE SETTINGS ::::::::::::::::
SET /a COUNTER=0
SET /a AMOUNT_OF_SA=99
SET SOURCE=Your Source:
SET DESTINATION=Your Destination:
SET SUBDIRECTORY=Subdirectory if Needed
SET arguments="--config=C:\rclone\config\location\path\rclone.conf" "--fast-list" "--drive-server-side-across-configs" "--transfers=10" "--tpslimit=5" "--drive-acknowledge-abuse" "-P"
:::::::::::::::: LOCATION SETTINGS ::::::::::::::::
SET rclone_location="C:\path\rclone.exe"
SET SA_location="C:\service\accounts\path"
:::::::::::::::: END OF ALL SETTINGS ::::::::::::::::

:loop
echo [%time%] Using service account %COUNTER%
%rclone_location% sync "%SOURCE%%SUBDIRECTORY%" "%DESTINATION%%SUBDIRECTORY%" --drive-service-account-file "%SA_location%"\\"%COUNTER%.json" --drive-stop-on-upload-limit=true %arguments%
IF %ERRORLEVEL% EQU 0 ( 
   echo [%time%] Everything is up to date and synced!
   exit /B %ERRORLEVEL%
) else (
SET /a COUNTER=%COUNTER%+1
if %COUNTER% neq %AMOUNT_OF_SA%+1 goto loop
)
echo [%time%] Ran out of all Service Accounts. Quitting.
