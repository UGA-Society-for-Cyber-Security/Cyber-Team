# Solution
## Don't read if you want spoilers!!

This steg challenge hid a flag within an image file. However, this time the flag was hidden within a zip file that was zipped multiple times. We first need to find the zip file hidden, unzip it, and output the flag file. We will be using the steghide tool.


`$ steghide -sf sec_champs.jpg`
`$ unzip super_zipped.zip`
`$ bzip2 -d zipped.zip.bz2`
`$ unzip zipped.zip`
`$ cat flag_folder/flag.txt`


`ugascs{embedded_zips_are_not_great}`