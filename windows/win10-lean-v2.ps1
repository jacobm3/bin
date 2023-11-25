
#test

# Paste this section into an admin powershell terminal
# Begin paste block
# enable unsigned powershell scripts
Set-ExecutionPolicy RemoteSigned -Scope LocalMachine -Force
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force

Set-MpPreference -DisableRealtimeMonitoring $true
Set-MpPreference -DisableBehaviorMonitoring $true
fsutil behavior set disablelastaccess 1
fsutil behavior set disablelastaccess 1
powercfg.exe /hibernate off
Add-MpPreference -ExclusionPath "C:\Windows","C:\Program Files","C:\Program Files (x86)","D:\Program Files","D:\Program Files (x86)","%TEMP%\WinGet"

# disable background apps
Reg Add HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications /v GlobalUserDisabled /t REG_DWORD /d 1 /f

# End Paste Block

# apply win10 updates

# Then execute this entire script (ok to rerun the top part)

# Once that completes, run https://github.com/Sycnex/Windows10Debloater/blob/master/Windows10DebloaterGUI.ps1 to disable telemetry
# and perform other debloat techniques
# or:
#iwr -useb https://git.io/debloat|iex

# Define the URL of the repository's .zip file
$repoUrl = "https://github.com/Sycnex/Windows10Debloater/archive/master.zip"
# Define the destination where the .zip file will be saved
$zipPath = "$env:USERPROFILE\Downloads\Windows10Debloater-master.zip"
# Define the folder to which the .zip file will be extracted
$extractPath = "$env:USERPROFILE\Downloads\Windows10Debloater-master"

# Download the .zip file from GitHub
Invoke-WebRequest -Uri $repoUrl -OutFile $zipPath

# Unblock the file in case it is marked as coming from the internet
Unblock-File -Path $zipPath

# Expand the .zip file
Expand-Archive -LiteralPath $zipPath -DestinationPath $extractPath

# Cleanup the .zip file if you want
Remove-Item -Path $zipPath

exit



# Not needed by most individual end users
Set-Service -Name MapsBroker -StartupType Disabled
Set-Service -Name SharedAccess -StartupType Disabled
Set-Service -Name LanmanServer -StartupType Disabled
Set-Service -Name edgeupdate -StartupType Disabled
Set-Service -Name edgeupdatem -StartupType Disabled


# UNINSTALLS
winget uninstall "3D Viewer"
winget uninstall "Cortana"
winget uninstall "Disney+"
winget uninstall "Feedback Hub"
winget uninstall "Get Help"
winget uninstall "Groove Music"
winget uninstall "MSN Weather"
winget uninstall "Mail and Calendar"
winget uninstall "Microsoft Pay"
winget uninstall "Microsoft People"
winget uninstall "Microsoft Solitaire Collection"
winget uninstall "Microsoft Tips"
winget uninstall "Microsoft Update Health Tools"
winget uninstall "Microsoft.OneDrive"
winget uninstall "Microsoft.WindowsPCHealthCheck"
winget uninstall "Mixed Reality Portal"
winget uninstall "Movies & TV"
winget uninstall "Office"
winget uninstall "OneNote for Windows 10"
winget uninstall "Phone Link"
winget uninstall "Skype"
winget uninstall "Snip & Sketch"
winget uninstall "Store Experience Host"
winget uninstall "Windows Camera"
winget uninstall "Windows Maps"
winget uninstall "Windows Voice Recorder"
winget uninstall "Xbox Console Companion"
winget uninstall "Xbox Game Bar Plugin"
winget uninstall "Xbox Game Bar"
winget uninstall "Xbox Game Speech Window"
winget uninstall "Xbox Identity Provider"
winget uninstall "Xbox TCUI"
winget uninstall "Xbox"
winget uninstall "Your Phone"


# INSTALLS
winget install -i "Microsoft.VisualStudioCode"
winget install --exact "Bitwarden.Bitwarden"
winget install --exact "mcmilk.7zip-zstd"
winget install --exact "AltSnap.AltSnap"
winget install --exact "Brave.Brave"
winget install --exact "CPUID.CPU-Z"
winget install --exact "CrystalDewWorld.CrystalDiskMark"
winget install --exact "FastStone.Viewer"
winget install --exact "GIMP.GIMP"
winget install --exact "Git.Git"
winget install --exact "Google.Chrome"
winget install --silent --exact "Greenshot.Greenshot"
winget install --exact "Notepad++.Notepad++"
winget install --exact "VideoLAN.VLC"
winget install --exact "AntibodySoftware.WizTree"
winget install --exact "RandyRants.SharpKeys"
winget install --exact "Ookla.Speedtest"
winget install --exact "Eraser.Eraser"
winget install --exact "TechPowerUp.GPU-Z"
winget install --exact "TheDocumentFoundation.LibreOffice"
winget install --exact "Zoom.Zoom"
winget install --exact "MiniTool.PartitionWizard.Free"
winget install "Microsoft.WindowsTerminal"

# configure greenshot settings
# https://pathcopycopy.github.io/
# https://geeks3d.com/furmark/downloads/
# disable background tasks

# scheduled task to start altsnap w/admin privs
# scheduled task to run c:\bin\cf-dns.ps1
# make a system restore point
