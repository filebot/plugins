# filebot-watcher

e.g. Usage on Windows:
```powershell
.\filebot-watcher.ps1 X:\Input --output X:\Output
```
e.g. Usage on Unix:
```bash
./filebot-watcher.sh /volume1/input --output /volume1/output
```
The first argument `$1` is the watch folder. The remaining arguments are [amc script](https://www.filebot.net/amc.html) options.
