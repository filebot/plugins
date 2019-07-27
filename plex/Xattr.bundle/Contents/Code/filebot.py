import json

from os.path import *
from xattr import *


def metadata(file):
  Log("[FILE] %s" % file)

  # try xattr
  metadata = getxattr(file, 'net.filebot.metadata')

  # try plain file xattr store
  if metadata is None:
    metadata = getxattr_plain_file('.xattr', file, 'net.filebot.metadata')

  Log("[XATTR] %s" % metadata)
  if metadata is not None:
    return json.loads(metadata)
  else:
    return None


def movie_id(attr):
  tmdb_id = attr['tmdbId']
  if tmdb_id > 0:
    id = str(tmdb_id)
    Log("[TMDB] %s" % id)
    return id

  imdb_id = attr['imdbId']
  if imdb_id > 0:
    id = 'tt%07d' % imdb_id
    Log("[IMDB] %s" % id)
    return id

  return None


def getxattr_plain_file(store, file, name):
  if not isabs(store):
    store = join(dirname(file), store)

  xattr_file = join(store, basename(file), name)

  if not isfile(xattr_file):
    return None

  Log("[STORE] %s" % xattr_file)

  fd = open(xattr_file, "rb")
  buffer = fd.read()
  fd.close()
  return buffer.decode('UTF-8')
