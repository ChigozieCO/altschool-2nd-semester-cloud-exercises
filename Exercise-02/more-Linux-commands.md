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

### Syntax:

```sh
type <command>

type cat

```

![type-comand](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/941f38c6-9335-409d-ad5b-638808c40cf4)

## `which`

'which' will print the full path of the provided PROGRAMNAME on STDOUT
It does this by searching for an executable or script in the directories listed in the environment variable PATH.

Sometimes there is more than one version of an executable program installed on a system. To determine the exact location of a given executable, the which command is used.

### Syntax:

```sh
which <command>

which sudo
```

which works on only executable programs, not builtins or aliases that are substitutes for actual executable programs. Hence why there is no response when I ran the `which cd` command in the screenshot below.

![which-command](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/3f564843-2fbd-4392-a58e-82e27b7d87b5)

## `apropos`

This command is used to search the man page files. It is particularly useful when searching for commands without knowing their exact names.

'apropos' command helps the user when they don’t remember the exact command but knows a few keywords related to the command that define its uses or functionality. 

It searches the Linux man page with the help of the keyword provided by the user to find the command and its functions.

### Syntax:

```sh
apropos [option] <keyword>

apropos 
```

![apropos](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/bfc966e8-16f8-465b-9254-188e9197b11f)

## `chattr`

This command changes the file attributes on a Linux file system, using this command you can increase the security of files with extended file attributes beyond what is obtainable with basic file permissions.

It is particularly useful to secure your important file systems like:

- hosts.allow & hosts.deny
- /etc/hosts
- /etc/ssh/*
- /etc/xinetd.d/*

**NOTE:** 

Once you add '+i' attribute to any file even the root user will not be allowed to make any changes in that file unless you change the attribute using '-i'

### Syntax:

```sh
chattr +i <filename>

chattr +i /etc/hosts // to add the security attribute that ensure no one (even root) is able to modify the file.

chattr -i /etc/hosts // to remove the attribute
```

![chattr](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/dc717ed2-cb7e-4296-9894-9458a0fb8836)

## `lsattr`

This command list file attributes on a Linux second extended file system. 

By default `ls` command will not show the permission attributes applied by `chattr` so we must use `lsattr` to get these details.

### Syntax:

```sh

lsattr <filename>

lsattr /etc/hosts
```

![lsattr](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/c6b0b25b-9387-43e0-a1fc-2018637afc4b)

In the above screenshot we can see the "i" attribute which we added with chattr in the previous example.

The 'e' attribute indicates that the file is using extents for mapping the blocks on disk. It may not be removed using chattr

In the screenshot below I remove the "i" attribute using `chattr -i <filename>` and run the `lsattr` command again.

![lsattr-again](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/6bc96a43-2ba0-4e08-8b77-7eedf28151bc)

## `stat`

The stat command is used to display file or file system status. It gives information about the file and filesystem.

Stat command gives information such as the size of the file, access permissions and the user ID and group ID, birth time access time of the file.

It retrieves information such as file type; access rights in octal and human-readable; SELinux security context string; time of file creation, last data modification time, and last accessed. 

When invoked without any options (as can be seen in the screenshot), stat command displays the following file information like: 

- File name, 
- file size, 
- number of allocated blocks, 
- blocksize, 
- file type, 
- device number, 
- inode number, 
- number of hard links, 
- access file permissions in numeric or symbolic form, 
- last time the file was accessed, 
- last time the file’s content was modified and 
- last time the file’s attribute or content was changed.

### Syntax: 

```sh

stat <file>

stat /etc/hosts
```

![stat](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/823dafbd-1fed-49b2-9dca-bd10c418c56c)

It has several options one of which is an option to specify a custom format instead of the default, for displaying information.

## `service`

The service command is used to run a System V init script. 

Usually all system V init scripts are stored in /etc/init.d or /usr/local/etc/init.d/ or /etc/rc.d/ or /usr/local/etc/rc.d/ directory and service command can be used to start, stop, and restart the daemons and other services under Linux. 

All scripts in /etc/init.d accepts and supports at least the start, stop, and restart commands.

### Syntax:

```sh

service <SCRIPT-Name> <COMMAND>

or

sudo service <SCRIPT-Name> <COMMAND>

sudo service ssh status
```

The COMMAND can be at least start, stop, status, and restart. You must run service command as the root user. Typically one can gain root access using the "su" or "sudo" command on Linux.

In the example below I check the ssh status using the `service` command.

![service-command](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/f9b53d56-93dd-43bd-90d4-13828429197f)

## `du`

The ‘du’ command in Linux helps you keep track of your disk usage. This command is a powerful tool that provides detailed information about the space consumed by files and directories.

The output of this command will show you the total disk usage of the specified directory, including all of its subdirectories. 

The number displayed is the total size of all the files and directories contained within the specified directory, measured in kilobytes.

But what if you want to see the size of each subdirectory individually? You can do this by using the ‘-h’ option with the ‘du’ command. 

This option makes the output easier to read by displaying the sizes in a ‘human-readable’ format (i.e., in kilobytes (K), megabytes (M), gigabytes (G), etc.).

### Syntax:

```sh

du <file or directory>

du /etc/init.d

du -h /etc/init.d

sudo du -h /root
```

![du-command](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/26f73bb7-2ee6-49fc-a3ce-ea840bdfb29f)

## `shred`

The shred command in Linux is your go-to utility for securely deleting files. If you ever wanted a file to be almost impossible to recover, shred can help you with this task.

When a file is deleted, it first gets moved to the trash and as soon as you clear off the trash the files get deleted for the file system. But the file is still there on your hard drive, and it could be recovered.

In order to delete a file completely from a hard disk “shred” is used in Linux. 

This command overwrites the contents of a file multiple times, using patterns chosen to maximize the destruction of the residual data, making it harder for even very expensive hardware probing to recover it. 

### Syntax:
```sh

shred [OPTION] <FILE>

If you want to delete the file right away, you can use the -u flag

shred -u <FILE>

shred destroyfile.txt

shred -u destroyfile.txt

```

![shred](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/2073cb08-a096-486f-9549-dae050cd0d14)

In this first example we can see that the file was shredded in place (it was not immediately deleted) and the contents of the file have become unreadable.

To delete it permanently we can then use the `rm` command.

However, the next example, as seen in the screenshot below, we used the `-u` flag along with the `shred` command and so the file was deleted as soon as the shred was complete.

By running the `ls` command immediately afterwards we can see that the file no longer exists in that directory.

![shred-with-flag](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/648dce7c-4e27-4aec-b0b3-767edd5a2f93)

## `histroy`

To reuse previously run commands you can simply tap your arrow up key on your keyboard.

To view the commands you have been running, perhaps after you ran the `clear` command use the `history` command as shown below.

### Syntax:

```sh

history
```

![history-command](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/ba339f04-a483-4f87-bbb4-8f3ee9cc609e)

The number of command saved in our history is determined by the value our HISTSIZE and echo HISTFILESIZE. 

Basically, **HISTSIZE** is the number of commands saved during your current session and **HISTFILESIZE** is the number of commands that will be remembered across sessions (even after a restart). 

To view what the values of your HISTSIZE and HISTFILESIZE are, use the command below:

```sh
echo $HISTSIZE
echo $HISTFILESIZE
```

That concludes this exercise, I've been able to highlight 10 additional Linux commands that will be useful in your day to day use of the Linux operating system.
