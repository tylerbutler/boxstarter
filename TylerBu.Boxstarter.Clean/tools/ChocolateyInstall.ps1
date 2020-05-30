try {
  Update-ExecutionPolicy Unrestricted
  Set-ExplorerOptions -showHiddenFilesFoldersDrives -showProtectedOSFiles -showFileExtensions
  Set-BoxstarterTaskbarOptions -Dock Right -Combine Always -AlwaysShowIconsOn -MultiMonitorOn -MultiMonitorMode     -MultiMonitorCombine Always
  Install-WindowsUpdate -AcceptEula
  
  # Install common packages
  cinst ag # Silver searcher
  cinst ConEmu
  cinst git
  cinst gitkraken
  cinst hub # https://hub.github.com/
  cinst microsoft-edge
  cinst microsoft-edge-insider # Edge beta
  cinst Microsoft-Hyper-V-All -source windowsFeatures
  cinst microsoft-windows-terminal
  cinst GoogleChrome
  cinst Firefox
  cinst poshgit
  cinst powertoys # https://github.com/microsoft/PowerToys
  cinst vscode
  
  # NodeJS
  cinst nvm.portable
  
  # golang
  cinst golang

  # Config dev settings
  Push-Location C:\
  mkdir code
  cd code
  hub clone tylerbutler/devsettings
  Pop-Location
  
  Enable-RemoteDesktop
  Write-ChocolateySuccess 'TylerBu installed'
}
catch {
  Write-ChocolateyFailure 'TylerBu' $($_.Exception.Message)
  throw
}