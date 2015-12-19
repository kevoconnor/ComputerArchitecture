LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY CPU IS
END ENTITY CPU;

ARCHITECTURE Behavior OF CPU IS

    SIGNAL clock : STD_LOGIC := '0';
    SIGNAL WE : STD_LOGIC := '1';
    SIGNAL pcIn : STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
    SIGNAL pcOut : STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
    SIGNAL pcOut_in, pcIn_out : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL over, neg, zero, carry : STD_LOGIC;
    SIGNAL Instruction : STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
    SIGNAL Operation : STD_LOGIC_VECTOR(5 DOWNTO 0);
    SIGNAL Reg1, Reg2, Reg3, inWriteReg : STD_LOGIC_VECTOR(4 DOWNTO 0);
    SIGNAL Shamt : STD_LOGIC_VECTOR(4 DOWNTO 0);
    SIGNAL Func : STD_LOGIC_VECTOR(5 DOWNTO 0);
    SIGNAL Immediate : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL JumpVal : STD_LOGIC_VECTOR(25 DOWNTO 0);
    SIGNAL newJumpVal : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL outShift : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL Branch, MemRead, MemWrite, RegWrite, SignExtend, ALUSrc1 : STD_LOGIC;
    SIGNAL ALUSrc2, MemToReg, WriteRegDst, PCSrc, ALUOpType : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL Op : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL Extended : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL writeData, read1Data, read2Data : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL ALUIn, ALUOut : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL Adder1, Adder2 : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL mux_out : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL and_out : STD_LOGIC;
    SIGNAL empty : STD_LOGIC_VECTOR(31 DOWNTO 0) := "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU";

    BEGIN
    clock <= NOT clock after 500 ps;
    -- PC
    PCi: ENTITY work.single_reg(Behavior) PORT MAP (WE, clock, pcIn, pcOut);
    pcOut_in <= pcOut;
    pcIn <= pcIn_out after 1 ns;
    -- 32-bit Adder for PC
    Adder_1: ENTITY work.full_adder32(Behavior) PORT MAP (pcOut_in, "00000000000000000000000000000100", '0', '0', over, neg, zero, carry, pcIn_out);

    -- Instruction Memory
    InstructionMem: ENTITY work.sram64kx8(sram_behaviour) PORT MAP ('0', pcOut_in, Instruction, '1', clock);
    Operation <= Instruction(31 DOWNTO 26);
    Reg1 <= Instruction(25 DOWNTO 21);
    Reg2 <= Instruction(20 DOWNTO 16);
    Reg3 <= Instruction(15 DOWNTO 11);
    Immediate <= Instruction(15 DOWNTO 0);
    JumpVal <= Instruction(25 DOWNTO 0);
    Shamt <= Instruction(10 DOWNTO 6);
    Func <= Instruction(5 DOWNTO 0);

    -- Shift Left 2 for PC
    jump0: FOR i IN 31 DOWNTO 26 GENERATE
	newJumpVal(i) <= '0';
    END GENERATE;
    jump1: FOR i IN 25 DOWNTO 0 GENERATE
	newJumpVal(i) <= JumpVal(i);
    END GENERATE;
    SL1: ENTITY work.barrel_left_test(Behavior) PORT MAP (newJumpVal, "00010", outShift);

    -- Control Unit
    Control: ENTITY work.control(Behavior) PORT MAP (Operation, Func, Branch, MemRead, MemWrite, RegWrite, SignExtend, ALUSrc1, ALUSrc2, MemToReg, WriteRegDst, PCSrc, ALUOpType);

    -- Mux before Register File
    mux1: ENTITY work.mux5x4to1(Behavior) PORT MAP (Reg3, Reg2, "11111", "UUUUU", WriteRegDst, inWriteReg);

    -- Register File
    RegFile: ENTITY work.RegFile(Behavior) PORT MAP (Reg1, Reg2, inWriteReg, WE, clock, writeData, read1Data, read2Data);

    -- Sign Extend
    sign_extend: ENTITY work.sign_extend(Behavior) PORT MAP (Immediate, Extended);

    -- ALU Control Unit
    ALUControl: ENTITY work.ALUControl(Behavior) PORT MAP (ALUOpType, Func, Op);

    -- Mux before ALU
    mux2: ENTITY work.mux32x2to1(Behavior) PORT MAP (read2Data, Extended, ALUSrc1, ALUIn);

    -- ALU
    ALU: ENTITY work.ALU(Behavior) PORT MAP (read1Data, ALUIn, Operation(3 DOWNTO 0), ALUOut, over, neg, zero, carry);

    -- Shift Left 2 for Sign Extended
    SL2: ENTITY work.barrel_left_test(Behavior) PORT MAP (Extended, "00010", Adder1);

    -- 32-bit Adder for ALU Result
    Adder_2: ENTITY work.full_adder32(Behavior) PORT MAP (Adder1, pcIn_out, '0', '0', over, carry, neg, zero, Adder2);

    -- AND before muxes
    AND0: ENTITY work.AND0(Behavior) PORT MAP (Branch, zero, and_out);

    -- Mux after adder
    mux3: ENTITY work.mux32x2to1(Behavior) PORT MAP (pcIn_out, Adder2, and_out, mux_out);

    -- Mux after mux
    mux4: ENTITY work.mux32x4to1(Behavior) PORT MAP (mux_out, outShift, read1Data, "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU", PCSrc, pcOut_in);

    -- Data Memory
    DataMem: ENTITY work.sram64kx8(sram_behaviour) PORT MAP ('0', ALUOut, read2Data, MemRead, MemWrite);

    -- Mux after Data Memory
    mux5: ENTITY work.mux32x4to1(Behavior) PORT MAP (ALUOut, read2Data, pcOut_in, empty, MemToReg, writeData);

END ARCHITECTURE Behavior;
