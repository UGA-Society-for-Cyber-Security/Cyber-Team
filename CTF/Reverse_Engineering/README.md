# Reverse Engineering

> Throughout the history of invention, curious minds have sought to understand the inner workings of their gadgets. Whether investigating a broken watch, or improving an engine, these people have broken down their goods into their elemental parts to understand how they work. This is Reverse Engineering (RE), and it is done every day from recreating outdated and incompatible software, understanding malicious code, or exploiting weaknesses in software. In this course we will explore what drives people to reverse engineer software and the methodology and tools used to do it. -- https://niccs.us-cert.gov/training/search/opensecuritytraininginfo/introduction-reverse-engineering-software

Reverse Engineering is generally considered one of the more difficult CTF tasks. Here are some great resources for learning.

- https://picoctf.com/learning_guides/Book-6-Reversing.pdf
- https://niccs.us-cert.gov/training/search/opensecuritytraininginfo/introduction-reverse-engineering-software
- http://man7.org/linux/man-pages/man1/strings.1.html
  - Sometimes even executable files have hidden strings in them
  - ALWAYS run strings!!
- https://github.com/upx/upx
  - UPX makes data harder to read
  - Malware often has a wrapper... you should know how to unpack it!
- https://www.gnu.org/software/gdb/
  - GNU Debugger
- https://github.com/pwndbg/pwndbg
  - Tool that improves on GDB

