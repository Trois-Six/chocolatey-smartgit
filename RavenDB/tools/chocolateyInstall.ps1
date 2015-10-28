$url = 'http://hibernatingrhinos.com/downloads/RavenDB%20Installer/3800'

Install-ChocolateyPackage 'RavenDB' 'exe' '/quiet /msicl "RAVEN_TARGET_ENVIRONMENT=DEVELOPMENT TARGETDIR=C:\ INSTALLFOLDER=C:\RavenDB RAVEN_INSTALLATION_TYPE=SERVICE REMOVE=IIS ADDLOCAL=Service"' $url