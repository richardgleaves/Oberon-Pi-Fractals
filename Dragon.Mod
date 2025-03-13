MODULE Dragon;

IMPORT Oberon, XYplane, RandomNumbers;

VAR
  a1, b1, c1, d1, e1, f1, p1: REAL;
  a2, b2, c2, d2, e2, f2, p2: REAL; 

  X, Y: REAL;
  x0, y0: INTEGER;
  e: INTEGER;  


PROCEDURE Init;
BEGIN
  X := FLT(0); Y := FLT(0);  (* initial pen position *) 

  x0 := 330;     (* X offset of image in window *)
  y0 := 75;       (*  Y offset of image in window *)
  e := 45;         (* image scale in window         *)

  a1 := 0.824074;  b1 := 0.281482;  c1 := -0.212346;  d1 := 0.864198; e1 := -1.882290;  f1 := -0.110607;  p1 := 0.787473;
  a2 := 0.088272;  b2 := 0.520988;  c2 := -0.463889;  d2 := -0.377778;  e2 := 0.785360;    f2 := 8.095795;    p2 := 0.212527;
   
  Oberon.FadeMouse;
  XYplane.Open("Dragon")

END Init;


PROCEDURE Draw*;
CONST
  iterations = 200000;

VAR
  x, y: REAL;             (* new position *)
  xi, eta: INTEGER;   (* pixel coordinates of pen *)
  rand: REAL;            (* random number *)
  count: INTEGER;     (* iteration count *)

BEGIN
  Init;
  count := 0;

  REPEAT
    rand := RandomNumbers.Uniform();

    IF rand < p1 THEN
      x := (a1 * X) + (b1 * Y) + e1;
      y := (c1 * X) + (d1 * Y) + f1;

    ELSE
      x := (a2 * X) + (b2 * Y) + e2; 
      y := (c2 * X) + (d2 * Y) + f2;

    END;

    X := x; xi := x0 + FLOOR(X * FLT(e));
    Y :=  y; eta := y0 + FLOOR(Y * FLT(e));
    XYplane.Dot(xi, eta, XYplane.draw);
     
    INC(count);

  UNTIL count >= iterations

END Draw;

END Dragon.
