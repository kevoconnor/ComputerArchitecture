LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY control_tb IS
END control_tb;

ARCHITECTURE test OF control_tb IS
    SIGNAL Operation : STD_LOGIC_VECTOR(31 DOWNTO 26);
    SIGNAL Func : STD_LOGIC_VECTOR(5 DOWNTO 0);
    SIGNAL Branch, MemRead, MemWrite, RegWrite, SignExtend : STD_LOGIC;
    SIGNAL ALUSrc1: STD_LOGIC;
    SIGNAL ALUSrc2, MemToReg, WriteRegDst, PCSrc, ALUOpType : STD_LOGIC_VECTOR(1 DOWNTO 0);
BEGIN
    control: ENTITY work.control(Behavior) PORT MAP (Operation, Func, Branch, MemRead, MemWrite, RegWrite, SignExtend, ALUSrc1, ALUSrc2, MemToReg, WriteRegDst, PCSrc, ALUOpType);

    PROCESS
	TYPE pattern_type IS RECORD
	    Operation : STD_LOGIC_VECTOR( 31 DOWNTO 26);
	    Func: STD_LOGIC_VECTOR(5 DOWNTO 0);
	    Branch, MemRead, MemWrite, RegWrite, SignExtend, ALUSrc1: STD_LOGIC;
	    ALUSrc2, MemToReg, WriteRegDst, PCSrc, ALUOpType: STD_LOGIC_VECTOR(1 DOWNTO 0));
	END RECORD;
	TYPE pattern_array IS ARRAY (NATURAL RANGE <>) OF pattern_type;
	CONSTANT patterns: pattern_array :=
	    (("000000", "100000", '0', '0', '0', '1', '0', '0', "00", "00", "01", "00", "00"),
	    ("100001", "000000", '0', '0', '0', '1', '0', '0', "00", "00", "01", "00", "10"));
    BEGIN
      --  Check each pattern.
      for j in patterns'range loop
	  --  Set the inputs.
	  Operation <= patterns(j).Operation;
	  Func <= patterns(j).Func;
	  --  Wait for the results.
	  wait for 1 ns;
	  --  Check the outputs.
	  assert Branch <= patterns(j).Branch;
	    report "bad Behavior output value" severity error;
	  assert MemRead <= patterns(j).MemRead;
	    report "bad Behavior output value" severity error;
	  assert MemWrite <= patterns(j).MemWrite;
	    report "bad Behavior output value" severity error;
	  assert RegWrite <= patterns(j).RegWrite;
	    report "bad Behavior output value" severity error;
	  assert SignExtend <= patterns(j).SignExtend;
	    report "bad Behavior output value" severity error;
	  assert ALUSrc1 <= patterns(j).ALUSrc1;
	    report "bad Behavior output value" severity error;
	  assert ALUSrc2 <= patterns(j).ALUSrc2;
	    report "bad Behavior output value" severity error;
	  assert MemToReg <= patterns(j).MemToReg;
	    report "bad Behavior output value" severity error;
	  assert WriteRegDst <= patterns(j).WriteRegDst;
	    report "bad Behavior output value" severity error;
	  assert PCSrc <= patterns(j).PCSrc;
	    report "bad Behavior output value" severity error;
      end loop;
      assert false report "end of test" severity note;
      --  Wait forever; this will finish the simulation.
      wait;
    END PROCESS;
END test;
