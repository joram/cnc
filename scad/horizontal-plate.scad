include <spindle_plate.scad>;
include <components/sc8uu.scad>;
include <components/kp08.scad>;
include <components/sk8.scad>;

horizontal_plate_w = spindle_plate_h;
horizontal_plate_h = 575;
horizontal_plate_thickness = 10;
horizontal_beam_length = horizontal_plate_h - (horizontal_plate_w/2 - sc8uu_w/2)*2 - sc8uu_w;
horizontal_beam_offset = horizontal_plate_w/2 - sc8uu_w/2+sc8uu_w/2;

    
module horizontal_beam_bolt(){
    cylinder(d=4, h=50, center=true);
}
    
module horizontal_plate(show_bolts=false, show_mounts=false, show_body=true){

    dx = horizontal_plate_w/2 - sc8uu_w/2;
    dy = spindle_plate_h/2  - sc8uu_l/2;
    dz = sc8uu_h/2 + horizontal_plate_thickness;
    bearings_offset = [0, - horizontal_plate_h/2 + dy + sc8uu_l/2];
    
    horizontal_sc8uu_offsets = [
        [ dx,-dy, dz],
        [ dx, dy, dz],
        [-dx,-dy, dz],
        [-dx, dy, dz],
        [  0,  0, dz],
    ];
    
    beam_bolt_offsets = [
        [10, (horizontal_beam_length-20) -horizontal_beam_offset],
        [10, (horizontal_beam_length-20)*2/3 -horizontal_beam_offset],
        [10, (horizontal_beam_length-20)*1/3 -horizontal_beam_offset],
        [10, 10-horizontal_beam_offset],    
    ];
    
    vertical_plate_dx = spindle_plate_h/2  - sc8uu_l/2;
    beam_rod_offset_1 = [0,horizontal_plate_h/2 - sk8_w/2,-10];
    beam_rod_offset_2 = [0,horizontal_plate_h/2 - kp08_w/2-vertical_plate_dx,-10];
    beam_rod_offset_3 = [0,horizontal_plate_h/2 - sk8_w -vertical_plate_dx*2,-10];

    if(show_bolts==true){
        translate(bearings_offset) union(){
            for(t=horizontal_sc8uu_offsets){
                translate(t) rotate([0, 0, 90]) sc8uu(true);
            }
        }
        
        translate([kp08_center_distance/2,0,0]) union(){
            for(t=beam_bolt_offsets){
                translate(t) rotate([0, 0, 90])  horizontal_beam_bolt();
            }
            translate(beam_rod_offset_1) translate([-kp08_center_distance/2,0,0]) cylinder(h=50, d=20, center=true);
            translate(beam_rod_offset_2) translate([-sk8_center_distance/2,0,0]) cylinder(h=50, d=20, center=true);
            translate(beam_rod_offset_3) translate([-kp08_center_distance/2,0,0]) cylinder(h=50, d=20, center=true);
        }
    }
    
    if(show_body==true){
        difference(){
            translate([0, 0, horizontal_plate_thickness/2]) cube([horizontal_plate_w, horizontal_plate_h, horizontal_plate_thickness], true);
            horizontal_plate(true, false, false);
        }
    }

    if(show_mounts==true){
        union(){
            translate(bearings_offset) union(){
                for(t=horizontal_sc8uu_offsets){
                     translate(t) rotate([0, 0, 90]) sc8uu();
                }
            }

        translate([kp08_center_distance/2,0,0]) union(){

                translate([10, horizontal_beam_offset, -horizontal_plate_thickness]) cube([20,horizontal_beam_length,20], center=true);
                translate(beam_rod_offset_1) rotate([90, 0, -90]) sk8_bearing();
                translate(beam_rod_offset_2) rotate([90, 0, -90]) kp08_bearing();
                translate(beam_rod_offset_3) rotate([90, 0, -90]) sk8_bearing();
        }
        }

    }

}

//horizontal_plate();
//horizontal_plate(false, true);
