import filebot


def Start():
  Log("[START]")


#####################################################################################################################


class XattrMovieAgent(Agent.Movies):
  name = 'FileBot Xattr Metadata (Movies)'
  languages = [Locale.Language.NoLanguage]
  primary_provider = False
  persist_stored_files = False
  contributes_to = ['com.plexapp.agents.imdb', 'com.plexapp.agents.none']


  def search(self, results, media, lang):
    Log("[SEARCH]")

    if media.items is None:
      return

    file = media.items[0].parts[0].file
    attr = filebot.metadata(file)
    if attr is None:
      return

    id = filebot.movie_id(attr)
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
    attr = filebot.metadata(file)
    if attr is None:
      return

    id = filebot.movie_id(attr)
    if id is None:
      return

    metadata.id = id
    metadata.title = attr['name']
    metadata.year = attr['year']
