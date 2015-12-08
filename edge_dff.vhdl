LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY edge_dff IS
    PORT (we, d, clk: IN STD_LOGIC;
	q: OUT STD_LOGIC);
END ENTITY edge_dff;

ARCHITECTURE Behavior of edge_dff IS
BEGIN
PROCESS (clk)
BEGIN
    IF clk'event AND clk = '1' THEN
	IF WE = '1' THEN
	    q <= d after 20 ps;
	END IF;
    END IF;
END PROCESS;
END ARCHITECTURE Behavior;
