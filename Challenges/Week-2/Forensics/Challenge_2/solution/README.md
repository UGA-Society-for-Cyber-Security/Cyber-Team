# Solution

This challenge is about recognizing data formats. At first glance, this flag looks like unintelligible text and numbers.

To those familiar however, this is a flag that is encoded in hexadecimal format!

> The hexadecimal numeral system, often shortened to "hex", is a numeral system made up of 16 symbols (base 16). The standard numeral system is called decimal (base 10) and uses ten symbols: 0,1,2,3,4,5,6,7,8,9. Hexadecimal uses the decimal numbers and six extra symbols. There are no numerical symbols that represent values greater than nine, so letters taken from the English alphabet are used, specifically A, B, C, D, E and F. Hexadecimal A = decimal 10, and hexadecimal F = decimal 15. -- https://simple.wikipedia.org/wiki/Hexadecimal

This means that our flag string is there, we just need to decode it. An online hexadecimal to ASCII decoder will work fine.

> https://www.rapidtables.com/convert/number/hex-to-ascii.html

Convert the text and then you can get the flag:

`ugascs{c4n_y0u_r34d_h3x?}`