$PACKAGE_VERSION = "5.1.4"


$PACKAGE_URL1 = "https://get.filebot.net/filebot/FileBot_${PACKAGE_VERSION}/FileBot_${PACKAGE_VERSION}_x64.msi"
$PACKAGE_URL2 = "https://get.filebot.net/filebot/FileBot_${PACKAGE_VERSION}/FileBot_${PACKAGE_VERSION}_x86.msi"


Invoke-WebRequest https://aka.ms/wingetcreate/latest -OutFile wingetcreate.exe
.\wingetcreate.exe update PointPlanck.FileBot $args --version $PACKAGE_VERSION --urls $PACKAGE_URL1 $PACKAGE_URL2
