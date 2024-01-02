$softwareToInstall = @(
    "vscode.install",
    "googlechrome",
    "notepadplusplus.install",
    "intellijidea-community",
    "dbeaver",
    "postgresql",
    "sourcetree",
    "oracle17jdk",
    "git"
)
forEach($software in $softwareToInstall)
{
    $installed = choco list $software | Out-String
    if ($installed -notmatch $software) {
        if($software -match "postgresql")
        {
            Write-Output "$software is not installed. Proceeding to install..."
            echo "A" | choco install $software --params '/AllowRemote /Password:1 /Port:5433' --ia '--enable-components server,commandlinetools'
        }else
        {
            Write-Output "$software is not installed. Proceeding to install..."
            echo "A" | choco install $software
        }
    } else {
        Write-Output "$software is already installed."
    }
}
