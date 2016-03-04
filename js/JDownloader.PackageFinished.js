var script = JD_HOME + '/jdownloader-postprocess.sh'

var path = package.getDownloadFolder()
var name = package.getName()
var label = package.getComment() ? package.getComment() : 'N/A'

var command = [script, path, name, label, 'PACKAGE_FINISHED']

log(command)
log(callSync(command))
