#!/bin/sh

############################################################
# Setup the progress bar                                   #
# Usage:                                                   #
#     shload_setup <maximum> <loading_symbol>              #
############################################################
shload_setup() {
  # Progress bar variables
  shload_percent=$1
  shload_symbol="$2"

  # Bar width depends on terminal size, max width is 96
  # and the default delimiter is 1 percent
  shload_width=96
  shload_delimiter=$shload_percent
  while [ $(($shload_width + 20)) -gt $(tput cols) ]; do
    shload_width=$(($shload_width / 2))
    shload_delimiter=$(($shload_delimiter * 2))
  done

  # If maximum count is less than bar width,
  # adjust symbol width and delimiter (when will the bar update)
  shload_count=$shload_width
  while [ $1 -lt $shload_count ]; do
    shload_delimiter=$(($shload_delimiter * 2))
    shload_symbol="$shload_symbol$shload_symbol"
    shload_count=$(($shload_count / 2))
  done

  # Initiate counter and progress bar
  shload_bar=""
  shload_count=0
  # Print the skeleton and save cursor location
  printf "\033[1;032mProgress:\033[0m\033[s [\033[${shload_width}C] 0%%"
  # Add 1 to the width (less math later)
  shload_width=$(($shload_width + 1))
}

############################################################
# Update the progress bar                                  #
# Usage:                                                   #
#     shload_update                                        #
############################################################
shload_update() {
  shload_count=$(($shload_count + 100))

  # add a symbol at every delimiter
  [ $(($shload_count % $shload_delimiter)) -lt 100 ] && shload_bar="$shload_bar$shload_symbol"

  # Print progress bar and percentage
  printf "\033[u [$shload_bar\033[u \033[${shload_width}C] $(($shload_count / $shload_percent))%%"
}
