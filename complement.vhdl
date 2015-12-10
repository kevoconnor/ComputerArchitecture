LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY complement IS
    PORT (i: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	o: OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END ENTITY complement;

ARCHITECTURE Behavior OF complement IS
    BEGIN
	outputs: FOR j IN 31 DOWNTO 0 GENERATE
	    o0: ENTITY work.NOT0(Behavior) PORT MAP (i(j), o(j));
	END GENERATE;
END ARCHITECTURE Behavior;
