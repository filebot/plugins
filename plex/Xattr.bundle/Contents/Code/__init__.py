import json

import xattr


def Start():
  Log("[START]")


#####################################################################################################################


def ReadXattrObject(file):
  Log("[FILE] %s" % file)
  metadata = xattr.getxattr(file, 'net.filebot.metadata')

  Log("[XATTR] %s" % metadata)
  if metadata is not None:
    return json.loads(metadata)
  else:
    return None


def GetMovieID(attr):
  tmdbId = attr['tmdbId']
  if tmdbId > 0:
    id = str(tmdbId)
    Log("[TMDB] %s" % id)
    return id

  imdbId = attr['imdbId']
  if imdbId > 0:
    id = 'tt%07d' % imdbId
    Log("[IMDB] %s" % id)
    return id

  return None


#####################################################################################################################


class XattrMovieAgent(Agent.Movies):
  name = 'FileBot Xattr Metadata (Movies)'
  languages = [Locale.Language.NoLanguage]
  primary_provider = False
  persist_stored_files = False
  accepts_from = ['com.plexapp.agents.localmedia']


  def search(self, results, media, lang):
    Log("[SEARCH]")

    if media.items is None:
      return

    file = media.items[0].parts[0].file
    attr = ReadXattrObject(file)
    if attr is None:
      return

    id = GetMovieID(attr)
    if id is None:
      return

    results.Append(
      MetadataSearchResult(
        id = id, 
        name = attr['name'], 
        year = attr['year'],
        lang = attr['language'],
        score = 100
      )
    )


  def update(self, metadata, media, lang):
    Log("[UPDATE]")

    if media.items is None:
      return

    file = media.items[0].parts[0].file
    attr = ReadXattrObject(file)
    if attr is None:
      return

    id = GetMovieID(attr)
    if id is None:
      return

    metadata.id = id
    metadata.title = attr['name']
    metadata.year = attr['year']
