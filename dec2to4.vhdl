LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY dec2to4 IS
    PORT (i,s1,s0: IN STD_LOGIC;
	o0,o1,o2,o3: OUT STD_LOGIC);
END ENTITY dec2to4;

ARCHITECTURE Behavior of dec2to4 IS
    SIGNAL t0,t1 : STD_LOGIC:='0';
BEGIN
    out0: ENTITY work.dec1to2 PORT MAP (i,s1,t0,t1);
    out1: ENTITY work.dec1to2 PORT MAP (t0,s0,o0,o1);
    out2: ENTITY work.dec1to2 PORT MAP (t1,s0,o2,o3);
END ARCHITECTURE Behavior;
