

// LM8UU
module linear_bearing(outer_diameter=15, inner_diameter=8, length=24, tolerance=0.2, faces=100){
  r = outer_diameter/2;
  translate([0,0,r]) cylinder(h=length, r=r+tolerance, $fn=faces);
}

module solid_lb_housing(outer_diameter=15, inner_diameter=8, length=24, tolerance=0.2, wall_thickness=2, faces=100){
  h = length + (wall_thickness + tolerance)*2;
  d = outer_diameter + wall_thickness*2 + tolerance*2;
  r = d/2;
  inner_r = (outer_diameter + tolerance*2)/2;
  inner_h = length + tolerance*2;
  union(){
    translate([0, 0, r/2]) cube([d, length+wall_thickness*2, r], center=true);
    translate([0, 0, r]) rotate([90,0]) cylinder(h=h, r=r, center=true);
  }
}

module empty_lb_housing(outer_diameter=15, inner_diameter=8, length=24, tolerance=0.2, wall_thickness=2, faces=100){
  h = length + (wall_thickness + tolerance)*2;
  d = outer_diameter + wall_thickness*2 + tolerance*2;
  r = d/2;
  inner_r = (outer_diameter + tolerance*2)/2;
  inner_h = length + tolerance*2;
  union(){
    translate([0, 0, r]) rotate([90,0]) cylinder(h=inner_h, r=inner_r, center=true);
    translate([0, 0, r]) rotate([90,0]) cylinder(h=length*2, r=(inner_diameter/2+tolerance), center=true);
  }
}

module lb_housing(outer_diameter=15, inner_diameter=8, length=24, tolerance=0.2, wall_thickness=2, faces=100){
  difference(){
    solid_lb_housing(outer_diameter, inner_diameter, length, tolerance, wall_thickness, faces);
    empty_lb_housing(outer_diameter, inner_diameter, length, tolerance, wall_thickness, faces);   
  }
}

// 608ZZ
module bearing(){

}

module bearings(){
  axle_offsets = [[0, 0], [0, bed_height], [bed_width, 0], [bed_width, bed_height]];
  for( offset = axle_offsets){
    translate([0, 0, bed_depth/2 - 20]) translate(offset) linear_bearing();
    translate([0, 0, bed_depth/2 + 60]) translate(offset) linear_bearing();
  }
}

lb_housing();