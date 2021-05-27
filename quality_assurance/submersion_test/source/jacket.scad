height = 29;
inner_d = 5;
outer_d = 6;

difference(){
    cylinder(h=height, r=outer_d/2, $fn=360); // outside of jacket
    translate([0, 0, -height/2]) 
        cylinder(h=height*2, r=inner_d/2, $fn=360);
}