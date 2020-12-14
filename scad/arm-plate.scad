

module m8_vertical_axles(w=150, length=300, thickness=10){
    dx = w/2 - sc8uu_l/2;
    y = thickness/2 + sc8uu_h/2;
    rotate([90]) translate([ dx, y, 0]) cylinder(h=length, d=8, center=true);
    rotate([90]) translate([-dx, y, 0]) cylinder(h=length, d=8, center=true);
    rotate([90]) translate([  0, y, 0]) cylinder(h=length, d=8, center=true);
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





module m8_horizontal_axles(w=150, length=600, thickness=10){
    dx = w/2 - sc8uu_l/2;
    y = thickness/2 + sc8uu_h/2;
//    translate([ dx, y, 0]) rotate([0,90]) cylinder(h=length, d=8, center=true);
    translate([0, -114, 40]) rotate([0,90]) cylinder(h=length, d=8, center=true);
    translate([0, 0, 40]) rotate([0,90]) cylinder(h=length, d=8, center=true);
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





$fn = 60;
w = 91 + sc8uu_l*2;
h = 100;
thickness = 10;

//spindle_mount_plate(w, h, thickness, spindle_offset = -h/2+41/2);
//
//#m8_vertical_axles(w, 300, thickness);
//#m8_horizontal_axles(w, 600, thickness);
//horizontal_plate();

