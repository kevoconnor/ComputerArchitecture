LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY ALU IS
    PORT(Value1, Value2: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	Operation: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	ValueOut: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	Overflow, Negative, Zero, CarryOut: OUT STD_LOGIC);
END ENTITY ALU;

ARCHITECTURE Behavior OF ALU IS
    SIGNAL add, addu, sl, sr, sub, slt, xo, no, na, comp : STD_LOGIC;
    BEGIN
        add <= '1' when Operation = "0000" else '0';
        addu <= '1' when Operation = "0001" else '0';
        sl <= '1' when Operation = "0010" else '0';
        sr <= '1' when Operation = "0011" else '0';
        sub <= '1' when Operation = "0100" else '0';
        slt <= '1' when Operation = "0101" else '0';
        xo <= '1' when Operation = "1000" else '0';
        no <= '1' when Operation = "1001" else '0';
        na <= '1' when Operation = "1010" else '0';
        comp <= '1' when Operation = "1100" else '0';
END ARCHITECTURE Behavior;
