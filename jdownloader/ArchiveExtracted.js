var script = JD_HOME + '/jdownloader-postprocess.sh'

var package = archive.getDownloadLinks() ? archive.getDownloadLinks()[0].getPackage() : null
var links = package ? package.getDownloadLinks() : []

function isReallyFinished() {
	for (var i = 0; i < links.length; i++) {
		if (links[i].getArchive() != null && links[i].getExtractionStatus() != "SUCCESSFUL" || !package.isFinished()) {
			return false
		}
	}
	return true
}

if (package && isReallyFinished()) {
	var path = package.getDownloadFolder()
	var name = package.getName()
	var label = package.getComment() ? package.getComment() : 'N/A'

	var command = [script, path, name, label, 'ARCHIVE_EXTRACTED']
	log(command)
	log(callSync(command))
}
