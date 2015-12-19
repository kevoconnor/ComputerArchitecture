LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY mux5x4to1 IS
    PORT (i0, i1, i2, i3: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	s: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	o: OUT STD_LOGIC_VECTOR(4 DOWNTO 0));
END ENTITY mux5x4to1;

ARCHITECTURE Behavior OF mux5x4to1 IS
    SIGNAL t0, t1 : STD_LOGIC_VECTOR(4 DOWNTO 0);
    BEGIN
	mux0: ENTITY work.mux5x2to1(Behavior) PORT MAP (i0, i1, s(0), t0);
	mux1: ENTITY work.mux5x2to1(Behavior) PORT MAP (i2, i3, s(0), t1);
	mux2: ENTITY work.mux5x2to1(Behavior) PORT MAP (t0, t1, s(1), o);
END ARCHITECTURE Behavior;
