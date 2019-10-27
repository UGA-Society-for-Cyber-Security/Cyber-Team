# caesar

>Decrypt this **message**. You can find the ciphertext in /problems/caesar_3_33108a6b0f87eb4b3606437d06290815 on the shell server.

The title of this one gives it away. It suggests that we might be getting a caesar cipher. Caesar ciphers are simple substitution cipher where each character is shifted. ROT13 is a special case of the caesar cipher. Lets see what we got.

`picoCTF{ynkooejcpdanqxeykjrubvtagp}`

Okay so obviously we do not need to decrypt picoCTF, so lets run ynkooejcpdanqxeykjrubvtagp through the caesar decrypter on [cryptii](https://cryptii.com). If we start at 0 shift and keep increasing we should eventually see some sensible words appear. At a shift of 22 we get `crossingtherubiconvyfzxekt` and when we submit it as the flag `picoCTF{crossingtherubiconvyfzxekt}` we get the points.
