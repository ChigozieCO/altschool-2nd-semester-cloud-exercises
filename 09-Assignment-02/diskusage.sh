#!/bin/bash

# Check if the '-d' flag is passed and specify the action to take if that is the flag passed.
if [ "$1" == '-d' ]; then
  
  # This if statement checks if the directory is passed by the user and asks the user to specify a directory or file if none is passed.
  if [ $# == 1 ]; then
    echo "Usage: $0 [OPTION] <file or directory to check it's disk usage>"
    echo "-d: all files and directory within the specified directory or directories should be listed"
    echo "-n: top N entries should be returned"
    echo "eg $0 -d /etc"
    exit 1
  fi

  du -ha $2 | sort -rh # check disk usage, list all files and directories in that path then sort then in descending order of disk usage.

# Check if it is the '-n' flag that is passed and specify the action to take in that case.
elif [ "$1" == '-n' ]
  then
  entries=$2
    
    # This if statement is to ensure that an integer is passed along with the '-n' flag. If it isn't, specify the correct syntax to the user.
    if [[ ! $2 =~ ^[0-9]+$ ]]; then
      echo "Usage: $0 -n [number of entries] [FILE or DIRECTORY]"
      echo "eg $0 -n 6 /etc"
      exit 1
    fi

    # Next, before running the command, ensure that a file or directory is passed. If it isn't, alert user of the syntax
    if [ $# == 2 ]; then
      echo "Usage: $0 [OPTION] <file or directory to check it's disk usage>"
      echo "-d: all files and directory within the specified directory or directories should be listed"
      echo "-n: top N entries should be returned"
      echo "eg $0 -n 9 /etc"
      exit 1
    fi

  # If everything is in order, run the command below:
  du -ha $3 | sort -rh | head -n $entries

# Set the default behaviour of the script when no flag is passed
# When no argument is passed at all
elif [ $# == 0 ]
then
  echo "Usage: $0 [OPTION] <file or directory to check it's disk usage>"
  echo "-d: all files and directory within the specified directory or directories should be listed"
  echo "-n: top N entries should be returned"
  echo "eg $0 -d /etc"
  exit 1

# When only the directory name is passed, output the disk usage of the top 8 files and directories.
else
  du -ha $1 | sort -rh | head -n 8
fi

