module doubleAxe(l = 600) {
    color("brown") for (x=[-12,12]) translate([x,0,0]) rotate([0,15,0]) translate([0,0,l/2+20]) cube([12,34,l], center=true);
}
    
module pied(ep = 50) {
    difference() {
// Cylindre
        translate([50,0,ep/2]) cylinder(d=150, h=ep, $fn=100, center=true);
// Abaissement face avant dessus
        translate([100/2+40,0,40]) cube([100,150,50],center=true);
// Passage barres
        for (x=[-12,12]) translate([x,0,0]) rotate([0,15,0]) translate([0,0,ep/2+5]) cube([12.5,34.5,ep+20], center=true);
// Passage pieds bois
        for (a=[-15,15]) rotate([0,0,a]) translate([80,0,6]) cube([100,34.5,12.5+.5], center=true);
// Côté
        for (a=[-15,15]) translate([-250,0,0]) rotate([0,0,a]) translate([300,0,ep/2]) cube([200,75,ep+1], center=true);
    }
    
    *color("brown") for (a=[-15,15]) rotate([0,0,a]) translate([180,0,6]) cube([300,34,12], center=true);
}

module support() {
    difference() {
        union() {
            rotate([90,0,0]) cylinder(d=45,h=45,$fn=60,center=true);
            translate([0,0,-45/4]) cube([45,45,45/2], center=true);
        }
        rotate([90,0,0]) cylinder(d=10.5,h=60,$fn=50,center=true);
        for (x=[-12,12]) translate([x,0,-50/2]) cube([12.5,34.5,50],center=true);
    }
}

module tete() {
    difference() {
        union() {
// 2 pattes latérales
            for (y=[-22.6,22.6]) translate([0,y,0]) {
//            for (y=[-20,20]) translate([0,y,0]) {
                hull() {
                    rotate([90,0,0]) cylinder(d=30, h=5, center=true);
                    rotate([0,27,0]) translate([41,0,0]) cube([0.1,5,50], center=true);
                }
            }
// Cone exterieur
            translate([70,0,-50]) cylinder(d1=180, d2=50, h=150, $fn=100, center=true);
// Epaisseur passe-fil
            translate([35,0,0]) rotate([0,23-90,0]) cylinder(d=10, h=3, $fn=20, center=true);
        }
// Cone intérieur
        translate([70,0,-50]) cylinder(d1=178, d2=48, h=150.1, center=true);
// Passage axe M10 
        rotate([90,0,0]) cylinder(d=10.5, h=75, $fn=50, center=true);
// Trou passe-fil
        translate([35,0,0]) rotate([0,23-90,0]) cylinder(d=7, h=7, $fn=20, center=true);
    }

// Support intérieur
    difference() {
        translate([70,0,0]) {
            difference() {
// Epaisseur support douille
                cylinder(d=37.5, h=1,center=true);
// Diamètre douille
                cylinder(d=25, h=8, center=true);
            }
// Support de douille
            for(a=[0:10]) rotate([0,20,a*40]) translate([15+25/2,0,6]) cube([25,12.5,2], center=true);
        }
        translate([70,0,-50]) difference() {
             cylinder(d1=200, d2=70, h=151, center=true);
             cylinder(d1=180, d2=50, h=150, $fn=100, center=true);
        }
    }
}

/*
pied();
doubleAxe(500);
translate([132.5,0,495]) {
    union() {
        support();
        rotate([0,0*(90*sin($t*360)-95),0]) tete();
    }
}
*/

pied();
// doubleAxe(500);
// translate([132.5,0,495]) rotate([0,15,0]) support();
