spindle_d = 52;
spindle_l = 186;
collet_l = 48;
collet_d = 16;

spindle_mount_w = 91;
spindle_mount_h = 41;
spindle_mount_d = 67;


module spindle(){
    translate([0, collet_l-10]) rotate([90]) cylinder(h=spindle_l-collet_l, d=spindle_d, center=true);
    translate([0, -collet_l/2-10]) rotate([90]) cylinder(h=collet_l, d=collet_d, center=true);            
}

module spindle_mount(show_bolts=false){
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
        translate([0,0,spindle_mount_d/2]) union(){
            spindle();
            for(t=offsets){
                translate(t) cylinder(h=spindle_mount_d*2, d=bolt_d, center=true);
            }
        }
    }

    // for human eyes only
    if(show_bolts==false){
        difference(){
            translate([0,0,spindle_mount_d/2]) cube([spindle_mount_w, spindle_mount_h, spindle_mount_d], true);
            spindle_mount(true);
        }
    }
}

//spindle_mount();
//%spindle_mount(true);