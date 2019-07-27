import os, sys


# Windows / NTFS Alternative Streams
if os.name == 'nt':
    def getxattr(file, name):
      try:
        fd = open("%s:%s" % (file, name), "rb")
        buffer = fd.read()
        fd.close()
        return buffer.decode('UTF-8')
      except: 
        return None


# Unix / xattr
elif os.name == 'posix':
  from ctypes import *
  from ctypes.util import *

  libc_name = find_library('c')
  libc = CDLL(libc_name)

  if sys.platform.startswith('linux'):
    libc.getxattr.argtypes = (c_char_p, c_char_p, c_char_p, c_size_t)
    libc.getxattr.restype = c_ssize_t
    def getxattr_impl(file, name, buffer):
      return libc.getxattr(file, name, buffer, sizeof(buffer))

  elif sys.platform.startswith('darwin'):
    libc.getxattr.argtypes = (c_char_p, c_char_p, c_char_p, c_size_t, c_uint32, c_int)
    libc.getxattr.restype = c_ssize_t
    def getxattr_impl(file, name, buffer):
      return libc.getxattr(file, name, buffer, sizeof(buffer), 0, 0)

  elif sys.platform.startswith('freebsd'):
    libc.extattr_get_file.argtypes = (c_char_p, c_int, c_char_p, c_char_p, c_size_t)
    libc.extattr_get_file.restype = c_ssize_t
    def getxattr_impl(file, name, buffer):
      return libc.extattr_get_file(file, 0x0001, name, buffer, sizeof(buffer))

  else:
    def getxattr_impl(file, name, buffer):
      return 0

  def fsencode(file):
    return file.encode(sys.getfilesystemencoding())

  def getxattr(file, name):
    file = fsencode(file)
    name = fsencode(name)

    buffer = create_string_buffer(64 * 1024)
    n = getxattr_impl(file, name, buffer)
    if n > 0:
      return buffer.raw[0:n].decode('UTF-8')
    else:
      return None


# other platforms / not supported
else:
  def getxattr(file, name):
    return None


if __name__ == "__main__":
  for f in sys.argv:
    print(f)
    print(getxattr(f, 'net.filebot.metadata'))
