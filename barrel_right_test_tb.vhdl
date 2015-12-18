LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY barrel_right_test_tb IS
END barrel_right_test_tb;

ARCHITECTURE test OF barrel_right_test_tb IS
    SIGNAL i: STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL n : STD_LOGIC_VECTOR(4 DOWNTO 0);
    SIGNAL o: STD_LOGIC_VECTOR(31 DOWNTO 0);
    --SIGNAL over : STD_LOGIC;
BEGIN
    --barrel_left_test: ENTITY work.barrel_left_test(Behavior) PORT MAP (i, n, o, over);
    barrel_right_test: ENTITY work.barrel_right_test(Behavior) PORT MAP (i, n, o);

    PROCESS
	TYPE pattern_type IS RECORD
	    i: STD_LOGIC_VECTOR(31 DOWNTO 0);
	    n: STD_LOGIC_VECTOR(4 DOWNTO 0);
	    o: STD_LOGIC_VECTOR(31 DOWNTO 0);
	    --over: STD_LOGIC;
	END RECORD;
	TYPE pattern_array IS ARRAY (NATURAL RANGE <>) OF pattern_type;
	CONSTANT patterns: pattern_array :=
	    --(("00000000000000000000000000000001", "00001", "00000000000000000000000000000010", '0'),
	    --("00000000000000000000000000000001", "00010", "00000000000000000000000000000100", '0'));
	    (("10000000000000000000000000000000", "00001", "01000000000000000000000000000000"),
	    ("10000000000000000000000000000000", "00010", "00100000000000000000000000000000"),
	    ("10000000000000000000000000000000", "00100", "00001000000000000000000000000000"),
	    ("10000000000000000000000000000000", "01000", "00000000100000000000000000000000"),
	    ("10000000000000000000000000000000", "10000", "00000000000000001000000000000000"));
    BEGIN
      --  Check each pattern.
      for j in patterns'range loop
	  --  Set the inputs.
	  i <= patterns(j).i;
	  n <= patterns(j).n;
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
