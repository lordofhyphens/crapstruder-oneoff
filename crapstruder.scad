include<inc/metric.scad>
include<inc/functions.scad>

sae_6_32_hole_diameter=0.1495*25.4;
sae_6_32_hole_head=0.270*25.4;
use_fillets=true;
center_hole_offset_z=3;
center_hole_offset_x=-0.5;
difference()
{
  translate([0,2,4])cube_fillet([44,48,10],top=[2,2,2,2],bottom=[3,3,3,3],radius=2, center=true);
  translate([0,0,10])rotate([0,180,0])nema17(holes=true);
  translate([0,0,3])cube([26,20,10],center=true);
  translate([center_hole_offset_x+ (-41/2)+25,45/2+20,center_hole_offset_z])rotate([90,0,0]) cylinder(r=1.3,h=500,$fs=.2); // feed hole
  translate([0,0,-5])cylinder(r=22/2,h=26);
}
translate([center_hole_offset_x+(-41/2)+25,45/2-.6,center_hole_offset_z])rotate([-90,90,0]) 
{
  // block with center hole
  difference() {
    translate([0,0,0.560*25.4/2])cube([80,53,0.560*25.4],center=true);
    difference() {
      cylinder(r=0.550*25.4/2,h=0.560*25.4);
      *translate([0,0,4.76])
        difference() {
          cylinder(r=0.550*25.4/2,h=4.76);
          cylinder(r=12/2,h=4.76);
        }
    }
  translate([30,-30,7]) rotate([-90,0,0])
  {
    screw(h=70,r=sae_6_32_hole_diameter/2,r_head=sae_6_32_hole_head/2,head_drop=40,slant=true,l=50,$fn=50);
  }
  translate([-20,-30,7]) rotate([-90,0,0])
  {
    screw(h=70,r=sae_6_32_hole_diameter/2,r_head=sae_6_32_hole_head/2,head_drop=40,slant=true,l=50,$fn=50);
  }
  translate([m3_diameter/2+6,-40,7]) rotate([-90,0,0])
  {
    screw(h=70,r=m3_diameter/2,r_head=5.5/2,head_drop=30,slant=false,l=50,$fn=50);
  }
  translate([-(m3_diameter/2+6),-40,7]) rotate([-90,0,0])
  {
    screw(h=70,r=m3_diameter/2,r_head=5.5/2,head_drop=30,slant=false,l=50,$fn=50);
  }
  }


}

