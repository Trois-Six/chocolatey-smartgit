$packageName = 'SmartGit'
$url = 'http://www.syntevo.com/download/smartgithg/smartgithg-win32-setup-nojre-4_0_5.zip'
$silentArgs = '/sp- /silent /norestart'

try {
    $toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
    Install-ChocolateyZipPackage "$packageName" "$url" $toolsDir

    $fileFullPath = get-childitem $toolsDir -recurse -include *.exe | select -First 1
    Install-ChocolateyInstallPackage "$packageName" "exe" "$silentArgs" "$fileFullPath"

    Remove-Item "$fileFullPath"
    
    Write-ChocolateySuccess "$packageName"
} catch {
    Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
    throw
}