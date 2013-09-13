$packageName = 'RavenDB'
$url = 'http://hibernatingrhinos.com/downloads/RavenDB%20Installer/2700'

try {
	# $toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
	# $downloadPath = Join-Path $toolsDir "raven-install.exe"

	Install-ChocolateyPackage $packageName "exe" "" $url

	# Get-ChocolateyWebFile $packageName $downloadPath $url

    # Install-ChocolateyInstallPackage $packageName "exe" "" $downloadPath

    # Remove-Item $downloadPath
        
    Write-ChocolateySuccess $packageName
} catch {
    Write-ChocolateyFailure $packageName "$($_.Exception.Message)"
    throw
}