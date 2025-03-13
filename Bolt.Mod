MODULE Bolt;

IMPORT Oberon, XYplane, RandomNumbers;

VAR
  a1, b1, c1, d1, e1, f1, p1: REAL;
  a2, b2, c2, d2, e2, f2, p2: REAL; 

  X, Y: REAL;
  x0, y0: INTEGER;
  e: INTEGER;  


PROCEDURE Init;
BEGIN
  x0 := 140;     (* X offset of image in window *)
  y0 := 135;     (*  Y offset of image in window *)
  e := 45;         (* image scale in window         *)

  X := FLT(0); Y := FLT(0);    (* initial pen position *) 

  a1 := 0.696970;  b1 := -0.393939;  c1 := -0.481061;  d1 := -0.662879;  e1 := 2.147003;    f1 := 10.310288;  p1 := 0.747826;
  a2 := 0.090909;  b2 := 0.515152;    c2 := -0.443182;  d2 := -0.094697;  e2 := 4.286558;  f2 := 2.925762;  p2 := 0.252174;
   
  Oberon.FadeMouse;
  XYplane.Open("Bolt")

END Init;


PROCEDURE Draw*;
CONST
  iterations = 300000;

VAR
  x, y: REAL;              (* new position *)
  xi, eta: INTEGER;    (* pixel coordinates of pen *)
  rand: REAL;             (* random number *)
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

END Bolt.
