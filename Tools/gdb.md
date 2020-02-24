# GDB (GNU Debugger)

gdb is a powerful debugger in UNIX environments developed to step through  C and C++ programs. It can be an essential tool in breaking binary exploitation challenges and many reverse engineering problems. While fairly daunting at first, like many things, with practice one can become very proficient with gdb fast!

## Creating Files

First off when you are creating your own C or C++ files make sure to use the `-g` tag when compiling. `-g` allows us to debug our own code and see the structure of it as well. When doing CTF challenges this will almost never be the case. The challengers will want you to analyze the raw assembly code of the program. But for the purpose of learning, we will add it to our own program

> -g
>
> &nbsp;&nbsp;&nbsp; Produce debugging information in the operating system’s native format (stabs, COFF, XCOFF, or DWARF). GDB can work with this debugging information.

Learn more at [gnu.org](https://gcc.gnu.org/onlinedocs/gcc/Debugging-Options.html#Debugging-Options_)

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

## Entering gdb

After creating a file, we can begin to debug with the `gdb` command. Just type
'gdb' followed by the name of your executable.

```
$ gdb executable
```

gdb works similarly to traditional debuggers with the exception of any fancy buttons. Once greeted by the version number and the NO WARRANTY warning then we are prompted to enter a command (if you want to ignore this message try running gdb with `-q`). Let's try typing `help`.

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

Well, it looks like quite a bit is going on here. I won't cover most of these in this guide, but you can read more about them [here][documentation].

## Disassembly

Before we begin to disassemble out code we are going to set our disassembly flavor to Intel. By default, gdb disassembles into the AT&T flavor. This isn't so much a requirement as it is a personal preference.

To do this we can give the following command to gdb.

```
(gdb) set disassembly-flavor intel
```

Next, we are going to take a look at the structure of the code we are dealing with. We can see the method names in a program by typing `list`.

```
(gdb) list
1	// This C file prints out "Hello World"
2
3	#include <stdio.h>
4
5	int main(int argc, char * argv[]){
6	    printf("Hello World!");
7	}
```

Because we compiled our code with the `-g` option gdb shows us all the source code. Sometimes this won't be possible. Try compiling `hello.c` without the `-g` argument and looking at the list. In that case, we might need to use something else, maybe objdump but we cover that tool in another guide.

After running `list` we are ready to disassemble! We are interested in looking at the main method of this program so we will disassemble `main`.

```
(gdb) disassemble main
Dump of assembler code for function main:
   0x0000000000001135 <+0>:	push   rbp
   0x0000000000001136 <+1>:	mov    rbp,rsp
   0x0000000000001139 <+4>:	sub    rsp,0x10
   0x000000000000113d <+8>:	mov    DWORD PTR [rbp-0x4],edi
   0x0000000000001140 <+11>:	mov    QWORD PTR [rbp-0x10],rsi
   0x0000000000001144 <+15>:	lea    rdi,[rip+0xeb9]        # 0x2004
   0x000000000000114b <+22>:	mov    eax,0x0
   0x0000000000001150 <+27>:	call   0x1030 <printf@plt>
   0x0000000000001155 <+32>:	mov    eax,0x0
   0x000000000000115a <+37>:	leave  
   0x000000000000115b <+38>:	ret    
End of assembler dump.

```

So what does this tell us? Well it since our program is very simple, not much. The first few lines of our dump are standard when entering a new method. At 0x0000000000001150 we notice something familiar. It is a call to printf. This makes sense because this program just prints "Hello World".

That is the quick rundown of how to disassemble methods in gdb. If you want an active disassemble view try out `layout asm` it will allow you to follow through the disassembly as you step through the program. Similarly `layout next` will show us the source code of out program as you step through it.

**BEWARE:** when scrolling to the bottom of the disassembled code, I have had issues with gdb crashing and messing up my terminal. It also might happen when you reach the end of your program. If this happens just close out your current session and start a new one.

## Setting Breakpoints

Like most other debuggers, gdb supports breakpoints. Breakpoints can either be set at the start of specified methods or on certain lines.

For this example we are going to be breaking main.

```
(gdb) break main
Breakpoint 1 at 0x1144: file hello.c, line 6.
```

After breaking main we can run the program with `run`

```
(gdb) run
Starting program: /home/ctf/Documents/Cyber-Team/Tools/executable

Breakpoint 1, main (argc=1, argv=0x7fffffffe128) at hello.c:6
6	    printf("Hello World!");

```

To step through program we can either use `step` or `s` for short, `step` will step into a function if it is called. If we just want to go to the next instruction and not jump into a function we can use the command `next` or `n` for short.

If we want to get to the next breakpoint we can use `continue`. If there are no breakpoints left, the program will continue to the end.

## Debugging a program

The following section has been partly adapted from Jon Eirkson's _Hacking: The Art of Exploitation, 2nd Edition_. You can find a copy of the book [here][hacking_book].

For this part of the guide we will be using a little more complex program called `hello2.c` you can find this program in this directory. This time we will compile it as the executable `hello2` and run up gdb.

```
scs@machine: ~/tools $  gcc -g hello2.c -o hello2
scs@machine: ~/tools $  gdb -q hello2
Reading symbols from hello2...
(gdb) list
1	// This C file prints out "Hello World"
2
3	#include <stdio.h>
4
5	int main(int argc, char * argv[]){
6	    int i;
7	    int var;
8
9	    var = 1;
10
(gdb) disassemble main
Dump of assembler code for function main:
   0x0000000000001135 <+0>:	push   %rbp
   0x0000000000001136 <+1>:	mov    %rsp,%rbp
   0x0000000000001139 <+4>:	sub    $0x20,%rsp
   0x000000000000113d <+8>:	mov    %edi,-0x14(%rbp)
   0x0000000000001140 <+11>:	mov    %rsi,-0x20(%rbp)
   0x0000000000001144 <+15>:	movl   $0x1,-0x8(%rbp)
   0x000000000000114b <+22>:	movl   $0x0,-0x4(%rbp)
   0x0000000000001152 <+29>:	jmp    0x116c <main+55>
   0x0000000000001154 <+31>:	lea    0xea9(%rip),%rdi        # 0x2004
   0x000000000000115b <+38>:	mov    $0x0,%eax
   0x0000000000001160 <+43>:	callq  0x1030 <printf@plt>
   0x0000000000001165 <+48>:	shll   -0x8(%rbp)
   0x0000000000001168 <+51>:	addl   $0x1,-0x4(%rbp)
   0x000000000000116c <+55>:	cmpl   $0x6,-0x4(%rbp)
   0x0000000000001170 <+59>:	jle    0x1154 <main+31>
   0x0000000000001172 <+61>:	mov    $0x0,%eax
   0x0000000000001177 <+66>:	leaveq
   0x0000000000001178 <+67>:	retq   
End of assembler dump.
(gdb) break main
Breakpoint 1 at 0x1144: file hello2.c, line 9.
(gdb) run
Starting program: /home/ctf/Documents/Cyber-Team/Tools/hello2

Breakpoint 1, main (argc=1, argv=0x7fffffffe138) at hello2.c:9
9	    var = 1;
(gdb)
```

Now that we have set our breakpoint at main and run our program we can take a look at the what is going on.

Take a look at the table below to see some of the inspection letters we will be using.

| Letter | Representation |
---------|----------------|
| o      | Octal          |
| x      | hexadecimal    |
| u      | unsigned (base10)|
| t      | binary         |
|c       | char           |
| a      | single byte    |
| h      | halfword (2 bytes)|
| w      | word (4 bytes) |
| g      | giant (8 bytes)|

We will use these characters to tell gdb how we want to format the data we are examining. We use the `p` command to examine the content pointed to by our named variables. Let's try this on var.

```
(gdb) p var
$1 = 0
```

Wait... why is `var` 0? Well, `var` is 0 because the instruction at line 9 hasn't been executed yet. Let's step through the program a few steps and examine how var changes using the `p` command along the way.

```
(gdb) s
11	    for(i=0; i < 7; i++){
(gdb) p var
$3 = 1

```

## Appendix

Check out these resources to increase your understanding of gdb!

[Cheatsheet][cheatsheet]

[Michigan GDB Tutorial][tutorial]

[Official Documentation][documentation]

[_Hacking: The Art of Exploitation, 2nd Edition_ By Jon Erikson][hacking_book]



[cheatsheet]: https://darkdust.net/files/GDB%20Cheat%20Sheet.pdf
[tutorial]: https://web.eecs.umich.edu/~sugih/pointers/summary.html
[documentation]: https://sourceware.org/gdb/current/onlinedocs/gdb/
[hacking_book]: https://www.amazon.com/Hacking-Art-Exploitation-Jon-Erickson/dp/1593271441
