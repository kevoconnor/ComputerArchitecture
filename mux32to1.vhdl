LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY mux32to1 IS
    PORT (i0,i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15,i16,i17,i18,i19,i20,i21,i22,i23,i24,i25,i26,i27,i28,i29,i30,i31,s4,s3,s2,s1,s0: IN STD_LOGIC;
	o: OUT STD_LOGIC);
END ENTITY mux32to1;

ARCHITECTURE Behavior of mux32to1 IS
    SIGNAL t0,t1 : STD_LOGIC:='0';
BEGIN
    out0: ENTITY work.mux16to1(Behavior) PORT MAP (i0,i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15,s3,s2,s1,s0,t0);
    out1: ENTITY work.mux16to1(Behavior) PORT MAP (i16,i17,i18,i19,i20,i21,i22,i23,i24,i25,i26,i27,i28,i29,i30,i31,s3,s2,s1,s0,t1);
    out2: ENTITY work.mux2to1(Behavior) PORT MAP (t0,t1,s4,o);
END ARCHITECTURE Behavior;
