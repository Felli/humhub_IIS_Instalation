cls
@echo off


echo ========================================================
echo  Find current dir (current_dir) and path (current_path)
echo - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
for %%* in (.) do set current_dir=%%~nx*

SET current_path=%~dp0

echo  current_dir = %current_dir%
echo  current_path = %current_path%
echo ========================================================

REM PAUSE





echo ========================================================
echo  Set humhub INSTALATION dir (public web access dir)
echo - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

SET humhub_dir=public

echo  humhub_dir = %humhub_dir%
echo ========================================================

REM PAUSE




echo ========================================================
echo  Set humhub DEVELOPMENT files adjustments dir
echo - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

SET humhub_dev_config_path=humhub_dev_config

echo  humhub_dev_config_path = %humhub_dev_config_path%
echo ========================================================

REM PAUSE



echo ========================================================
echo  Set humhub PRODUCTION files adjustments dir
echo - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

SET humhub_production_config_path=humhub_production_config

echo  humhub_production_config_path = %humhub_production_config_path%
echo ========================================================



echo ========================================================
echo  Set humhub DOWNLOAD dir
echo - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

SET humhub_dl_path=humhub-git

echo  humhub_dl_path = %humhub_dl_path%
echo ========================================================

REM PAUSE



echo ========================================================
echo  Set humhub BACKUP SCRIPT 
echo  (inlcude path if it is not the same as this bath)
echo - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
SET humhub_backup_script=_BACKUP_ONLY___HUMHUB_.bat

echo  humhub_backup_script = %humhub_backup_script%
echo - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
IF NOT EXIST %humhub_backup_script% (echo FILE NOT FOUND!! %humhub_backup_script% & PAUSE)
echo ========================================================

REM PAUSE



echo ========================================================
echo  Set humhub PERMISSION SCRIPT 
echo  (inlcude path if it is not the same as this bath)
echo - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
REM SET humhub_backup_script=humhub_backups\_permission_humhub__RUN_as_ADMIN_.bat
SET humhub_permission_script=_permission_humhub__RUN_as_ADMIN_.bat

echo  humhub_permission_script = %humhub_permission_script%
echo - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
IF NOT EXIST %humhub_permission_script% (echo FILE NOT FOUND!! %humhub_permission_script% & PAUSE)
echo ========================================================


REM PAUSE



echo ========================================================
echo  Set humhub DELETE INSTALATION SCRIPT 
echo  (inlcude path if it is not the same as this bath)
echo - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
REM SET humhub_delete_instalation_script=humhub_backups\_DELETE__Instaltion__Humhub_.bat
SET humhub_delete_instalation_script=_DELETE__Instaltion__Humhub_.bat

echo  humhub_delete_instalation_script = %humhub_delete_instalation_script%
echo - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
IF NOT EXIST %humhub_delete_instalation_script% (echo FILE NOT FOUND!! %humhub_delete_instalation_script% & PAUSE)
echo ========================================================


REM PAUSE



REM ##################################################################
REM ##################################################################
REM ####                                                          ####
REM ####    CONMFIGURATION ENDED                                  ####
REM ####    ----------------------------                          ####
REM ####                                                          ####
REM ####    DO NOT TOUCH BELOW THIS POIN                          ####
REM ####                                                          ####
REM ##################################################################
REM ##################################################################


echo ========================================================
echo  Set TIMESTAMP
echo - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
for /f "tokens=1-7 delims=:/-, " %%i in ('echo exit^|cmd /q /k"prompt $d $t"') do (
   for /f "tokens=2-4 delims=/-,() skip=1" %%a in ('echo.^|date') do (
      set dow=%%i
      set %%a=%%j
      set %%b=%%k
      set %%c=%%l
      set hh=%%m
      set min=%%n
      set ss=%%o
   )
)
set date_us_format=%yy%-%mm%-%dd%
REM set current_hour=%hh%-%min%-%ss%
set current_hour=%hh%-%min%
echo - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
echo  dow = -%dow%-
echo  yy = %yy%
echo  mm = %mm%
echo  dd = %dd%
echo  date_us_format = %date_us_format%
echo  yy = %yy%
echo  mm = %mm%
echo  dd = %dd%
echo  current_hour = %current_hour%
echo ========================================================

REM PAUSE





echo ========================================================
echo  Check if EXIST humhub donwload dir (%humhub_dl_path%)
echo - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

IF NOT EXIST %humhub_dl_path% ECHO  OK: humhub donwload dir does not exits

IF EXIST %humhub_dl_path% ECHO  WARNING: humhub donwload dir folder exits it will be deleted (recommended) & RD /S /Q %humhub_dl_path%

echo ========================================================

REM PAUSE




echo ========================================================
echo  BACKUP IF HUMHUB is installed!
echo   - SET updating_humhub = FALSE
echo   - Check IF EXIST humhub config file exists %humhub_dir%\protected\config\dynamic.php
echo         -  BACKUP HUMHUb FILES
echo         -  SET  updating_humhub = TRUE
echo - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
SET updating_humhub=FALSE
REM IF EXIST %humhub_dir%\protected\config\dynamic.php echo O|call %humhub_backup_script% & SET updating_humhub=TRUE
IF EXIST %humhub_dir%\protected\config\dynamic.php SET updating_humhub=TRUE
IF %updating_humhub%==TRUE echo O|call %humhub_backup_script%
echo - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
echo updating_humhub = %updating_humhub%
echo ========================================================

REM PAUSE



echo ========================================================
echo  Downlaod last HumHub version
echo  (git clone https://github.com/humhub/humhub.git %humhub_dl_path%)
echo - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
REM start /wait git clone https://github.com/humhub/humhub.git %humhub_dl_path%
REM call git clone https://github.com/humhub/humhub.git %humhub_dl_path%
call git clone --branch master https://github.com/humhub/humhub.git %humhub_dl_path%
echo ========================================================

REM PAUSE



echo ========================================================
echo  Change dir to DOWNLOAD dir
echo  (cd %humhub_dl_path%)
echo - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cd %humhub_dl_path%
echo ========================================================

REM PAUSE



echo ========================================================
echo composer global require "fxp/composer-asset-plugin:~1.1.1"
echo - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
REM start /wait composer global require "fxp/composer-asset-plugin:~1.1.1" REM start /wait NOT WORKING
call composer global require "fxp/composer-asset-plugin:~1.1.1"
echo ========================================================

REM PAUSE



echo ========================================================
echo composer update
echo - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
REM start /wait composer update REM start /wait NOT WORKING
call composer update
echo ========================================================

REM  PAUSE




echo ========================================================
echo npm update
echo - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
REM start /wait npm update REM start /wait NOT WORKING
call npm update
echo ========================================================

REM PAUSE



echo ========================================================
echo npm install grunt --save-dev
echo - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
REM start /wait npm install grunt --save-dev REM start /wait NOT WORKING
call npm install grunt --save-dev
echo ========================================================

REM PAUSE




echo ========================================================
echo  Back to START dir
echo  (cd..)
echo - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cd..
echo ========================================================

REM PAUSE



echo ========================================================
echo COPY DEV CONFIG and grunt fixes for windows
echo xcopy /e /r /y %humhub_dev_config_path%\ %humhub_dl_path%\
echo - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
xcopy /e /r /y %humhub_dev_config_path%\*.*  %humhub_dl_path%\*.*
echo ========================================================

REM PAUSE



echo ========================================================
echo  CHECK if UPDATE
echo  (%humhub_delete_instalation_script%)
echo   - STOP IIS
echo   - DELETE humhub_dir (%humhub_dir%)
echo   - START IIS
echo - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
IF %updating_humhub%==TRUE echo 0|%humhub_delete_instalation_script%
echo - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
IF NOT %updating_humhub%==TRUE echo  NOTHIMG TO UPDATE
echo ========================================================

REM PAUSE




echo ========================================================
echo  COPY TO PUBLICATION DIR
echo  xcopy /e /r /y %humhub_dl_path%\*.* %humhub_dir%\*.*
echo - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
xcopy /e /r /y %humhub_dl_path%\*.* %humhub_dir%\*.*
echo ========================================================

REM PAUSE







echo ========================================================
echo   PERMISSIONS
echo - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
call %humhub_permission_script%
echo ========================================================

REM PAUSE





echo ========================================================
echo  If UPDATE run migrations
echo - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
IF %updating_humhub%==TRUE CD /D  %humhub_dir%\protected\
IF %updating_humhub%==TRUE "C:\PHP\php-7.1.x-nts-Win32-VC14-x64\php-win.exe" yii migrate/up --includeModuleMigrations=1
echo ========================================================

REM PAUSE




echo ========================================================
echo grunt build-assets
echo - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
REM  start /wait grunt build-assets REM start /wait NOT WORKING
call grunt build-assets 
echo ========================================================

REM PAUSE



echo ----------------------------------------------------------
echo ----------------------------------------------------------
echo.
echo   DONE!!!
echo.
echo ----------------------------------------------------------
echo ----------------------------------------------------------

PAUSE
