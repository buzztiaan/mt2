use <clip.scad>;

module touchpad() {

 color("grey") cube([49,64.5,2]);

}

module stellaris() {

  color("red") cube([66,51,4]);

}

module ledmatrix() {

  cube([61,61,9.5]);
  for ( i = [0 : 7] ) {
    for ( j = [0 : 7] ) {
      color("red") translate([3.5+(i*7.65),3.5+(j*7.65),8.6]) cylinder(r=2.5,h=1);
    }
  }
  translate([21.5,7,-6]) color("lightgrey") cube([18,1,6]);
  translate([21.5,54,-6]) color("lightgrey") cube([18,1,6]);

}

module mpu6050() {

  color("green") cube([21,15.5,3.5]);

}

module dcdc() {
  color("green") cube([20,35,13.5]);
}

module battery() {
  color("blue") cylinder(h=67.5,r=9.25);
}

module leddriver() {
  color("tan") cube([35,22,7]);
}

module xbee() {
  color ("royalblue") cube([40,26.5,13]);
}

module insideparts() {
  translate ([1,0,0]) touchpad();
  translate ([-50,0,0]) touchpad();

  translate([-30,-65,-7.5]) ledmatrix();

  translate([-22,10,-19]) stellaris();

  translate([-10.5,-31,-15]) mpu6050();

  translate([-46,16,-19]) dcdc();

//  translate([-33.75,-2,-27]) rotate([0,90,0]) battery();

  translate([-17.5,-55,-17]) leddriver();

  translate([-10,20,-14]) xbee();
}

module clearances() {
  color("green",0.3) translate([2,1,.9]) cube([47,62.5,6]);
  color("green",0.3) translate([-49,1,.9]) cube([47,62.5,6]);

hull(){
  translate([40.5,55,-20]) cube([10,10,21]);
  translate([-50.5,55,-20]) cube([10,10,21]);

  translate([40.5,-.5,-20]) cube([10,10,21]);
  translate([-50.5,-.5,-20]) cube([10,10,21]);

  translate([22,-8,-18]) cube([10,10,19]);
  translate([-30.5,-8,-18]) cube([10,10,19]);

  translate([22,-65.5,-18]) cube([10,10,19]);
  translate([-30.5,-65.5,-18]) cube([10,10,19]);

}

}

module bodyshape() {
   $fn = 50;
   union() {
      hull() {
//    insideparts();
        translate([-30,-65,-9]) sphere(12);
        translate([30,-65,-9]) sphere(12);
        translate([50,5,-9]) sphere(12);
        translate([-50,5,-9]) sphere(12);
        translate([50,65,-9]) sphere(12);
        translate([-50,65,-9]) sphere(12);
      }
      translate([0,-2,-30.5]) rotate([0,180,0]) 18650holder();
   }
}

module mainbody() {

  difference() {
    bodyshape();
    clearances();
    insideparts();
  }
}

mainbody();
//insideparts();
//clearances();
//cube(2);

