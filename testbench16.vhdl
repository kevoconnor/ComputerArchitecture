LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY sixteen2one_tb IS
END sixteen2one_tb;

ARCHITECTURE test OF sixteen2one_tb IS
    SIGNAL i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14, i15, s3, s2, s1, s0, o: STD_LOGIC;
BEGIN
    mux_0: ENTITY work.mux16to1(Behavior) PORT MAP (i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14, i15, s3, s2, s1, s0, o);
    --mux_1: ENTITY work.mux2to1(rtl) PORT MAP (i0, i1, s, o2);

    PROCESS
	TYPE pattern_type IS RECORD
	    i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14, i15, s3, s2, s1, s0: STD_LOGIC;
	    o: STD_LOGIC;
	END RECORD;
	TYPE pattern_array IS ARRAY (NATURAL RANGE <>) OF pattern_type;
	CONSTANT patterns: pattern_array :=
	    (('1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1'),
	    ('0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1'),
	    ('0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '1'),
	    ('0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '1'),
	    ('0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1'),
	    ('0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '1', '1'),
	    ('0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '1'),
	    ('0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '1'),
	    ('0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '1'),
	    ('0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '1'),
	    ('0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '1', '0', '1', '0', '1'),
	    ('0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '1', '0', '1', '1', '1'),
	    ('0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '1', '1', '0', '0', '1'),
	    ('0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '1', '0', '1', '1'),
	    ('0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '1', '1', '1', '0', '1'),
	    ('0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '1', '1', '1'));
    BEGIN
      --  Check each pattern.
      for i in patterns'range loop
	  --  Set the inputs.
	  i0 <= patterns(i).i0;
	  i1 <= patterns(i).i1;
	  i2 <= patterns(i).i2;
	  i3 <= patterns(i).i3;
	  i4 <= patterns(i).i4;
	  i5 <= patterns(i).i5;
	  i6 <= patterns(i).i6;
	  i7 <= patterns(i).i7;
	  i8 <= patterns(i).i8;
	  i9 <= patterns(i).i9;
	  i10 <= patterns(i).i10;
	  i11 <= patterns(i).i11;
	  i12 <= patterns(i).i12;
	  i13 <= patterns(i).i13;
	  i14 <= patterns(i).i14;
	  i15 <= patterns(i).i15;
	  s0 <= patterns(i).s0;
	  s1 <= patterns(i).s1;
	  s2 <= patterns(i).s2;
	  s3 <= patterns(i).s3;
	  --  Wait for the results.
	  wait for 1 ns;
	  --  Check the outputs.
	  assert o = patterns(i).o
	    report "bad Behavior output value" severity error;
	  --assert o2 = patterns(i).o
	    --report "bad rtl output value" severity error;
      end loop;
      assert false report "end of test" severity note;
      --  Wait forever; this will finish the simulation.
      wait;
    END PROCESS;
END test;
