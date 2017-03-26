var script = JD_HOME + '/jdownloader-postprocess.sh'

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
	var command = [script, path, name, label, 'PACKAGE_FINISHED']
	log(command)
	log(callSync(command))
}
