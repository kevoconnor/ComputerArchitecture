LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY tristate IS
    PORT (i: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	s: IN STD_LOGIC;
	o: OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END ENTITY tristate;

ARCHITECTURE Behavior OF tristate IS
    BEGIN
	PROCESS (s) IS
	BEGIN
	    output: FOR j IN 31 DOWNTO 0 LOOP 
	    	IF s = '0' THEN
		    o(j) <= 'Z';
	    	ELSE
		    o(j) <= i(j);
	    	END IF;
	    END LOOP;
	END PROCESS;
END ARCHITECTURE Behavior;
