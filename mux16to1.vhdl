LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY mux16to1 IS
    PORT (i0,i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15,s3,s2,s1,s0: IN STD_LOGIC;
	o: OUT STD_LOGIC);
END ENTITY mux16to1;

ARCHITECTURE Behavior of mux16to1 IS
    SIGNAL t0,t1,t2,t3 : STD_LOGIC:='0';
BEGIN
    out0: ENTITY work.mux4to1(Behavior) PORT MAP (i0,i1,i2,i3,s1,s0,t0);
    out1: ENTITY work.mux4to1(Behavior) PORT MAP (i4,i5,i6,i7,s1,s0,t1);
    out2: ENTITY work.mux4to1(Behavior) PORT MAP (i8,i9,i10,i11,s1,s0,t2);
    out3: ENTITY work.mux4to1(Behavior) PORT MAP (i12,i13,i14,i15,s1,s0,t3);
    out4: ENTITY work.mux4to1(Behavior) PORT MAP (t0,t1,t2,t3,s3,s2,o);
END ARCHITECTURE Behavior;
