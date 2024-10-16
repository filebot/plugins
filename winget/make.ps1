$PACKAGE_VERSION = "5.1.6"


$PACKAGE_URL1 = "https://get.filebot.net/filebot/FileBot_${PACKAGE_VERSION}/FileBot_${PACKAGE_VERSION}_x64.msi"



Invoke-WebRequest https://aka.ms/wingetcreate/latest -OutFile wingetcreate.exe
.\wingetcreate.exe update PointPlanck.FileBot $args --version $PACKAGE_VERSION --urls $PACKAGE_URL1
