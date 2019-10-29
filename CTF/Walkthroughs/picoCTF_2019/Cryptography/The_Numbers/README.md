# The Numbers

> The numbers... what do they mean?

The Numbers is the first crypto challenge we get faced with. We are presented an image file that displays printed numbers.

`16 9 3 15 3 20 6 { 20 8 5 14 21 13 2 5 18 19 13 1 19 15 14 }`

![the_numbers.png - "16 9 3 15 3 20 6 { 20 8 5 14 21 13 2 5 18 19 13 1 19 15 14 }"](the_numbers.png)

Based on the lay out of the picoCTF flags we know that the first 7 letters will always be picoCTF. We can make a table to examine this.

Letter | Number
------ | ------
C | 3
F | 6
I | 9
O | 15
P | 16
T | 20

Do you notice a pattern? If not the way I aligned the table should help you out.

The letters correspond to their positions; this cipher is called an A1Z26 cipher. You can go [here](https://cryptii.com/) to find a decoder.

Once we decode the provided numbers we find out that the flag is `PICOCTF{THENUMBERSMASON}`
