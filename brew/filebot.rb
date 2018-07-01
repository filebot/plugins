cask 'filebot' do
  version '4.8.2'
  sha256 'ee5c9e1439de6c2f090f03dcb6ce206e9cf162658389142b31d424b336bfbbf9'

  url "https://get.filebot.net/filebot/FileBot_#{version}/FileBot_#{version}.app.tar.xz"
  gpg "#{url}.asc", key_url: 'https://raw.githubusercontent.com/filebot/plugins/master/gpg/maintainer.pub'
  appcast 'https://app.filebot.net/update.xml'

  name 'FileBot'
  homepage 'https://www.filebot.net/'

  app "FileBot.app"
  binary "#{appdir}/FileBot.app/Contents/MacOS/filebot.sh", target: 'filebot'

  zap trash: '~/Library/Preferences/net.filebot.ui.plist'

  caveats do
    depends_on_java '10+'
  end
end
