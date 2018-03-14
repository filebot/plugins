cask 'filebot' do
  version '4.7.21'
  sha256 '8b1d2b715e50133e0d6faab6674fca7f8f403c81ed9f4d2cd8449935f9287442'

  url "https://get.filebot.net/filebot/latest/FileBot_#{version}-darwin.tar.xz.gpg"
  gpg :embedded, key_url: 'https://raw.githubusercontent.com/filebot/plugins/master/gpg/maintainer.pub'
  appcast 'https://app.filebot.net/update.xml', checkpoint: 'cfc707d5378dd6e9ca479a4d20f92801e4a18ce326909ff31b99d417649a4fae'

  name 'FileBot'
  homepage 'https://www.filebot.net/'

  binary 'filebot.sh', target: 'filebot'

  depends_on formula: 'gpg'
  depends_on cask: 'java'
end
