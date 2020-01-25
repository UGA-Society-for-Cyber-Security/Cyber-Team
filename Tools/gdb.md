# GDB (GNU Debugger)

gdb is a powerful debugger in UNIX environments developed to step through  C and C++ programs. It can be an essential tool in breaking binary exploitation challenges and many reverse engineering problems. While fairly daunting at first, as many things, with practice one can become very proficient with gdb fast!

[Comprehensive gdb tutorial][tutorial].

## Getting Started

### Creating Files

First off when you are creating your own C or C++ files make sure to use the `-g` tag when compiling.

> -g
>
> &nbsp;&nbsp;&nbsp; Produce debugging information in the operating system’s native format (stabs, COFF, XCOFF, or DWARF). GDB can work with this debugging information.

[gnu.org](https://gcc.gnu.org/onlinedocs/gcc/Debugging-Options.html#Debugging-Options_)

Below you can find some examples:


C
```
$ gcc -g hello.c -o executable
```

C++
```
$ g++ -g hello.cpp -o executable
```
P.S. the hello.c file is in this directory if you would like to follow along.

### Entering gdb

After creating a file, we can being to debug with the `gdb` command. Just type
'gdb' followed by the name of your executable.

```
$ gdb executable
```

gdb works similarly to traditional debuggers with the exception of any fancy buttons. Once greeted by the version number and the NO WARRANTY warning then we are prompted to enter a command. Lets try typing `help`

```
(gdb) help
List of classes of commands:

aliases -- Aliases of other commands
breakpoints -- Making program stop at certain points
data -- Examining data
files -- Specifying and examining files
internals -- Maintenance commands
obscure -- Obscure features
running -- Running the program
stack -- Examining the stack
status -- Status inquiries
support -- Support facilities
tracepoints -- Tracing of program execution without stopping the program
user-defined -- User-defined commands

Type "help" followed by a class name for a list of commands in that class.
Type "help all" for the list of all commands.
Type "help" followed by command name for full documentation.
Type "apropos word" to search for commands related to "word".
Command name abbreviations are allowed if unambiguous.
(gdb)
```

Well it looks like quite a bit is going on here. I won't cover most of these in this guide, but you can read more about them [here](https://sourceware.org/gdb/current/onlinedocs/gdb/).

### Disassembly

Before we begin to disassemble out code we are going to set our disassembly flavor to Intel. By default gdb disassembles into the AT&T flavor. This isn't so much a requirement as it is a personal preference.

To do this we can give the following command to gdb.

```
(gdb) set disassembly-flavor intel
```

After running that command we are ready to disassemble!

```
(gdb) disassemble main
```





[tutorial]: https://web.eecs.umich.edu/~sugih/pointers/summary.html
[documentation]: https://sourceware.org/gdb/current/onlinedocs/gdb/
