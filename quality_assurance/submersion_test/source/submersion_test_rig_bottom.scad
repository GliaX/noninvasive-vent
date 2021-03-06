// Include variables
include <submersion_test_rig_variables.scad>;
include <submersion_test_rig_common.scad>;

// Create bottom plate
module bottom_plate() {
    cylinder(5, plunger_diameter / 2, plunger_diameter / 2, $fn=360);
}

difference() {
    bottom_plate();
    holes(); // Found in common
}