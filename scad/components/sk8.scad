sk8_w = 42;
sk8_h = 13;
sk8_d = 32.8;
sk8_center_distance = 32;
sk8_axle_diameter = 5.5;

module sk8_bearing(show_axles=false){
    if(show_axles == false){
        difference(){
            union() {
                translate([0,0, 5]) cube([sk8_w,sk8_h,10], true);
                translate([0,0, sk8_d/2]) cube([18,sk8_h,sk8_d], center=true);
            }
            sk8_bearing(show_axles=true);
        }
    }
    if(show_axles == true){
        translate([0,0,20])  rotate([90]) cylinder(h=100, d=8, center=true);
        translate([0,0, sk8_d/2]) union(){
 
            translate([sk8_center_distance/2, 0]) cylinder(h=100, d=sk8_axle_diameter, center=true);
            translate([-sk8_center_distance/2, 0]) cylinder(h=100, d=sk8_axle_diameter, center=true);
        }
    }
}

//sk8_bearing();