(**** Replicator 1 & 2 leveling script ****)
(**** Do not run on Thing-o-Matics or Cupcakes: their homing is backwards ***)
M103 (Disable RPM)
M73 P0 (enable build progress)
G21 (set units to mm)
G90 (set positioning to absolute)
(**** Begin homing ****)
G161 X Y F2500 (home XY axes minimum)
G161 Z F1100 (home Z axis minimum)
G92 Z-5 (set Z to -5)
G1 Z0.0 F1100 (move Z to "0")
G161 Z F100 (home Z axis minimum)
M132 X Y Z A B (Recall stored home offsets)
(**** End homing ****)
(**** Move to the center of platform using three moves.  Move the      ****)
(**** extruder away from the platform, then move to the center of the  ****)
(**** platform, and finally move the extruder to the Z=0 mm position   ****)
(**** over the platform.                                               ****)
G1 Z10 F600.0 (Move to [?,?,10]; unaccelerated owing to prior M132)
(**** Move to Z10.01 so as to force the gcode to x3g translator to not ****)
(**** combine the next two G1 moves into a single command.             ****)
G1 X0 Y0 Z10.01 F1100.0 (Move to [0,0,10.01]; accelerated)
G1 Z0 F600.0 (Move to [0,0,0]; accelerated)
(**** Disable the X & Y stepper motors so that the nozzle can be moved ****)
(**** about to any position over the platform allowing multi-point     ****)
(**** leveling and testing with a dial indicator or other test guage.  ****)
M18 X Y A B (Leave Z stepper enabled; disable the others)
M71 (By hand move the ex-truder to different positions over the  build platform....)
M71 (Adjust the spacing  between the extrudernozzle and platform with the knobs...)
M71 (under the platform  and a sheet of paperplaced between the  platform and the...)
M71 (nozzle. When you aredone, press the     center button.)
; M71 (Press the center    button when finished)
(**** All done -- disable all the stepper motors ****)
M18 X Y Z A B (Disable all stepper motors)