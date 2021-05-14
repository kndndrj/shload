#!/bin/sh

############################################################
# EXAMPLE                                                  #
# Here, the functions are imported from ./shload.sh file,  #
# but you can also just copy the functions over to your    #
# script (so you wont look for dependencies all the time). #
############################################################

. $(pwd)/shload.sh

max_count=4
for loading_symbol in "+" "=" "#" "-" "@" "%%"; do
  printf "\nBar with $max_count items:\n"

  # Setup the progress bar with number of lines and a symbol
  shload_setup $max_count $loading_symbol

  count=0
  while [ $count -lt $max_count ]; do
    sleep .01
    count=$(($count + 1))
    shload_update
  done
  max_count=$((max_count * 4))

  # Print new line after you are done loading
  printf "\n"
done

