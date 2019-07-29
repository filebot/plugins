import Media, VideoFiles

from filebot import *


def Scan(path, files, mediaList, subdirs, language=None, root=None):
  VideoFiles.Scan(path, files, mediaList, subdirs, root)

  for file in files:
    attr = xattr_metadata(file)
    if attr is None:
      continue

    guid = movie_guid(attr)
    if guid is None:
      continue

    movie = Media.Movie(movie_name(attr), movie_year(attr))
    movie.guid = guid

    movie.parts.append(file)
    mediaList.append(movie)
