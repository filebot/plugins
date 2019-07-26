import json

from filebot import *


def Start():
  Log("[START]")
  Log(FileBotCommand().version())


#####################################################################################################################


def ReadXattrObject(file):
  Log("[FILE] %s" % file)
  xattrValue = FileBotCommand().metadata(file)
  if len(xattrValue) > 0:
    Log("[XATTR] %s" % xattrValue)
    return json.loads(xattrValue)
  else:
    Log("[XATTR] undefined")
    return None


def GetMovieID(xattr):
  tmdbId = xattr['tmdbId']
  if tmdbId > 0:
    id = str(tmdbId)
    Log("[TMDB] %s" % id)
    return id

  imdbId = xattr['imdbId']
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
    xattr = ReadXattrObject(file)
    if xattr is None:
      return

    id = GetMovieID(xattr)
    if id is None:
      return

    results.Append(
      MetadataSearchResult(
        id = id, 
        name = xattr['name'], 
        year = xattr['year'],
        lang = xattr['language'],
        score = 100
      )
    )


  def update(self, metadata, media, lang):
    Log("[UPDATE]")

    if media.items is None:
      return

    file = media.items[0].parts[0].file
    xattr = ReadXattrObject(file)
    if xattr is None:
      return

    id = GetMovieID(xattr)
    if id is None:
      return

    metadata.id = id
    metadata.title = xattr['name']
    metadata.year = xattr['year']
