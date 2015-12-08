LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY dec1to2 IS
    PORT (i, s: IN STD_LOGIC;
	o0, o1: OUT STD_LOGIC);
END ENTITY dec1to2;

ARCHITECTURE Behavior of dec1to2 IS
    SIGNAL s0 : STD_LOGIC:='0';
BEGIN
    s0 <= NOT s after 5 ps;
    out0: ENTITY work.AND0(Behavior) PORT MAP (i,s0,o0);
    out1: ENTITY work.AND0(Behavior) PORT MAP (i,s,o1);
END ARCHITECTURE Behavior;
