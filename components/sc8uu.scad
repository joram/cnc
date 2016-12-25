// all units in mm
sc8uu_w = 30;
sc8uu_j = 18;
sc8uu_l = 34; 
sc8uu_k = 24;
sc8uu_h = 11;

module m4_bolt(){
    cylinder(h=50, d=4, center=true);
}

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
        rotate([90]) cylinder(h=50, d=8, center=true);
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

