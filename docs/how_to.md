# How To
There are three phases to building an object with a CnC machine: modeling, caming, carving

## Modeling
Use whatever you want to make an STL file (or anything that can be imported to fusion 360)

## Caming


## Carving

### Initial setup
- visit [cncJS](http://192.168.1.10:8000) (john with reg password)
- on the left, top right: choose grbl, and connect to ttyS0

### Zero-ing Workspace
There are two coordinate systems: machine and workspace.
Machine origin (0,0,0) is wherever the bit was when the machine was turned on.
Workspace origin is the position in relation to your stock piece (what you are gonna carve).
Before each carve, you want to zero out the workspace origin:
 - reset then unlock
 - keyboard button (to manually control)
 - finger to position for piece you are carving
 - set work position to zero/zero/zero