include <components/sc8uu.scad>;
include <components/kp08.scad>;
include <components/sk8.scad>;

spindle_plate_w = 150;
spindle_plate_h = 200;
vertical_plate_w = spindle_plate_w;
vertical_plate_h = 300;
vertical_plate_thickness = 10;


module vertical_plate(show_bolts=false, show_mounts=false, show_rods=true){


    dx = horizontal_plate_h/2 - sc8uu_w/2 - 30;
    dy = horizontal_plate_h/2  - sk8_w/2;
    dz = sc8uu_h/2 + vertical_plate_thickness;
    bearings_offset = []; //[0, - vertical_plate_h/2 + dy + sc8uu_l/2 + kp08_h];
    horizontal_sc8uu_offsets = [
        [ dx,-dy, dz],
        [ dx,dy, dz],
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

    if(show_rods==true){
        rod_offsets = [
          [dx2+7, vertical_plate_h/2, -25],
          [-dx2-7, vertical_plate_h/2, -25],
          [0,vertical_plate_h/2,-15],
        ];
        for(t=rod_offsets){
           # translate(t) rotate([90,]) cylinder(h=vertical_plate_h, d=5);
        }
    }

    if(show_bolts==true){
        translate(bearings_offset) union(){
            for(t=horizontal_sc8uu_offsets){
                translate(t) rotate([180, 0, 90]) sc8uu(true);
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
            vertical_plate(true, false);
        }
    }

    if(show_mounts==true){
        %union(){
            translate(bearings_offset) union(){
                for(t=horizontal_sc8uu_offsets){
                     translate(t) rotate([180, 0, 90]) sc8uu();
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

//rotate([0, 0, 90,0]) projection(cut = false) translate([vertical_plate_w/2, -vertical_plate_h/2,0])  vertical_plate(true, false);
