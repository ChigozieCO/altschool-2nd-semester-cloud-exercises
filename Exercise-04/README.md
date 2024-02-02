# Task

Install PHP 7.4 on your local linux machine using the ppa:ondrej/php package repo.

# Instruction

Learn how to use the add-apt-repository command

Submit the content of /etc/apt/sources.list and the output of php -v command.

# Solution

This exercise is to practice installing an application that was not originally contained in the apt package index.

It will have us first adding the application's repository to our package index from a Personal Package Archive (ppa).

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

This installation cannot be done using only the regular `apt install <package name>`. Some steps have to happen before we use that command and so I will begin the installation using the command below:

```sh
sudo add-apt-repository ppa:ondrej/php
```

![add-apt-repository](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/c2722b59-844d-4fef-b001-edaa681da95b)

Next I update the package index.

```sh
sudo apt update
```

![update apt package index](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/acf8ceda-247e-4958-ad65-8d70c3599ed1)

Now I can go ahead and install PHP from the package index I just added.

```sh
sudo apt install php7.4
```

From the screenshot below you can see that it is installing from the ppa:ondrej/php package repo that was added.

![command to install php7.4](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/e729ccab-8942-4a3c-9a0f-a99ad685336a)

## Confirm Installation / Output of `php -v`

To confirm that the installation was truly successful, I run the command below to check the version, assuming the installation was unsuccessful I would have gotten a `Command 'php' not found` error.

```sh
php -v
```

![php version](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/4f9e8635-aaae-4c4d-893f-262d76cdbde4)

## Content of `/etc/apt/sources.list`

Below is a screenshot of the content of my `/etc/apt/sources.list` and you can find the txt file [here](./sources.list)

![Content of /etc/apt/sources.list](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/7d036356-b4eb-4500-95d4-73732cf080d6)
