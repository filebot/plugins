#!/bin/sh -xu

# org.jdownloader.extensions.eventscripter.EventScripterExtension.scripts.json
# [{"eventTrigger":"ON_PACKAGE_FINISHED","enabled":true,"name":"Execute FileBot (PackageFinished)","script":"var script = JD_HOME + '/jdownloader-postprocess.sh'\n\nvar path = package.getDownloadFolder()\nvar name = package.getName()\nvar label = package.getComment() ? package.getComment() : 'N/A'\n\nvar command = [script, path, name, label, 'PACKAGE_FINISHED']\n\nlog(command)\nlog(callSync(command))\n","eventTriggerSettings":{}} ]

# Input Parameters
ARG_PATH="$1"
ARG_NAME="$2"
ARG_LABEL="$3"

# Configuration
CONFIG_OUTPUT="$HOME/Media"

filebot -script fn:amc --output "$CONFIG_OUTPUT" --action duplicate --conflict skip -non-strict --log-file amc.log --def skipExtract=y unsorted=y music=y artwork=y excludeList=".excludes" ut_dir="$ARG_PATH" ut_kind="multi" ut_title="$ARG_NAME" ut_label="$ARG_LABEL"
