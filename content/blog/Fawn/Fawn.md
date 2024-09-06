---
title: "HTB: Fawn"
date: 2024-09-06T023:26:00+01:00
draft: true
author: "Jamie Gunner"
authorLink: "https://github.com/SwiftLaggy"
description: "Starting Point Fawn HTB"
---


# Introduction

I was successful in completing the second starting point box for HackTheBox, by the name of "Fawn". This was a great introduction, as it allowed me to acclimatise to these machines and to understand how they function. In order for me to hack these boxes, I will be utilising my own personal machine, which is running Parrot OS on VMware. 
Before we begin to hack this machine, we must first answer a couple of questions.

# Task 1
![Picture 1](../Images/FTPAcronym.png)
At the beginning of this task, it asks of you the explanation of the acronym FTP, which is File Transfer Protocol:

# Task 2

![[PortFTP1.png]]
File Transfer Protocol is a network protocol available on port 20, which allows for the transfer of data, via a data channel and port 21, which is used to establish a connection between two hosts.

# Task 3

![[SFTPTask.png]]
To continue the explanation of FTP, we have another protocol called SFTP, which stands for SSH, or secure File Transfer Protocol. This utilises port 22.

# Task 4

![[PingTask1.png]]
To test our connection with a box, you use an ICMP echo request called ``ping``.

# Starting Point - Ping

It is important that you are connected to the boxes before you can begin hacking them. We can do this by performing the command ``ping``, followed by the machine's IP. Below is an example of the command ping being performed:
```
ping machineIP
```

![[Fawn/Images/Ping.png]]

# Using Nmap

The next tool we will be using is ``nmap``. Nmap gives us plenty of options, those of which, we will explore in other boxes that I will complete later on in this website. For this box, we are using a similar command to the one in the box ``Meow`` however, we now have the addition of ``-O``. This is an option used to find the operating system. Below, you can see the scan in question:
```
nmap -O -sV -vv machineIP
```
![[Namo1.png]]

# Task 5

![[ScanTask1.png]]
![[Nmapport.png]]
After using the ``nmap`` command we can see the port that FTP is on and the version of FTP. 
# Task 6

We can see from the terminal below, that the operating system hosting the FTP server is Unix. Sometimes, the scan can be wrong, other times it will detect an operating system. However, it cannot give specifics as to what version it is, like Windows Server =. 

![[Unix.png]]
![[ScanOS.png]]

# Task 7

As with most commands, there are two ways of viewing a help menu. The first, would be using the ``-h`` option, leading you to the help area. The other, not specific in this box, would be ``man`` , followed the application you are using. 

![[FTPHelp.png]]

# FTP -h

For your reference, here is a screenshot of the ``ftp -h`` command result within the terminal. 
![[FTPHELP1.png]]

# FTP Help

Within the FTP terminal itself, it will also provide you with another help menu for the specific command you can use in whatever scenario you might be in. 
![[FTPHELP2.png]]

# Task 8 

The standard version of FTP has its own anonymous account, allowing a non-account holder the ability to view files however, the secure version does not have this option available immediately; it needs to be enabled. 

![[FTPLogin.png]]

# FTP Login

We now use the terminal in order to login to ftp using the command:
```
ftp machineIP
```
![[FTP.png]]
Then, you can type in "anonymous" for the username with no password and it will allow you to traverse the file structure.
# Task 9

As you can see in the screenshot above, the 'Login successful' response code is 230.
![[LoginCode.png]]

# Task 10

In a Linux filesystem, you will be using the ``ls`` command to look at the current file structure/directory. There are, of course, a large number of options you can utilise to expand your search through this file structure, such as ``-a`` for all including hidden files. 

![[LSTask.png]]

![[Fawn/Images/LS.png]]

# Task 11

I was not overly familiar with FTP, so I had to use the ``help`` command with the FTP terminal to learn the ``get`` option. Using ``get`` will allow you to download the file you are viewing. 

![[GetTask.png]]
![[Get.png]]

As you can see, after downloading the file, we can access it using a text editor on the .txt file and obtain the flag. 

![[Flag.png]]

# Final Thoughts

This concludes the finishing stages for the first box on HackTheBox. It provided a good insight into FTP, allowing me to learn the basics of FTP and obtain another flag.  This newfound interest has sparked a curiosity, and I would like to see some exploits with FTP and SFTP. 
