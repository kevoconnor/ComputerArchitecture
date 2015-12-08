LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE work.outputs.all;

ENTITY mux32x32to1 IS
    PORT (i0,i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15,i16,i17,i18,i19,i20,i21,i22,i23,i24,i25,i26,i27,i28,i29,i30,i31: IN out1;
	s4,s3,s2,s1,s0: IN STD_LOGIC;
	o: OUT STD_LOGIC_VECTOR(31 downto 0));
END ENTITY mux32x32to1;

ARCHITECTURE Behavior of mux32x32to1 IS
BEGIN
    mux: for i IN 0 to 31 GENERATE
	output: ENTITY work.mux32to1(Behavior) PORT MAP (i0(i),i1(i),i2(i),i3(i),i4(i),i5(i),i6(i),i7(i),i8(i),i9(i),i10(i),i11(i),i12(i),i13(i),i14(i),i15(i),i16(i),i17(i),i18(i),i19(i),i20(i),i21(i),i22(i),i23(i),i24(i),i25(i),i26(i),i27(i),i28(i),i29(i),i30(i),i31(i),s4,s3,s2,s1,s0,o(i)); 
    END GENERATE;
END ARCHITECTURE Behavior;
