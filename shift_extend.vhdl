LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY shift_extend IS
    PORT (i: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	o: OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END ENTITY shift_extend;

ARCHITECTURE Behavior OF shift_extend IS
    BEGIN
	out0: FOR j IN 31 DOWNTO 5 GENERATE
	    o(j) <= '0';
	END GENERATE;
	out1: FOR j IN 4 DOWNTO 0 GENERATE
	    o(j) <= i(j);
	END GENERATE;
END ARCHITECTURE Behavior;
