include <components/kp08.scad>;

include <spindle_plate.scad>;
include <vertical-plate.scad>;
include <horizontal-plate.scad>;

$fn = 100;

translate([spindle_plate_w/2,30+spindle_plate_h/2,-18])  union(){
    spindle_plate();
    spindle_plate(false, true);
}

translate([vertical_plate_w/2, vertical_plate_h/2, -50]) rotate([180,0,0])  union() {
    vertical_plate();
    vertical_plate(false, true);
}

translate([horizontal_plate_w/4, 50+horizontal_plate_h/2, -100]) union(){
  horizontal_plate();
  horizontal_plate(false, true);
}


