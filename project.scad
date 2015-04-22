
include <./settings.scad>
include <./axles.scad>
include <./bearings.scad>
include <./nema17.scad>
axle_offsets = [[0, 0], [0, bed_height], [bed_width, 0], [bed_width, bed_height]];


//sliding_nema17_mount();
//axles();
//bearings();

module sliding_tray(thickness=2, depth=100, tolerance=0.2){
  linear_bearing_housing_diameter = 15 + thickness*2 + tolerance*2;
  linear_bearing_housing_length = 24+thickness*2-tolerance;
  width = bed_height + linear_bearing_housing_diameter;
  depth_offset = depth - linear_bearing_housing_length/2 - thickness*3;
  offsets = [
    [bed_height/2, 0, thickness*4],
    [-bed_height/2, 0, thickness*4],
    [bed_height/2, 0, depth_offset],
    [-bed_height/2, 0, depth_offset]];
  standard_offset = [0,-linear_bearing_housing_diameter/2-thickness/2,-depth/2-linear_bearing_housing_length/2];
  nut_wall_thickness = 10;
  nut_wall_offsets = [
    [0, -linear_bearing_housing_diameter/2, depth/2-linear_bearing_housing_length/2],
    [0, -linear_bearing_housing_diameter/2, -depth/2+linear_bearing_housing_length/2],
  ];

  union(){
    cube([width,thickness,depth], center=true);
    for(offset = offsets){
      translate(standard_offset) translate(offset)linear_bearing_housing();
    }
    for(offset = nut_wall_offsets){
      translate(offset) cube([width-linear_bearing_housing_diameter/2, linear_bearing_housing_diameter, nut_wall_thickness], center=true);
    }
  }
}

sliding_tray();