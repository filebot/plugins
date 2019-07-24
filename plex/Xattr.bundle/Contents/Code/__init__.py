# local xattr agent


#####################################################################################################################


class xattrMovie(Agent.Movies):
  name = 'Xattr (Movies)'
  languages = [Locale.Language.NoLanguage]
  
  def search(self, results, media, lang):
    results.Append(MetadataSearchResult(id = 'null', score = 100))

  def update(self, metadata, media, lang):
    Log("self: %s" % self)
    Log("metadata: %s" % metadata)
    Log("media: %s" % media)
    Log("lang: %s" % lang)


#####################################################################################################################


class xattrSeries(Agent.TV_Shows):
  name = 'Xattr (TV)'
  languages = [Locale.Language.NoLanguage]

  def search(self, results, media, lang):
    results.Append(MetadataSearchResult(id = 'null', score = 100))

  def update(self, metadata, media, lang):
    Log("self: %s" % self)
    Log("metadata: %s" % metadata)
    Log("media: %s" % media)
    Log("lang: %s" % lang)
