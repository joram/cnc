include <settings.scad>

module axle(length=50, diameter=8, tolerance=0.001, faces=50){
  r = diameter/2;
  translate([0,0,r]) cylinder(h=length, r=r+tolerance, $fn=faces);
}

module axles(){
  union(){
 
    // X axis
    axle(bed_depth);
    translate([0, bed_height, 0,]) axle(bed_depth);
    translate([bed_width, 0, 0]) axle(bed_depth);
    translate([bed_width, bed_height, 0]) axle(bed_depth);

    // Y axis
    translate([5, 0, bed_depth/2]) rotate([0, 90, 0]) axle(bed_depth-20);
    translate([5, bed_height, bed_depth/2]) rotate([0, 90, 0]) axle(bed_depth-20);
    translate([5, 0, bed_depth/2+y_tray_depth]) rotate([0, 90, 0]) axle(bed_depth-20);
    translate([5, bed_height, bed_depth/2+y_tray_depth]) rotate([0, 90, 0]) axle(bed_depth-20);
  }
}


module sliding_nema17_mount(){
  thickness = 2;
  wall_depth = y_tray_depth+24+thickness*2;

  difference(){
  // axle sheethes
  union(){
    for( offset = axle_offsets){
      translate([0, 0, bed_depth/2 - 20 -4]) translate(offset) linear_bearing(length=24+thickness*2, tolerance=thickness);
      translate([0, 0, bed_depth/2 + 60 -4]) translate(offset) linear_bearing(length=24+thickness*2, tolerance=thickness);
    }

    translate([-8.5, bed_height/2, bed_depth/2+wall_depth/2-15.5]) cube([thickness, bed_height+4, 110], center=true);

    // joing wall
    union() {
      //mount_plates();
      translate([21, bed_height/2-10, bed_depth/2+wall_depth/2-27]) cube([60, 37, thickness], center=true);
      translate([30, 0, bed_depth/2+wall_depth/2-37.5]) cube([bed_height-13, thickness, 23], center=true);
      translate([6, 0, bed_depth/2]) rotate([0, 90]) cylinder(r=6, h=45);

    }
  }

  union(){
    for( offset = axle_offsets){
      translate([0, 0, bed_depth/2 - 20 -thickness]) translate(offset) linear_bearing();
      translate([0, 0, bed_depth/2 + 60-thickness]) translate(offset) linear_bearing();
      translate(offset)  axle(bed_depth);
    }
  }

  }
}

