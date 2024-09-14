@ECHO OFF

:: Usage
:: cmd /c C:\qbt-postprocess.cmd "%L" "%N" "%F"

:: Input Parameters
set ARG_LABEL=%1
set ARG_NAME=%2
set ARG_FOLDER=%3

:: Configuration
set CONFIG_OUTPUT=%USERPROFILE%/Media

if not %ARG_LABEL% == "ignore" (
	filebot -script fn:amc --output %CONFIG_OUTPUT% --action duplicate --conflict skip -non-strict --log-file amc.log --def skipExtract=y unsorted=y music=y artwork=y excludeList=excludes.txt ut_label=%ARG_LABEL% ut_title=%ARG_NAME% ut_kind=multi ut_dir=%ARG_FOLDER%
)
