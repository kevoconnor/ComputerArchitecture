LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY slt_tb IS
END slt_tb;

ARCHITECTURE test OF slt_tb IS
    SIGNAL i0, i1, o: STD_LOGIC_VECTOR(31 DOWNTO 0);
BEGIN
    slt: ENTITY work.slt(Behavior) PORT MAP (i0, i1, o);

    PROCESS
	TYPE pattern_type IS RECORD
	    i0, i1: STD_LOGIC_VECTOR(31 DOWNTO 0);
	    o: STD_LOGIC_VECTOR(31 DOWNTO 0);
	END RECORD;
	TYPE pattern_array IS ARRAY (NATURAL RANGE <>) OF pattern_type;
	CONSTANT patterns: pattern_array :=
	    (("00000000000000000000000000000000", "01111111111111111111111111111111", "00000000000000000000000000000001"),
	     ("01111111111111111111111111111111", "00000000000000000000000000000000", "00000000000000000000000000000000"));
    BEGIN
      --  Check each pattern.
      for j in patterns'range loop
	  --  Set the inputs.
	  i0 <= patterns(j).i0;
	  i1 <= patterns(j).i1;
	  --  Wait for the results.
	  wait for 1 ns;
	  --  Check the outputs.
	  assert o = patterns(j).o
	    report "bad Behavior output value" severity error;
	  --assert o2 = patterns(i).o
	    --report "bad rtl output value" severity error;
      end loop;
      assert false report "end of test" severity note;
      --  Wait forever; this will finish the simulation.
      wait;
    END PROCESS;
END test;
