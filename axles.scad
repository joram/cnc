include <settings.scad>
y_tray_depth = 60;

module axle(length=50, diameter=8, tolerance=0.001, faces=10){
  r = diameter/2;
  translate([0,0,r]) cylinder(h=length, r=r+tolerance, $fs=faces);
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

axles();