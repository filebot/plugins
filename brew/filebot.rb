cask 'filebot' do
  version '4.7.10'
  sha256 '6a97eed72a11bc16637e5f7e969d49cd6112b7bb2eee90d623e1574ade833ae5'

  url "https://get.filebot.net/filebot/#{version}/FileBot_#{version}-darwin.tar.xz.gpg"
  gpg :embedded, key_url: 'https://raw.githubusercontent.com/filebot/plugins/master/gpg/maintainer.pub'
  appcast 'https://app.filebot.net/update.xml', checkpoint: 'cfc707d5378dd6e9ca479a4d20f92801e4a18ce326909ff31b99d417649a4fae'

  name 'FileBot'
  homepage 'https://www.filebot.net/'

  binary 'FileBot.app/Contents/MacOS/filebot.sh', target: 'filebot'
  zap delete: '~/Library/Preferences/net.filebot.ui.plist'

  depends_on formula: 'gpg'
  depends_on cask: 'java'
end
