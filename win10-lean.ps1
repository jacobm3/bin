
# Paste this section into an admin powershell terminal
Set-MpPreference -DisableRealtimeMonitoring $true
Set-MpPreference -DisableBehaviorMonitoring $true
fsutil behavior set disablelastaccess 1
powercfg.exe /hibernate off
Add-MpPreference -ExclusionPath "C:\Windows","C:\Program Files","C:\Program Files (x86)","D:\Program Files","D:\Program Files (x86)","%TEMP%\WinGet","C:\Users","D:\Users"

# Install App Installer https://apps.microsoft.com/store/detail/app-installer/9NBLGGH4NNS1?hl=en-us&gl=us

# Apply Windows Updates manually:  Start > update

# Enable unsigned powershell scripts: Start > developer settings

# Then execute this entire script (ok to rerun the top part)

# Once that completes, run https://github.com/Sycnex/Windows10Debloater/blob/master/Windows10DebloaterGUI.ps1 to disable telemetry
# and perform other debloat techniques
# or:
# iwr -useb https://git.io/debloat|iex

# UNINSTALLS
winget uninstall "Cortana"
winget uninstall "MSN Weather"
winget uninstall "Get Help"
winget uninstall "Microsoft Tips"
winget uninstall "3D Viewer"
winget uninstall "Office"
winget uninstall "Microsoft Solitaire Collection"
winget uninstall "Mixed Reality Portal"
winget uninstall "OneNote for Windows 10"
winget uninstall "Microsoft People"
winget uninstall "Snip & Sketch"
winget uninstall "Skype"
winget uninstall "Store Experience Host"
winget uninstall "Microsoft Pay"
winget uninstall "Windows Camera"
winget uninstall "Feedback Hub"
winget uninstall "Windows Maps"
winget uninstall "Windows Voice Recorder"
winget uninstall "Xbox TCUI"
winget uninstall "Xbox Console Companion"
winget uninstall "Xbox Game Bar Plugin"
winget uninstall "Xbox Game Bar"
winget uninstall "Xbox Identity Provider"
winget uninstall "Xbox Game Speech Window"
winget uninstall "Phone Link"
winget uninstall "Groove Music"
winget uninstall "Movies & TV"
winget uninstall "Mail and Calendar"
winget uninstall "Microsoft Update Health Tools"
winget uninstall "Disney+"
winget uninstall "Microsoft Edge"
winget uninstall "Microsoft Edge Update"
winget uninstall "Microsoft Edge WebView2 Runtime"
winget uninstall "Microsoft.Edge"
winget uninstall "Microsoft.MicrosoftEdge.Stable_8wekyb3d8bbwe"
winget uninstall "Microsoft.OneDrive"
winget uninstall "Microsoft.WindowsPCHealthCheck"

# INSTALLS
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
winget install --exact "Greenshot.Greenshot"
winget install --exact "Notepad++.Notepad++"
winget install --exact "VideoLAN.VLC"
winget install --exact "AntibodySoftware.WizTree"
winget install --exact "RandyRants.SharpKeys"
winget install --exact "Ookla.Speedtest"
winget install --exact "Eraser.Eraser"
winget install --exact "TechPowerUp.GPU-Z"
winget install --exact "TheDocumentFoundation.LibreOffice"
winget install --exact "Microsoft.PowerToys"
winget install --exact "Zoom.Zoom"
winget install -i "Microsoft.VisualStudioCode"
winget install "Microsoft.WindowsTerminal"
# winget install ""
# winget install ""
# winget install ""
# winget install ""
# winget install ""


# GAMING
# winget install -i "Afterburner"
# winget install "RTSS"
# winget install "Valve.Steam"
