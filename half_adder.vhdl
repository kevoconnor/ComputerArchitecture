LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY half_adder IS
    PORT (i0, i1: IN STD_LOGIC;
	s, c: OUT STD_LOGIC);
END ENTITY half_adder;

ARCHITECTURE Behavior OF half_adder IS
    BEGIN
	out0: ENTITY work.XOR0(Behavior) PORT MAP (i0,i1,s);
	out1: ENTITY work.AND0(Behavior) PORT MAP (i0,i1,c);
END ARCHITECTURE Behavior;
