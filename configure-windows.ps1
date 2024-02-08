####################################
#--- Configure Windows Explorer ---#
####################################
Write-Output "Configuring Windows Explorer"

# Navigate registry
Push-Location
Set-Location HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced

# Show file extensions
Set-ItemProperty . HideFileExt "0"
# Show hidden files
Set-ItemProperty . Hidden "1"

Pop-Location

# Force Windows Explorer restart so settings take effect
Stop-Process -processName: Explorer -force

######################
#--- Install Apps ---#
######################
Write-Output "Installing Apps"
$apps = @(
    @{name = "7zip.7zip" },
    @{name = "Adobe.Acrobat.Reader.64-bit" },
    @{name = "Audacity.Audacity" },
    @{name = "CoreyButler.NVMforWindows" },
    @{name = "Discord.Discord" },
    @{name = "GIMP.GIMP" },
    @{name = "Git.Git" },
    @{name = "GitHub.cli" },
    @{name = "GoLang.Go.1.20" },
    @{name = "Google.Chrome" },
    @{name = "Google.Drive" },
    @{name = "Greenshot.Greenshot" },
    @{name = "Malwarebytes.Malwarebytes" },
    @{name = "Microsoft.PowerShell" },
    @{name = "Microsoft.PowerToys" },
    @{name = "Microsoft.VisualStudio.2022.Community" },
    @{name = "Microsoft.VisualStudioCode" },
    @{name = "Mozilla.Firefox" },
    @{name = "Postman.Postman" },
    @{name = "Python.Python.3.11" },
    @{name = "Amazon.AWSCLI" },
    @{name = "Amazon.SAM-CLI" },
    @{name = "Racket.Racket" },
    @{name = "Rustlang.Rustup" },
    @{name = "Spotify.Spotify" },
    @{name = "SteelSeries.GG" },
    @{name = "Valve.Steam" },
    @{name = "VideoLAN.VLC" },
    @{name = "WinDirStat.WinDirStat" }
);
Foreach ($app in $apps) {
    Write-host "Installing: " $app.name
    winget install -e -h --accept-source-agreements --accept-package-agreements --id $app.name 
}

###############################
#--- Install Node Versions ---#
###############################
nvm install 16
nvm install 18
nvm use 18

###################################
#--- Install VSCode Extensions ---#
###################################
code --install-extension amazonwebservices.aws-toolkit-vscode --force
code --install-extension astro-build.astro-vscode --force
code --install-extension christian-kohler.path-intellisense --force
code --install-extension esbenp.prettier-vscode --force
code --install-extension golang.go --force
code --install-extension mgmcdermott.vscode-language-babel --force
code --install-extension ms-azuretools.vscode-docker --force
code --install-extension ms-vscode-remote.remote-containers --force
code --install-extension ms-vscode-remote.remote-ssh --force
code --install-extension ms-vscode-remote.remote-ssh-edit --force
code --install-extension ms-vscode-remote.remote-wsl --force
code --install-extension ms-vscode-remote.vscode-remote-extensionpack --force
code --install-extension ms-vscode.powershell --force
code --install-extension ms-vscode.remote-explorer --force
code --install-extension ms-vscode.remote-server --force
code --install-extension PKief.material-icon-theme --force
code --install-extension unifiedjs.vscode-mdx --force