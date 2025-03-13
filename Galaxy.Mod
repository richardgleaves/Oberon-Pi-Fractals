MODULE Galaxy;

IMPORT Oberon, XYplane, RandomNumbers;

VAR
  a1, b1, c1, d1, e1, f1, p1: REAL;
  a2, b2, c2, d2, e2, f2, p2: REAL; 

  X, Y: REAL;
  x0, y0: INTEGER;
  e: INTEGER;  


PROCEDURE Init;
BEGIN
  x0 := 235;     (* X offset of image in window *)
  y0 := 295;     (*  Y offset of image in window *)
  e := 25;         (* image scale in window         *)

  X := FLT(0); Y := FLT(0);  (* initial pen position *) 

  a1 := 0.745455;    b1 := 0.406061;    c1 := -0.459091;  d1 := 0.887121;    e1 := 1.460279;  f1 := 0.691072;  p1 := 0.912675; 
  a2 := -0.424242;  b2 := -0.175758;  c2 := -0.065152;  d2 := -0.218182;  e2 := 3.809567;  f2 := 6.741476;  p2 := 0.087325;  
  
  Oberon.FadeMouse;
  XYplane.Open("Galaxy")

END Init;


PROCEDURE Draw*;
CONST
  iterations = 350000;

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

END Galaxy.
