LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY AND0 IS
    PORT (i0,i1: IN STD_LOGIC;
	o: OUT STD_LOGIC);
END ENTITY AND0;

ARCHITECTURE Behavior of AND0 IS
BEGIN
    o <= (i0 AND i1) after 5 ps;
END ARCHITECTURE Behavior;