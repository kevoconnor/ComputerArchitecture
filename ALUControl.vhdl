LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY ALUControl IS
    PORT(OpType: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	Func: IN STD_LOGIC_VECTOR(5 DOWNTO 0);
	Operation: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END ALUControl;

ARCHITECTURE Behavior OF ALUControl IS
    BEGIN
	PROCESS (OpType, Func) IS
	BEGIN
	IF OpType = "00" THEN				-- Addition
	    Operation <= "0000";
	ELSIF OpType = "01" THEN			-- Subtraction
	    Operation <= "0100";
	ELSIF OpType = "10" THEN			-- Determined by ALU
	    IF Func = "100001" THEN			-- addu
		Operation <= "0001";
	    ELSIF Func = "000000" THEN
		Operation <= "0010";
	    ELSIF Func = "000010" THEN
		Operation <= "0011";
	    ELSIF Func = "101010" THEN
		Operation <= "0101";
	    ELSIF Func = "100110" THEN
		Operation <= "1000";
	    ELSE 
		Operation <= "1111";
	    END IF;
	ELSE						-- Logical OR
	    Operation <= "1001";
	END IF;
	END PROCESS;
		
END ARCHITECTURE Behavior;
