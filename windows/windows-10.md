All commands run from powershell admin prompt.

## disable ntfs atime

`fsutil behavior set disablelastaccess 1`

## disable background apps

reboot

## disable defender
Lasts until next reboot. Good to do before applying Windows updates.

`Set-MpPreference -DisableRealtimeMonitoring $true`

## uninstall yourphone

`Get-AppxPackage Microsoft.YourPhone -AllUsers | Remove-AppxPackage`

## disable windows search service
```
sc stop wsearch
sc config wsearch start=disabled
```

## apply windows updates
start -> check for updates

## run debloat scripts
https://github.com/Sycnex/Windows10Debloater

## adjust appearance and performance of windows
- adjust for best performance
- show thumbnails, smooth font edges

## privacy settings 
- background apps
- disable everything except spotify and ubuntu



## install WSL2/Ubuntu, then set noatime in WSL, /etc/fstab
https://docs.microsoft.com/en-us/windows/wsl/install-manual
```
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
wsl --set-default-version 2
```
`LABEL=cloudimg-rootfs   /        ext4   defaults,noatime        0 0`


# ahk
https://gist.github.com/volks73/1e889e01ad0a736159a5d56268a300a8


