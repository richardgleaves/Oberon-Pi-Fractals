MODULE XYplaneDemo;

IMPORT XYplane, Terminal;

(* dots drawn in 400x400 pixel square with frame origin [100,100] *)

CONST numdots = 100; origin = 100; maxpos = 400;

VAR seed: INTEGER;

PROCEDURE Random(): INTEGER;
CONST a = 8371; c = 37;
BEGIN
  seed := (a * seed) + c;
  RETURN seed MOD maxpos
END Random;

PROCEDURE Draw*;
VAR x, y, dots: INTEGER;
BEGIN
  XYplane.Open("XYplaneDemo");
  FOR dots := 1 TO numdots DO
    XYplane.Dot(origin + Random(), origin + Random(), XYplane.draw)
  END
END Draw;

PROCEDURE Check*;
CONST numrands = 100;
VAR i: INTEGER;
BEGIN
  FOR i := 1 TO numrands DO
    Terminal.Ln; Terminal.Int(Random(), 5)
  END
END Check;

BEGIN
   seed := 42;
END XYplaneDemo.