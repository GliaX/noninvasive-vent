vent_diameter = 130; // ID is this

hole_side_length = 5;
spacing = 1;
grid_thickness = 3;

ring_thickness = 4;
ring_height = 8;
module grid() {
    for (dy=[0:hole_side_length+spacing:vent_diameter+hole_side_length]) {
        for (dx=[0:hole_side_length+spacing:vent_diameter+hole_side_length]) {
            translate([dx,dy,0])
                cube([hole_side_length, hole_side_length,grid_thickness+5]);
        }
    }
}

module mesh(){
    difference(){
        cylinder(h=grid_thickness, r=vent_diameter/2, $fn=360);  
        translate([-vent_diameter/2, -vent_diameter/2, -2]) grid();    
    }
}

// hole of ring has diameter vent_diameter
module ring(){
    difference(){
        cylinder(h=ring_height, r=vent_diameter/2+ring_thickness, $fn=360);    
        translate([0, 0, -ring_height/2]) cylinder(h=ring_height*2, r=vent_diameter/2, $fn=360);    
    }
}

union(){
    translate([0, 0, ring_height-grid_thickness]) mesh();
    ring();
}