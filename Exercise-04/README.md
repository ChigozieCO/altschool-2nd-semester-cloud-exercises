# Task

Install PHP 7.4 on your local linux machine using the ppa:ondrej/php package repo.

# Instruction

Learn how to use the add-apt-repository command
Submit the content of /etc/apt/sources.list and the output of php -v command.

# Solution

This exercise is to practice installing an application from a different package manager than the apt package index.

To do this I will be installing PHP 7.4 using the ppa:ondrej/php package repo using the `add-apt-repository` command.

## `add-apt-repository`

The `add-apt-repository` command adds   a   repository   into   the   `/etc/apt/sources.list` or `/etc/apt/sources.list.d` or removes an existing one.

The options supported by add-apt-repository are:

>-h, --help Show help message and exit
>
>-m, --massive-debug Print a lot of debug information to the command line
>
>-r, --remove Remove the specified repository
>
>-y, --yes Assume yes to all queries
>
>-k, --keyserver Use a custom keyserver URL instead of the default
>
>-s, --enable-source Allow downloading of the source packages from the repository
>

## Install PHP 7.4 Using the `ppa:ondrej/php` Package Repo

This installation cannot be done using the regular `apt install <package name>`and so I will install it using the command below:

```sh
sudo add-apt-repository ppa:ondrej/php
```

image 6

Next I update the package index.

```sh
sudo apt update
```

(image 8)

Now I can go ahead and install PHP from the package index I just added.

```sh
sudo apt install php7.4
```

From the screenshot below yo can see that it is installing from the ppa:ondrej/php package repo that was added.

(image 10)

## Confirm Installation / Output of `php -v`

To confirm that the installation was truly successful, I run the command below to check the version, assuming the installation was unsuccessful I would have gotten a `Command 'php' not found` error.

```sh
php -v
```

(image 11)

## Content of `/etc/apt/sources.list`

Below is a screenshot of the content of my `/etc/apt/sources.list` and you can find the txt file [here](./sources.list)

(image 12)