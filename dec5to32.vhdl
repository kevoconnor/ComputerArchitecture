LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY dec5to32 IS
    PORT (i,s4,s3,s2,s1,s0: IN STD_LOGIC;
        o0,o1,o2,o3,o4,o5,o6,o7,o8,o9,o10,o11,o12,o13,o14,o15,o16,o17,o18,o19,o20,o21,o22,o23,o24,o25,o26,o27,o28,o29,o30,o31: OUT STD_LOGIC);
END ENTITY dec5to32;

ARCHITECTURE Behavior of dec5to32 IS
    SIGNAL t0,t1 : STD_LOGIC:='0';
BEGIN
    out0: ENTITY work.dec1to2(Behavior) PORT MAP (i,s4,t0,t1);
    out1: ENTITY work.dec4to16(Behavior) PORT MAP (t0,s3,s2,s1,s0,o0,o1,o2,o3,o4,o5,o6,o7,o8,o9,o10,o11,o12,o13,o14,o15);
    out2: ENTITY work.dec4to16(Behavior) PORT MAP (t1,s3,s2,s1,s0,o16,o17,o18,o19,o20,o21,o22,o23,o24,o25,o26,o27,o28,o29,o30,o31);
END ARCHITECTURE Behavior;
