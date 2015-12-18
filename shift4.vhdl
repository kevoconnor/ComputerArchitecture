LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY sr4 IS
    PORT (i: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	n: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	o: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END ENTITY sr4;

ARCHITECTURE Behavior OF sr4 IS
    SIGNAL z : STD_LOGIC := '0';
    BEGIN
	-- n(1)
	mux0: ENTITY work.mux2to1(Behavior) PORT MAP (i(3), z, n(1), o(3));
	mux1: ENTITY work.mux2to1(Behavior) PORT MAP (i(2), z, n(0), o(2);
	mux2: ENTITY work.mux2to1(Behavior) PORT MAP (i(
	
END ARCHITECTURE Behavior;
