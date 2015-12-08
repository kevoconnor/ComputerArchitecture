LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY two2four_tb IS
END two2four_tb;

ARCHITECTURE test OF two2four_tb IS
    SIGNAL i, s1, s0, o0, o1, o2, o3: STD_LOGIC;
BEGIN
    mux_0: ENTITY work.dec2to4(Behavior) PORT MAP (i, s1, s0, o0, o1, o2, o3);
    --mux_1: ENTITY work.mux2to1(rtl) PORT MAP (i0, i1, s, o2);

    PROCESS
	TYPE pattern_type IS RECORD
	    i, s1, s0: STD_LOGIC;
	    o0, o1, o2, o3: STD_LOGIC;
	END RECORD;
	TYPE pattern_array IS ARRAY (NATURAL RANGE <>) OF pattern_type;
	CONSTANT patterns: pattern_array :=
	    (('0', '0', '0', '0', '0', '0', '0'),
	    ('0', '0', '1', '0', '0', '0', '0'),
	    ('0', '1', '0', '0', '0', '0', '0'),
	    ('0', '1', '1', '0', '0', '0', '0'),
	    ('1', '0', '0', '1', '0', '0', '0'),
	    ('1', '0', '1', '0', '1', '0', '0'),
	    ('1', '1', '0', '0', '0', '1', '0'),
	    ('1', '1', '1', '0', '0', '0', '1'));
    BEGIN
      --  Check each pattern.
      for j in patterns'range loop
	  --  Set the inputs.
	  i <= patterns(j).i;
	  s0 <= patterns(j).s0;
	  s1 <= patterns(j).s1;
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
	  --assert o2 = patterns(i).o
	    --report "bad rtl output value" severity error;
      end loop;
      assert false report "end of test" severity note;
      --  Wait forever; this will finish the simulation.
      wait;
    END PROCESS;
END test;
