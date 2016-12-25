include <spindle_plate.scad>;
include <components/sc8uu.scad>;
include <components/kp08.scad>;
include <components/sk8.scad>;

vertical_plate_w = spindle_plate_h;
vertical_plate_h = 600;
vertical_plate_thickness = 10;

module vertical_plate(show_bolts=false, show_mounts=false){



    dx = vertical_plate_w/2 - sc8uu_w/2;
    dy = spindle_plate_h/2  - sc8uu_l/2;
    dz = sc8uu_h/2 + vertical_plate_thickness;
    bearings_offset = [0, - vertical_plate_h/2 + dy + sc8uu_l/2 + kp08_h];
    horizontal_sc8uu_offsets = [
        [ dx,-dy, dz],
        [ dx, dy, dz],
        [-dx,-dy, dz],
        [-dx, dy, dz],
        [  0,  0, dz],
    ];

    // kp08 details
    dx2 = vertical_plate_w/2 - kp08_w/2;
    dy2 = vertical_plate_h/2  - kp08_h/2;
    vertical_kp08_offsets = [
        [0,-dy2],
        [0, dy2],
    ];

    // sk8 details
    dx3 = vertical_plate_w/2 - sk8_w/2;
    dy3 = vertical_plate_h/2  - sk8_h/2;
    vertical_sk8_offsets = [
        [dx3,-dy3],
        [dx3, dy3],
        [-dx3,-dy3],
        [-dx3, dy3],
    ];

    if(show_bolts==true){
        translate(bearings_offset) union(){
            for(t=horizontal_sc8uu_offsets){
                translate(t) rotate([0, 0, 90]) kp08(true);
            }
        }
        for(t=vertical_kp08_offsets){
            translate(t) rotate([180]) kp08_bearing(true);
        }
        for(t=vertical_sk8_offsets){
            translate(t) rotate([180]) sk8_bearing(true);
        }
    }
    
    if(show_bolts==false){
        difference(){
            translate([0, 0, vertical_plate_thickness/2]) cube([vertical_plate_w, vertical_plate_h, vertical_plate_thickness], true);
            vertical_plate(true);
        }
    }

    if(show_mounts==true){
        %union(){
            translate(bearings_offset) union(){
                for(t=horizontal_sc8uu_offsets){
                     translate(t) rotate([0, 0, 90]) sc8uu();
                }
            }
            for(t=vertical_kp08_offsets){
                translate(t) rotate([180]) kp08_bearing();
            }
            for(t=vertical_sk8_offsets){
                translate(t) rotate([180]) sk8_bearing();
            }
        }

    }

}

vertical_plate();
%vertical_plate(false, true);