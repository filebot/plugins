cask 'filebot-latest' do
  version :latest
  sha256 :no_check

  url 'https://get.filebot.net/filebot/BETA/FileBot_4.8.2.app.tar.xz'
  # gpg "#{url}.asc", key_url: 'https://raw.githubusercontent.com/filebot/plugins/master/gpg/maintainer.pub'
  appcast "#{url}.sha256"
  name 'FileBot'
  homepage 'https://www.filebot.net/'

  app 'FileBot.app'
  binary "#{appdir}/FileBot.app/Contents/MacOS/filebot.sh", target: 'filebot'
  binary "#{appdir}/FileBot.app/Contents/Resources/bash_completion.d/filebot_completion", target: "#{HOMEBREW_PREFIX}/etc/bash_completion.d/filebot"

  zap trash: '~/Library/Preferences/net.filebot.ui.plist'
end
