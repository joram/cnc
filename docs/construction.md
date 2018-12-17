## Parts List

### Electronic
|  name                    | #  |  unit cost  | total cost |
|:-------------------------|---:|-------------|------------|
| nema17 stepper motors    | 3x | [$00.00](https://www.adafruit.com/product/324) ||
| milling motor            | 1x | [here]() ||
| Raspberry PI 3           | 1x | [here](https://www.amazon.ca/gp/product/B01CD5VC92/ref=oh_aui_detailpage_o01_s00?ie=UTF8&psc=1) ||
| CnC Controller           | 1x | [here](https://www.buyapi.ca/product/raspberry-pi-cnc-board/) ||
| Stepper Motor Controller | 1x | [here](https://www.pololu.com/product/2133) ||
| Stepper power supply     | 1x | [here](https://www.amazon.ca/gp/product/B00FEYHNIE/ref=oh_aui_detailpage_o00_s00?ie=UTF8&psc=1) ||
| Drill power supply       | 1x | [here](https://www.amazon.ca/gp/product/B0716XVR7P/ref=oh_aui_detailpage_o00_s00?ie=UTF8&psc=1) ||

### Hardware
| name                 |  #  | unit cost | total cost |
|---------------------:|:----|-----------|------------|
| aluminium beams      | 12x | [here](https://www.adafruit.com/product/1221) | |
| stepper axle adapter | 3x  | [here](https://www.adafruit.com/product/1176) ||
| t-slot nuts          | 1x  | [here]() ||
| bolts                | 1x  | [here]() ||
| corner bracket       | 1x  | [here]() ||
| corner triangle      | 1x  | [here]() ||
| sheet of plastic     | 1x  | [here]() ||
| long threaded axle   | 2x  | [here]() ||
| short threaded axle  | 1x  | [here]() ||
| short threaded axle  | 1x  | [here]() ||


## Construction Gotchas
- a moving gantry powered by two axles was hard
    - a fixed gantry and moving piece plate was easier


## Software
There are two stages in making a physical object: `stl` then `gcode`.
Following that, we use the cnc controller via a web interface to do the milling.
### Designing
- *STL* - for athetic pieces [blender](https://www.blender.org)
- *STL* - for mechanical pieces [openSCAD](www.openscad.org)
- *GCode* - [visualCADCAM]()
- *Preview* - [CAMotics]()
### Carving
- *web interface* - [CNCjs]()
- *grbl* - [grbl]()


## RPi setup
```
mkdir ~/code
cd ~/code
sudo apt-get update
sudo apt-get install -y git avrdude
sudo apt-get install -y realvnc-vnc-server realvnc-vnc-viewer
git clone git@github.com:vlachoudis/bCNC.git
git clone git@github.com:Protoneer/RPI-CNC-Config-Scripts.git
source ~/code/RPIa-CNC-Config-Scripts/resources/scripts/Run-Flash-GRBL-Latest.sh
```
