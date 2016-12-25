include <components/spindle_mount.scad>;
include <components/sc8uu.scad>;

spindle_plate_w = 150;
spindle_plate_h = 200;
spindle_plate_thickness = 10;

module spindle_plate(show_bolts=false, show_mounts=false){
    dx = spindle_plate_w/2 - sc8uu_l/2;
    dy = spindle_plate_h/2  - sc8uu_w/2;
    dz = -sc8uu_h/2;
    sc8uu_offsets = [
        [ dx,-dy, dz],
        [ dx, dy, dz],
        [-dx,-dy, dz],
        [-dx, dy, dz],
        [  0,  0, dz],
    ];

    if(show_bolts==true){
        translate([0, -spindle_plate_h/4, spindle_plate_thickness]) spindle_mount(true);
        for(t=sc8uu_offsets){
            translate(t) sc8uu(true);
        }
    }
    
    if(show_bolts==false){
        difference(){
            translate([0, 0, spindle_plate_thickness/2]) cube([spindle_plate_w, spindle_plate_h, spindle_plate_thickness], true);
            spindle_plate(true);
        }
    }

    if(show_mounts==true){
        %union(){
            translate([0, -spindle_plate_h/4, spindle_plate_thickness]) union(){
                translate([0,0,spindle_mount_d/2]) spindle();
                spindle_mount();
            }
            for(t=sc8uu_offsets){
                translate(t) sc8uu();
            }
        }
    }

}

//spindle_plate();
//spindle_plate(false, true);