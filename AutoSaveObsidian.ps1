cd "C:\Users\Viet\Documents\Obsidian Vault"
$status = git status --porcelain
$dateTime = Get-Date -Format "dd/MM/yyyy HH:mm:ss"
# If there are changes, run git add .
if ($status) {
    git add .
    git commit -m "Save note at $dateTime"
    git push origin main
}
else {
    Write-Host "No changes to commit."
}
cd "C:\Users\Viet\Desktop\SetupWindow"
