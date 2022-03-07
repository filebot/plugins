# filebot-watcher
#
# Usage:
# .\filebot-watcher.ps1 X:\Input --output X:\Output
#


$global:input = $args[0]
$global:options = $args
Write-Host "Watch Folder: $global:input"


$onChange = {
	$path = $Event.SourceEventArgs.FullPath
	$type = $Event.SourceEventArgs.ChangeType
	Write-Host "[$type] $path"
	& filebot -script fn:amc --action duplicate --conflict auto -non-strict --log-file amc.log --def excludeList="excludes.txt" unsorted=y music=y artwork=y @global:options | Write-Host
}


$watcher = New-Object System.IO.FileSystemWatcher
$watcher.Path = $global:input
$watcher.Filter = ""
$watcher.IncludeSubdirectories = $false
$watcher.EnableRaisingEvents = $true


Register-ObjectEvent $watcher "Created" -Action $onChange
# Register-ObjectEvent $watcher "Changed" -Action $onChange
# Register-ObjectEvent $watcher "Renamed" -Action $onChange


try {
	while ($true) {
		Start-Sleep -Seconds 1
	}
}
finally {
	$watcher.Dispose()
	Write-Host "Stop Watcher"
}
