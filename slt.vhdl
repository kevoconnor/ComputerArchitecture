LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY slt IS
    PORT(i0, i1: IN STD_LOGIC;
	o: OUT STD_LOGIC);
END ENTITY slt;

ARCHITECTURE Behavior OF slt IS
    SIGNAL a : STD_LOGIC_VECTOR(31 DOWNTO 0);
    BEGIN
	o0: ENTITY 32full_adder(Behavior) PORT MAP (i0, i1, '1', '1', a);
END ARCHITECTURE Behavior;
