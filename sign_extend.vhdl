LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY sign_extend IS
    PORT (i: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	o: OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END ENTITY sign_extend;

ARCHITECTURE Behavior OF sign_extend IS
    BEGIN
	out0: FOR j IN 31 DOWNTO 16 GENERATE
	    o(j) <= i(15);
	END GENERATE;
	out1: FOR j IN 15 DOWNTO 0 GENERATE
	    o(j) <= i(j);
	END GENERATE;
END ARCHITECTURE Behavior;
