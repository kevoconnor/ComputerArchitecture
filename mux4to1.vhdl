LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY mux4to1 IS
    PORT (i0,i1,i2,i3,s1,s0: IN STD_LOGIC;
	o: OUT STD_LOGIC);
END ENTITY mux4to1;

ARCHITECTURE Behavior of mux4to1 IS
    SIGNAL t0,t1 : STD_LOGIC:='0'; 
BEGIN
    out0: ENTITY work.mux2to1(Behavior) PORT MAP (i0,i1,s0,t0);
    out1: ENTITY work.mux2to1(Behavior) PORT MAP (i2,i3,s0,t1);
    out2: ENTITY work.mux2to1(Behavior) PORT MAP (t0,t1,s1,o);
END ARCHITECTURE Behavior;
