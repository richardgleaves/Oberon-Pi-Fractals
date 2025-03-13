MODULE Fern;

IMPORT Oberon, XYplane, RandomNumbers;

VAR
  a1, b1, c1, d1, e1, f1, p1: REAL;
  a2, b2, c2, d2, e2, f2, p2: REAL; 
  a3, b3, c3, d3, e3, f3, p3: REAL; 
  a4, b4, c4, d4, e4, f4, p4: REAL;

  X, Y: REAL;
  x0, y0: INTEGER;
  e: INTEGER; 


PROCEDURE Init;
BEGIN
  X := FLT(0); Y := FLT(0);  (* initial pen position *) 

  x0 := 320;     (* X offset of image in window *)
  y0 := 50;       (*  Y offset of image in window *)
  e := 48;         (* image scale in window         *)

  a1 := 0.0;     b1 := 0.0;      c1 := 0.0;      d1 := 0.16;  e1 := 0.0;  f1 := 0.0;    p1 := 0.01; 
  a2 := 0.85;   b2 := 0.04;    c2 := -0.04;  d2 := 0.85;  e2 := 0.0;  f2 := 1.6;    p2 := 0.85;  
  a3 := 0.2;     b3 := -0.26;  c3 := 0.23;    d3 := 0.22;  e3 := 0.0;  f3 := 1.6;    p3 := 0.07;  
  a4 := -0.15; b4 := 0.28;    c4 := 0.26;    d4 := 0.24;  e4 := 0.0;  f4 := 0.44;  p4 := 0.07;

  Oberon.FadeMouse;
  XYplane.Open("Fern")

END Init;


PROCEDURE Draw*;
CONST
  iterations = 300000;

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

    ELSIF rand < (p1 + p2 + p3) THEN
      x := (a3 * X) + (b3 * Y) + e3;
      y := (c3 * X) + (d3 * X) + f3;

    ELSE
      x := (a4 * X) + (b4 * Y) + e4;
      y := (c4 * X) + (d4 * Y) + f4;

    END;

    X := x; xi := x0 + FLOOR(X * FLT(e));
    Y :=  y; eta := y0 + FLOOR(Y * FLT(e));
    XYplane.Dot(xi, eta, XYplane.draw);
     
    INC(count);

  UNTIL count >= iterations

END Draw;

END Fern.
