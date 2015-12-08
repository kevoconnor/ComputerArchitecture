LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY OR0 IS
    PORT (i0,i1: IN STD_LOGIC;
        o: OUT STD_LOGIC);
END ENTITY OR0;

ARCHITECTURE Behavior of OR0 IS
BEGIN
    o <= (i0 OR i1) after 5 ps;
END ARCHITECTURE Behavior;

