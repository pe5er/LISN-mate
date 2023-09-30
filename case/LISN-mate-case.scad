/* LISN-mate case

   The LISN-mate is distributed under the CC BY-SA 4.0 license
   (Attribution-ShareAlike 4.0 International).

   You are free to:

      Share - copy and redistribute the material in any medium or format

      Adapt - remix, transform, and build upon the material

      The licensor cannot revoke these freedoms as long as you follow the
      license terms.

   Under the following terms:

      Attribution - You must give appropriate credit, provide a link to the
      license, and indicate if changes were made. You may do so in any
      reasonable manner, but not in any way that suggests the licensor endorses
      you or your use.

      NonCommercial - You may not use the material for commercial purposes.

      ShareAlike - If you remix, transform, or build upon the material, you must
      distribute your contributions under the same license as the original.

      No additional restrictions - You may not apply legal terms or
      technological measures that legally restrict others from doing anything
      the license permits.

   Acknowledgement:
      This project use the "Chamfered primitives for OpenSCAD v1.2" by
      "TimeWaster". That project is published under a Creative Commons
      Attribution-NonCommercial-ShareAlike 3.0 licence.
*/

Length = 41;        /* interior size (of the PCB, including some tolerance) */
Width = 29.5;
Height = 8.5;
SMA_Diameter = 6.5; /* SMA connector diameter */
SMA_Spacing = 25.15;
ScrewDiameter = 3;
WallSize = 2.4;
Snap_Ridge = 0.5;   /* depth of the ridge for snapping the bottom shell into the top shell */
Chamfer = 1.2;      /* chamfer size on all outer edges */

epsilon = 0.05;
$fn = 50;

include <Chamfer.scad>

module top_shell() {
  difference() {
    /* basic shell (box) */
    length_ext = Length + 2*WallSize;
    width_ext = Width + 2*WallSize;
    height_ext = Height + 2*WallSize;
    translate([-length_ext/2, -width_ext/2, 0])
      chamferCube([length_ext, width_ext, height_ext], undef, Chamfer);
    translate([-Length/2, -Width/2, -epsilon])
      cube([Length, Width, Height + WallSize + epsilon]);

    /* connector holes */
    tube_length = Width + 2*(WallSize + epsilon);
    translate([0, -tube_length/2, height_ext/2]) {
      union() {
        rotate([-90, 0, 0])
          translate([-SMA_Spacing/2, 0, 0])
            cylinder(d = SMA_Diameter, h = tube_length);
        translate([-SMA_Spacing/2 - SMA_Diameter/2, 0, -height_ext/2 - epsilon])
          cube([SMA_Diameter, tube_length, height_ext/2]);

        rotate([-90, 0, 0])
          translate([SMA_Spacing/2, 0, 0])
            cylinder(d = SMA_Diameter, h = tube_length);
        translate([SMA_Spacing/2 - SMA_Diameter/2, 0, -height_ext/2 - epsilon])
          cube([SMA_Diameter, tube_length, height_ext/2]);
      }
    }

    /* snap ridges (to snap the bottom in place) */
    ridge_height = WallSize/2 + 0.3; /* 0.3 = tolerance */
    ridge_width = Snap_Ridge + 0.2;
    translate([Length/2 - epsilon, -Width/2, WallSize - ridge_height])
      cube([ridge_width, Width, ridge_height]);
    translate([-Length/2 - ridge_width, -Width/2, WallSize - ridge_height])
      cube([ridge_width + epsilon, Width, ridge_height]);
  }
}

module bottom_shell() {
  height_ext = Height + 2*WallSize;
  difference() {
    union() {
      /* bottom plate */
      translate([-Length/2, -Width/2, 0])
        cube([Length, Width, WallSize]);

      /* snap ridges */
      translate([Length/2 - epsilon, -Width/2, WallSize/2])
        cube([Snap_Ridge, Width, WallSize/2]);
      translate([-Length/2 - Snap_Ridge, -Width/2, WallSize/2])
        cube([Snap_Ridge + epsilon, Width, WallSize/2]);

      /* connector supports (rounded part in subtracted below) */
      stud_size = SMA_Diameter - 0.2;
      stud_height = height_ext/2 - SMA_Diameter/4;
      translate([-SMA_Spacing/2 - stud_size/2, -(Width/2 + WallSize), 0])
        chamferCube([stud_size, WallSize + epsilon, stud_height], [[1, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]], Chamfer);
      translate([SMA_Spacing/2 - stud_size/2, -(Width/2 + WallSize), 0])
        chamferCube([stud_size, WallSize + epsilon, stud_height], [[1, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]], Chamfer);
      translate([-SMA_Spacing/2 - stud_size/2, Width/2 - epsilon, 0])
        chamferCube([stud_size, WallSize + epsilon, stud_height], [[0, 1, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]], Chamfer);
      translate([SMA_Spacing/2 - stud_size/2, Width/2 - epsilon, 0])
        chamferCube([stud_size, WallSize + epsilon, stud_height], [[0, 1, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]], Chamfer);
    }

    tube_length = Width + 2*(WallSize + epsilon);
    height_ext = Height + 2*WallSize;
    translate([0, -tube_length/2, height_ext/2])
      rotate([-90, 0, 0])
        translate([-SMA_Spacing/2, 0, 0])
          cylinder(d = SMA_Diameter, h = tube_length);
    translate([0, -tube_length/2, height_ext/2])
      rotate([-90, 0, 0])
        translate([SMA_Spacing/2, 0, 0])
          cylinder(d = SMA_Diameter, h = tube_length);
  }
}

/* assembled */
//top_shell();
//bottom_shell();

/* separate, for printing */
translate([0, Width + 2*WallSize + 5, Height + 2*WallSize])
  rotate([180, 0, 0])
    top_shell();
bottom_shell();
