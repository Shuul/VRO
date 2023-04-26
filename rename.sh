#!/bin/bash

#
# Filename: rename.sh
# Description: Renames files and folders to lowercase recursively
#              from the current directory
# Variables: Source = x
#            Destination = y

#
# Rename all directories. This will need to be done first.
#

# Process each directory’s contents before the directory  itself
for x in `find * -depth -type d`;
do

  # Translate Caps to Small letters
  y=$(echo $x | tr '[A-Z]' '[a-z]');

  # check if directory exits
  if [ ! -d $y ]; then
    mkdir -p $y;
  fi

  # check if the source and destination is the same
  if [ "$x" != "$y" ]; then

    # check if there are files in the directory
    # before moving it
    if [ $(ls "$x") ]; then
      mv $x/* $y;
    fi
    rmdir $x;

  fi

done

#
# Rename all files
#
for x in `find * -type f`;
do
  # Translate Caps to Small letters
  y=$(echo $x | tr '[A-Z]' '[a-z]');
  if [ "$x" != "$y" ]; then
    mv $x $y;
  fi
done

exit 0
