LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY xor_tb IS
END xor_tb;

ARCHITECTURE test OF xor_tb IS
    SIGNAL i0, i1, o: STD_LOGIC;
BEGIN
    XOR0: ENTITY work.XOR0(Behavior) PORT MAP (i0, i1, o);

    PROCESS
	TYPE pattern_type IS RECORD
	    i0, i1: STD_LOGIC;
	    o: STD_LOGIC;
	END RECORD;
	TYPE pattern_array IS ARRAY (NATURAL RANGE <>) OF pattern_type;
	CONSTANT patterns: pattern_array :=
	    (('0', '0', '0'),
	     ('0', '1', '1'),
	     ('1', '0', '1'),
	     ('1', '1', '0'));
    BEGIN
      --  Check each pattern.
      for i in patterns'range loop
	  --  Set the inputs.
	  i0 <= patterns(i).i0;
	  i1 <= patterns(i).i1;
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
