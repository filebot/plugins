var script = JD_HOME + '/jdownloader-postprocess.sh'

var links = archive.getDownloadLinks() ? archive.getDownloadLinks() : []
var package = links.length > 0 ? links[0].getPackage() : null

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
