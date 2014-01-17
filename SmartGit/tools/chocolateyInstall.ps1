$packageName = 'SmartGit'
$url = 'http://www.syntevo.com/download/smartgithg/smartgithg-win32-setup-nojre-5_0_6.zip'
$silentArgs = '/sp- /silent /norestart'

try {
    $toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
    Install-ChocolateyZipPackage "$packageName" "$url" $toolsDir

    $exeFilePath = get-childitem $toolsDir -recurse -include *.exe | select -First 1
    Install-ChocolateyInstallPackage "$packageName" "exe" "$silentArgs" "$exeFilePath"
    
    $logFilePath = get-childitem $toolsDir -recurse -include *.txt | select -First 1
    Remove-Item "$exeFilePath"
    Remove-Item "$logFilePath"
    
    Write-ChocolateySuccess "$packageName"
} catch {
    Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
    throw
}