$softwareToInstall = @(
    "vscode.install",
    "googlechrome",
    "notepadplusplus.install",
    "intellijidea-community",
    "dbeaver",
    "sourcetree",
    "oracle17jdk",
    "git",
    # "office365business",
    "7zip.install",
    "obsidian",
    "foxitreader",
    "postman",
    "messenger"
)
forEach ($software in $softwareToInstall) {
    $installed = choco list $software | Out-String
    if ($installed -notmatch $software) {
        Write-Output "$software is not installed. Proceeding to install..."
        echo "A" | choco install $software
        
    }
    else {
        Write-Output "$software is already installed."
    }
}
