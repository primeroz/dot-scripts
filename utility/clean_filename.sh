#!/usr/bin/env bash
##############################################################################
# @file clean_filenames.sh
# @date January, 2016
# @author G. Roggemans <g.roggemans@grog.be>
# @copyright Copyright (c) GROG [https://grog.be] 2016, All Rights Reserved
# @license MIT
##############################################################################
#
# Cleans the filenames of the provided files.
#   - All spaces become '_'
#   - All lower case
#   - Special characters are removed '{},!#$%^&*()=?'
#
##############################################################################

for file in "$@"
do
    # Cleanup name
    clean_filename=`echo $file |\
        tr ' ' '_' |\
        tr -d '[{},\!#$%^&*()=?|]' |\
        tr -d "\'" |\
        tr '[A-Z]' '[a-z]' |\
        sed 's/_-_/_/g'`

    # Echo message
    echo "$file -> $clean_filename"

    # Check if already clean
    if [ "$file" == "$clean_filename" ]; then
        echo "  $clean_filename already clean!"

    # Check if target doesn't already exist
    elif [ -f "$clean_filename" ]; then
        echo "  $clean_filename already exists!"

    # If all fine, clean up name
    else
        mv "$file" "$clean_filename"
    fi
done

##############################################################################
