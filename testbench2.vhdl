LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY two2one_tb IS
END two2one_tb;

ARCHITECTURE test OF two2one_tb IS
    SIGNAL i0, i1, s, o1, o2: STD_LOGIC;
BEGIN
    mux_0: ENTITY work.mux2to1(Behavior) PORT MAP (i0, i1, s, o1);
    --mux_1: ENTITY work.mux2to1(rtl) PORT MAP (i0, i1, s, o2);

    PROCESS
	TYPE pattern_type IS RECORD
	    i0, i1, s: STD_LOGIC;
	    o: STD_LOGIC;
	END RECORD;
	TYPE pattern_array IS ARRAY (NATURAL RANGE <>) OF pattern_type;
	CONSTANT patterns: pattern_array :=
	    (('0', '0', '0', '0'),
	     ('0', '0', '1', '0'),
	     ('0', '1', '0', '0'),
	     ('0', '1', '1', '1'),
	     ('1', '0', '0', '1'),
	     ('1', '0', '1', '0'),
	     ('1', '1', '0', '1'),
	     ('1', '1', '1', '1'));
    BEGIN
      --  Check each pattern.
      for i in patterns'range loop
	  --  Set the inputs.
	  i0 <= patterns(i).i0;
	  i1 <= patterns(i).i1;
	  s <= patterns(i).s;
	  --  Wait for the results.
	  wait for 1 ns;
	  --  Check the outputs.
	  assert o1 = patterns(i).o
	    report "bad Behavior output value" severity error;
	  --assert o2 = patterns(i).o
	    --report "bad rtl output value" severity error;
      end loop;
      assert false report "end of test" severity note;
      --  Wait forever; this will finish the simulation.
      wait;
    END PROCESS;
END test;
