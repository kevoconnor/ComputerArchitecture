LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY complement IS
    PORT(i: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	o: OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END ENTITY complement;

ARCHITECTURE Behavior OF complement IS
    BEGIN
	FOR i IN 31 DOWNTO 0 LOOP
	    o0: ENTITY work.NOT0(Behavior) PORT MAP (i(i), o(i));
	END LOOP;
END ARCHITECTURE Behavior;
