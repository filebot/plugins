import json

from filebot import *


def Start():
  Log(FileBotCommand().version().strip())


#####################################################################################################################


def ReadXattrObject(file):
  xattrValue = FileBotCommand().metadata(file)
  return json.loads(xattrValue)


#####################################################################################################################


class XattrMovieAgent(Agent.Movies):
  name = 'FileBot Xattr Metadata (Movies)'
  languages = [Locale.Language.NoLanguage]
  primary_provider = False
  persist_stored_files = False
  accepts_from = ['com.plexapp.agents.localmedia']


  def search(self, results, media, lang):
    results.Append(MetadataSearchResult(id = 'null', score = 100))


  def update(self, metadata, media, lang):
    if media.items is None:
      return

    file = media.items[0].parts[0].file
    Log("[FILE] %s" % file)

    xattr = ReadXattrObject(file)
    Log("[XATTR] %s" % xattr)

    metadata.title = xattr['name']
    metadata.year = xattr['year']

    tmdbId = xattr['tmdbId']
    imdbId = xattr['imdbId']

    if tmdbId > 0:
      metadata.id = str(tmdbId)
    elif imdbId > 0:
      metadata.id = 'tt%0*d' % (7, imdbId)
