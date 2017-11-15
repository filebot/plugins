cask 'filebot' do
  version '4.7.14'
  sha256 'c9dc41d2a47d9db99b5ec8e18603805bf1809964e79f9ffbe2e44f0129f320ff'

  url "https://get.filebot.net/filebot/latest/FileBot_4.7.14_r5241-darwin.tar.xz.gpg"
  gpg "#{url}.asc", key_url: 'https://raw.githubusercontent.com/filebot/plugins/master/gpg/maintainer.pub'
  appcast 'https://app.filebot.net/update.xml', checkpoint: 'cfc707d5378dd6e9ca479a4d20f92801e4a18ce326909ff31b99d417649a4fae'

  name 'FileBot'
  homepage 'https://www.filebot.net/'

  binary 'FileBot.app/Contents/MacOS/filebot.sh', target: 'filebot'
  zap delete: '~/Library/Preferences/net.filebot.ui.plist'

  depends_on formula: 'gpg'
  depends_on cask: 'java'
end
