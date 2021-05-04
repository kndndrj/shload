# Shload - Shell Loading Bar
I created this simple loading bar because I found it useful to have a kind of progress tracking in some scripts.
```
Progress: [============================                    ] 56%
```

## Usage
This bar consists of 2 simple shell functions; `shload_setup()` and `shload_update()`.

To use the bar, copy these functions from `shload.sh` to your script and use them like so:
1. Initiate the bar with the maximum number and a loading symbol (string):
```sh
shload_setup <maximum> <loading_symbol>
```
2. Call the update function for every iteration following up to the maximum number:
```sh
while read file; do
    #...some work...

    shload_update
done
```
It's best to keep the forementioned functions as close as possible, so you don't print something over the bar.

## Example
If you run the script `shload.sh` by itself, you should see the progress bar in action:
```sh
./shload.sh
```
Peek inside `shload.sh` to take a deeper look at the example.
