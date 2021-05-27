// Include variables
include <submersion_test_rig_variables.scad>;
include <submersion_test_rig_common.scad>;

// Create top plunger
module plunger() {
    union() {
        cylinder(30, collet_diameter / 2, collet_diameter / 2, $fn=360);
        cylinder(5, plunger_diameter / 2, plunger_diameter / 2, $fn=360);
    }
}

blank_radius = 15;
blank_offset = 20;
difference() {
    plunger();
    holes(); //Found in common
    translate([blank_offset, blank_offset, -1]) cylinder(15, blank_radius, blank_radius, $fn=360);
    translate([-blank_offset, blank_offset, -1]) cylinder(15, blank_radius, blank_radius, $fn=360);
    translate([blank_offset, -blank_offset, -1]) cylinder(15, blank_radius, blank_radius, $fn=360);
    translate([-blank_offset, -blank_offset, -1]) cylinder(15, blank_radius, blank_radius, $fn=360);
}