var node = 'http://username:password@172.17.0.1:5452/command'
var output = '/path/to/Media'

var path = package.getDownloadFolder()
var name = package.getName()
var label = package.getComment() ? package.getComment() : 'N/A'
var links = package.getDownloadLinks() ? package.getDownloadLinks() : []

function isReallyFinished() {
	for (var i = 0; i < links.length; i++) {
		if (links[i].getArchive() != null && links[i].getExtractionStatus() != "SUCCESSFUL" || !package.isFinished()) {
			return false
		}
	}
	return true
}

if (isReallyFinished()) {
	var filebot = ['-script', 'fn:amc', '--output', output, '--action', 'duplicate', '--conflict', 'skip', '-non-strict', '--log-file', 'amc.log', '--def', 'skipExtract=y', 'unsorted=y', 'music=y', 'artwork=y', 'excludeList=.excludes', '--def', 'ut_dir=' + path, 'ut_kind=multi', 'ut_title=' + name, 'ut_label=' + label]
	var curl = ['curl', node, '--header', 'Content-Type: application/json', '--data', JSON.stringify(filebot)]
	log(curl)
	log(callSync(curl))
}
