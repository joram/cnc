
include <./settings.scad>
include <./axles.scad>
include <./bearings.scad>
include <./nema17.scad>

module sliding_nema17_mount(){
  thickness = 2;
  axle_offsets = [[0, 0], [0, bed_height], [bed_width, 0], [bed_width, bed_height]];
  wall_depth = y_tray_depth+24+thickness*2;

  // axle sheethes
  union(){
    for( offset = axle_offsets){
      translate([0, 0, bed_depth/2 - 20 -thickness]) translate(offset) linear_bearing(length=24+thickness*2, tolerance=thickness);
      translate([0, 0, bed_depth/2 + 60-thickness]) translate(offset) linear_bearing(length=24+thickness*2, tolerance=thickness);
    }

    translate([-8.5, bed_height/2, bed_depth/2+wall_depth/2-14.5]) cube([thickness, bed_height+4, 108], center=true);

    // joing wall
    union() {
      //mount_plates();
      translate([21, bed_height/2-10, bed_depth/2+wall_depth/2-27]) cube([60, 37, thickness], center=true);
      translate([30, 0, bed_depth/2+wall_depth/2-37.5]) cube([bed_height-13, thickness, 23], center=true);
      translate([6, 0, bed_depth/2]) rotate([0, 90]) cylinder(r=6, h=45);

    }
  }
}

sliding_nema17_mount();
//axles();
//bearings();
