Set-MpPreference -DisableRealtimeMonitoring $true
fsutil behavior set disablelastaccess 1
Add-MpPreference -ExclusionPath "C:\Program Files"
Add-MpPreference -ExclusionPath "C:\Program Files (x86)"
Add-MpPreference -ExclusionPath "%TEMP%\WinGet"
Add-MpPreference -ExclusionPath "C:\Users\admin\Desktop"
Add-MpPreference -ExclusionPath "C:\Users\admin\Downloads"

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
winget uninstall Microsoft.Edge
winget uninstall Microsoft.MicrosoftEdge.Stable_8wekyb3d8bbwe
