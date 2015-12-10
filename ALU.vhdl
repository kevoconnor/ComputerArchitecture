LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY ALU IS
    PORT(Value1, Value2: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	Operation: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	ValueOut: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	Overflow, Negative, Zero, CarryOut: OUT STD_LOGIC);
END ENTITY ALU;

ARCHITECTURE Behavior OF ALU IS
    SIGNAL output, addo, sllo, srlo, subo, slto, xoro, noro, nando, noto : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL output2 : STD_LOGIC_VECTOR(4 DOWNTO 0);
    SIGNAL add_sub, s, adda, addb, slla, sllb, srla, srlb, zero : STD_LOGIC;
    BEGIN
	add_sub <= NOT Operation(0) after 5 ps;
	s <= NOT Operation(2) after 5 ps;
	zero <= '0';
	outputs: FOR i IN 0 TO 4 GENERATE
	    output2(i) <= Value2(i);
	END GENERATE;
	add: ENTITY work.full_adder32(Behavior) PORT MAP (Value1, Value2, add_sub, s, adda, addb, addo);
	shl: ENTITY work.barrel_left(Behavior) PORT MAP (Value1, Value2, sllo, slla);
	shr: ENTITY work.barrel_right(Behavior) PORT MAP (Value1, Value2, srlo, srla);
	slt: ENTITY work.slt(Behavior) PORT MAP (Value1, Value2, slto);
	x0r: ENTITY work.XOR1(Behavior) PORT MAP (Value1, Value2, xoro);
	n0r: ENTITY work.NOR1(Behavior) PORT MAP (Value1, Value2, noro);
	nan: ENTITY work.NAND1(Behavior) PORT MAP (Value1, Value2, nando);
	n0t: ENTITY work.complement(Behavior) PORT MAP (Value1, noto);

	output0: FOR i IN 0 TO 31 GENERATE
	    outputs0: ENTITY work.mux16to1(Behavior) PORT MAP ();
	END GENERATE;

	carryout: ENTITY work.mux16to1(Behavior) PORT MAP ();
	overflow: ENTITY work.mux16to1(Behavior) PORT MAP ();

	Negative <= output(31);
	output2: FOR i IN 0 TO 31 GENERATE
	    ValueOut(i) <= output(i);
	END GENERATE;
	zero: ENTITY work.zerobit(Behavior) PORT MAP (output, Zero);
END ARCHITECTURE Behavior;
