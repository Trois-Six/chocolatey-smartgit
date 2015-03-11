$packageName = 'SmartGit'
$version = '6_5_6'
$fileType = '.zip'
$silentArgs = '/sp- /silent /norestart'

try {
    $url = 'http://www.syntevo.com/downloads/smartgit/smartgit-win32-setup-nojre-' + $version + $fileType

    $httpRequest = [System.Net.WebRequest]::Create($url)
    $httpResponse = $httpRequest.GetResponse()
    $httpStatus = [int]$httpResponse.StatusCode

    if (!($httpStatus = 200)) {
        Write-Error "File not found, trying to find it in the archive"
        $url = 'http://www.syntevo.com/download/smartgithg/archive/smartgithg-win32-setup-nojre-' + $version + $fileType
    }

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