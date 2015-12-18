LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY full_adder32 IS
    PORT (i0, i1: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	add_sub, ci: IN STD_LOGIC;
	over, carry, neg, zero: OUT STD_LOGIC;
	o: OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END ENTITY full_adder32;

ARCHITECTURE Behavior OF full_adder32 IS
    SIGNAL a_s32, a_s, x0, ov : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL x1 : STD_LOGIC_VECTOR(0 TO 31);
    SIGNAL final : STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
    SIGNAL na, uadd_ov, add_ov, sub_ov : STD_LOGIC;
    BEGIN
	o0: FOR i IN 31 DOWNTO 0 GENERATE
	    a_s32(i) <= add_sub;
	END GENERATE;
	o1: ENTITY work.XOR1(Behavior) PORT MAP (i1, a_s32, x0);
	
	o1_1: ENTITY work.full_adder(Behavior) PORT MAP (x0(0), final(0), add_sub, a_s(0), ov(0));
	o1_2: FOR j IN 1 TO 30 GENERATE
	   o1_3: ENTITY work.full_adder(Behavior) PORT MAP (x0(j), final(j), ov(j-1), a_s(j), ov(j));
	END GENERATE;
	o1_4: ENTITY work.full_adder(Behavior) PORT MAP (x0(31), final(31), ov(30), a_s(31), ov(31));

	o2: ENTITY work.full_adder(Behavior) PORT MAP (i0(0), a_s(0), ci, o(0), x1(0));
	o3: FOR k IN 1 TO 30 GENERATE
	    o4: ENTITY work.full_adder(Behavior) PORT MAP (i0(k), a_s(k), x1(k-1), o(k), x1(k));
	END GENERATE;
	o5: ENTITY work.full_adder(Behavior) PORT MAP (i0(31), a_s(31), x1(30), o(31), x1(31));

	na <= (NOT x1(31)) after 5 ps;
	add_ov <= ((na AND (NOT i1(31)) AND x1(31)) OR ((x1(31) AND i1(31) AND na))) after 15 ps;
	sub_ov <= (na AND i1(31) AND x1(31)) OR (x1(31) AND (NOT i1(31)) AND na) after 15 ps;
	uadd_ov <= x1(31);
	o6: ENTITY work.mux4to1(Behavior) PORT MAP (add_ov, sub_ov, uadd_ov, uadd_ov, add_sub, ci, over);

END ARCHITECTURE Behavior;
