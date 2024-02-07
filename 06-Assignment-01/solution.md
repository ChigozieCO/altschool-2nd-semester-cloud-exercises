# Solution

To begin this assignment, I created a new user called altschool, with home directory home/altschool and default shell of bin/bash using  the command below:

```sh
sudo adduser --home /home/altschool --shell /bin/bash altschool
```

(image 55)

The main difference between the `adduser` and the `useradd` command is that the `adduser` will prompt you to create a password if you don't use any flag that specifies that the user should not have a password whereas the `useradd` command will not prompt you to create a password for the user. You will have to do that manually.

Another difference is that when you create the home directory with the `adduser` command it populates that home directory with default files and folders from the `/etc/skel` file.

I then switch to the user I created and navigated to their home directory using the commands:

```sh
su altschool
cd ~
```

(image 56)

Next I created the necessary sub-directories that were mentioned in the assignment.

I created them all at the same time with one command:

```sh
mkdir code tests personal misc 
```

(image 57)

## A. Change Directory to the `tests` Directory Using Absolute Pathname.

An absolute path is the location of a file or directory specified from the root directory. It represents the complete path from the start of the filesystem from the root directory.

To change directory using absolute path I use the command below:

```sh
cd /home/altschool/tests/
```

(image 58)

## B. Change Directory to the `tests` Directory Using Relative Pathname.

A relative path is the location of a file or directory relative to your current working directory. 

Unlike an absolute path, the relative path doesn't start with a slash or drive letter since it doesn't start from the root directory.

To change directory using absolute path I use the command below:

```sh
cd tests
```

## C. Use `echo` Command to Create a File

The `echo` command displays a line of text to standard output.

The instruction was to use the `echo` command to create a file named fileA with text content ‘Hello A’ in the misc directory.

To do this I used the command below:

```sh
echo "Hello A" > misc/fileA
```

(image 60)

## D. Create an Empty File and Populate Afterwards

To create an empty file I used the touch command:

```sh
touch misc/fileB 
```

To populate `fileB` with dummy content I used my vim editor.

```sh
vi misc/fileB
```

(image 61)

## E. Copy Contents of `fileA` into `fileC`

To copy contents of one file into another file I use the `cp` command.

```sh
cp misc/fileA misc/fileB
```

(image 62)

## F. Move Contents of `fileB` into `fileD`

To move contents of one file into another file I use the `mv` command.

```sh
mv misc/fileB misc/fileD
```

(image 63)

## G. Create a Tar Archive

The `tar` command creates tar files by converting a group of files into an archive. 

It also can extract tar archives, display a list of the files included in the archive, add additional files to an existing archive, and various other kinds of operations.

The general syntax for the tar command is as follows:

```sh
tar [OPERATION_AND_OPTIONS] [ARCHIVE_NAME] [FILE_NAME(s)]
```

- `OPERATION` - Only one operation argument is allowed and required. The most frequently used operations are:
  > - --create (-c) - Create a new tar archive.

  > - --extract (-x) - Extract the entire archive or one or more files from an archive.

  > - --list (-t) - Display a list of the files included in the archive

- `OPTIONS` - The most frequently used operations are:
  > - --verbose (-v) - Show the files being processed by the tar command.

  > - --file=archive=name (-f archive-name) - Specifies the archive file name.

- `ARCHIVE_NAME` - The name of the archive.

- `FILE_NAME(s)` - A space-separated list of filenames to be extracted from the archive. If not provided, the entire archive is extracted.

To create a tar archive for the contents of the misc directory I used the below command:

```sh
tar -cvf misc.tar misc
```

(image 64)

## H. Compress the Tar Archive.

The instruction was to compress the tar archive to create a `misc.tar.gz` file. This indicates that I will be using the Gzip compression.

To do this I used the command below:

```sh
tar -czvf misc.tar.gz misc.tar
```

The `z` specifies the Gzip compression.

(image 65)

## I. Create a User and Force the User to Change his/her Password Upon Login
To create a new user and force the user to change their password upon the first login, I first used the `useradd` command with the `-m` and `-s` flags to create a home directory and specify their default shell.

I then used the `passwd` command to set a password for the user.

Finally I used the `-e` flag along with the `passwd` command to expire the password so that they are prompted to change their password upon their next login.

The commands are shown below:

```sh
sudo useradd -m -s /bin/bash assignmentuser
sudo passwd assignmentuser
sudo passwd -e assignmentuser
```

(image 66)

To demonstrate the effectiveness of the above command I tried to switch user in my vagrant machine and was asked to change my password.

(image 67)

I also repeated same process in another VM of mine that had a GUI then logged out and tried to login as the new user and I was asked to change password.

(virtualbox login gif)

## J. Lock a users password

I decided to lock the password of this new user I created. 

To do this I used the command below:

```sh
passwd -l assignmentuser
```

(image 68)

When I try to switch to that user now you can see that their is an authentication error.

(image 69)

To unlock the user's password I used the command below:

```sh
passwd -u assignmentuser
```

And now when I try to switch to the user, it is successful as can be seen in the screenshot.

(image 70)

## Create a user with no login shell

