var script = JD_HOME + '/jdownloader-postprocess.sh'

var path = archive.getFolder()
var name = archive.getName()
var links = archive.getDownloadLinks() ? archive.getDownloadLinks() : []
var package = links.length > 0 ? links[0].getPackage() : null
var label = package.getComment() ? package.getComment() : 'N/A'

function isReallyFinished() {
	for (var i = 0; i < links.length; i++) {
		if (links[i].getArchive() != null && links[i].getExtractionStatus() != "SUCCESSFUL" || !package.isFinished()) {
			return false
		}
	}
	return true
}

if (isReallyFinished()) {
	var command = [script, path, name, label, 'ARCHIVE_EXTRACTED']
	log(command)
	log(callSync(command))
}
