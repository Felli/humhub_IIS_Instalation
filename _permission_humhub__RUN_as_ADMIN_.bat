@ECHO OFF

REM --------------------------------------------------------
REM find current dir (current_dir)
REM --------------------------------------------------------
for %%* in (.) do set current_dir=%%~nx*

echo --------------------------------------------------------
echo  current_dir = %current_dir%
echo --------------------------------------------------------

SET base_path=public\


REM PAUSE

echo --------------------------------------------------------
echo base_path = %base_path%
echo --------------------------------------------------------
echo %base_path%assets

REM PAUSE

echo -----------------------------------
echo  icacls %base_path%assets /grant
echo -----------------------------------
icacls %base_path%assets		/grant IUSR:(OI)(CI)(M)

REM PAUSE

echo -----------------------------------
echo  icacls %base_path%protected\config
echo -----------------------------------
icacls %base_path%protected\config	/grant IUSR:(OI)(CI)(M)

REM PAUSE

echo -----------------------------------
echo  icacls %base_path%protected\modules
echo -----------------------------------
icacls %base_path%protected\modules	/grant IUSR:(OI)(CI)(M)

REM PAUSE

echo -----------------------------------
echo  icacls %base_path%protected\runtime
echo -----------------------------------
icacls %base_path%protected\runtime	/grant IUSR:(OI)(CI)(M)

REM PAUSE

echo -----------------------------------
echo  icacls %base_path%uploads
echo -----------------------------------
icacls %base_path%uploads		/grant IUSR:(OI)(CI)(M)

REM PAUSE

echo -----------------------------------
echo icacls %base_path%assets\yii
echo -----------------------------------
icacls %base_path%protected\yii		/grant IUSR:(OI)(CI)(X)


REM PAUSE

echo -----------------------------------
echo  icacls %base_path%assets\yii.bat
echo -----------------------------------
icacls %base_path%protected\yii.bat	/grant IUSR:(OI)(CI)(X)


REM PAUSE


echo --------------------------------------------------------
echo --------------------------------------------------------
echo  DONE !!!
echo --------------------------------------------------------
echo --------------------------------------------------------

PAUSE


rem SET pool_name=humhub.en-desarrollo.es

rem icacls "%base_path%assets"		/grant IUSR:(OI)(CI)(M)
rem icacls "%base_path%protected\config"	/grant IUSR:(OI)(CI)(M)
rem icacls "%base_path%protected\modules"	/grant IUSR:(OI)(CI)(M)
rem icacls "%base_path%protected\runtime"	/grant IUSR:(OI)(CI)(M)
rem icacls "%base_path%uploads"		/grant IUSR:(OI)(CI)(M)

REM icacls "%base_path%\assets\*"			/T /grant "IIS AppPool\%pool_name%":(OI)(CI)(M)
REM icacls "%base_path%\protected\config\*"		/T /grant "IIS AppPool\%pool_name%":(OI)(CI)(M)
REM icacls "%base_path%\protected\modules\*"	/T /grant "IIS AppPool\%pool_name%":(OI)(CI)(M)
REM icacls "%base_path%\protected\runtime\*"	/T /grant "IIS AppPool\%pool_name%":(OI)(CI)(M)
REM icacls "%base_path%\uploads\*"			/T /grant "IIS AppPool\%pool_name%":(OI)(CI)(M)

rem icacls "%base_path%assets\yii"		/grant IUSR:(OI)(CI)(X)
rem icacls "%base_path%assets\yii.bat"	/grant IUSR:(OI)(CI)(X)

REM icacls "%base_path%\assets\yii"			/T /grant "IIS AppPool\%pool_name%":(OI)(CI)(M)(X)
REM icacls "%base_path%\assets\yii.bat"		/T /grant "IIS AppPool\%pool_name%":(OI)(CI)(M)(X)

REM icacls c:\inetpub\wwwroot /grant "IIS APPPOOL\DefaultAppPool":(OI)(CI)(RX)




PAUSE


REM  ===============================================
REM   2. Set IUSR permission
REM  ===============================================
REM    A sequence of simple rights:
REM    F (full access)
REM    M (modify access)
REM    RX (read and execute access)
REM    R (read-only access)
REM    W (write-only access)
REM    A comma-separated list in parenthesis of specific rights:
REM    D (delete)
REM    RC (read control)
REM    WDAC (write DAC)
REM    WO (write owner)
REM    S (synchronize)
REM    AS (access system security)
REM    MA (maximum allowed)
REM    GR (generic read)
REM    GW (generic write)
REM    GE (generic execute)
REM    GA (generic all)
REM    RD (read data/list directory)
REM    WD (write data/add file)
REM    AD (append data/add subdirectory)
REM    REA (read extended attributes)
REM    WEA (write extended attributes)
REM    X (execute/traverse)
REM    DC (delete child)
REM    RA (read attributes)
REM    WA (write attributes)
REM  Inheritance rights may precede either Perm form, and they are applied only to directories:
REM  (OI): object inherit
REM  (CI): container inherit
REM  (IO): inherit only
REM  (NP): do not propagate inherit




REM	/T            Changes ACLs of specified files in
REM	               the current directory and all subdirectories.
REM	/L            Work on the Symbolic Link itself versus the target
REM	/M            Changes ACLs of volumes mounted to a directory
REM	/S            Displays the SDDL string for the DACL.
REM	/S:SDDL       Replaces the ACLs with those specified in the SDDL string
REM	                  (not valid with /E, /G, /R, /P, or /D).
REM	           Edit ACL instead of replacing it.
REM	/C            Continue on access denied errors.
REM	/grant user:perm  Grant specified user access rights.
REM	                  Perm can be: R  Read
REM	                               W  Write
REM	                               C  Change (write)
REM	                               F  Full control
REM	/R user       Revoke specified user's access rights (only valid with /E).
REM	/P user:perm  Replace specified user's access rights.
REM	                  Perm can be: N  None
REM	                               R  Read
REM	                               W  Write
REM	                               C  Change (write)
REM	                               F  Full control
REM	/D user       Deny specified user access.