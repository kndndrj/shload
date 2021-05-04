# Shload - Shell Loading Bar
I created this simple loading bar because I found it useful to have a kind of progress tracking in some scripts.

## Usage
This bar consists of 2 simple shell functions; `progress_bar_setup()` and `progress_bar_update()`.

To use the bar, copy these functions from `progress_bar.sh` to your script and use them like so:
1. Initiate the bar with the maximum number and a loading symbol (string):
```sh
progress_bar_setup <maximum> <loading_symbol>
```
2. Call the update function for every iteration following up to the maximum number:
```sh
while read file; do
    #...some work...

    progress_bar_update
done
```
It's best to keep the forementioned functions as close as possible, so you don't print something over the bar.

## Example
If you run the script `progress_bar.sh` by itself, you should see the progress bar in action:
```sh
./progress_bar.sh
```
