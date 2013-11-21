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
  color("green") cube([35,20,13.5]);
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

module rotaryencoder() {
 difference() {
   translate([0,0,-.2]) cylinder(h=13.2,r=3,$fn=30);
   translate([1.5,-3,3]) cube([2,6,11]);
 }
 translate([0,0,-7]) cylinder(h=7,r=3.5);
 translate([0,0,-12]) color("lightblue") cube([15,12,10],center=true);
}

module insideparts() {
  translate ([34,0,0]) touchpad();
  translate ([-82,0,0]) touchpad();

  translate([-30,2,-7.5]) ledmatrix();

  translate([-30,10,-18.5]) stellaris();

  translate([-10.5,25,-13]) mpu6050();

  translate([-74,8,-15]) dcdc();

//  translate([-33.75,-2,-27]) rotate([0,90,0]) battery();

  translate([-72,35,-9]) leddriver();

  translate([36,20,-14]) xbee();

//  translate([77,71,-9]) rotate([270,90,0]) rotaryencoder();
}


module onlyrotary() {

  translate([81,64,-9]) rotate([315,90,0]) rotaryencoder();
}

module clearances() {
  color("green",0.3) translate([35,1,.9]) cube([47,62.5,6]);
  color("green",0.3) translate([-81,1,.9]) cube([47,62.5,6]);

 color("green",0.3) hull(){
  translate([73.5,55,-19]) cube([10,10,20]);
  translate([-82.5,55,-19]) cube([10,10,20]);

  translate([73.5,-.5,-19]) cube([10,10,20]);
  translate([-82.5,-.5,-19]) cube([10,10,20]);



/*  translate([22,-8,-18]) cube([10,10,19]);
  translate([-30.5,-8,-18]) cube([10,10,19]);

  translate([22,-65.5,-18]) cube([10,10,19]);
  translate([-30.5,-65.5,-18]) cube([10,10,19]);
*/
  }

 // ruimte voor schroefdraad van rotary (moet nog r=3.5 worden)
 translate([88,71,-9]) rotate([315,90,0]) cylinder(r=4,h=50,$fn=30);

 //ruimte voor KNOP
 translate([87,70,-9]) rotate([270,90,0]) sphere(r=12.5);
}

module bodyshape() {
   $fn = 50;
   union() {
      hull() {
        //translate([-30,-65,-9]) sphere(12);
        //translate([30,-65,-9]) sphere(12);
        translate([82,0,-9]) sphere(12);
        translate([-82,0,-9]) sphere(12);
        translate([82,65,-9]) sphere(12);
        translate([-82,65,-9]) sphere(12);
      }
 //     translate([0,-2,-30.5]) rotate([0,180,0]) 18650holder();
   }
}

module rotarybutton(){
 difference() {
   //cylinder(r=12,h=16);
   sphere(r=11,$fn=50);
   translate([0,0,-7]) rotaryencoder();
   translate([0,0,-17]) cylinder(r=6,h=10);
 }
}

module mainbody() {

  difference() {
    bodyshape();
    clearances();
    insideparts();
  }
}

%mainbody();
//bodyshape();
//insideparts();
onlyrotary();
//clearances();
//cube(2);

 translate([87,70,-9]) rotate([315,90,0]) %rotarybutton();

//rotaryencoder();