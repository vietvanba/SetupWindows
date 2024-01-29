Unblock-File -Path .\InstallChoco.ps1
.\InstallChoco.ps1
if ($?) {
        Unblock-File -Path .\RightClick.bat
        Write-Host "=============================================================================="
        .\RightClick.bat
        Write-Host "=============================================================================="
        Unblock-File -Path .\InstallSoftware.ps1
        .\InstallSoftware.ps1
        Write-Host "=============================================================================="
        Unblock-File -Path .\InstallNodeJS.ps1
        .\InstallNodeJS.ps1
        Write-Host "=============================================================================="
        Unblock-File -Path .\SetJavaHomeEnvironment.ps1
        .\SetJavaHomeEnvironment.ps1
        Write-Host "=============================================================================="
        Unblock-File -Path .\SetGitEnvironment.ps1
        .\SetGitEnvironment.ps1
        Write-Host "=============================================================================="
        Unblock-File -Path .\DownloadFile.ps1
        .\DownloadFile.ps1
        Write-Host "=============================================================================="
        Unblock-File -Path .\ExtractFiles.ps1
        .\ExtractFiles.ps1
        Write-Host "=============================================================================="
        Unblock-File -Path .\WintelSetupHostpot.ps1
        .\WintelSetupHostpot.ps1
        Write-Host "=============================================================================="
        Unblock-File -Path .\CloneCode.ps1
        $NewScriptPath = ".\CloneCode.ps1"
        Write-Host "=============================================================================="
        Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$NewScriptPath`"" -Verb RunAs
} 
else {
        Write-Output "Can't run script"
}
