MODULE Shrimp;

IMPORT Oberon, XYplane, RandomNumbers;

VAR
  a1, b1, c1, d1, e1, f1, p1: REAL;
  a2, b2, c2, d2, e2, f2, p2: REAL; 
  a3, b3, c3, d3, e3, f3, p3: REAL; 

  X, Y: REAL;
  x0, y0: INTEGER;
  e: INTEGER;  


PROCEDURE Init;
BEGIN
  x0 := 300;     (* X offset of image in window *)
  y0 := 275;     (*  Y offset of image in window *)
  e := 25;         (* image scale in window         *)

  X := FLT(0); Y := FLT(0);  (* initial pen position *) 

  a1 := 0.787879;    b1 := 0.242424;  c1 := -0.424242;  d1 := 0.859848;  e1 := 1.758647;    f1 := 1.408065;  p1 := 0.895652; 
  a2 := -0.121212;  b2 := 0.151515;  c2 := 0.257576;    d2 := 0.053030;  e2 := -6.721654;  f2 := 1.377236;  p2 := 0.052174;  
  a3 := 0.181818;    b3 := 0.090909;  c3 := -0.136364;  d3 := 0.181818;  e3 := 6.086107;    f3 := 1.568035;  p3 := 0.052174;  
 
  Oberon.FadeMouse;
  XYplane.Open("Shrimp")

END Init;


PROCEDURE Draw*;
CONST
  iterations = 250000;

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

    ELSIF rand < (p1 + p2) THEN
      x := (a2 * X) + (b2 * Y) + e2; 
      y := (c2 * X) + (d2 * Y) + f2;

    ELSE
      x := (a3 * X) + (b3 * Y) + e3;
      y := (c3 * X) + (d3 * X) + f3;

    END;

    X := x; xi := x0 + FLOOR(X * FLT(e));
    Y :=  y; eta := y0 + FLOOR(Y * FLT(e));
    XYplane.Dot(xi, eta, XYplane.draw);
     
    INC(count);

  UNTIL count >= iterations

END Draw;

END Shrimp.
