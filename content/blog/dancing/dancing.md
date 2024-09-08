---
title: "HTB: Dancing"
date: 2024-09-09T17:30:00+01:00
draft: true
author: "Jamie Gunner"
authorLink: "https://github.com/SwiftLaggy"
description: "Starting Point Dancing HTB"
---

# Introduction

I was successful in completing the second starting point box for HackTheBox, by the name of "Dancing". This was a great introduction, as it allowed me to acclimatise to these machines and to understand how they function. In order for me to hack these boxes, I will be utilising my own personal machine, which is running Parrot OS on VMware. (You might see different IP's listed in these write-ups. This is due to completing areas on different days.)
Before we begin to hack this machine, we must first answer a couple of questions. 

# Task 1

![Picture 1](../images/TaskAcronym.jpg)

At the beginning of this task, it asks of you the explanation of the acronym SMB, which is Server Message Block.

# Task 2

![Picture 2](../images/TaskPort.jpg)

Server Message Block lives on port 445 and port 139 when it is communicating over NetBIOS however, this is quite old and is not seen as often. 

# Starting Point - Ping

It is important that you are connected to the boxes before you can begin hacking them. We can do this by performing the command ``ping``, followed by the machine's IP. Below is an example of the command ping being performed:
```
ping machineIP
```

![Picture 3](../images/Ping.jpg)

# Using Nmap

The next tool we will be using is ``nmap``. Nmap gives us plenty of options, those of which, we will explore in other boxes that I will complete later on in this website. Below, you can see the scan in question:
```
nmap -sV -vv machineIP
```
![Picture 4](../images/Nmap.jpg)

# Task 3
![Picture 5](../images/TaskService.jpg)

After completing our ``nmap`` scan, we can see there are three ports open however, as we know, SMB resides on port 445. We can see the service name on 445 is called ``microsoft-ds``.

# SMB Help
![Picture 6](../images/SMBclienthelp.jpg)

Within the terminal, I am now using a new service/application. Therefore, I want to look at the options I can use within the service to ensure I am using it correctly. The image above is actually an error message help screen however, you can get a better and more in-depth version using the ``-?`` or ``--help`` options. 

# Task 4
![Picture 7](../images/TaskSMBOption.jpg)

As we can see from the above terminal screenshot,  ``-L`` is the option we are looking for in order to list the available shares on the box. 
# Task 5

![Picture 8](../images/TaskShares.jpg)

![Picture 9](../images/SMBlist.jpg)

Now, using the option, we can see there are 4 shares available on this box. 

# Task 6

![Picture 10](../images/TaskPassword.jpg)

I made a small assumption from this point, that ``WorkShares`` was the share we could access without a password. It was also a huge hint from HTB however, it would be incredibly unsecure if they allowed anyone into the Admin or C drive.

[Picture 11](../images/SMBworkshares.jpg)

We can see within the ``WorkShares`` that there are two folder locations, ``Amy.J`` and ``James.P``. We can access both of these. As shown in the screenshot below, the Amy folder possesses a text file called ``worknotes``. 

[Picture 12](../images/SMBlsworknotes.jpg)

In the next screenshots, we ``get`` the ``worknotes.txt`` file, and look inside to find a set of instructions however, this is most likely not important to us. However, in later boxes, it might be useful to remember that there is an Apache server, and they are in the process of securing the FTP server.
[Picture 13](../images/Getworknotes.jpg)

[Picture 14](../images/Worknotes.jpg)

# Task 7
[Picture 15](../images/TaskGet.jpg)

Lastly, as we saw in the previous task, we used the ``get`` command to download the files we want. In the screenshot below, we can see that James has our flat. 
[Picture 16](../images/SMBlsFlag.jpg)

So now we ``get flag.txt`` and then open it to get our flag and complete our next box. 
[Picture 17](../images/Getflag.jpg)

[Picture 18](../images/Flag.jpg)
# Final Thoughts

This concludes the finishing stages for this box on HackTheBox. It provided a good insight into SMB, allowing me to learn the basics of SMB, how to traverse and obtain another flag.  I have used SMB in the past for my university module, so this was not entirely new to me but, it was nice being able to revisit an old vulnerability. I would like to experience more with SMB and see what I can do with it in the future. 



