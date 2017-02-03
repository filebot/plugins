# FileBot Docker

Docker images for [FileBot](http://www.filebot.net/).
- [`filebot` (*Dockerfile*)](https://github.com/filebot/plugins/blob/master/docker/Dockerfile)
- [`filebot-node` (*Dockerfile*)](https://github.com/filebot/plugins/blob/master/docker/Dockerfile.node)
- [`filebot-watcher` (*Dockerfile*)](https://github.com/filebot/plugins/blob/master/docker/Dockerfile.watcher).


## filebot

The [`filebot`](http://www.filebot.net/cli.html) command-line tool.

`docker run -it -v $PWD:/volume1 -v data:/data rednoah/filebot -script fn:sysinfo`


## filebot-node

FileBot Node allows you to call the [amc script](https://www.filebot.net/forums/viewtopic.php?f=4&t=215) via a simple web interface.

`docker run -it -v $PWD:/volume1 -v data:/data -p 5452:5452 rednoah/filebot:node`

Once the [FileBot Node Service](https://github.com/filebot/filebot-node) is running, you can access the  web interface via [http://localhost:5452/filebot/](http://localhost:5452/filebot/).


## filebot-watcher

The [`filebot-watcher`](https://github.com/filebot/plugins/blob/master/docker/filebot-watcher) command-line tool watches a given folder and executes the [amc script](https://www.filebot.net/forums/viewtopic.php?f=4&t=215) on newly added files.

`docker run -it -v $PWD:/volume1 -v data:/data rednoah/filebot:watcher /volume1/input --output /volume1/output`

The first argument `$1` is the watch folder. The remaining arguments are [amc script](https://www.filebot.net/forums/viewtopic.php?f=4&t=215) options.
