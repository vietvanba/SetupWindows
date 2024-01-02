$path = "D:\Code"
function CheckPathExisted {
    param(
        [string] $path
    )
    if (Test-Path $path) {
        return $true
    }
    else {
        return $false
    }
}
$counter = 1
while (!(CheckPathExisted -path $path)) {
    if ($counter -lt 3) {
        Write-Output "Trying to create new folder with path" $path "Times: " $counter
        mkdir $path
        $counter++
    }
    else {
        Write-Output "Something wrong with directory. please check!"
        break
    }
}
cd $path
git clone https://github.com/vietvanba/dictionary.git
cd .\dictionary\frontend-reactjs-vite
npm install
git clone https://github.com/vietvanba/reactResponesiveAdminDashboard.git