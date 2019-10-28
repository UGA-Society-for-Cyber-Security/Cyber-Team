# Solution

This first cryptography problem is a form of Base64

> In computer science, Base64 is a group of binary-to-text encoding schemes that represent binary data in an ASCII string format by translating it into a radix-64 representation. The term Base64 originates from a specific MIME content transfer encoding. Each Base64 digit represents exactly 6 bits of data. Three 8-bit bytes (i.e., a total of 24 bits) can therefore be represented by four 6-bit Base64 digits.

Common to all binary-to-text encoding schemes, Base64 is designed to carry data stored in binary formats across channels that only reliably support text content. Base64 is particularly prevalent on the World Wide Web[1] where its uses include the ability to embed image files or other binary assets inside textual assets such as HTML and CSS files.[2] -- Wikipedia


The way we know that it is a Base64 encoding scheme is because of the `=` at the end of the ciphertext. Base64 encoding uses `=`s as padding at the end of the ciphertext when necessary.

Base64 can easily be decoded using a variety of online decoders:

https://www.base64decode.org/

`Flag: ugascs{cryptflag}`