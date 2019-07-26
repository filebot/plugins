import json
import filebot


def Start():
  Log("START".ljust(157, '-'))
  Log(FileBotCommand().version())


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
    Log("search()".ljust(157, '-'))
    Log("self: %s" % self)
    Log("results: %s" % results)
    Log("media: %s" % media)
    Log("lang: %s" % lang)
    results.Append(MetadataSearchResult(id = 'null', score = 100))


  def update(self, metadata, media, lang):
    Log("update()".ljust(157, '-'))
    Log("self: %s" % self)
    Log("metadata: %s" % metadata)
    Log("media: %s" % media)
    Log("lang: %s" % lang)

    for attr_name, attr_obj in metadata.attrs.iteritems():
      Log("attr_name: %s" % attr_name)
      Log("attr_obj: %s" % attr_obj)

    file = movie.parts[0]
    Log("file: %s" % file)

    xattr = ReadXattrObject(file)
    Log("xattr: %s" % xattr)

    metadata.title = xattr['name']
    metadata.year = xattr['year']

    tmdbId = xattr['tmdbId']
    imdbId = xattr['imdbId']
    if tmdbId > 0:
      metadata.id = tmdbId
    elif imdbId > 0:
      metadata.id = 'tt%0*d' % (7, imdbId)

