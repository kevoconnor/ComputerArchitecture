LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY CPU IS
END ENTITY CPU;

ARCHITECTURE Behavior OF CPU IS
    -- PC
    PC: ENTITY work.PC(Behavior) PORT MAP ();

    -- Instruction Memory
    InstructionMem: ENTITY work.sram(

    -- 32-bit Adder for PC
    Adder1: ENTITY work.32full_adder(Behavior) PORT MAP ();

    -- Shift Left 2 for PC
    SL1: ENTITY work.barrel_left(Behavior) PORT MAP ();

    -- Control Unit
    Control: ENTITY work.control(Behavior) PORT MAP ();

    -- Mux before Register File
    mux1: ENTITY work.mux2to1(Behavior) PORT MAP ();

    -- Register File
    RegFile: ENTITY work.RegFile(Behavior) PORT MAP ();

    -- Sign Extend
    SignExtend: ENTITY work.SignExtend(Behavior) PORT MAP ();

    -- ALU Control Unit
    ALUControl: ENTITY work.ALUControl(Behavior) PORT MAP ();

    -- Mux before ALU
    mux2: ENTITY work.mux2to1(Behavior) PORT MAP ();

    -- ALU
    ALU: ENTITY work.ALU(Behavior) PORT MAP ();

    -- Shift Left 2 for Sign Extended
    SL2: ENTITY work.barrel_left(Behavior) PORT MAP ();

    -- 32-bit Adder for ALU Result
    Adder2: ENTITY work.32full_adder(Behavior) PORT MAP ();

    -- AND before muxes
    AND0: ENTITY work.AND0(Behavior) PORT MAP ();

    -- Mux after adder
    mux3: ENTITY work.mux2to1(Behavior) PORT MAP ();

    -- Mux after mux
    mux4: ENTITY work.mux2to1(Behavior) PORT MAP ();

    -- Data Memory
    DataMem: ENTITY work.sram(Something) PORT MAP ();

    -- Mux after Data Memory
    mux5: ENTITY work.mux2to1(Behavior) PORT MAP ();

END ARCHITECTURE Behavior;
