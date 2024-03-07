# Task

1. Write a shell script that checks the disk usage in a given directory.

The script can take two optional arguments and one compulsory argument...

-d: which means that all files and directory within the specified directory or directories should be listed.

-n: which means that the top N entries should be returned.

List of directories: this will be the directories you want to check it's disk usage

```sh
eg yourscript.sh -n 5 /var
should return the top 5 directories wrt disk usage in /var directory
```

```sh
yourscript.sh -d /var
should list both directories and files
```

Note: if -n argument is not given, it should return 8 entries by default.


2. Create a backup script. This script creates a backup of a given directory and saves it in another directory with a timestamp. It takes two arguments:

the source directory and the destination directory

Note: The backup should be a tar archive

# Instruction

Mode of submission:
You are going to push the required script to your GitHub repositories.

Deadline: 9th March 2024 before 6pm.

# Solution

Find detailed explanation and tests for the two scripts. 

Conditions specified in the question for the two scripts were put to test and passed.

# Disk Usage Script

The requirements for this script was very specific, the script is meant to check disk usage of any user supplied directory or file.

There should be a compulsory argument passed by the user, the argument being the file or directory to check it's disk usage.

The script can also take two flags; `d` and `n`

>
>-d: which means that all files and directory within the specified directory or directories should be listed.
>
>-n: which means that the top N entries should be returned.
>

Passing these flags are however not compulsory for the user.

I wanted to keep this script as simple and as uncomplicated as possible, I doubt I was successful in doing that, and so I made use of multiple IF statements.

The resulting script can be found [here](./diskusage.sh).

Using various IF statements and differing conditions I was able to satisfy all the specifications of the scrip and this is demonstrated in the screenshots below.

## Ensure a Directory is Passed by the User Compulsorily

Running the script with no argument supplied by the user will throw an error.

I ensured I specified the script usage as well as explain the various available flags for the benefit of new users.

The screenshot below shows the error message.

![error message](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/fdfad1bc-2178-4095-9161-0e1e19aa7cba)

When the script is run with a file or directory passed, it runs correctly as shown below:

![directory argument passed](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/f2e9a4e3-0040-4642-a605-5293a5376bef)

We can only see 8 entries because as specified in the question, it is the default behaviour of the script to return only the top 8 entries when no flag is passed by the user. 

## Behaviour When the `d` Flag is Passed

The `d` flag is another argument that can be passed by the user but it isn't compulsory. 

When it is passed however, the disk usage of all the files and subdirectories are listed as against the default script behaviour of listing just the top 8.

![d flag output](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/f9ea7faf-1f7a-4db0-8403-8eaf244f0197)

I also wrote an IF statement ensuring that the script also checks to ensure that the user passes the compulsory directory name along with the flag. If the directory name is not passed it throws an error:

![d flag error](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/8097d6ab-0c03-4bae-a1cc-ed59d92ad3d9)

## Behaviour When the `n` Flag is Passed

The final argument we were asked to implement was the `n` flag, it is also an optional flag for the user.

This flag will allow the user specify the number of entries they want the script to output. This is useful when the user wants to output more than the default 8 entries but less than the full list of files and subdirectories.

![n flag output](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/80a8a3ba-954d-4a22-90d3-3fe75b5c9313)

The user will also need to specify the number of entries they want. I wrote an IF statement to check that an integer is passed next to the `n` flag as this is what will let the script know the number of entries to output to the user.

If no integer is passed, and error is thrown:

![n flag error](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/7f6e639e-fcb5-49c7-b078-4640c7232095)

Further, I ensure my compulsory argument is passed along with the `n` flag and the integer. If not it throws an error as seen:

![n flag error](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/d46c3b3a-a388-49ac-a758-e65eb1d5c083)

The full script can be found [here](./diskusage.sh)

# Backup Script

This was a pretty straightforward script and can be found [here](./backup.sh)

I started out setting a variable for the filename and timestamp as these would be used in the naming convention of the backup.

Next I ensured the user had `tar` installed on their system, in the case that they don't, tar would be installed for them.

## Behaviour When no (or More Than Two) Argument(s) is Passed
Next I ensured that two arguments (and only two) are compulsorily passed by the user, the logic here is that even if the user wants to backup multiple files or directories, they would have to first put them all in one directory with which they will work with.

![no argument passed](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/0a800cb1-32b4-443e-b723-3142012819cf)

## Behaviour When the First Argument Passed is not a Directory
After making sure the user was passing 2 arguments, I ensured that the first argument was a directory and that a directory is created for the second argument if it doesn't already exist.

The script will throw an error at this point if it encounters a problem when trying to create a directory.

![non directory](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/f23eadae-f6f4-4ed6-99ce-1d21410db2ba)

## Working Script
Now we are ready to backup once you have passed two arguments with the first one being the source directory that you want to backup.

![working script](https://github.com/ChigozieCO/altschool-2nd-semester-cloud-exercises/assets/107365067/3f855b56-95d3-4c9d-99a5-888b9dbe8496)

We can see some of the previous backups as well and they are saved as tar archives with timestamps.

The backup script is found [here](./backup.sh)
