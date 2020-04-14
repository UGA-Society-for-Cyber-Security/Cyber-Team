# Cryptography

> Cryptography or cryptology (from Ancient Greek: κρυπτός, romanized: kryptós "hidden, secret"; and γράφειν graphein, "to write", or -λογία -logia, "study", respectively[1]) is the practice and study of techniques for secure communication in the presence of third parties called adversaries.[2] More generally, cryptography is about constructing and analyzing protocols that prevent third parties or the public from reading private messages;[3] various aspects in information security such as data confidentiality, data integrity, authentication, and non-repudiation[4] are central to modern cryptography. -- https://en.wikipedia.org/wiki/Cryptography

Cryptography is always a fun CTF challenge. You know the answer is sitting right in front of you! Here are some great resources for cryptography challenges.

Sometimes, online decoders won't work for one reason or another. The key is keep trying more and more if you are confident that you have found the correct encryption cipher.

- https://picoctf.com/learning_guides/Book-2-Cryptography.pdf
- https://quipqiup.com/
  - Great tool overall
- https://www.dcode.fr/tools-list
- https://gchq.github.io/CyberChef/
  - Go-to for any decryption purposes
- https://docs.python.org/2/library/codecs.html
  - Python module for encoding and decoding
- https://guballa.de/vigenere-solver
  - Great for breaking Vigenere ciphers (not in English)
-http://rumkin.com/tools/cipher/
  - Rumkin offered a railfence cipher decoder that worked better than Cyber Chef

#### Types of Ciphers we've encountered in CTFs

- Caesar Cipher (ROT-13)
  - Often maintains the English language syntax
- Vigenere Cipher
  - Encoded with a key, sometimes the key is just "CTF" or the acronym of the competition
- Substitution Cipher
  - Maintains the English language syntax
- XOR cipher
- Base64
  - Has "=*" padding as a tell-tale sign
- Rails Encryption (Rails Fence)
  - Looks off-putting, usually does not appear to look like English language syntax
- Atbash Cipher
  - "Monoalphabetic substituion cipher originally used to encrypt the Hebrew alphabet" -- Wikipedia
- A different language
  - One time the ciphertext was just the Dutch language...



