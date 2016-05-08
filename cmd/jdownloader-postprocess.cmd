@ECHO OFF

:: Input Parameters
set ARG_PATH=%1
set ARG_NAME=%2
set ARG_LABEL=%3

:: Configuration
set CONFIG_OUTPUT=%USERPROFILE%/Media

filebot -script fn:amc --output "%CONFIG_OUTPUT%" --action duplicate --conflict skip -non-strict --log-file amc.log --def skipExtract=y unsorted=y music=y artwork=y excludeList=".excludes" ut_dir="%ARG_PATH%" ut_kind="multi" ut_title="%ARG_NAME%" ut_label="%ARG_LABEL%"
