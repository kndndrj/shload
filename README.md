# Shload - Shell Loading Bar
I created this simple loading bar because I found it useful to have a kind of progress tracking in some scripts.
```
Progress: [===         ] 27%
Progress: [++++++++++++++++++++++++] 100%
Progress: [----------------------------                    ] 56%
```
The main (and possibly only) design decision was for the script to be POSIX compliant and to have the setup function do as much work as possible (thats why the resizing doesn't work while running).

## Usage
This bar consists of 2 simple shell functions; `shload_setup()` and `shload_update()`. The first function sets up the bar with max count, width and other presets and it is also used to calculate the width of the bar.

To use **shload**, copy these functions from `shload.sh` to your script and use them like so:
1. Initiate the bar with the maximum number and a loading symbol (string):
```sh
shload_setup <maximum_value> <loading_symbol>
```
2. Call the update function for every iteration following up to the maximum number:
```sh
while read file; do
    #...some work...

    shload_update <current_value>
done
```
It's best to keep the forementioned functions as close as possible, so you don't print something over the bar.

## Example
You can find an example in `shexample.sh`. If you run the script by itself, you should see the progress bar in action:
```sh
./shexample.sh.sh
```
Peek inside the mentioned files to take a deeper look at the example. Also, try resizing the terminal window before running the script
