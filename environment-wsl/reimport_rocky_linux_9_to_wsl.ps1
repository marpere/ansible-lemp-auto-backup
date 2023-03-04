$distribution = "rocky-linux-9"
function Uninstall-Distribution{
    wsl --unregister $distribution --version 2
}
function Import-Distribution{
    .\import_rocky_linux_9_to_wsl.ps1
}

function Main{    
    Uninstall-Distribution
    Import-Distribution
}

Main "$@"
