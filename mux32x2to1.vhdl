LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY mux32x2to1 IS
    PORT (i0, i1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
	s: IN STD_LOGIC;
	o: OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END ENTITY mux32x2to1;

ARCHITECTURE Behavior of mux32x2to1 IS
    SIGNAL s0 : STD_LOGIC:='0';
BEGIN
    s0 <= NOT s after 5 ps;
    outs: FOR i IN 31 DOWNTO 0 GENERATE
	o(i) <= (i0(i) AND s0) OR (i1(i) AND s) after 15 ps;
    END GENERATE;
END ARCHITECTURE Behavior;
