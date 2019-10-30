# Solution

The file command tells us the `re2` file is an ELF file. But trying to execute it with `./re2` does nothing. Strange. Maybe the flag is hidden within the program.

Running strings on the file doesn't pick up anything in our flag format either. This is because the executable is wrapped up and the contents are difficult to read. Malware creators often wrap their malware to prevent defenders from finding easy solutions to stop it.

In this situation, the hints indicate that we should use the program UPX to decompress or unwrap this flag.

`upx -d ./re2`

From here, let's see if we can read anything.

`strings re2 | grep ugascs`

And there's our flag!

`ugascs{upx_7r1ck}`