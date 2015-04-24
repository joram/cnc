include <./settings.scad>

module nema17(motor_length=50) {
  // NEMA 17 stepper motor.
  difference() {
    union() {
      translate([0, 0, -motor_length/2]) intersection() {
        cube([42.2, 42.2, motor_length], center=true);
        cylinder(r=25.1, h=motor_length+1, center=true, $fn=60);
      }
      cylinder(r=11, h=4, center=true, $fn=32);
      cylinder(r=2.5, h=48, center=true, $fn=24);
    }
    for (a = [0:90:359]) {
      rotate([0, 0, a]) translate([15.5, 15.5, 0])
        cylinder(r=m3_radius, h=10, center=true, $fn=12);
    }
  }
}

module empty_nema17_mount_plate(thickness=2){
    union(){
      for (a = [0:90:359]) {
        rotate([0, 0, a]) translate([15.5, 15.5, 0]) cylinder(r=m3_radius, h=10, center=true, $fn=12);
      }
      translate([0, 0, 2]) cylinder(r=11, h=5, center=true, $fn=32);
    }
}
module solid_nema17_mount_plate(thickness=2){
  translate([0, 0, thickness/2]) intersection() {
    cube([42.2, 42.2, thickness], center=true);
    cylinder(r=25.1, h=thickness+1, center=true, $fn=60);
  }
}

module nema17_mount_plate(thickness=2){
  difference(){
    solid_nema17_mount_plate(thickness);
    empty_nema17_mount_plate(thickness);
  }
}

module triangle(o_len, a_len, depth)
{
    linear_extrude(height=depth)
    {
        polygon(points=[[0,0],[a_len,0],[0,o_len]], paths=[[0,1,2]]);
    }
}

module empty_sliding_tray_nema17_mount(thickness=2, depth=100, tolerance=0.2){
  lb_outer_diameter=15;
  lb_length = 24;
  lb_housing_d = lb_outer_diameter + thickness*2 + tolerance*2;
  nema17_width = 42.2;
  margin=5;
  x = (bed_height+lb_housing_d)/2-margin;
  y = (nema17_width+thickness*2)/2 - margin;
  union(){
    translate([0,0,thickness/2]) translate([15,0,nema17_width/2]) rotate([0, 90]) empty_nema17_mount_plate();
    for(offset = [[x,y], [-x,y], [x,-y], [-x,-y]]){
      translate(offset) cylinder(r=m3_radius, h=20, center=true);
    }
  }
}

module solid_sliding_tray_nema17_mount(thickness=2, depth=100, tolerance=0.2){
  w = bed_height;
  lb_outer_diameter=15;
  lb_length = 24;
  lb_housing_d = lb_outer_diameter + thickness*2 + tolerance*2;
  lb_housing_h = lb_length + (thickness + tolerance)*2;
  nut_wall_thickness = 10;
  nema17_width = 42.2;

  translate([0,0,thickness/2]) union(){
    cube([w+lb_housing_d, nema17_width+thickness*2, thickness], center=true); // floor
    translate([15,0,nema17_width/2]) rotate([0, 90]) solid_nema17_mount_plate();
    translate([15,nema17_width/2+thickness, thickness/2])rotate([90,0])  triangle(nema17_width*3/4,20,thickness);
    translate([15,-nema17_width/2, thickness/2])rotate([90,0])  triangle(nema17_width*3/4,20,thickness);
  }

  //#translate([15,0,nema17_width/2+lb_housing_d+thickness*2]) rotate([0, 90]) nema17();
}

module sliding_tray_nema17_mount(thickness=2, depth=100, tolerance=0.2){
  difference(){
    solid_sliding_tray_nema17_mount(thickness, depth, tolerance);
    #empty_sliding_tray_nema17_mount(thickness, depth, tolerance);
  }
}

sliding_tray_nema17_mount();
rotate([90,0])cylinder(r=1, h=100, center=true);
rotate([0,90])cylinder(r=1, h=100, center=true);