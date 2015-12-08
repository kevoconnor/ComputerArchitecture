LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY XOR1 IS
    PORT (i0, i1: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	o: OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END ENTITY XOR1;

ARCHITECTURE Behavior OF XOR1 IS
    --SIGNAL t0,t1,t2,t3 : STD_LOGIC_VECTOR := '00000000000000000000000000000000';
    BEGIN
	outputs: FOR i IN 0 TO 31 GENERATE 
	    output : ENTITY work.XOR0(Behavior) PORT MAP (i0(i), i1(i), o(i));
	END GENERATE;
END ARCHITECTURE Behavior;