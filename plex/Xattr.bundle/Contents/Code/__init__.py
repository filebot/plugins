import subprocess

def Start():
  Log("START".ljust(157, '-'))


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


    metadata.title = "July 24 @ %s" % subprocess.check_output(['/usr/local/bin/filebot', '-version'])
