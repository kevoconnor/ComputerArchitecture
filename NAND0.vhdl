LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY NAND0 IS
    PORT (i0, i1: IN STD_LOGIC;
	o: OUT STD_LOGIC);
END ENTITY NAND0;

ARCHITECTURE Behavior OF NAND0 IS
    SIGNAL t : STD_LOGIC := '0';
    BEGIN
	output: ENTITY work.AND0(Behavior) PORT MAP (i0,i1,t);
	o <= NOT t after 5 ps;
END ARCHITECTURE Behavior;
