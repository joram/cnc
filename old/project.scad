
include <./settings.scad>
include <./axles.scad>
include <./bearings.scad>
include <./nema17.scad>
include <./sliding_tray.scad>

thickness=2;
tolerance=0.2;
lb_outer_diameter=15;
lb_housing_d = lb_outer_diameter + thickness*2 + tolerance*2;
width = 200;
//translate([-width-(lb_housing_d-thickness+thickness*2),0,0]) rotate([0, 90, 0]) sliding_tray();

rotate([0, -90, 0]) sliding_tray_nema17_mount();
