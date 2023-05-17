# apply CloudFlare DNS porn & malware blocking to every interface
# https://blog.cloudflare.com/introducing-1-1-1-1-for-families/

$interfaces = Get-NetAdapter

foreach ($interface in $interfaces) {
    $interfaceName = $interface.Name
    
    # just block malware
    #Set-DnsClientServerAddress -InterfaceAlias $interfaceName -ServerAddresses ("1.1.1.2","1.0.0.2","2606:4700:4700::1112","2606:4700:4700::1002")
    
    # block porn and malware
    Set-DnsClientServerAddress -InterfaceAlias $interfaceName -ServerAddresses ("1.1.1.3","1.0.0.3","2606:4700:4700::1113","2606:4700:4700::1003")

}
