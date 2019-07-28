from filebot import *


def Start():
  Log("[START]")


#####################################################################################################################


class XattrMovieAgent(Agent.Movies):
  name = 'FileBot Xattr Metadata (Movies)'
  languages = [Locale.Language.NoLanguage]
  primary_provider = False
  persist_stored_files = False
  accepts_from = None
  contributes_to = None


  def search(self, results, media, lang):
    Log("[SEARCH]")

    if media.items is None:
      return

    file = media.items[0].parts[0].file
    attr = xattr_metadata(file)
    if attr is None:
      return

    id = movie_id(attr)
    if id is None:
      return

    results.Append(
      MetadataSearchResult(
        id = id, 
        name = attr.get('name'),
        year = attr.get('year'),
        lang = attr.get('language'),
        score = 100
      )
    )


  def update(self, metadata, media, lang):
    Log("[UPDATE]")

    if media.items is None:
      return

    file = media.items[0].parts[0].file
    attr = xattr_metadata(file)
    if attr is None:
      return

    id = movie_id(attr)
    if id is None:
      return

    metadata.id = id
    metadata.title = attr.get('name')
    metadata.year = attr.get('year')


#####################################################################################################################


class XattrSeriesAgent(Agent.TV_Shows):
  name = 'FileBot Xattr Metadata (TV)'
  languages = [Locale.Language.NoLanguage]
  primary_provider = True
  fallback_agent = None
  persist_stored_files = False
  contributes_to = ['com.plexapp.agents.thetvdb', 'com.plexapp.agents.themoviedb', 'com.plexapp.agents.none']

  def search(self, results, media, lang, manual=False):
    for s in media.seasons:
      for e in media.seasons[s].episodes:
        for i in media.seasons[s].episodes[e].items:
          for part in i.parts:
            Log("[SEARCH] %s | %s" % (s, e))
            file = part.file
            attr = xattr_metadata(file)
            if attr is None:
              continue

            id = thetvdb_id(attr)
            if id is None:
              continue

            results.Append(
              MetadataSearchResult(
                id = id,
                name = series_name(attr),
                year = series_year(attr),
                lang = series_language(attr),
                score = 100
              )
            )


  def update(self, metadata, media, lang, force=False):
    for s in media.seasons:
      for e in media.seasons[s].episodes:
        for i in media.seasons[s].episodes[e].items:
          for part in i.parts:
            Log("[UPDATE] %s | %s" % (s, e))
            file = part.file
            attr = xattr_metadata(file)
            if attr is None:
              return

            id = thetvdb_id(attr)
            if id is None:
              continue

            metadata.id = id
            metadata.title = series_name(attr)
            metadata.originally_available_at = series_date(attr)

            metadata.content_rating = attr_get(attr, 'seriesInfo', 'certification')
            metadata.studio = attr_get(attr, 'seriesInfo', 'network')
            metadata.duration = attr_get(attr, 'seriesInfo', 'runtime')
            metadata.rating = attr_get(attr, 'seriesInfo', 'rating')
            metadata.genres = attr_get(attr, 'seriesInfo', 'genres')

            episode = metadata.seasons[s].episodes[e]
            Log("[EPISODE] %s" % episode)

            episode.title = attr.get('title')
            episode.absolute_index = attr.get('absolute')
            episode.originally_available_at = episode_date(attr)
            Log("[EPISODE] %s" % episode)
