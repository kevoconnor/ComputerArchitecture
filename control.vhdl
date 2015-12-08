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

	CASE(Operation) IS

	    -- R-TYPE
	    WHEN "000000" =>
		CASE(Func) IS
		    WHEN "100000" =>			-- add
			WriteRegDst <= "01";
			RegWrite <= '1';
		    WHEN "100001" =>			-- addu
			WriteRegDst <= "01";
			RegWrite <= '1';
			ALUOpType <= "10";
		    WHEN "001000" =>			-- jr
			PCSrc <= "10";
		    WHEN "100111" =>			-- nor
			WriteRegDst <= "01";
			RegWrite <= '1';
			ALUOpType <= "10"
		    WHEN "000000" =>			-- sll
			WriteRegDst <= "01";
			ALUSrc2 <= "10";
			RegWrite <= '1';
			ALUOpType <= "10";
		    WHEN "000010" =>			-- srl
			WriteRegDst <= "01";
			ALUSrc2 <= "10";
			RegWrite <= '1';
			ALUOpType <= "10";
		    WHEN "101010" =>			-- slt
			WriteRegDst <= "01";
			RegWrite <= '1';
			ALUOpType <= "10";
		    WHEN "100010" =>			-- sub
			RegWrite <= '1';
			ALUOpType <= "01";
		    WHEN "100110" =>			-- xor
			WriteRegDst <= "01";
			RegWrite <= '1';
			ALUOpType <= "10";
		END CASE;

	    -- I-TYPE
	    WHEN "001000" =>				-- addi
		WriteRegDst <= "01";
		RegWrite <= '1';
		SignExtend <= '1';
	    WHEN "001001" =>				-- addui
		WriteRegDst <= "01";
		RegWrite <= '1';
		SignExtend <= '1';
	    WHEN "000100" =>				-- beq
		Branch <= '1';
		ALUOpType <= "01";
		SignExtend <= '1';
	    WHEN "111111" =>				-- halt
		RegWrite <= '0';
	    WHEN "100011" =>				-- lw
		MemRead <= '1';
		MemToReg <= "01";
		ALUSrc2 <= "01";
		RegWrite <= '1';
		SignExtend <= '1';
	    WHEN "101011" =>				-- sw
		MemWrite <= '1';
		ALUSrc2 <= "01";
		SignExtend <= '1';
	    WHEN "001101" =>				-- ori
		RegWrite <= '1';
		ALUOpType <= "11";

	    -- J-TYPE
	    WHEN "000010" =>				-- j
		PCSrc <= "01";
	    WHEN "000011" =>				-- jal
		WriteRegDst <= "10";
		PCSrc <= "01";
		RegWrite <= '1';
		ALUSrc2 <= "11";
	END CASE;

END ARCHITECTURE;
