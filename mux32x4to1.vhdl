LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY mux32x4to1 IS
    PORT (i0,i1,i2,i3: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	s: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	o: OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END ENTITY mux32x4to1;

ARCHITECTURE Behavior of mux32x4to1 IS
    SIGNAL t0,t1 : STD_LOGIC_VECTOR(31 DOWNTO 0); 
BEGIN
    out0: ENTITY work.mux32x2to1(Behavior) PORT MAP (i0,i1,s(0),t0);
    out1: ENTITY work.mux32x2to1(Behavior) PORT MAP (i2,i3,s(0),t1);
    out2: ENTITY work.mux32x2to1(Behavior) PORT MAP (t0,t1,s(1),o);
END ARCHITECTURE Behavior;
