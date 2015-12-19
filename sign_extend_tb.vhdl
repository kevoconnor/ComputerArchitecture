LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY sign_extend_tb IS
END sign_extend_tb;

ARCHITECTURE test OF sign_extend_tb IS
    SIGNAL i : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL z_s : STD_LOGIC;
    SIGNAL o: STD_LOGIC_VECTOR(31 DOWNTO 0);
BEGIN
    sign_extend: ENTITY work.sign_extend(Behavior) PORT MAP (i, z_s, o);

    PROCESS
	TYPE pattern_type IS RECORD
    	    i : STD_LOGIC_VECTOR(15 DOWNTO 0);
    	    z_s : STD_LOGIC;
    	    o: STD_LOGIC_VECTOR(31 DOWNTO 0);
	END RECORD;
	TYPE pattern_array IS ARRAY (NATURAL RANGE <>) OF pattern_type;
	CONSTANT patterns: pattern_array :=
	    (("0000000000000000", '0', "00000000000000000000000000000000"),
	     ("1111111111111111", '0', "00000000000000001111111111111111"),
	     ("1111111111111111", '1', "11111111111111111111111111111111"));
    BEGIN
      --  Check each pattern.
      for j in patterns'range loop
	  --  Set the inputs.
	  i <= patterns(j).i;
	  z_s <= patterns(j).z_s;
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
