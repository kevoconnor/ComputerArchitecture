LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY full_adder32 IS
    PORT (i0, i1: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	add_sub, s: IN STD_LOGIC;
	over, carry, neg, zero: OUT STD_LOGIC;
	o: OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END ENTITY full_adder32;

ARCHITECTURE Behavior OF full_adder32 IS
    SIGNAL x0, x1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL na, uadd_ov, add_ov, sub_ov : STD_LOGIC;
    BEGIN
	o0: FOR i IN 0 TO 31 GENERATE
	    o1: ENTITY work.XOR0(Behavior) PORT MAP (i1(i), add_sub, x0(i));
	END GENERATE;

	o2: ENTITY work.full_adder(Behavior) PORT MAP (i0(0), x0(0), s, o(0), x1(0));
	o3: FOR j IN 1 TO 30 GENERATE
	    o4: ENTITY work.full_adder(Behavior) PORT MAP (i0(j), x0(j), x1(j-1), o(j), x1(j));
	END GENERATE;
	o5: ENTITY work.full_adder(Behavior) PORT MAP (i0(31), x0(31), x1(30), o(31), carry);

	na <= (NOT x1(31)) after 5 ps;
	add_ov <= ((na AND (NOT i1(31)) AND x1(31)) OR ((x1(31) AND i1(31) AND na))) after 15 ps;
	sub_ov <= (na AND i1(31) AND x1(31)) OR (x1(31) AND (NOT i1(31)) AND na) after 15 ps;
	uadd_ov <= x1(31);
	o6: ENTITY work.mux4to1(Behavior) PORT MAP (add_ov, sub_ov, uadd_ov, uadd_ov, add_sub, s, over);

END ARCHITECTURE Behavior;
