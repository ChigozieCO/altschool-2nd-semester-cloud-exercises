# Solution

To begin this assignment, I created a new user called altschool, with home directory home/altschool and default shell of bin/bash using  the command below:

```sh
sudo adduser --home /home/altschool --shell /bin/bash altschool
```

![create-user](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/9eea9984-adda-440b-bf33-a2f9df8ad89f)

The main difference between the `adduser` and the `useradd` command is that the `adduser` will prompt you to create a password if you don't use any flag that specifies that the user should not have a password whereas the `useradd` command will not prompt you to create a password for the user. You will have to do that manually.

Another difference is that when you create the home directory with the `adduser` command it populates that home directory with default files and folders from the `/etc/skel` file.

I then switch to the user I created and navigated to their home directory using the commands:

```sh
su altschool
cd ~
```

![switch user](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/28240fdb-03a4-4f60-aa76-ac3db56000c0)

Next I created the necessary sub-directories that were mentioned in the assignment.

I created them all at the same time with one command:

```sh
mkdir code tests personal misc 
```

![create directories](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/ef37dab3-b559-4931-a132-c17751ed0330)

## A. Change Directory to the `tests` Directory Using Absolute Pathname.

An absolute path is the location of a file or directory specified from the root directory. It represents the complete path from the start of the filesystem from the root directory.

To change directory using absolute path I use the command below:

```sh
cd /home/altschool/tests/
```

![change directory with absolute path](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/2baa1fc9-54eb-4831-9b9e-3afc034ec766)

## B. Change Directory to the `tests` Directory Using Relative Pathname.

A relative path is the location of a file or directory relative to your current working directory. 

Unlike an absolute path, the relative path doesn't start with a slash or drive letter since it doesn't start from the root directory.

To change directory using absolute path I use the command below:

```sh
cd tests
```

![change directory with relative path](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/f644c9c7-d9fa-460b-a97b-a9b52c8e137a)

## C. Use `echo` Command to Create a File

The `echo` command displays a line of text to standard output.

The instruction was to use the `echo` command to create a file named fileA with text content ‘Hello A’ in the misc directory.

To do this I used the command below:

```sh
echo "Hello A" > misc/fileA
```

![create file with echo](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/ad68aed5-1265-4172-b70f-dd2319051e72)

## D. Create an Empty File and Populate Afterwards

To create an empty file I used the touch command:

```sh
touch misc/fileB 
```

To populate `fileB` with dummy content I used my vim editor.

```sh
vi misc/fileB
```

![create empty file](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/c5a9cc0c-98e6-4da2-9461-456a8444c54b)

## E. Copy Contents of `fileA` into `fileC`

To copy contents of one file into another file I use the `cp` command.

```sh
cp misc/fileA misc/fileB
```

![copy file contents](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/7a433e65-d578-4178-93a4-7e6284f7760c)

## F. Move Contents of `fileB` into `fileD`

To move contents of one file into another file I use the `mv` command.

```sh
mv misc/fileB misc/fileD
```

![move file](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/c8021809-3c62-4776-89d8-07caabd66cd6)

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

![create tar archive](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/6652e80d-7a89-4711-96ab-2300653f660d)

## H. Compress the Tar Archive.

The instruction was to compress the tar archive to create a `misc.tar.gz` file. This indicates that I will be using the Gzip compression.

To do this I used the command below:

```sh
tar -czvf misc.tar.gz misc.tar
```

The `z` specifies the Gzip compression.

![compress tar archive](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/8bd29f75-4beb-4310-a325-e10235d01c50)

## I. Create a User and Force the User to Change his/her Password Upon Login
To create a new user and force the user to change their password upon the first login, I first used the `useradd` command with the `-m` and `-s` flags to create a home directory and specify their default shell.

I then used the `passwd` command to set a password for the user.

Finally I used the `-e` flag along with the `passwd` command to expire the password so that they are prompted to change their password upon their first login.

The commands are shown below:

```sh
sudo useradd -m -s /bin/bash assignmentuser
sudo passwd assignmentuser
sudo passwd -e assignmentuser
```

![expire user password](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/33a9b99b-e8d8-4908-947d-4eaa574fb9d1)

To demonstrate the effectiveness of the above command I tried to switch user in my vagrant machine and was asked to change my password.

![user login cli](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/2a30ab05-e66f-40d4-9b1b-b7153456955f)

I also repeated same process in another VM of mine that had a GUI then logged out and tried to login as the new user and I was asked to change password.

![user login GUI](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/5abf01d5-37b8-4c50-9093-927361b28bb1)

## J. Lock a Users Password

I decided to lock the password of this new user I created. 

To do this I used the command below:

```sh
passwd -l assignmentuser
```

![Lock user password](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/cc4fe570-6d68-4569-877d-92ecce596b44)

When I try to switch to that user now you can see that there is an authentication error.

![authentication error](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/9639b6b5-45eb-4e99-a882-f84d1d25620b)

To unlock the user's password I used the command below:

```sh
passwd -u assignmentuser
```

And now when I try to switch to the user, it is successful as can be seen in the screenshot.

![unlock password](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/507b9452-86b4-41ff-a6b6-e13fb3620f49)

## K. Create a User With no Login Shell

There are various ways you can employ to create a non login user.

They include the following:

- Assign the `/bin/false` shell to the user during creation.

- Assign the `/usr/sbin/nologin` to the user during creation.

- Create a user using the `adduser` command specifying the `--system` flag. (This will create a system user that has no login shell)

-  Create a user using the `adduser` command specifying the `--disable-login` flag. (Here, until a password is created for the user, the account will be inactive.)

For this question I will be creating my no login shell user called `uno` with the second method. 

I will assign the `/usr/sbin/nologin` shell to the user and also ensure no home directory is created for said user.

I do this with the command below:

```sh
sudo useradd -M -s /usr/sbin/nologin uno
```

From the screenshot below one can see that the user was created successfully, we can see the shell attached to the user when we list the content of the `/etc/passwd` file.

We can also see that even though I was allowed to assign a password to the user, when I try to switch to that user I am told that the `account is currently not available.` 

![create non login user](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/76b3075f-87cd-4ad7-a069-58cbf2adf92f)

## L. Disable Password Based Authentication for SSH

To disable password-based authentication for SSH and only allow SSH key-based authentication, we need to modify the SSH daemon configuration file (`sshd_config`)

To do this I opened the SSH daemon configuration file for editing. 

This file is typically located at `/etc/ssh/sshd_config`. You'll need root privileges to edit this file.

I used the vim editor:

```sh
sudo vi /etc/ssh/sshd_config
```

![command to edit /etc/ssh/sshd_config file](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/a2746c6b-31c0-4a03-bd53-c47062a944cd)

I look for the part of the document that has to do with authentication, particularly the line that has the word `PasswordAuthentication` as shown below:

![/etc/ssh/sshd_config file](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/0417cf08-1e3b-403d-801b-3e020dd6bc55)

And I uncomment it (to enter the insert mode in vim, punch the `i` key on your keyboard):

![edit /etc/ssh/sshd_config file](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/ebdf4811-208b-4d49-bc95-bce23ac76a77)

And I save the document (to save a change in vim after inserting, leave the insert mode by punching the `esc` key then type `:wq`)

To effect the changes made I have to restart the SSH service like so:

```sh
sudo systemctl restart ssh
```

![restart ssh](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/ef1dc8ea-47db-4a4c-aa5b-9d5a0c429f40)

## M. Disable Root Login for SSH

The same way the previous instruction required me to edit the `/etc/ssh/sshd_config` file, the solution to this also requires that I edit said file again.

So I repeat the above process again but this time I will edit the part of the document that mentions `PermitRootLogin`.

```sh
sudo vi /etc/ssh/sshd_config
```

I uncomment the line shown and change the value to no like so:

![/etc/ssh/sshd_config file](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/dbac6fbe-ae9b-4369-81d6-e5d1b20d62e2)

```sh
PermitRootLogin no
```

![edit /etc/ssh/sshd_config](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/69159ab3-d344-4a28-9de9-ecb5d4a6ed6a)

I saved the file and restarted the SSH service with the `sudo systemctl restart ssh` command.
