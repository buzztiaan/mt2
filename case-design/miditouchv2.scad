use <clip.scad>;

module touchpad() {

 cube([49,64.5,2]);

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
  touchpad();
  translate ([-50,0,0]) touchpad();

  translate([-30,-65,-8]) ledmatrix();

  translate([-22,10,-20]) stellaris();

  translate([-10.5,-31,-15]) mpu6050();

  translate([-46,16,-16]) dcdc();

//  translate([-33.75,-2,-27]) rotate([0,90,0]) battery();

  translate([-17.5,-55,-17]) leddriver();

  translate([-10,20,-15]) xbee();
}

module mainbody() {

  hull() {
    insideparts();
    translate([-30,-65,-8]) sphere(10);
    translate([30,-65,-8]) sphere(10);
    translate([50,65,-8]) sphere(10);
    translate([-50,65,-8]) sphere(10);
  }
}

union() {
  //mainbody();
  translate([0,-2,-29]) rotate([0,180,0]) 18650holder();
  insideparts();
}
