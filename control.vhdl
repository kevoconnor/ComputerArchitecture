LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY Control IS
    PORT(Operation: IN STD_LOGIC_VECTOR(31 DOWNTO 26);
	Func: IN STD_LOGIC_VECTOR(5 DOWNTO 0);
	Branch, MemRead, MemWrite, RegWrite, SignExtend,
	ALUSrc1: OUT STD_LOGIC;
	ALUSrc2, MemToReg, WriteRegDst, PCSrc,
	ALUOpType: OUT STD_LOGIC_VECTOR(1 DOWNTO 0));
END ENTITY Control;

ARCHITECTURE Behavior OF Control IS
    BEGIN
	WriteRegDst <= "00"; 	-- 00=Rt, 01=Rd, 10=R[31]
	Branch <= '0';
	PCSrc <= "00";		-- 00=PC+4 or BranchAddr, 01=Instruction or Jump, 10=First data item from register
	MemRead <= '0';
	MemWrite <= '0';
	MemToReg <= "00";	-- 00=ALU, 01=Data Memory, 10=PC
	ALUSrc1 <= '0';		-- 0=Register data item, 1=Hardcoded 4
	ALUSrc2 <= "00";	-- 00=Second register data item, 01=immediate extended, 10=shamt extended, 11=PC
	RegWrite <= '0';	
	ALUOpType <= "00";	-- 00=addition, 01=subtraction, 10=function input, 11=logical OR
	SignExtend <= '0';

	PROCESS(Operation) IS
	BEGIN	
	-- R-TYPE
	IF Operation = "000000" THEN
	    
	    IF Func = "100000" THEN			-- add
		WriteRegDst <= "01";
		RegWrite <= '1';
	    ELSIF Func = "100001" THEN			-- addu
		WriteRegDst <= "01";
		RegWrite <= '1';
		ALUOpType <= "10";
	    ELSIF Func = "001000" THEN			-- jr
		PCSrc <= "10";
	    ELSIF Func = "100111" THEN			-- nor
		WriteRegDst <= "01";
		RegWrite <= '1';
		ALUOpType <= "10";
	    ELSIF Func = "000000" THEN			-- sll
		WriteRegDst <= "01";
		ALUSrc2 <= "10";
		RegWrite <= '1';
		ALUOpType <= "10";
	    ELSIF Func = "000010" THEN			-- srl
		WriteRegDst <= "01";
		ALUSrc2 <= "10";
		RegWrite <= '1';
		ALUOpType <= "10";
	    ELSIF Func = "101010" THEN			-- slt
		WriteRegDst <= "01";
		RegWrite <= '1';
		ALUOpType <= "10";
	    ELSIF Func = "100010" THEN			-- sub
		RegWrite <= '1';
		ALUOpType <= "01";
	    ELSE						-- xor
		WriteRegDst <= "01";
		RegWrite <= '1';
		ALUOpType <= "10";
	    END IF;

	-- I-TYPE
	ELSIF Operation = "001000" THEN				-- addi
	    WriteRegDst <= "01";
	    RegWrite <= '1';
	    SignExtend <= '1';
	ELSIF Operation = "001001" THEN				-- addui
	    WriteRegDst <= "01";
	    RegWrite <= '1';
	    SignExtend <= '1';
	ELSIF Operation = "000100" THEN				-- beq
	    Branch <= '1';
	    ALUOpType <= "01";
	    SignExtend <= '1';
	ELSIF Operation = "111111" THEN				-- halt
	    RegWrite <= '0';
	ELSIF Operation = "100011" THEN				-- lw
	    MemRead <= '1';
	    MemToReg <= "01";
	    ALUSrc2 <= "01";
	    RegWrite <= '1';
	    SignExtend <= '1';
	ELSIF Operation = "101011" THEN				-- sw
	    MemWrite <= '1';
	    ALUSrc2 <= "01";
	    SignExtend <= '1';
	ELSIF Operation = "001101" THEN				-- ori
	    RegWrite <= '1';
	    ALUOpType <= "11";

	-- J-TYPE
	ELSIF Operation = "000010" THEN				-- j
	    PCSrc <= "01";
	ELSIF Operation = "000011" THEN				-- jal
	    WriteRegDst <= "10";
	    PCSrc <= "01";
	    RegWrite <= '1';
	ELSE    
	    WriteRegDst <= "10";
	    PCSrc <= "01";
	    RegWrite <= '1';
	    ALUSrc2 <= "11";
	END IF;
	END PROCESS;
END ARCHITECTURE;
