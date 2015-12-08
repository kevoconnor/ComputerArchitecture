LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY four2sixteen_tb IS
END four2sixteen_tb;

ARCHITECTURE test OF four2sixteen_tb IS
    SIGNAL i, s3, s2, s1, s0, o0, o1, o2, o3, o4, o5, o6, o7, o8, o9, o10, o11, o12, o13, o14, o15: STD_LOGIC;
BEGIN
    mux_0: ENTITY work.dec4to16(Behavior) PORT MAP (i, s3, s2, s1, s0, o0, o1, o2, o3, o4, o5, o6, o7, o8, o9, o10, o11, o12, o13, o14, o15);
    --mux_1: ENTITY work.mux2to1(rtl) PORT MAP (i0, i1, s, o2);

    PROCESS
	TYPE pattern_type IS RECORD
	    i, s3, s2, s1, s0: STD_LOGIC;
	    o0, o1, o2, o3, o4, o5, o6, o7, o8, o9, o10, o11, o12, o13, o14, o15: STD_LOGIC;
	END RECORD;
	TYPE pattern_array IS ARRAY (NATURAL RANGE <>) OF pattern_type;
	CONSTANT patterns: pattern_array :=
	    (('1', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	    ('1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	    ('1', '0', '0', '1', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	    ('1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	    ('1', '0', '1', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	    ('1', '0', '1', '0', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	    ('1', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	    ('1', '0', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0'),
	    ('1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
	    ('1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0'),
	    ('1', '1', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0'),
	    ('1', '1', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0'),
	    ('1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
	    ('1', '1', '1', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0'),
	    ('1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0'),
	    ('1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1'));
    BEGIN
      --  Check each pattern.
      for j in patterns'range loop
	  --  Set the inputs.
	  i <= patterns(j).i;
	  s0 <= patterns(j).s0;
	  s1 <= patterns(j).s1;
	  s2 <= patterns(j).s2;
	  s3 <= patterns(j).s3;
	  --  Wait for the results.
	  wait for 1 ns;
	  --  Check the outputs.
	  assert o0 = patterns(j).o0
	    report "bad Behavior output value" severity error;
	  assert o1 = patterns(j).o1
	    report "bad Behavior output value" severity error;
	  assert o2 = patterns(j).o2
	    report "bad Behavior output value" severity error;
	  assert o3 = patterns(j).o3
	    report "bad Behavior output value" severity error;
	  assert o4 = patterns(j).o4
	    report "bad Behavior output value" severity error;
	  assert o5 = patterns(j).o5
	    report "bad Behavior output value" severity error;
	  assert o6 = patterns(j).o6
	    report "bad Behavior output value" severity error;
	  assert o7 = patterns(j).o7
	    report "bad Behavior output value" severity error;
	  assert o8 = patterns(j).o8
	    report "bad Behavior output value" severity error;
	  assert o9 = patterns(j).o9
	    report "bad Behavior output value" severity error;
	  assert o10 = patterns(j).o10
	    report "bad Behavior output value" severity error;
	  assert o11 = patterns(j).o11
	    report "bad Behavior output value" severity error;
	  assert o12 = patterns(j).o12
	    report "bad Behavior output value" severity error;
	  assert o13 = patterns(j).o13
	    report "bad Behavior output value" severity error;
	  assert o14 = patterns(j).o14
	    report "bad Behavior output value" severity error;
	  assert o15 = patterns(j).o15
	    report "bad Behavior output value" severity error;
	  --assert o2 = patterns(i).o
	    --report "bad rtl output value" severity error;
      end loop;
      assert false report "end of test" severity note;
      --  Wait forever; this will finish the simulation.
      wait;
    END PROCESS;
END test;
