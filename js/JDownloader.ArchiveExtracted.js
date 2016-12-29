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
	var command = [script, package.getDownloadFolder(), package.getName(), package.getComment() ? package.getComment() : 'N/A', 'ARCHIVE_EXTRACTED']
	log(command)
	log(callSync(command))
}
