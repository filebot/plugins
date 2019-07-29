from filebot import *


def Start():
  Log("FileBot Xattr Metadata Agent - CPU: %s, OS: %s" % (Platform.CPU, Platform.OS))


#####################################################################################################################


class XattrMovieAgent(Agent.Movies):
  name = 'FileBot Xattr Metadata (Movies)'
  languages = [Locale.Language.NoLanguage]
  primary_provider = False
  persist_stored_files = False
  contributes_to = ['com.plexapp.agents.imdb', 'com.plexapp.agents.themoviedb', 'com.plexapp.agents.localmedia', 'com.plexapp.agents.none']


  def search(self, results, media, lang):
    Log("[SEARCH]")

    if media.items is None:
      return

    file = media.items[0].parts[0].file
    attr = xattr_metadata(file)
    if attr is None:
      return

    mid = movie_id(attr)
    if mid is None:
      return

    results.Append(MetadataSearchResult(id=mid, name=movie_name(attr), year=movie_year(attr), lang=lang, score=100))


  def update(self, metadata, media, lang):
    Log("[UPDATE]")

    if media.items is None:
      return

    file = media.items[0].parts[0].file
    attr = xattr_metadata(file)
    if attr is None:
      return

    mid = movie_id(attr)
    if mid is None:
      return

    metadata.id = mid
    metadata.title = movie_name(attr)
    metadata.year = movie_year(attr)


#####################################################################################################################


class XattrSeriesAgent(Agent.TV_Shows):
  name = 'FileBot Xattr Metadata (TV)'
  languages = [Locale.Language.NoLanguage]
  primary_provider = True
  persist_stored_files = False
  accepts_from = ['com.plexapp.agents.thetvdb']
  contributes_to = ['com.plexapp.agents.thetvdb', 'com.plexapp.agents.localmedia', 'com.plexapp.agents.none']


  def search(self, results, media, lang):
    for s in media.seasons:
      for e in media.seasons[s].episodes:
        for i in media.seasons[s].episodes[e].items:
          for part in i.parts:
            Log("[SEARCH] %s | %s" % (s, e))
            file = part.file
            attr = xattr_metadata(file)
            if attr is None:
              continue

            sid = thetvdb_series_id(attr)
            if sid is None:
              continue

            media.id = sid
            media.show = series_name(attr)
            media.year = series_year(attr)
            results.Append(MetadataSearchResult(id=media.id, name=media.show, year=media.year, lang=lang, score=100))


  def update(self, metadata, media, lang):
    for s in media.seasons:
      for e in media.seasons[s].episodes:
        for i in media.seasons[s].episodes[e].items:
          for part in i.parts:
            Log("[UPDATE] %s | %s" % (s, e))
            file = part.file
            attr = xattr_metadata(file)
            if attr is None:
              return

            sid = thetvdb_series_id(attr)
            if sid is None:
              continue

            metadata.id = sid
            metadata.title = series_name(attr)
            metadata.originally_available_at = series_date(attr)
            metadata.content_rating = series_certification(attr)
            metadata.studio = series_network(attr)
            metadata.duration = series_runtime(attr)
            metadata.rating = series_rating(attr)
            metadata.genres = series_genres(attr)

            episode = metadata.seasons[s].episodes[e]

            episode.title = episode_title(attr)
            episode.absolute_index = episode_absolute_number(attr)
            episode.originally_available_at = episode_date(attr)
