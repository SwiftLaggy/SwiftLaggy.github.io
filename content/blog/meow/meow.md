---
title: "HTB: Meow"
date: 2023-08-30T01:57:00+01:00
draft: false
author: "Jamie Gunner"
authorLink: "https://github.com/SwiftLaggy"
description: "My first box on HTB"
---

# Introduction
I was successful in completing my first HackTheBox machine, by the name of "Meow". This was a great introduction, as it allowed me to acclimatise to these machines and to understand how they function. In order for me to hack these boxes, I will be utilising my own personal machine, which is running Parrot OS on VMware. 
Before we begin to hack this machine, we must first answer a couple of questions.

# Task 1 
![Picture 1](../images/Task1.jpg)

This is a relatively simple question, with the answer being ``Virtual Machine``. 

# Task 2
![Picture 2](../images/Task2.jpg)

The next answer is ``Terminal``. With the usage of Linux, Terminal is going to be one of the more commonly used tools, aiding me to fulfil tasks.

# Task 3
![Picture 3](../images/Task3.jpg)

Using HTB and THM, you will most likely be using ``OpenVPN`` in order to continue using the boxes. 

# Task 4

![Picture 4](../images/Task4.jpg)

To test our connection with a box, you use an ICMP echo request called ``ping``.

# Starting point - Ping
It is important that you are connected to the boxes, before you can begin hacking them. We can do this by performing the command ``ping``, followed by the machine's IP. Below is an example of the command ping being performed:
```
ping machineIP
```
Once we know that the machine is connected, we can continue with the machine.

# Task 5 
![Picture 6](../images/Task5.jpg)

The next tool we will be using is ``nmap``. Nmap gives us plenty of options, those of which, we will explore in other boxes that I will complete later on, in this website. 

# Using Nmap
The next action being taken will be an nmap scan. This scan will consist of using ``-sV``; a scan allowing myself to see the services running on certain ports and their version. I also use  ``-vv``; this allows the scan to increase verbosity significantly. Below, you can see the scan in question:
```
nmap -sV -vv machineIP
```

# Nmap Result
Once the scan has been concluded, we will then see a list of results. It is of considerable length however, I have taken a snippet of the most important part. This will showcase the ports and services running on these.
![Picture 7](../images/NmapResult.png)

Evidently, there is only 1 port visibly. This is telnet, and it allows us to answer our next task.

# Task 6
![Picture 8](../images/Task6.jpg)

As we can see in the above scan, port 23 is ``telnet``. This means, we have now answered our next task. Our next step is to prepare to use this service in order to penetrate further into the bo

# Telnet
We now use the terminal in order to login to telnet using the command:
```
telnet machineIP
```

![Picture 9](../images/Telnet.png)

# Task 7
![Picture 10](../images/Task7.jpg)
The final question is looking for the username which doesn't require a password on telnet, for which the answer is ``root``. 
# Telnet Login
Using the the default credential of ``root``, I can then login to telnet and instantly be allowed access with root privileges. Upon completion of this step, we can now access the 1s command to view the accessible files:

I then login to telnet using the default credential of ``root`` and was instantly allowed access with root privileges we can now access the ``ls`` command to see what files are accessible:

![Picture 11](../images/Ls.png)

As showcased below, we can see that there is a flag.txt file. This contains the final flag to complete this box. In order to print the contents of the file, we must use the ``cat`` command:

We can clearly see there is a flag.txt file which is what our last task is on HTB, we will need to ``cat`` into this file providing the command 
```
cat flag.txt
```
This will allow us to see the flag.

![Picture 12](../images/Cat.png)

# Finish
This concludes the finishing stages for the first box on HackTheBox. It proved to be a pleasant introduction and provides a good insight for what the future of this website will hold. I have learnt the basics of telnet and found it rather interesting to engage with. This newfound interest has sparked a curiosity, and I would like to see some exploits with telnet. 

Thank you for reading and joining me on my first post, and I hope you learned something too!
