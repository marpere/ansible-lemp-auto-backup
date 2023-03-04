$WsldistributionName = "rocky-9"
$rockyLInux9WslImageName = "Rocky-9-Container-Base.latest.x86_64.tar.xz"
$rockyLinux9WslImageLocalFile = "./$rockyLInux9WslImageName"
$rockyLInux9WslImageUrlDownload = "https://download.rockylinux.org/pub/rocky/9/images/x86_64/$rockyLInux9WslImageName"
$isImageDownloaded = Test-Path -Path $rockyLinux9WslImageLocalFile -PathType Leaf

function Initialize-Distribution{
    param(
        [bool]$SkipDownloadIfAlreadyDownloaded = $true
    )

    if($SkipDownloadIfAlreadyDownloaded){
        if (-not($isImageDownloaded)) {
            Invoke-WebRequest -Uri $rockyLInux9WslImageUrlDownload -OutFile $rockyLinux9WslImageLocalFile
        }
    }
}

function Install-Distribution{
    wsl --import $WsldistributionName $WsldistributionName $rockyLinux9WslImageLocalFile --version 2
}

function Edit-Distribution{
    wsl --distribution $WsldistributionName --user root bash -ic "dnf install -y systemd"
    Copy-Item -Path .\wsl.conf -Destination \\wsl.localhost\$WsldistributionName\etc\
}

function Restart-Distribution{
    wsl --shutdown $WsldistributionName
    wsl --distribution $WsldistributionName
}

function Main{    
    Initialize-Distribution -SkipDownloadIfAlreadyDownloaded $true
    Install-Distribution
    Edit-Distribution
    Restart-Distribution
}

Main "$@"