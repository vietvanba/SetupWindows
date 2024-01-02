$softwareToInstall = @(
    "vscode.install",
    "googlechrome",
    "notepadplusplus.install",
    "intellijidea-community",
    "dbeaver",
    "postgresql14",
    "sourcetree",
    "oracle17jdk",
    "git"
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
