# Solution

This steg challenge hid a flag within an image file. However, this time the flag was hidden within the middle of the picture, making it a pain to find when parsing the image in a text editor. 

`$ strings gatsby.jpg` in the command line will output all of the strings found within the image. To parse that output for our specific flag format, we can use the `grep` command. Pipe the output of `strings` into the `grep` command.

`$ strings gatsby.jpg | grep ugascs`

`ugascs{the_greatest_of_gatsby}`