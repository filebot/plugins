cask 'filebot' do
  version '4.7.15.9'
  sha256 '13dc465bf4ad6930af8d6656741e69a52f6aee266fe56b03ea1af72163ce006c'

  url "https://get.filebot.net/filebot/latest/FileBot_#{version}-darwin.tar.xz.gpg"
  gpg "#{url}.asc", key_url: 'https://raw.githubusercontent.com/filebot/plugins/master/gpg/maintainer.pub'
  appcast 'https://app.filebot.net/update.xml', checkpoint: 'cfc707d5378dd6e9ca479a4d20f92801e4a18ce326909ff31b99d417649a4fae'

  name 'FileBot'
  homepage 'https://www.filebot.net/'

  binary 'filebot.sh', target: 'filebot'

  depends_on formula: 'gpg'
  depends_on cask: 'java'
end
