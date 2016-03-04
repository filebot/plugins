var script = JD_HOME + '/jdownloader-postprocess.sh'

var path = archive.getFolder()
var name = archive.getName()
var label = archive.getDownloadLinks() && archive.getDownloadLinks()[0].getPackage().getComment() ? archive.getDownloadLinks()[0].getPackage().getComment() : 'N/A'

var command = [script, path, name, label, 'ARCHIVE_EXTRACTED']

log(command)
log(callSync(command))
