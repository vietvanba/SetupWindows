$path="D:\Tools"
$fileLinks = @(
    "https://github.com/lamquangminh/EVKey/releases/download/Release/EVKey.zip",
    "https://github.com/vietvanba/java/releases/download/v1.0.0/JAVADOC.zip"
)
function DownloadFile {
    param (
        [string[]]$links,
        [string]$path = "D:\Tools" # Default download path
    )

    foreach ($link in $links) {
        $filename = $link.Substring($link.LastIndexOf("/") + 1)
        $outputPath = Join-Path -Path $path -ChildPath $filename

        # Check if file already exists at the output path
        if (Test-Path $outputPath -PathType Leaf) {
            Write-Host "File already exists. Skipping download for: $outputPath"
        } else {
            Write-Host "Downloading file from: $link"
            Invoke-WebRequest -Uri $link -OutFile $outputPath

            # Check if download succeeded
            if (Test-Path $outputPath -PathType Leaf) {
                Write-Host "File download succeeded. File saved as: $outputPath"
            } else {
                Write-Host "File download failed."
            }
        }
    }
}

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
$counter = 1
while (!(CheckPathExisted -path $path)) {
    if ($counter -lt 3)
    {
        Write-Output "Trying to create new folder with path" $path "Times: " $counter
        mkdir $path
        $counter++
    }else
    {
        Write-Output "Something wrong with directory. please check!"
        break
    }
}
DownloadFile -links $fileLinks

