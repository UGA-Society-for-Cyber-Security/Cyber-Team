# Solution

This challenge is all about understanding file signatures.

> Many file formats are not intended to be read as text. If such a file is accidentally viewed as a text file, its contents will be unintelligible. However, sometimes the file signature can be recognizable when interpreted as text. -- Wikipedia

In this instance, the file command only tells us that the flag is "data". Trying to read the file in a text editor won't help either.

A great step when dealing with unknown files is to create a hex dump. I then used `xxd flag | head` to check out the first contents of the hexdump (where the file signature should be).

![First screenshot](https://github.com/UGA-Society-for-Cyber-Security/Cyber-Team/blob/dev/Challenges/Week-2/Forensics/Challenge_1/solution/w2-ch1-1.png)

The file signature (aka those first few bytes represented in hex) don't seem to represent something the Wikipedia page knows about. From here we can assume the signature has been altered in some way. So let's pull up the data in a hexedit (I used curse hexeditor)

![Second screenshot](https://github.com/UGA-Society-for-Cyber-Security/Cyber-Team/blob/dev/Challenges/Week-2/Forensics/Challenge_1/solution/w2-ch1-2.png)

From here we can see that the file signature is very similar to that of PNG. The bytes 0x89 0x4E looks like they should be 0x89 0x50 0x4E. Let's try adding that 0x50 byte to make the file signature match that of a PNG file.

In Curse hexeditor this is accomplished by using CTRL-A

![Third screenshot](https://github.com/UGA-Society-for-Cyber-Security/Cyber-Team/blob/dev/Challenges/Week-2/Forensics/Challenge_1/solution/w2-ch1-3.png)

Now let's see what type of file it is now

![Fourth screenshot](https://github.com/UGA-Society-for-Cyber-Security/Cyber-Team/blob/dev/Challenges/Week-2/Forensics/Challenge_1/solution/w2-ch1-4.png)

Looks like it's fixed! Let's open it open!

![Flag screenshot](https://github.com/UGA-Society-for-Cyber-Security/Cyber-Team/blob/dev/Challenges/Week-2/Forensics/Challenge_1/solution/flag)

Then we scan the QR code for our flag.

`ugascs{f1le_s1gn4tur35_m4tt3r}`