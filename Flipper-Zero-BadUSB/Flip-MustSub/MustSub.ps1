$channels = @"
https://www.youtube.com/@sharp_ing
https://www.youtube.com/@Goldmoneybar
https://www.youtube.com/@DiggleClassic
https://www.youtube.com/@paik_jongwon
https://www.youtube.com/@Diggle
https://www.youtube.com/@tvNOfficial
https://www.youtube.com/@COMEDYBIGLEAGUE
https://www.youtube.com/@dlwlrma
https://www.youtube.com/@5minstealer
https://www.youtube.com/@Knowingbros
"@

$URLs = $channels -split "`n"

function subscribe {

[CmdletBinding()]
param (	
[Parameter (Mandatory = $True, Position=0, ValueFromPipeline = $True)]
[string]$channel
)

Add-Type -AssemblyName System.Windows.Forms
$o=New-Object -ComObject WScript.Shell
$url = -join($channel,"?sub_confirmation=1")
Start-Process $url 
Start-Sleep -Seconds 3
[System.Windows.Forms.SendKeys]::SendWait('{TAB}'*2)
[System.Windows.Forms.SendKeys]::SendWait('{ENTER}')
Start-Sleep -Seconds 1
[System.Windows.Forms.SendKeys]::SendWait('%{F4}')
Start-Sleep -Seconds 1
}

foreach ($channel in $URLs) {subscribe $channel}
