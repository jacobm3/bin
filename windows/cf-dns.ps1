# Apply CloudFlare DNS malware and adult content blocking to every interface
# https://blog.cloudflare.com/introducing-1-1-1-1-for-families/

$interfaces = Get-NetAdapter

# Cloudflare DNS servers, block malware
$dnsServers = @("1.1.1.2","1.0.0.2","2606:4700:4700::1112","2606:4700:4700::1002")

# Cloudflare DNS servers, block malware and adult content
$dnsServers = @("1.1.1.3", "1.0.0.3", "2606:4700:4700::1113", "2606:4700:4700::1003")

# Function to test DNS server by sending a DNS query request
function Test-DnsServerQuery {
    param (
        [string[]]$dnsServers
    )

    $testDomain = "google.com"

    foreach ($server in $dnsServers) {
        try {
            $result = Resolve-DnsName -Name $testDomain -Server $server -ErrorAction Stop
            if (-not $result) {
                Write-Host "DNS server $server did not respond to the query for $testDomain."
                return $false
            }
        } catch {
            Write-Host "Failed to query $testDomain on DNS server $server."
            return $false
        }
    }

    return $true
}

# Test DNS server query
$areDnsServersResponsive = Test-DnsServerQuery -dnsServers $dnsServers

if ($areDnsServersResponsive) {
    foreach ($interface in $interfaces) {
        $interfaceName = $interface.Name

        Write-Host "Setting DNS servers for interface: $interfaceName"
    
        Set-DnsClientServerAddress -InterfaceAlias $interfaceName -ServerAddresses $dnsServers
    }

    Write-Host "DNS servers set to Cloudflare's servers ($dnsServers -join ',') for all network interfaces."
} else {
    Write-Host "One or more of the DNS servers did not respond to the DNS query. DNS settings not changed."
}
