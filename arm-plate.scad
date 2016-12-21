// all units in mm
sc8uu_w = 30;
sc8uu_j = 18;
sc8uu_l = 34; 
sc8uu_k = 24;
sc8uu_h = 11;

spindle_d = 52;
spindle_l = 186;
collet_l = 48;
collet_d = 16;


module m4_bolt(){
    cylinder(h=20, d=4, center=true);
}

module sc8uu(show_body=false){
    dx = sc8uu_k/2;
    dy = sc8uu_j/2;
    offsets = [
        [ dx,-dy],
        [ dx, dy],
        [-dx,-dy],
        [-dx, dy]
    ];
    if(show_body == false) {
        for(t=offsets){
            translate(t) m4_bolt();
        } 
    }
    if(show_body == true) {
        %cube([sc8uu_l, sc8uu_w, sc8uu_h], true);
    }
}

module mount_plate(w=150, h=500, thickness=10, spindle_offset = -50){
    dx = w/2 - sc8uu_l/2;
    dy = h/2  - sc8uu_w/2;
    offsets = [
        [ dx,-dy],
        [ dx, dy],
        [-dx,-dy],
        [-dx, dy],
        [  0, -20],
    ];

    difference(){
        union(){
            cube([w, h, thickness], true);
        }
        union(){
            for(t=offsets){
                translate(t) sc8uu();
            }
            translate([0,spindle_offset,-thickness/2]) spindle_mount(show_bolts=true);
        }
    }

    // for human eyeballs only
    for(t=offsets){
        t = concat(t, [thickness]);
        translate(t) sc8uu(true);
    }
    translate([0,spindle_offset,-thickness/2]) spindle_mount();

}

module m8_axles(w=150, thickness=10){
    dx = w/2 - sc8uu_l/2;
    y = thickness/2 + sc8uu_h/2;
    rotate([90]) translate([ dx, y, 0]) cylinder(h=600, d=8, center=true);
    rotate([90]) translate([-dx, y, 0]) cylinder(h=600, d=8, center=true);
    rotate([90]) translate([  0, y, 0]) cylinder(h=600, d=8, center=true);
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
h = 150;
thickness = 10;
mount_plate(w, h, thickness, spindle_offset = -h/2+41/2);

#m8_axles(w, thickness);


