LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY full_adder32_tb IS
END full_adder32_tb;

ARCHITECTURE test OF full_adder32_tb IS
    SIGNAL i0, i1: STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL add_sub, ci: STD_LOGIC;
    SIGNAL over, carry, neg, zero: STD_LOGIC;
    SIGNAL o: STD_LOGIC_VECTOR(31 DOWNTO 0);
BEGIN
    full_adder32: ENTITY work.full_adder32(Behavior) PORT MAP (i0, i1, add_sub, ci, over, carry, neg, zero, o);

    PROCESS
	TYPE pattern_type IS RECORD
	    i0, i1: STD_LOGIC_VECTOR(31 DOWNTO 0);
	    add_sub, ci: STD_LOGIC;
	    over, carry, neg, zero: STD_LOGIC;
	    o: STD_LOGIC_VECTOR(31 DOWNTO 0);
	END RECORD;
	TYPE pattern_array IS ARRAY (NATURAL RANGE <>) OF pattern_type;
	CONSTANT patterns: pattern_array :=
	    (("00000000000000000000000000000000", "01111111111111111111111111111111", '0', '0', '0', '0', '0', '0', "01111111111111111111111111111111"),
	    ("00000000000000000000000000000000", "11111111111111111111111111111111", '0', '0', '0', '0', '0', '0', "11111111111111111111111111111111"),
	    ("00000000000000000000000000000001", "00000000000000000000000000000001", '0', '0', '0', '0', '0', '0', "00000000000000000000000000000010"),
	    ("00000000000000000000000000000001", "00000000000000000000000000000001", '1', '0', '0', '0', '0', '0', "00000000000000000000000000000000"),
	    ("00000000000000000000000000000001", "00000000000000000000000000000001", '0', '1', '0', '0', '0', '0', "00000000000000000000000000000011"));
    BEGIN
      --  Check each pattern.
      for j in patterns'range loop
	  --  Set the inputs.
	  i0 <= patterns(j).i0;
	  i1 <= patterns(j).i1;
	  add_sub <= patterns(j).add_sub;
	  ci <= patterns(j).ci;
	  --  Wait for the results.
	  wait for 1 ns;
	  --  Check the outputs.
	  assert over <= patterns(j).over
	    report "bad Behavior output value" severity error;
	  assert carry <= patterns(j).carry
	    report "bad Behavior output value" severity error;
	  assert neg <= patterns(j).neg
	    report "bad Behavior output value" severity error;
	  assert zero <= patterns(j).zero
	    report "bad Behavior output value" severity error;
	  assert o <= patterns(j).o
	    report "bad Behavior output value" severity error;
      end loop;
      assert false report "end of test" severity note;
      --  Wait forever; this will finish the simulation.
      wait;
    END PROCESS;
END test;
