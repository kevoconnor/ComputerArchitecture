LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY tristate_tb IS
END tristate_tb;

ARCHITECTURE test OF tristate_tb IS
    SIGNAL i : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL s : STD_LOGIC;
    SIGNAL o: STD_LOGIC_VECTOR(31 DOWNTO 0);
BEGIN
    tristate: ENTITY work.tristate(Behavior) PORT MAP (i, s, o);

    PROCESS
	TYPE pattern_type IS RECORD
    	    i : STD_LOGIC_VECTOR(31 DOWNTO 0);
    	    s : STD_LOGIC;
    	    o: STD_LOGIC_VECTOR(31 DOWNTO 0);
	END RECORD;
	TYPE pattern_array IS ARRAY (NATURAL RANGE <>) OF pattern_type;
	CONSTANT patterns: pattern_array :=
	    (("00000000000000000000000000000000", '0', "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ"),
	    ("00000000000000000000000000000000", '1', "00000000000000000000000000000000"));
    BEGIN
      --  Check each pattern.
      for j in patterns'range loop
	  --  Set the inputs.
	  i <= patterns(j).i;
	  s <= patterns(j).s;
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
