# Task


- Create 3 groups – admin, support & engineering and add the admin group to sudoers. 
- Create a user in each of the groups. 
- Generate SSH keys for the user in the admin group

# Instruction

Submit the contents of /etc/passwd, /etc/group, /etc/sudoers

# Solution

For this assignment I made use of my Vagrant VM which is an Ubuntu 20.04 LTS

## Create 3 Groups

To create a group in Linux use the `groupadd` command. You need to have root privileges to be able to do this.

I created the groups using the commands below:

```sh
sudo groupadd <groupname>

sudo groupadd support
sudo groupadd engineering
```

Because my vagrant machine already had an `admin` group I didn't have to create that group again.

### `/etc/groups` File

Here is a snippet of my `/etc/group` file showing the new groups.

![groups](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/1e58b3d2-ab87-4eed-bab8-85f97db19986)

Find a copy of the contents of the [`/etc/group`](./etc-group) file.

## Add `admin` Group to Sudoers

The `sudoers` file is a text file that controls the deepest levels of your permission system. It permits or denies users from gaining super-user access and holds some special preferences for sudo.

Its main purpose is to control how sudo works on your machine and determine which users and groups have the ability to run with superuser permission.

Before I went about editing the `sudoers` file I displayed it's content and I was able to discover that the admin group was already part of the sudoers.

However assuming the admin group wasn't part of the sudoers, here is how I would go about adding it:

First I would ensure to use the `visudo` command. This is the recommended and advisable way to edit the sudoers file.

### Reasons why you should use the `visudo` command to edit the sudoers file:

- The visudo command opens a text editor like normal, but it validates the syntax of the file upon saving. This is very useful as improper syntax in the /etc/sudoers file can leave you with a broken system where it is impossible to obtain elevated privileges.

- Using the visudo command also eliminates the probability of having simultaneous editing and corrupted files, potentially denying any admin access.

To edit the file I'll use the `visudo` command as earlier stated however with root privilege as seen below:

```sh
sudo visudo
```

To add a group to the sudoers I would then add the line below to the file:

```sh
%<group name> ALL=(ALL) ALL

%admin ALL=(ALL) ALL
```

The above command begins with a `%` because I am adding a group, if I were adding a user directly I wouldn't use the `%` in front of the username like so:

```sh
anulika ALL=(ALL) ALL
```

### `/etc/sudoers` File

Here is a snippet of my `/etc/sudoers` file.

![sudoers](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/eadac618-252d-4d76-a770-50c057f0c33b)

Find a copy of the contents of the [`/etc/sudoers`]() file.

## Create a User in Each of the Groups

Having created 3 groups `admin`, `support` & `engineering` I go ahead to create 3 users that would be added to the 3 groups.

I wanted my users to have a home directory and the bin/bash shell as their default shell so I used the command below:

```sh

useradd -m /home/<user> -s bin/bash <user name>

useradd -m /home/anulika -s /bin/bash anulika
useradd -m /home/nwando -s /bin/bash nwando
useradd -m /home/anita -s /bin/bash anita
```

I could have added the users to their respective groups while creating them but I chose not to, I wanted a group with the same name as their username to be their primary group and then the other groups their secondary group.

I did this with the below command:

```sh
usermod -aG <groupname> <username>

usermod -aG admin anulika 
usermod -aG support nwando
usermod -aG engineering anita 
```

### `/etc/passwd` File 

Here is a snippet of my `/etc/passwd` file showing the new users.

![passwd](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/33d693cb-1689-4e78-88dd-b550c59a4d40)

Find a copy of the contents of the [`/etc/passwd`](./etc-passwd) file.

## Generate SSH Keys for the User in the Admin Group

The user in my admin group is the user called `anulika` and so I switched to that user and navigated to their home directory using the below command:

```sh
su anulika
cd ~
```

**PRO TIP**

- `cd ~` navigates to the user's home directory.

- `cd /` navigates to the root directory.

![pro-tip](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/36fc891a-3bdb-4dc2-8163-9deabe27371b)

Now I then created SSH key pair for this user with the command below:

```sh
ssh-keygen
```

![ssh-keygen](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/53e27fb1-0abe-42de-abc0-bccc5843f630)

