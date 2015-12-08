LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY dec4to16 IS
    PORT (i,s3,s2,s1,s0: IN STD_LOGIC;
	o0,o1,o2,o3,o4,o5,o6,o7,o8,o9,o10,o11,o12,o13,o14,o15: OUT STD_LOGIC);
END ENTITY dec4to16;

ARCHITECTURE Behavior of dec4to16 IS
    SIGNAL t0,t1,t2,t3 : STD_LOGIC:='0';
BEGIN
    out0: ENTITY work.dec2to4(Behavior) PORT MAP (i,s3,s2,t0,t1,t2,t3);
    out1: ENTITY work.dec2to4(Behavior) PORT MAP (t0,s1,s0,o0,o1,o2,o3);
    out2: ENTITY work.dec2to4(Behavior) PORT MAP (t1,s1,s0,o4,o5,o6,o7);
    out3: ENTITY work.dec2to4(Behavior) PORT MAP (t2,s1,s0,o8,o9,o10,o11);
    out4: ENTITY work.dec2to4(Behavior) PORT MAP (t3,s1,s0,o12,o13,o14,o15);
END ARCHITECTURE Behavior;
