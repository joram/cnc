// all units in mm
sc8uu_w = 30;
sc8uu_j = 18;
sc8uu_l = 34; 
sc8uu_k = 24;
sc8uu_h = 11;

module sc8uu(show_bolts=false){
    dx = sc8uu_k/2;
    dy = sc8uu_j/2;
    offsets = [
        [ dx,-dy],
        [ dx, dy],
        [-dx,-dy],
        [-dx, dy]
    ];
    if(show_bolts == true) {
        for(t=offsets){
            translate(t) m4_bolt();
        } 
    }
    if(show_bolts == false) {
        difference(){
            cube([sc8uu_l, sc8uu_w, sc8uu_h], true);
            sc8uu(true);
        }
    }
}

module m4_bolt(){
    cylinder(h=50, d=4, center=true);
}

module m8_vertical_axles(w=150, length=300, thickness=10){
    dx = w/2 - sc8uu_l/2;
    y = thickness/2 + sc8uu_h/2;
    rotate([90]) translate([ dx, y, 0]) cylinder(h=length, d=8, center=true);
    rotate([90]) translate([-dx, y, 0]) cylinder(h=length, d=8, center=true);
    rotate([90]) translate([  0, y, 0]) cylinder(h=length, d=8, center=true);
}

module m8_horizontal_axles(w=150, length=600, thickness=10){
    dx = w/2 - sc8uu_l/2;
    y = thickness/2 + sc8uu_h/2;
//    translate([ dx, y, 0]) rotate([0,90]) cylinder(h=length, d=8, center=true);
    translate([0, -114, 40]) rotate([0,90]) cylinder(h=length, d=8, center=true);
    translate([0, 0, 40]) rotate([0,90]) cylinder(h=length, d=8, center=true);
}


kp08_w = 55;
kp08_h = 13;
kp08_d = 28;
kp08_center_distance = 42;
kp08_axle_diameter = 5;

module kp08_bearing(show_axles=false){
    if(show_axles == false){
        %difference(){
            cube([kp08_w,kp08_h,kp08_d], true);
            kp08_bearing(show_axles=true);
        }
    }
    if(show_axles == true){
        translate([kp08_center_distance/2, 0]) cylinder(h=100, d=kp08_axle_diameter, center=true);
        translate([-kp08_center_distance/2, 0]) cylinder(h=100, d=kp08_axle_diameter, center=true);
    }

}


shaft_guide_x = 42;
shaft_guide_y = 32.8;
shaft_guide_z = 14;
shaft_guide_bolt_d = 5;
shaft_guide_dist = 37.5-shaft_guide_bolt_d;

module shaft_guide(show_axles=false){
    if(show_axles==true){
        translate([ shaft_guide_dist/2, 0]) cylinder(d=shaft_guide_bolt_d, h=100, center=true);
        translate([-shaft_guide_dist/2, 0]) cylinder(d=shaft_guide_bolt_d, h=100, center=true);
    }
    if(show_axles==false){
        %cube([shaft_guide_x, shaft_guide_z, shaft_guide_y], true);
    }
}



spindle_d = 52;
spindle_l = 186;
collet_l = 48;
collet_d = 16;

module spindle_mount_plate(w=150, h=500, thickness=10, spindle_offset = -50){
    dx = w/2 - sc8uu_l/2;
    dy = h/2  - sc8uu_w/2;
    sc8uu_offsets = [
        [ dx,-dy],
        [ dx, dy],
        [-dx,-dy],
        [-dx, dy],
        [  0, 10],
    ];

    difference(){
        union(){
            cube([w, h, thickness], true);
        }
        union(){
            for(t=sc8uu_offsets){
                translate(t) sc8uu(true);
            }
            translate([0,spindle_offset,-thickness/2]) spindle_mount(show_bolts=true);
        }
    }

    // for human eyeballs only
    for(t=sc8uu_offsets){
        t = concat(t, [thickness]);
        %translate(t) sc8uu();
    }
    translate([0,spindle_offset,-thickness/2]) spindle_mount();

}


module horizontal_plate(thickness=10){
    dx = w/2 - sc8uu_l/2;
    y = 28/2 - 4;
    z = 140;
    sh_y = 32.8/2;
    kp08_offsets = [
        [ dx, z, y],
        [-dx, z, y],
        [ dx,-z, y],
        [-dx,-z, y],
    ];
    shaftguide_offsets = [
        [0, z, sh_y/2],
        [0,-z, sh_y/2]
    ];
    sc8uu_offsets = [
        [ dx, -z + kp08_h*2, 40],
        [-dx, -z + kp08_h*2, 40],
        [ dx, 0, 40],
        [-dx, 0, 40],
    ];
    
    difference(){
        translate([0,0,29]) cube([dx*2+55, 300, thickness], true);        
        union(){
            for(t=kp08_offsets){
                translate(t) kp08_bearing(show_axles=true);
            }
            for(t=shaftguide_offsets){
                translate(t) shaft_guide(show_axles=true);
            }
            for(t=sc8uu_offsets){
                translate(t) rotate([0,0,90]) sc8uu(true);
            }
        }
    }
    
    // for human eyes only
    for(t=kp08_offsets){
        translate(t) kp08_bearing();
    }
    for(t=shaftguide_offsets){
        translate(t) shaft_guide();
    }
    for(t=sc8uu_offsets){
        %translate(t) rotate([0,0,90]) sc8uu();
    }

}

module spindle_mount(show_bolts=false){
    w = 91;
    h = 67;
    d = 41;
    bolt_d = 6;
    bolt_x = 77;
    bolt_y = 26;
    offsets = [
        [ bolt_x/2, bolt_y/2],
        [ bolt_x/2,-bolt_y/2],
        [-bolt_x/2, bolt_y/2],
        [-bolt_x/2,-bolt_y/2],
    ];

    if(show_bolts == true){
        rotate([90]) union(){
            for(t=offsets){
                rotate([90]) translate(t) cylinder(h=400, d=bolt_d, center=true);;
            }
        }
    }

    // for human eyes only
    if(show_bolts==false){
        %translate([0,0,-h/2]) rotate([90]) difference(){
            union(){
                cube([w, h, d], true);
            }
            union(){
                cylinder(h=400, d=spindle_d, center=true);
                for(t=offsets){
                    rotate([90]) translate(t) cylinder(h=400, d=bolt_d, center=true);;
                }
            }
        }
        %translate([0, collet_l-10,-h/2]) rotate([90]) cylinder(h=spindle_l-collet_l, d=spindle_d, center=true);
        %translate([0, -collet_l/2-10,-h/2]) rotate([90]) cylinder(h=collet_l, d=collet_d, center=true);
            
    }
}




$fn = 60;
w = 91 + sc8uu_l*2;
h = 100;
thickness = 10;

spindle_mount_plate(w, h, thickness, spindle_offset = -h/2+41/2);

#m8_vertical_axles(w, 300, thickness);
#m8_horizontal_axles(w, 600, thickness);
horizontal_plate();

