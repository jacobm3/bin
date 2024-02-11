# add user and put them in the admin group
```
net user NewUser Password123 /add
net localgroup Administrators NewUser /add

```


# hardening
```
netsh advfirewall set allprofiles state on
netsh advfirewall set allprofiles firewallpolicy blockinbound,allowoutbound
netsh advfirewall firewall set rule group="remote desktop" new enable=No
Set-ExecutionPolicy Restricted
net user guest /active:no
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorAdmin" -Value 2



