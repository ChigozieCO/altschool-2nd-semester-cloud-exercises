# Linux

Linux is an operating system just like Windows and MacOS. 

Interestingly, Android, is powered by the Linux operating system and nearly all servers run on the Linux OS as well and so you can basically say that Linux is everywhere and you won't be wrong.

Therefore as a cloud engineer, it is very beneficial to have at least a basic understanding of the Linux operating system as well as how to use basic commands for navigating in Linux. 

We looked at quite a number of commands in the Introduction to Linux Operating System Module.

Commands such as ls, touch, mkdir, cat, df -h, pwd, cp, rm, mv, cd and much more.

This exercise is building on that knowledge and touching on commands that were not mentioned in the module.

## `type`

The 'type' command is a shell builtin that displays the kind of command the shell will execute, given a particular command name.

It is used to identify the kind of command you are dealing with.

It helps you determine whether a command is an alias, a shell built-in, a file, or a function.

Syntax:

```sh
type <command>

type cat

```

(image 12)

## `which`

'which' will print the full path of the provided PROGRAMNAME on STDOUT
It does this by searching for an executable or script in the directories listed in the environment variable PATH.

Sometimes there is more than one version of an executable program installed on a system. To determine the exact location of a given executable, the which command is used.

Syntax:

```sh
which <command>

which sudo
```

which works on only executable programs, not builtins or aliases that are substitutes for actual executable programs. Hence why there is no response when I ran the `which cd` command in the screenshot below.

(image 13)

## `apropos`

This command is used to search the man page files. It is particularly useful when searching for commands without knowing their exact names.

'apropos' command helps the user when they don’t remember the exact command but knows a few keywords related to the command that define its uses or functionality. 

It searches the Linux man page with the help of the keyword provided by the user to find the command and its functions.

Syntax:

```sh
apropos [option] <keyword>

apropos 
```

(image 14)

## `chattr`

This command changes the file attributes on a Linux file system, using this command you can increase the security of files with extended file attributes beyond what is obtainable with basic file permissions.

It is particularly useful to secure your important file systems like:

- hosts.allow & hosts.deny
- /etc/hosts
- /etc/ssh/*
- /etc/xinetd.d/*

NOTE: 

Once you add '+i' attribute to any file even the root user will not be allowed to make any changes in that file unless you change the attribute using '-i'

Syntax:

```sh
chattr +i <filename>

chattr +i /etc/hosts // to add the security attribute that ensure no one (even root) is able to modify the file.

chattr -i /etc/hosts // to remove the attribute
```

(image 15)

## `lsattr`

This command list file attributes on a Linux second extended file system. 

By default `ls` command will not show the permission attributes applied by `chattr` so we must use `lsattr` to get these details.

Syntax:

```sh

lsattr <filename>

lsattr /etc/hosts
```

(image 16)

In the above screenshot we can see the "i" attribute which we added with chattr in the previous example.

The 'e' attribute indicates that the file is using extents for mapping the blocks on disk. It may not be removed using chattr

In the screenshot below I remove the "i" attribute using `chattr -i <filename>` and run the `lsattr` command again.

(image 17)