LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY one2two_tb IS
END one2two_tb;

ARCHITECTURE test OF one2two_tb IS
    SIGNAL i, s, o0, o1: STD_LOGIC;
BEGIN
    mux_0: ENTITY work.dec1to2(Behavior) PORT MAP (i, s, o0, o1);
    --mux_1: ENTITY work.mux2to1(rtl) PORT MAP (i0, i1, s, o2);

    PROCESS
	TYPE pattern_type IS RECORD
	    i, s: STD_LOGIC;
	    o0, o1: STD_LOGIC;
	END RECORD;
	TYPE pattern_array IS ARRAY (NATURAL RANGE <>) OF pattern_type;
	CONSTANT patterns: pattern_array :=
	    (('0', '0', '0', '0'),
	     ('0', '1', '0', '0'),
	     ('1', '0', '1', '0'),
	     ('1', '1', '0', '1'));
    BEGIN
      --  Check each pattern.
      for j in patterns'range loop
	  --  Set the inputs.
	  i <= patterns(j).i;
	  s <= patterns(j).s;
	  --  Wait for the results.
	  wait for 1 ns;
	  --  Check the outputs.
	  assert o0 = patterns(j).o0
	    report "bad Behavior output value" severity error;
	  assert o1 = patterns(j).o1
	    report "bad Behavior output value" severity error;
	  --assert o2 = patterns(i).o
	    --report "bad rtl output value" severity error;
      end loop;
      assert false report "end of test" severity note;
      --  Wait forever; this will finish the simulation.
      wait;
    END PROCESS;
END test;
