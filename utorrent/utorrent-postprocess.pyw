import sys
import subprocess


# configuration
output = 'X:/Media'


# required args
label, state, title, kind, file, dir = sys.argv[1:7]


command = [
	'filebot', '-script', 'fn:amc',
	'--output', output,
	'--action', 'copy',
	'--conflict', 'skip',
	'-non-strict',
	'--log-file', output + '/amc.log',

	'--def',
		'unsorted=y',
		'music=y',
		'artwork=y',
		'ut_label=' + label,
		'ut_state=' + state,
		'ut_title=' + title,
		'ut_kind=' + kind,
		'ut_file=' + file,
		'ut_dir=' + dir
]


# execute command (and hide cmd window)
subprocess.run(command, creationflags=0x08000000)
