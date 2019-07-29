import Media, VideoFiles

from filebot import *


def Scan(path, files, mediaList, subdirs, language=None, root=None):
  VideoFiles.Scan(path, files, mediaList, subdirs, root)

  for file in files:
    attr = xattr_metadata(file)
    if attr is None:
      continue

    guid = series_guid(attr)
    if guid is None:
      continue

    episode = Media.Episode(series_name(attr), episode_season_number(attr), episode_number(attr), episode_title(attr), series_year(attr))

    date = episode_date(attr)
    if date:
      episode.released_at = date.strftime('%Y-%m-%d')

    episode.parts.append(file)
    mediaList.append(episode)
