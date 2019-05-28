cask 'filebot-beta' do
  version :latest
  sha256 :no_check

  url "https://get.filebot.net/filebot/BETA/FileBot_4.8.6.app.tar.xz"

  name 'FileBot'
  homepage 'https://www.filebot.net/'
  gpg "#{url}.asc", key_url: 'https://raw.githubusercontent.com/filebot/plugins/master/gpg/maintainer.pub'

  app 'FileBot.app'
  binary "#{appdir}/FileBot.app/Contents/MacOS/filebot.sh", target: 'filebot'

  zap trash: '~/Library/Preferences/net.filebot.ui.plist'
end