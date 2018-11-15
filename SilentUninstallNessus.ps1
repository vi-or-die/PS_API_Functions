Function UninstallNessus {
    # Grab the Uninstall string
    $uninstall64 = gci "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" | foreach { gp $_.PSPath } | ? { $_ -match "Nessus Agent" } | select UninstallString 
    $uninstall64 = $uninstall64.UninstallString -Replace "msiexec.exe","" -Replace "/I","" -Replace "/X","" 
    $uninstall64 = $uninstall64.Trim() 
    # Uninstall Nessus Quietly
    start-process "msiexec.exe" -arg "/X $uninstall64 /qn" -Wait
}
