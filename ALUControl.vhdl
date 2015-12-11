LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY ALUControl IS
    PORT(OpType: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	Func: IN STD_LOGIC_VECTOR(5 DOWNTO 0);
	Operation: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END ALUControl;

ARCHITECTURE Behavior OF ALUControl IS
    BEGIN
	CASE(OpType) IS
	    WHEN "00" =>				-- Addition
		Operation <= "0000";			-- add
	    WHEN "01" =>				-- Subtraction
		Operation <= "0100";			-- sub
	    WHEN "10" =>				-- Determined by ALU
		CASE(Func) IS
		    WHEN "100001" =>			-- addu
			Operation <= "0001";
		    WHEN "000000" =>			-- sll
			Operation <= "0010";
		    WHEN "000010" =>			-- srl
			Operation <= "0011";
		    WHEN "101010" =>			-- slt
			Operation <= "0101";
		    WHEN "100110" =>			-- xor
			Operation <= "1000";
		END CASE;
	    WHEN "11" =>				-- Logical OR
		Operation <= "1001";			-- nor
		
END ARCHITECTURE Behavior;
