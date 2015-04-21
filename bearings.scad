

// LM8UU
module linear_bearing(outer_diameter=15, inner_diameter=8, length=24, tolerance=0.2, faces=100){
  r = outer_diameter/2;
  translate([0,0,r]) cylinder(h=length, r=r+tolerance, $fn=faces);
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


