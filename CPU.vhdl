LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY CPU IS
END ENTITY CPU;

ARCHITECTURE Behavior OF CPU IS

    SIGNAL clock : STD_LOGIC := '0';
    SIGNAL pcIn : STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
    SIGNAL pcOut : STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
    SIGNAL pcOut_in, pcIn_out : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL over, neg, zero, carry : STD_LOGIC;
    SIGNAL Instruction : STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
    SIGNAL Operation : STD_LOGIC_VECTOR(5 DOWNTO 0);
    SIGNAL Reg1, Reg2, Reg3 : STD_LOGIC_VECTOR(4 DOWNTO 0);
    SIGNAL Shamt : STD_LOGIC_VECTOR(4 DOWNTO 0);
    SIGNAL Func : STD_LOGIC_VECTOR(5 DOWNTO 0);
    SIGNAL Immediate : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL JumpVal : STD_LOGIC_VECTOR(25 DOWNTO 0);
    SIGNAL outShift : STD_LOGIC_VECTOR(27 DOWNTO 0);
    SIGNAL Branch, MemRead, MemWrite, RegWrite, SignExtend, ALUSrc1 : STD_LOGIC;
    SIGNAL ALUSrc2, MemToReg, WriteDst, PCSrc, ALUOpType : STD_LOGIC_VECTOR(1 DOWNTO 0);

    BEGIN
    clock <= NOT clock after 500 ps;
    -- PC
    PCi: ENTITY work.single_reg(Behavior) PORT MAP ('1', clock, pcIn, pcOut);
    pcOut_in <= pcOut;
    pcIn <= pcIn_out after 1 ns;
    -- 32-bit Adder for PC
    Adder1: ENTITY work.full_adder32(Behavior) PORT MAP (pcOut_in, "00000000000000000000000000000100",'0','0',over,neg,zero,carry,pcIn_out);

    -- Instruction Memory
    --InstructionMem: ENTITY work.sram64kx8(sram_behaviour) PORT MAP ('0', pcOutTemp, Instruction, '1', clock);
    Operation <= Instruction(31 DOWNTO 26);
    Reg1 <= Instruction(25 DOWNTO 21);
    Reg2 <= Instruction(20 DOWNTO 16);
    Reg3 <= Instruction(15 DOWNTO 11);
    Immediate <= Instruction(15 DOWNTO 0);
    JumpVal <= Instruction(25 DOWNTO 0);

    -- Shift Left 2 for PC
    --SL1: ENTITY work.barrel_left_test(Behavior) PORT MAP (JumpVal, "00010", outShift);

    -- Control Unit
    --Control: ENTITY work.control(Behavior) PORT MAP (Operation, Func, Branch, MemRead, MemWrite, RegWrite, SignExtend, ALUSrc1, ALUSrc2, MemToReg, WriteRegDst, PCSrc, ALUOpType);

    -- Mux before Register File
    --mux1: ENTITY work.mux2to1(Behavior) PORT MAP (ReadReg2, WriteReg1, WriteRegDst, WriteReg);

    -- Register File
    --RegFile: ENTITY work.RegFile(Behavior) PORT MAP (Reg1, Reg2, WriteReg, WE, clock, writeData, read1Data, read2Data);

    -- Sign Extend
    --SignExtend: ENTITY work.SignExtend(Behavior) PORT MAP ();

    -- ALU Control Unit
    --ALUControl: ENTITY work.ALUControl(Behavior) PORT MAP (ALUOpType, Funct, Operation);

    -- Mux before ALU
    --mux2: ENTITY work.mux2to1(Behavior) PORT MAP ();

    -- ALU
    --ALU: ENTITY work.ALU(Behavior) PORT MAP ();

    -- Shift Left 2 for Sign Extended
    --SL2: ENTITY work.barrel_left(Behavior) PORT MAP ();

    -- 32-bit Adder for ALU Result
    --Adder2: ENTITY work.32full_adder(Behavior) PORT MAP ();

    -- AND before muxes
    --AND0: ENTITY work.AND0(Behavior) PORT MAP ();

    -- Mux after adder
    --mux3: ENTITY work.mux2to1(Behavior) PORT MAP ();

    -- Mux after mux
    --mux4: ENTITY work.mux2to1(Behavior) PORT MAP ();

    -- Data Memory
    --DataMem: ENTITY work.sram64kx8(sram_behaviour) PORT MAP ();

    -- Mux after Data Memory
    --mux5: ENTITY work.mux2to1(Behavior) PORT MAP ();

END ARCHITECTURE Behavior;
