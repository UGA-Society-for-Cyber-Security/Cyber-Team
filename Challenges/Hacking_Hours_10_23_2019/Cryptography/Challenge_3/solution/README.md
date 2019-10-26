# Solution

This ciphertext is extremely long and complex. It would takes ages to decode by hand. However the hints indicate to use that this is the undecipherable cipher, the Vigenere Cipher.

> The Vigenère cipher (French pronunciation: ​[viʒnɛːʁ]) is a method of encrypting alphabetic text by using a series of interwoven Caesar ciphers, based on the letters of a keyword. It employs a form of polyalphabetic substitution. -- Wikipedia

We can use the website Cyber Chef (https://gchq.github.io/CyberChef/) to easily decode this challenge.

Use the Vigenere decoder function and insert the keg used to encode this information. Which is conveniently provided in the hints: `UGASCS`.

ugascs{great_gatsby}