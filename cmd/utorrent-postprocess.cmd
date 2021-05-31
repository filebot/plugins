@ECHO OFF

:: Usage
:: cmd /c C:\utorrent-postprocess.cmd "%L" "%S" "%N" "%K" "%F" "%D"

:: Input Parameters
set ARG_LABEL=%1
set ARG_STATE=%2
set ARG_NAME=%3
set ARG_KIND=%4
set ARG_FILE=%5
set ARG_FOLDER=%6

:: Configuration
set CONFIG_OUTPUT=%USERPROFILE%/Media

filebot -script fn:amc --output %CONFIG_OUTPUT% --action duplicate --conflict skip -non-strict --log-file amc.log --def skipExtract=y unsorted=y music=y artwork=y excludeList=excludes.txt ut_label=%ARG_LABEL% ut_state=%ARG_STATE% ut_title=%ARG_NAME% ut_kind=%ARG_KIND% ut_file=%ARG_FILE% ut_dir=%ARG_FOLDER%
