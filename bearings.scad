

// LM8UU
module linear_bearing(outer_diameter=15, inner_diameter=8, length=24, tolerance=0.2, faces=100){
  r = outer_diameter/2;
  translate([0,0,r]) cylinder(h=length, r=r+tolerance, $fn=faces);
}

module linear_bearing_housing(outer_diameter=15, inner_diameter=8, length=24, tolerance=0.2, wall_thickness=2, faces=100){
  d = outer_diameter + wall_thickness*2 + tolerance*2;
  r = d/2;

  union(){
    translate([0, 0, length/2]) difference(){
      translate([0, r/2, r-wall_thickness]) cube([d, r, length+wall_thickness*2], center=true);
      translate([0, 0, -length]) translate([0, 0,r-wall_thickness]) cylinder(h=length*2, r=r, $fn=faces);
    }

    difference(){
      translate([0, 0,r-wall_thickness*2]) cylinder(h=length+wall_thickness*2, r=r, $fn=faces);
      union(){
        linear_bearing(outer_diameter, inner_diameter, length, tolerance, faces, center=true);
	     translate([0, 0, length/2]) cylinder(h=length*2, r=inner_diameter/2+tolerance, $fn=faces, center=true);
      }
    }
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