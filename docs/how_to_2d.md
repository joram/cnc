# How To (2D)


## Make SVG
use your tool of choice
- I've heard inkscape is good
- OR: using any photo editing tool and then converting to svg (web tool [pngtosvg.com](https://www.pngtosvg.com/))
- a 380px square will fit on a alphabet cube.


## Make GCODE
use [jscut.org](http://jscut.org/jscut.html) tool.
- set 300 DPI
- cut depth 0.05 to start, go up to 0.1 per layer
- don't lie about your bit size. it's 3.175 for the default. use calipers if oyu are using a different bit


## Setup Machine
place the block firmly attached to the board
- for small blocks use the clamp
- for big sheets clamp or screw to table

## Mill
- manually drive the bit to the top left corner of your work, barely touching the material.
- zero out the machine
- manually drive the bit to the bottom left of the work (as seen in the UI)
- make sure it will fit the material
- home XY, then home Z
- turn on the spindle
- press play
