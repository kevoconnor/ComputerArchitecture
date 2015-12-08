LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY XOR0 IS
    PORT (i0, i1: IN STD_LOGIC;
	o: OUT STD_LOGIC);
END ENTITY XOR0;

ARCHITECTURE Behavior OF XOR0 IS
    SIGNAL n0, n1, t0, t1: STD_LOGIC := '0';
    BEGIN
	n0 <= NOT n0 after 5 ps;
	n1 <= NOT n1 after 5 ps;
	out0: ENTITY work.AND0(Behavior) PORT MAP (i0,n1,t0);
	out1: ENTITY work.AND0(Behavior) PORT MAP (i1,n0,t1);
	out2: ENTITY work.OR0(Behavior) PORT MAP (t0,t1,o);
END ARCHITECTURE Behavior;
