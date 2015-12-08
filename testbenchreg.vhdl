LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY regfile_tb IS
END regfile_tb;

ARCHITECTURE test OF regfile_tb IS
    SIGNAL reg1, reg2, writeReg: STD_LOGIC_VECTOR(4 DOWNTO 0);
    SIGNAL WE, clock: STD_LOGIC;
    SIGNAL writeData, read1Data, read2Data: STD_LOGIC_VECTOR(31 DOWNTO 0);
BEGIN
    reg: ENTITY work.RegFile(Behavior) PORT MAP (reg1, reg2, writeReg, WE, clock, writeData, read1Data, read2Data);

    PROCESS
	TYPE pattern_type IS RECORD
	    reg1, reg2, writeReg: STD_LOGIC_VECTOR(4 DOWNTO 0);
	    WE, clock: STD_LOGIC;
	    writeData, read1Data, read2Data: STD_LOGIC_VECTOR(31 DOWNTO 0);
	END RECORD;
	TYPE pattern_array IS ARRAY (NATURAL RANGE <>) OF pattern_type;
	CONSTANT patterns: pattern_array :=
	    (('0','0','0','0','0', '1','0','0','0','0', '1','0','0','0','0', '1', '1', '0','1','0','1','0','1','0','1','0','1','0','1','0','1','0','1','0','1','0','1','0','1','0','1','0','1','0','1','0','1','0','1', '0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0', '0','1','0','1','0','1','0','1','0','1','0','1','0','1','0','1','0','1','0','1','0','1','0','1','0','1','0','1','0','1','0','1'));
    BEGIN
      --  Check each pattern.
      for i in patterns'range loop
	  --  Set the inputs.
	for j in 0 to 5 loop	
	  reg1(j) <= patterns(i).reg1(j);
	end loop;
	
	for k in 0 to 5 loop
	  reg2(k) <= patterns(i).reg2(k);
	end loop;
	
	for l in 0 to 5 loop
	  writeReg(l) <= patterns(i).writeReg(l);
	end loop;

	WE <= patterns(i).WE;
	clock <= patterns(i).clock;
	  
	for m in 0 to 32 loop
	  writeData(m) <= patterns(i).writeData(m);
	end loop;

	  --  Wait for the results.
	  wait for 100 ns;
	  --  Check the outputs.
	  for n in 0 to 32 loop
            assert read1Data(n) <= patterns(i).read1Data(n)
	    report "bad Behavior read1 output value" severity error;
          end loop;

          for o in 0 to 32 loop
            assert read2Data(o) <= patterns(i).read2Data(o)
	    report "bad Behavior read2 output value" severity error;
          end loop;  
	  --assert o2 = patterns(i).o
	    --report "bad rtl output value" severity error;
      end loop;
      assert false report "end of test" severity note;
      --  Wait forever; this will finish the simulation.
      wait;
    END PROCESS;
END test;
