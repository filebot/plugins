import sys
import subprocess


# configuration
output = 'X:/Media'


# custom formats
movieFormat  = '''{plex}'''
seriesFormat = '''{plex}'''
animeFormat  = '''{plex}'''
musicFormat  = '''{plex}'''


# required args
label, state, title, kind, file, directory = sys.argv[1:7]


command = [
	'filebot', '-script', 'fn:amc',
	'--output', output,
	'--action', 'duplicate',
	'--conflict', 'skip',
	'-non-strict',
	'--log-file', output + '/amc.log',
	'--def',
		'unsorted=y',
		'music=y',
		'artwork=y',
		'movieFormat='  + movieFormat,
		'seriesFormat=' + seriesFormat,
		'animeFormat='  + animeFormat,
		'musicFormat='  + musicFormat,
		'ut_label=' + label,
		'ut_state=' + state,
		'ut_title=' + title,
		'ut_kind='  + kind,
		'ut_file='  + file,
		'ut_dir='   + directory
]


# execute command (and hide cmd window)
subprocess.run(command, creationflags=0x08000000)
