$installed = choco list $software | Out-String
if ($installed -notmatch 'nodejs') {
    Write-Output "nodejs is not installed. Proceeding to install..."
    choco install nodejs --version=18.8.0 -y
}else
{
        Write-Output "nodejs is already installed."
}
