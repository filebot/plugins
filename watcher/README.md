# filebot-watcher

e.g. [filebot-watcher.ps1](https://github.com/filebot/plugins/blob/master/watcher/filebot-watcher.ps1) usage on Windows:
```powershell
.\filebot-watcher.ps1 X:\Input --output X:\Output
```
e.g. [filebot-watcher.sh](https://github.com/filebot/plugins/blob/master/watcher/filebot-watcher.sh) usage on Linux and FreeBSD:
```bash
./filebot-watcher.sh /input --output /output
```
The first argument `$1` is the watch folder. The remaining arguments are [amc script](https://www.filebot.net/amc.html) options.
