LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY complement_tb IS
END complement_tb;

ARCHITECTURE test OF complement_tb IS
    SIGNAL i, o: STD_LOGIC_VECTOR(31 DOWNTO 0);
BEGIN
    complement: ENTITY work.complement(Behavior) PORT MAP (i, o);

    PROCESS
	TYPE pattern_type IS RECORD
	    i: STD_LOGIC_VECTOR(31 DOWNTO 0);
	    o: STD_LOGIC_VECTOR(31 DOWNTO 0);
	END RECORD;
	TYPE pattern_array IS ARRAY (NATURAL RANGE <>) OF pattern_type;
	CONSTANT patterns: pattern_array :=
	    (("00000000000000000000000000000000", "11111111111111111111111111111111"),
	     ("11111111111111111111111111111111", "00000000000000000000000000000000"),
	     ("10101010101010101010101010101010", "01010101010101010101010101010101"));
    BEGIN
      --  Check each pattern.
      for j in patterns'range loop
	  --  Set the inputs.
	  i <= patterns(j).i;
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
