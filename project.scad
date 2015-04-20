include <./settings.scad>
include <./axles.scad>
use <./nema17.scad>

axles();


module mount_plates(){
  translate([20, bed_height/2 , bed_depth/2+nema17_width/2 + 5]) rotate([0, 90]) nema17_mount_plate();
}
mount_plates();
