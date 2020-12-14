include <components/sc8uu.scad>;
include <components/kp08.scad>;
include <components/sk8.scad>;

horizontal_plate_w = 600;
horizontal_plate_h = 200;
horizontal_plate_thickness = 10;
horizontal_beam_length = horizontal_plate_h - (horizontal_plate_w/2 - sc8uu_w/2)*2 - sc8uu_w;
horizontal_beam_offset = horizontal_plate_w/2 - sc8uu_w/2+sc8uu_w/2;


module horizontal_end_mount(){

    dx = horizontal_plate_h/2 - sk8_w/2;
    dz = sc8uu_h/2 + horizontal_plate_thickness/2;


    union(){
        union(){
            translate([dx, 0, dz]) sk8_bearing();
            translate([0,  0, dz]) kp08_bearing();
            translate([-dx,0, dz]) sk8_bearing();
        }
    }
}

module horizontal_plate(show_bolts=false, show_mounts=false, show_body=true, show_bolts=true){
    if(show_body==true){
        difference(){
            translate([0, 0, horizontal_plate_thickness/2]) cube([horizontal_plate_w, horizontal_plate_h, horizontal_plate_thickness], true);
            horizontal_plate(true, true, false);
        }
    }

    if(show_mounts==true){
        w2 = horizontal_plate_w/2 - sk8_h/2;
        translate([w2, 0,0]) rotate([0,0,90]) horizontal_end_mount();
        translate([-w2, 0,0]) rotate([0,0,90]) horizontal_end_mount();
        // rotate([0,0,90]) horizontal_end_mount();
    }

        if(show_mounts==true){
        dx = horizontal_plate_h/2 - sk8_w/2;
        w2 = horizontal_plate_w/2 - sk8_h/2;
        #translate([-horizontal_plate_w/2,  0, 30]) rotate([0,90,0]) cylinder(h=horizontal_plate_w, d=5);
        #translate([-horizontal_plate_w/2, dx, 35]) rotate([0,90,0]) cylinder(h=horizontal_plate_w, d=5);
        #translate([-horizontal_plate_w/2,-dx, 35]) rotate([0,90,0]) cylinder(h=horizontal_plate_w, d=5);
    }

}
