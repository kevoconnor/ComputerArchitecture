LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY full_adder_tb IS
END full_adder_tb;

ARCHITECTURE test OF full_adder_tb IS
    SIGNAL i0, i1, ci, s, co: STD_LOGIC;
BEGIN
    full_adder: ENTITY work.full_adder(Behavior) PORT MAP (i0, i1, ci, s, co);

    PROCESS
	TYPE pattern_type IS RECORD
	    i0, i1, ci: STD_LOGIC;
	    s, co: STD_LOGIC;
	END RECORD;
	TYPE pattern_array IS ARRAY (NATURAL RANGE <>) OF pattern_type;
	CONSTANT patterns: pattern_array :=
	    (('0', '0', '0', '0', '0'),
	     ('0', '0', '1', '1', '0'),
	     ('0', '1', '1', '0', '1'),
	     ('1', '1', '1', '1', '1'));
    BEGIN
      --  Check each pattern.
      for i in patterns'range loop
	  --  Set the inputs.
	  i0 <= patterns(i).i0;
	  i1 <= patterns(i).i1;
	  ci <= patterns(i).ci;
	  --  Wait for the results.
	  wait for 1 ns;
	  --  Check the outputs.
	  assert s = patterns(i).s
	    report "bad Behavior output value" severity error;
	  assert co = patterns(i).co
	    report "bad Behavior output value" severity error;
      end loop;
      assert false report "end of test" severity note;
      --  Wait forever; this will finish the simulation.
      wait;
    END PROCESS;
END test;
