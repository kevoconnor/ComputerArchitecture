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
    SIGNAL add_sub, ci, adda, addb, addc, addd, slla, sllb, srla, srlb, zero0 : STD_LOGIC;
    SIGNAL empty : STD_LOGIC := 'U';

    BEGIN
	add_sub <= NOT Operation(0) after 5 ps;
	ci <= NOT Operation(2) after 5 ps;
	zero0 <= '0';
	outputs0: FOR i IN 0 TO 4 GENERATE
	    output2(i) <= Value2(i);
	END GENERATE;
	add: ENTITY work.full_adder32(Behavior) PORT MAP (Value1, Value2, add_sub, ci, adda, addb, addc, addd, addo);
	shl: ENTITY work.barrel_left_test(Behavior) PORT MAP (Value1, Value2(4 DOWNTO 0), sllo);
	shr: ENTITY work.barrel_right_test(Behavior) PORT MAP (Value1, Value2(4 DOWNTO 0), srlo);
	slt: ENTITY work.slt(Behavior) PORT MAP (Value1, Value2, slto);
	x0r: ENTITY work.XOR1(Behavior) PORT MAP (Value1, Value2, xoro);
	n0r: ENTITY work.NOR1(Behavior) PORT MAP (Value1, Value2, noro);
	nan: ENTITY work.NAND1(Behavior) PORT MAP (Value1, Value2, nando);
	n0t: ENTITY work.complement(Behavior) PORT MAP (Value1, noto);

	outputs1: FOR i IN 0 TO 31 GENERATE
	    outputs0_1: ENTITY work.mux16to1(Behavior) PORT MAP (addo(i),addo(i),sllo(i),srlo(i),addo(i),slto(i),empty,empty,xoro(i),noro(i),nando(i),empty,noto(i),empty,empty,empty,Operation(3),Operation(2),Operation(1),Operation(0),output(i));
	END GENERATE;

	--carryout: ENTITY work.mux16to1(Behavior) PORT MAP ();
	CarryOut <= '0';
	--overflow: ENTITY work.mux16to1(Behavior) PORT MAP ();
	Overflow <= '0';

	Negative <= output(31);
	outputs2: FOR i IN 0 TO 31 GENERATE
	    ValueOut(i) <= output(i);
	END GENERATE;
	zeroout: ENTITY work.zerobit(Behavior) PORT MAP (output, Zero);
	
END ARCHITECTURE Behavior;
