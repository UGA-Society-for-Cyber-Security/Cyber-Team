# Solution

This challenge is all about understanding file signatures.

> Many file formats are not intended to be read as text. If such a file is accidentally viewed as a text file, its contents will be unintelligible. However, sometimes the file signature can be recognizable when interpreted as text. -- Wikipedia

In this instance, the file command only tells us that the flag is "data". Trying to read the file in a text editor won't help either.

A great step when dealing with unknown files is to create a hex dump. I then used `xxd flag | head` to check out the first contents of the hexdump (where the file signature should be).

![First screenshot](https://github.com/UGA-Society-for-Cyber-Security/Cyber-Team/blob/dev/Challenges/Week-2/Forensics/Challenge_1/solution/w2-ch1-1.png)