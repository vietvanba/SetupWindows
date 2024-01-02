$gitCmdPath = "C:\Program Files\Git\cmd\"  # Update with your Git cmd path
$gitBinPath = "C:\Program Files\Git\bin\"  # Update with your Git bin path

# Get the current PATH variable
$currentPaths = [System.Environment]::GetEnvironmentVariable("Path", "Machine").Split(';')

# Check if the paths already exist in the PATH variable
$pathsToAdd = @()
if ($currentPaths -notcontains $gitCmdPath) {
    $pathsToAdd += $gitCmdPath
}
if ($currentPaths -notcontains $gitBinPath) {
    $pathsToAdd += $gitBinPath
}

# Append the new paths to the PATH variable if they don't exist
if ($pathsToAdd.Count -gt 0) {
    $newPaths = $pathsToAdd -join ';'
    $existingPath = [System.Environment]::GetEnvironmentVariable("Path", "Machine")
    $newPath = "$newPaths;$existingPath"
    [System.Environment]::SetEnvironmentVariable("Path", $newPath, "Machine")
    Write-Host "GIT PATH ADDED."
} else {
    Write-Host "GIT PATH already exist in the PATH variable. No changes made."
}
