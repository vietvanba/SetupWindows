# Specify the path to your Java installation directory
function CheckPathExisted {
    param(
        [string] $path
    )
    if(Test-Path $path)
    {
        return $true
    }else {
        return $false
    }
}
if(CheckPathExisted -path "C:\Program Files\Java\")
{
    $javaFolder = Get-ChildItem -Path "C:\Program Files\Java\" -Directory | Where-Object { $_.Name -like "jdk*" } | Sort-Object { $_.Name.Length } -Descending | Select-Object -First 1

        $javaPath = $javaFolder.Fullname
        $javaHomeExists = [Environment]::GetEnvironmentVariable("JAVA_HOME", "Machine")
        if (-not $javaHomeExists)
        {
            [Environment]::SetEnvironmentVariable("JAVA_HOME", $javaPath, "Machine")
            Write-Output "JAVA_HOME ADDED"

        }else
        {
            Write-Output "JAVA_HOME EXIST"
        }
        $javaBin = Join-Path -Path $javaPath -ChildPath "bin"
        $currentPath = [Environment]::GetEnvironmentVariable("Path", "Machine")
        
        if ($currentPath -like "*$javaBin*") {
            Write-Host "Bin exists in the path."
        } else {
            $newPath = "$currentPath;$javaBin"
            [Environment]::SetEnvironmentVariable("Path", $newPath, "Machine")
            Write-Output "BIN ADDED"

        }
        
        
        
}

