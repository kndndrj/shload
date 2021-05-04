#!/bin/sh

############################################################
# Setup the progress bar                                   #
# Usage:                                                   #
#     shload_bar_setup <maximum> <loading_symbol>          #
############################################################
shload_setup() {
  # Progress bar variables
  shload_maximum=$(($1 * 100))
  shload_percent=$1
  # Default delimiter updates the bar every second percent and the symbol stands for 2 percents
  shload_delimiter=$(($shload_percent * 2))
  shload_symbol="$2"

  # If shload_maximum is less than bar width,
  # adjust symbol width and delimiter (when will the bar update)
  shload_count=48 # bar width
  while [ $1 -lt $shload_count ]; do
    shload_delimiter=$(($shload_delimiter * 2))
    shload_symbol="$shload_symbol$shload_symbol"
    shload_count=$(($shload_count / 2))
  done

  # Initiate counter and progress bar
  shload_bar=""
  shload_count=0
  # Print the skeleton and save cursor location
  printf "\033[1;032mProgress:\033[0m\033[s [\033[48C] 0%%"
}

############################################################
# Update the progress bar:                                 #
# Usage:                                                   #
#     shload_bar_update                                    #
############################################################
shload_update() {
  shload_count=$(($shload_count + 100))

  # add symbol at every delimiter
  [ $(($shload_count % $shload_delimiter)) -lt 100 ] && shload_bar="$shload_bar$shload_symbol"

  # Print progress bar and percentage
  printf "\033[u [$shload_bar\033[u \033[49C] $(($shload_count / $shload_percent))%%"
}



#==========================================================#
# EXAMPLE                                             / /  #
# If you are using the progress bar in your script,  / /   #
# remove this part.                                 /_/    #
#                                                  (_)     #
#==========================================================#
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

