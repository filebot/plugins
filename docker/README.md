# FileBot Docker

FileBot docker images for filebot and filebot-node.


## filebot

`docker run -it -v /path/to/files:/volume1 -v data:/data rednoah/filebot -script fn:sysinfo`


## filebot-node

`docker run -it -v /path/to/files:/volume1 -p 5452:5452 rednoah/filebot:node`

Once the [FileBot Node Service](https://github.com/filebot/filebot-node) is running, you can access the  web interface via [http://localhost:5452/filebot/](http://localhost:5452/filebot/).


## filebot-watcher

`docker run -it -v /path/to/files:/volume1 -v data:/data rednoah/filebot:watcher /volume1/WatchFolder --output /volume1/Media`

The first argument `$1` is the watch folder. The remaining arguments are [amc script](https://www.filebot.net/forums/viewtopic.php?f=4&t=215) options.
