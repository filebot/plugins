from os.path import *


def getxattr_plain_file(store, file, name):
  if not isabs(store):
    store = join(dirname(file), store)

  xattrFile = join(store, basename(file), name)

  try:
    fd = open(xattrFile, "rb")
    buffer = fd.read()
    fd.close()
    return buffer.decode('UTF-8')
  except:
    return None
