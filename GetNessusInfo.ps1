Function GetNessusInfo {
    # Information about Nessus Software Key 
    $NessusInfo = Get-ItemProperty -Path "HKLM:\SOFTWARE\Tenable\Nessus Agent"
    $KeyId = $NessusInfo.ProductCode
    $AppKey_Version = $NessusInfo.Version

    # Information about Nessus Uninstall Key
    $UninstallNessusKey = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$KeyId"
    $UninstallVersion = $UninstallNessusKey.DisplayVersion
    $uninstallCommand = $UninstallNessusKey.UninstallString

    # Information about NessusCli.exe file 
    $FileInfo = Get-ItemProperty -Path "C:\Program Files\Tenable\Nessus Agent\nessuscli.exe"
    $FileVersion = $FileInfo.VersionInfo.Productversion

    $Chart = @{
        AppRegVer = $AppKey_Version
        UninstallRegVer = $UninstallVersion
        FileVersion = $FileVersion
        UID = $KeyId
        UninstallCommand = $uninstallCommand
    }

    $Chart
}
