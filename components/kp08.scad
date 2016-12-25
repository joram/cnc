kp08_w = 55;
kp08_h = 13;
kp08_d = 28;
kp08_center_distance = 42;
kp08_axle_diameter = 5;

module kp08_bearing(show_axles=false){
    if(show_axles == false){
        difference(){
            union() {
                translate([0,0, 5]) cube([kp08_w,kp08_h,10], true);
                translate([0,0, kp08_d/4]) cube([kp08_d,kp08_h,kp08_d/2], true);
                translate([0,0, kp08_d/2]) rotate([90]) cylinder(h=kp08_h, d=kp08_d, center=true);
            }
            kp08_bearing(show_axles=true);
        }
    }
    if(show_axles == true){
        translate([0,0,15])  rotate([90]) cylinder(h=100, d=8, center=true);
        translate([0,0, kp08_d/2]) union(){
 
            translate([kp08_center_distance/2, 0]) cylinder(h=100, d=kp08_axle_diameter, center=true);
            translate([-kp08_center_distance/2, 0]) cylinder(h=100, d=kp08_axle_diameter, center=true);
        }
    }
}


//kp08_bearing();
//kp08_bearing(show_axles=true);

