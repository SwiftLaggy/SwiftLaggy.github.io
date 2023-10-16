---
title: "Miscellaneous Challenge"
date: 2023-10-16T23:27:00+01:00
draft: false
author: "Jamie Gunner"
authorLink: "https://github.com/SwiftLaggy"
description: "Miscellaneous Challenge a CTF"
---

On a recent CTF that I competed in, me and my team had worked together on an incredibly tough Misc challenge. Considering that this was the first of many challenges, it was quite an arduous task.
After attempting to complete this, my team and I had realised that we may not have trained enough for this CTF challenge. Despite this, I wanted to give a small write up detailing what we managed to accomplish as this was a considerably enjoyable challenge.

# The Email

Within the challenge .ZIP folder contained a singular .TXT email file. 

![Picture 1](../images/Email.jpg)

We can see in this email that it covers many areas. The first email holds a lot of  information, starting with Jenny's "jfeng@veryrealmail.com". Then, we have her personal information:

- Date of Birth: 02/08/1990
- Postal Code: 00100
- Weight: 61kg

Next, we can see the email provides us with a .ZIP but it is password protected. The problem that we are faced with, is that we have not been provided this password as it was in their previous emails. 

We are also provided with another attachment, which appears to be a receipt, asking us to make sure the (m)data is correct, assuming this could be meta data, maybe steganography. The main problem currently, is that we do not have access to either attachment, but it does provide us with 2 Base64 strings. 

One of which is far too long to input on this website however, I can paste the other.
# The First Base64
```UEsDBDMAAQBjABt3Q1cAAAAAPwAAACMAAAAIAAsAZmxhZy50eHQBmQcAAgBBRQMAALXlHmkDJrqpuC6UsKfMRf0ryv1ot/Vf0o0rJl7iNPv+pINt/HGY9cx7/J7HpS5xfce96yETu2enDZD+8nLU31BLAQI/ADMAAQBjABt3Q1cAAAAAPwAAACMAAAAIAC8AAAAAAAAAIAAAAAAAAABmbGFnLnR4dAoAIAAAAAAAAQAYANdGZhT59dkBWFt5Lfn12QFO9TAOV8XZAQGZBwACAEFFAwAAUEsFBgAAAAABAAEAZQAAAHAAAAAAAA==```

Once this is put into Cyberchef, we are given a very odd string:

![Picture 2](../images/CyberFail.jpg)

But the email states it is Base64 encoding. I then noticed that it is a .ZIP as previously stated. So, I did some research and found Base64 to file from Base64 guru. 

![Picture 3](../images/B642F.jpg)

This website gave us Application.zip containing a .TXT file however, it seems to be password protected with no password in sight. 

![Picture 4](../images/Passwordedfile.jpg)

There must be a password. I continued on as I would normally, with the information that there was a password given previously. Maybe it could be elsewhere, perhaps the metadata of the .PNG of the next Base64 encoding. As expected, Cyberchef could not decode it as it is an image however, one must test these things.
# The Second Base64

![Picture 5](../images/Base64Fail2.jpg)

As cyberchef had an issue, I had to find another alternative. As we were loading an image from Base64, it was only natural to go for a Base64 to image. So I found a website with such services and it returned:

![Picture 6](../images/B64toImage.jpg)

# Stenography

We were told "(m)data"; I believe this to be the meta data. So, I loaded up my Kali Linux machine with a stenography tool and looked at the meta data. I could use basic websites, but I prefer to perfect the skills with tools rather than use websites. I decided to use an easy tool, as I was only searching the meta data. 

![Picture 7](../images/Exif.jpg)

As explained in the Copyright field, there is a password format, "birthDateMail\*\*\*R3ply!". It was specified by the creators. The asterixis' are random characters/symbols, which means we have a base password format with 3 random characters. We have all the information and this would be: ```
```
900802jfeng@veryrealmail.com***R3ply! 
```
But what are the three characters? I had to write a script on Python in order to cover every possible combination. 
# Python Program
```
import itertools
import string

email_address = "900802jfeng@veryrealmail.com***R3ply!"
characters = string.ascii_letters + string.digits + "!@#$%^&*()-_=+[]{}|;:'\",.<>?/\\~`"  # Alphabets, numbers, and special characters

# Find asterisk positions
asterisk_positions = [pos for pos, char in enumerate(email_address) if char == "*"]

# Generate combinations of single characters
combinations = itertools.product(characters, repeat=len(asterisk_positions))

#output file name
output_file = "email_combinations.txt"

# Open the file for writing
with open(output_file, "w") as file:
    # Iterate through the combinations
    for combination in combinations:
        modified_email = list(email_address)
        for i, char in zip(asterisk_positions, combination):
            modified_email[i] = char
        modified_email = "".join(modified_email)
        file.write(modified_email + "\n")

print(f"Email combinations with numbers and special characters have been saved to {output_file}")

```
This created a massive file of roughly 830584 lines. Once I ran this through JohnTheRipper, we got the answer. But to run it through John, I needed to perform other actions. So I remain on Kali, as this would possess the tools needed to continue, Starting with Zip2John. This takes all hashes that needed to be cracked, and turns them into a file in order for John to work his magic and crack the password using a word list. 

# JohnTheRipper
![Picture 8](../images/Ziphashes.jpg)

Then, once I had retrieved the "zip.hashes" file, I ran John with the word list created earlier and obtained:

![Picture 9](../images/Johnpassword.jpg)

 Once I obtained the password, I unfortunately had to move to ParrotOS as John had noticed I had run this command before and obtained the password. So I figured I'd go to Parrot to finish the job for a 2nd time. But huzzah! We have the password. Let's open the flag.txt file.
 
![Picture 10](../images/Flag.jpg)

We have now obtained a flag, brilliant! 100 points to us in the CTF. Unfortunately, we did not continue this event, on the basis that it was quite late and slightly beyond our own capabilities but, that is why we do them, to see where we need to sharpen our skills. 

# Conclusion

I sincerely hope that you have been able to gain some knowledge from this write up. I can say with certainty that I have. 
This has given me the opportunity to improve and hone my Python skills, alongside gaining the knowledge that applications can be encoded and decoded as Base64. This means that other applications can be encoded with different encoding techniques (something to learn later on). 
Participation in this CTF has also allowed me to gain additional experience with JohnTheRipper.

