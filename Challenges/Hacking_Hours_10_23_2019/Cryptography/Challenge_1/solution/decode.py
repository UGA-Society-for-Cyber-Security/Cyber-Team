#! /usr/bin/python3

import base64

ciphertext = input('Enter the ciphertext (base64):\n')

plaintext = base64.b64decode(b'dWdhc2Nze2NyeXB0ZmxhZ30=')

print(plaintext)
