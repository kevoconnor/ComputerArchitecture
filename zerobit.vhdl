LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY zerobit IS
    PORT (i: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	o: OUT STD_LOGIC);
END ENTITY zerobit;

ARCHITECTURE Behavior OF zerobit IS
    SIGNAL outs : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL zero : STD_LOGIC := '0';
    BEGIN
	ors: FOR j IN 0 TO 31 GENERATE
	    zero <= zero OR outs(j) after 5 ps;
	END GENERATE;
	o <= (NOT zero) after 5 ps;
END ARCHITECTURE Behavior;
