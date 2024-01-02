$zipFiles = Get-ChildItem -Path "D:\Tools" -Filter "*.zip"

foreach ($zipFile in $zipFiles) {
    $destination = "D:\Tools\Extract\" + $zipFile.BaseName  # Destination folder for extraction
    
    # Check if destination folder already exists
    if (-not (Test-Path -Path $destination -PathType Container)) {
        New-Item -Path $destination -ItemType Directory
        Expand-Archive -Path $zipFile.FullName -DestinationPath $destination -Force
    } else {
        Write-Host "Destination folder already exists. Skipping extraction for: $zipFile"
    }
}
