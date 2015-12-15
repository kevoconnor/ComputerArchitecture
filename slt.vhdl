LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY slt IS
    PORT(i0, i1: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	o: OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END ENTITY slt;

ARCHITECTURE Behavior OF slt IS
    SIGNAL a : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL over, carry, neg, zero : STD_LOGIC;
    BEGIN
	o0: ENTITY work.full_adder32(Behavior) PORT MAP (i0, i1, '1', '1', over, carry, neg, zero, a);
	o(0) <= a(0);
	output: FOR i IN 1 TO 31 GENERATE
	    o(i) <= '0';
	END GENERATE;
	
END ARCHITECTURE Behavior;
