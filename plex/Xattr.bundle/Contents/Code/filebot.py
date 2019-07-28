import json

from os.path import *
from datetime import *
from xattr import *


def xattr_metadata(file):
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
  id = attr['tmdbId']
  if id > 0:
    Log("[TMDB] %s" % id)
    return str(id)

  id = attr['imdbId']
  if id > 0:
    id = 'tt%07d' % id
    Log("[IMDB] %s" % id)
    return id

  return None


def thetvdb_id(attr):
  if attr_get(attr, 'seriesInfo', 'database') == 'TheTVDB':
    id = attr_get(attr, 'seriesInfo', 'id')
    Log("[TheTVDB] %s" % id)
    return str(id)
  return None


def series_name(attr):
  return attr_get(attr, 'seriesName')

def series_year(attr):
  return attr_get(attr, 'seriesInfo', 'startDate', 'year')

def series_language(attr):
  return attr_get(attr, 'seriesInfo', 'language')

def series_date(attr):
  return attr_date(attr_get(attr, 'seriesInfo', 'startDate'))

def episode_date(attr):
  return attr_date(attr_get(attr, 'airdate'))

def attr_get(attr, *keys):
  for k in keys:
    attr = attr.get(k)
    if attr is None:
      return None
  return attr

def attr_date(attr):
  if attr is not None:
    return datetime(year=attr['year'], month=attr['month'], day=attr['day'])
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
