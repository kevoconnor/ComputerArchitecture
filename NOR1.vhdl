LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY NOR1 IS
    PORT (i0, i1: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	o: OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END ENTITY NOR1;

ARCHITECTURE Behavior OF NOR1 IS
    --SIGNAL t : STD_LOGIC_VECTOR := '00000000000000000000000000000000';
    BEGIN
	outputs: FOR i IN 0 TO 31 GENERATE
	    output : ENTITY work.NOR0(Behavior) PORT MAP (i0(i), i1(i), o(i));
	END GENERATE;
END ARCHITECTURE Behavior;
