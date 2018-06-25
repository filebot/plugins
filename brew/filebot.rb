cask 'filebot' do
  version '4.8.2'
  sha256 'b226b6f2b98417d7b4f452af927b39557adfceabb7db0b0b082c6c7e126a5f74'

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
