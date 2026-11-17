$names = "Block_http_conn", "Allow_rdp_conn", "Block_ftp_conn", "Block_ping_conn"

$result = foreach ($name in $names) {
    $rule = Get-NetFirewallRule -DisplayName $name
    $port = $rule | Get-NetFirewallPortFilter

    [PSCustomObject]@{
        Name       = $rule.DisplayName
        Enabled    = $rule.Enabled
        Protocol   = $port.Protocol
        LocalPort  = $port.LocalPort
        RemotePort = $port.RemotePort
        Action     = $rule.Action
        Profile    = $rule.Profile
    }
}

$result | Format-List
$result | Format-List | Out-File -FilePath "result.txt" -Encoding utf8