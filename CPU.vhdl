LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY CPU IS
END ENTITY CPU;

ARCHITECTURE Behavior OF CPU IS

    SIGNAL clock : STD_LOGIC := '0';
    SIGNAL WE : STD_LOGIC := '1';
    SIGNAL PCIn, PCOut : STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
    SIGNAL four : STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000100";
    SIGNAL over, neg, zero, carry : STD_LOGIC;
    SIGNAL Instruction : STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
    SIGNAL Operation : STD_LOGIC_VECTOR(5 DOWNTO 0);
    SIGNAL Reg1, Reg2, Reg3, inWriteReg : STD_LOGIC_VECTOR(4 DOWNTO 0);
    SIGNAL Shamt : STD_LOGIC_VECTOR(4 DOWNTO 0);
    SIGNAL Func : STD_LOGIC_VECTOR(5 DOWNTO 0);
    SIGNAL Immediate : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL JumpVal : STD_LOGIC_VECTOR(25 DOWNTO 0);
    SIGNAL JumpAddr, BranchAddr, PC4Branch : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL Branch, MemRead, MemWrite, RegWrite, SignExtend, ALUSrc1 : STD_LOGIC;
    SIGNAL ALUSrc2, MemToReg, WriteRegDst, PCSrc, ALUOpType : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL Op : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL s0, s1 : STD_LOGIC := '1';
    SIGNAL Extended, ShamtExtended : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL writeData, read1Data, read2Data : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL ALUIn1, ALUIn2, ALUOut : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL Adder1, Adder2 : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL mux_out : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL and_out : STD_LOGIC;
    SIGNAL MemData : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL empty : STD_LOGIC_VECTOR(31 DOWNTO 0) := "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU";

    BEGIN
    clock <= NOT clock after 500 ps;
    -- PC
    PC: ENTITY work.single_reg(Behavior) PORT MAP (WE, clock, PCIn, PCOut);
    
    -- 32-bit Adder for PC
    Adder_1: ENTITY work.full_adder32(Behavior) PORT MAP (PCOut, four, '0', '0', over, neg, zero, carry, PCIn);

    -- Instruction Memory
    InstructionMem: ENTITY work.sram64kx8(sram_behaviour) PORT MAP ('0', PCOut, Instruction, '1', clock);
    Operation <= Instruction(31 DOWNTO 26);
    Reg1 <= Instruction(25 DOWNTO 21);
    Reg2 <= Instruction(20 DOWNTO 16);
    Reg3 <= Instruction(15 DOWNTO 11);
    Immediate <= Instruction(15 DOWNTO 0);
    JumpVal <= Instruction(25 DOWNTO 0);
    Shamt <= Instruction(10 DOWNTO 6);
    Func <= Instruction(5 DOWNTO 0);

    -- Sign Extend
    sign_extend: ENTITY work.sign_extend(Behavior) PORT MAP (Immediate, s0, Extended);

    -- Shift Extend
    shift_extend: ENTITY work.shift_extend(Behavior) PORT MAP (Shamt, ShamtExtended);

    -- Jump and Branch Addresses
    JumpAddr <= PCIn(31 DOWNTO 28) & JumpVal & "00";

    -- Control Unit
    Control: ENTITY work.control(Behavior) PORT MAP (Operation, Func, Branch, MemRead, MemWrite, RegWrite, SignExtend, ALUSrc1, ALUSrc2, MemToReg, WriteRegDst, PCSrc, ALUOpType);

    -- Mux before Register File
    mux1: ENTITY work.mux5x4to1(Behavior) PORT MAP (Reg3, Reg2, "11111", "UUUUU", WriteRegDst, inWriteReg);

    -- Register File
    RegFile: ENTITY work.RegFile(Behavior) PORT MAP (Reg1, Reg2, inWriteReg, WE, clock, writeData, read1Data, read2Data);

    -- ALU Control Unit
    ALUControl: ENTITY work.ALUControl(Behavior) PORT MAP (ALUOpType, Func, Op);

    -- Muxes before ALU
    mux2: ENTITY work.mux32x2to1(Behavior) PORT MAP (read1Data, four, ALUSrc1, ALUIn1);
    mux3: ENTITY work.mux32x4to1(Behavior) PORT MAP (read2Data, Extended, ShamtExtended, PCOut,ALUSrc2, ALUIn2);

    -- ALU
    ALU: ENTITY work.ALU(Behavior) PORT MAP (ALUIn1, ALUIn2, Operation(3 DOWNTO 0), ALUOut, over, neg, zero, carry);

    -- PC + 4 + BranchAddr
    BranchAddr <= Extended(29 DOWNTO 0) & "00";
    pcbranch: ENTITY work.full_adder32(Behavior) PORT MAP (PCIn, BranchAddr, '0', '1', over, neg, zero, carry, PC4Branch);

    -- 32-bit Adder for ALU Result
    Adder_2: ENTITY work.full_adder32(Behavior) PORT MAP (PC4Branch, PCIn, '0', '0', over, carry, neg, zero, Adder2);

    -- AND before muxes
    AND0: ENTITY work.AND0(Behavior) PORT MAP (Branch, zero, and_out);

    -- Mux after adder
    mux4: ENTITY work.mux32x2to1(Behavior) PORT MAP (PCIn, Adder2, and_out, mux_out);

    -- Mux after mux
    mux5: ENTITY work.mux32x4to1(Behavior) PORT MAP (mux_out, JumpAddr, read1Data, "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU", PCSrc, PCOut);

    -- Tri-state
    tristate: ENTITY work.tristate(Behavior) PORT MAP (read2Data, s1, MemData);

    -- Data Memory
    DataMem: ENTITY work.sram64kx8(sram_behaviour) PORT MAP ('0', ALUOut, MemData, MemRead, MemWrite);

    -- Mux after Data Memory
    mux6: ENTITY work.mux32x4to1(Behavior) PORT MAP (ALUOut, read2Data, pcOut, empty, MemToReg, writeData);

END ARCHITECTURE Behavior;
