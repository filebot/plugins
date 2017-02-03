# FileBot Docker

## filebot

`docker run -it -v /path/to/files:/volume1 -v data:/data rednoah/filebot -script fn:sysinfo`


## filebot-node

`docker run -it -v /path/to/files:/volume1 -p 5452:5452 rednoah/filebot:node`


## filebot-watcher

`docker run -it -v /path/to/files:/volume1 -v data:/data rednoah/filebot:watcher /volume1/WatchFolder --output /volume1/Media`
