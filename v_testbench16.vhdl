LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY sixteen2one_tb IS
END sixteen2one_tb;

ARCHITECTURE test OF sixteen2one_tb IS
    --SIGNAL i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14, i15, s3, s2, s1, s0, o: STD_LOGIC;
    SIGNAL i: STD_LOGIC_VECTOR(15 downto 0);
	 s: STD_LOGIC_VECTOR(3 downto 0);
	 o: STD_LOGIC;
    --SIGNAL i: STD_LOGIC_VECTOR(20 downto 0);
BEGIN
    mux_0: ENTITY work.mux16to1(Behavior) PORT MAP (i, s, o);
    --mux_1: ENTITY work.mux2to1(rtl) PORT MAP (i0, i1, s, o2);

    PROCESS
	TYPE pattern_type IS RECORD
	    i: STD_LOGIC_VECTOR(15 downto 0);
	    s: STD_LOGIC_VECTOR(3 downto 0);
	    o: STD_LOGIC;
	END RECORD;
	TYPE pattern_array IS ARRAY (NATURAL RANGE <>) OF pattern_type;
	CONSTANT patterns: pattern_array :=
	    (("1000000000000000", "0000", '1'),
	    ("0100000000000000", "0001", '1'),
	    ("0010000000000000", "0010", '1'),
	    ("0001000000000000", "0011", '1'),
	    ("0000100000000000", "0100", '1'),
	    ("0000010000000000", "0101", '1'),
	    ("0000001000000000", "0110", '1'),
	    ("0000000100000000", "0111", '1'),
	    ("0000000010000000", "1000", '1'),
	    ("0000000001000000", "1001", '1'),
	    ("0000000000100000", "1010", '1'),
	    ("0000000000010000", "1011", '1'),
	    ("0000000000001000", "1100", '1'),
	    ("0000000000000100", "1101", '1'),
	    ("0000000000000010", "1110", '1'),
	    ("0000000000000001", "1111", '1'),
    BEGIN
      --  Check each pattern.
      for j in patterns'range loop
	  --  Set the inputs.
	  i <= patterns(j).i;
	  s <= patterns(j).s;
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
