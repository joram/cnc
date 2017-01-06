include <components/kp08.scad>;

include <horizontal-plate.scad>;
include <spindle_plate.scad>;
include <vertical-plate.scad>;

$fn = 100;

translate([180,190,0]) union(){
    spindle_plate();
    //%spindle_plate(false, true);
}

union(){
  horizontal_plate();
  //%horizontal_plate(false, true);
}


translate([-210,0,0]) union() {
    vertical_plate();
 //   vertical_plate(false, true);
}
translate([-420,0,0]) union() {
    vertical_plate();
//    vertical_plate(false, true);
}