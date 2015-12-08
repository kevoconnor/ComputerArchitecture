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
		CASE(Func) IS
		    WHEN "100000" =>			-- add
			Operation <= "0000";
		    WHEN "100001" =>			-- addu
			Operation <= "0001";
		    WHEN "000000" =>			-- sll
			Operation <= "0010";
		    WHEN "000010" =>			-- srl
			Operation <= "0011";
		    WHEN "100010" =>			-- sub
			Operation <= "0100";
		    WHEN "101010" =>			-- slt
			Operation <= "0101";
		    WHEN "100110" =>			-- xor
			Operation <= "1000";
		    WHEN "100111" =>			-- nor
			Operation <= "1001";
	    --WHEN "01" =>				-- Subtraction
	    --WHEN "10" =>				-- Determined by ALU
	    --WHEN "11" =>				-- Logical OR
END ARCHITECTURE Behavior;
