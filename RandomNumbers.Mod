MODULE RandomNumbers;

VAR z: INTEGER;


PROCEDURE Uniform*(): REAL;

CONST a = 16807;
			m = 2147483647;
			q = m DIV a;
			r = m MOD a;

VAR gamma: INTEGER;

BEGIN
  gamma := a*(z MOD q) - r*(z DIV q);
  IF gamma > 0 THEN z := gamma
  ELSE z := gamma + m
  END;
  RETURN FLT(z)*(1.0/FLT(m))
END Uniform;


PROCEDURE InitSeed*(seed: INTEGER);
BEGIN
  z := seed
END InitSeed;


BEGIN
  z := 314159
END RandomNumbers.