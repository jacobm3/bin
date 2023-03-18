# apply CloudFlare DNS porn & malware blocking to every interface

$interfaces = Get-NetAdapter

foreach ($interface in $interfaces) {
    $interfaceName = $interface.Name

    Write-Host "Setting DNS servers for interface: $interfaceName"
    
    Set-DnsClientServerAddress -InterfaceAlias $interfaceName -ServerAddresses ("1.1.1.3","1.0.0.3","2606:4700:4700::1113","2606:4700:4700::1003")
}

Write-Host "DNS servers set to Cloudflare's servers (1.1.1.3,1.0.0.3,2606:4700:4700::1113,2606:4700:4700::1003) for all network interfaces."
