#!/bin/sh

############################################################
# Setup the progress bar                                   #
# Usage:                                                   #
#     progress_bar_setup <maximum> <loading_symbol>        #
############################################################
progress_bar_setup() {
  # Progress bar variables
  prog_maximum=$(($1 * 100))
  prog_percent=$1
  # Default delimiter updates the bar every second percent and the symbol stands for 2 percents
  prog_delimiter=$(($prog_percent * 2))
  prog_symbol="$2"

  # If prog_maximum is less than bar width,
  # adjust symbol width and delimiter (when will the bar update)
  prog_count=48 # bar width
  while [ $1 -lt $prog_count ]; do
    prog_delimiter=$(($prog_delimiter * 2))
    prog_symbol="$prog_symbol$prog_symbol"
    prog_count=$(($prog_count / 2))
  done

  # Initiate counter and progress bar
  progress_bar=""
  prog_count=0
  # Print the skeleton and save cursor location
  printf "\033[1;032mProgress:\033[0m\033[s [\033[48C] 0%%"
}

############################################################
# Update the progress bar:                                 #
# Usage:                                                   #
#     progress_bar_update                                  #
############################################################
progress_bar_update() {
  prog_count=$(($prog_count + 100))

  # add symbol at every delimiter
  [ $(($prog_count % $prog_delimiter)) -lt 100 ] && progress_bar="$progress_bar$prog_symbol"

  # Print progress bar and percentage
  printf "\033[u [$progress_bar\033[u \033[49C] $(($prog_count / $prog_percent))%%"
}


############################################################
# Example                                                  #
# If you are using the progress bar in your script,        #
# remove this part                                         #
############################################################
max_count=4
for loading_symbol in "+" "=" "#" "-" "@" "%%"; do
  printf "$max_count items:\n"

  # Setup the progress bar with number of lines and a symbol
  progress_bar_setup $max_count $loading_symbol

  count=0
  while [ $count -lt $max_count ]; do
    sleep .01
    count=$(($count + 1))
    progress_bar_update
  done
  max_count=$((max_count * 4))

  # Print new line after you are done loading
  printf "\n"
done

