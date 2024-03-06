#!/bin/bash

filename=$( basename "$2" )
timestamp=$( date +"%Y%m%d_%H%M%S" )

# Check if tar is installed, if it isn't, install it.
if ! command -v tar &> /dev/null; then
  echo "tar is not installed."
  echo "installing tar"
  sudo apt update
  sudo apt install -y tar gzip build-essential
  echo "Installation complete"
  echo
fi

# Check if the source dir and destination directory are passed as arguments by the user
if [ $# -ne 2 ]; then
  echo "Usage: $0 [SOURCE DIR] [DESTINATION DIR]"
  exit 1
fi 

# If two arguments are passed, ensure the first argument passed is a directory
if [ ! -d "$1" ]; then
 echo "Source directory does not exist or is not a directory. Enter the directory you want to backup"
 echo "Usage: $0 [SOURCE DIR] [DESTINATION DIR]"
 exit 1
fi 

# Create the destination directory if it doesn't exist
mkdir -p "$2" || { echo "Error creating destination directory"; exit 1; }

echo "Backing up ..............."

# The main backup, this command performs the required backup job. If it fails it throws an error message, if it succeeds, it also lets you know.
tar -czf "${2}/${filename}_${timestamp}.tar.gz" "$1" || { echo "Error creating tarball"; exit 1; }
echo "Backup completed."

