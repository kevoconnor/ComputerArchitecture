LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY barrel_left_test IS
    PORT (i: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	n: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	o: OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
	--over: OUT STD_LOGIC);
END ENTITY barrel_left_test;

ARCHITECTURE Behavior OF barrel_left_test IS
    SIGNAL t0,t1,t2,t3 : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL ov : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL o0 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL o1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL o2 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL o3 : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL c : STD_LOGIC := '0';
    BEGIN 
	--IF % 1
	mux0: ENTITY work.mux2to1(Behavior) PORT MAP (i(0), c, n(0), t0(0));
	outputs0: FOR j IN 1 TO 31 GENERATE
	    n0: ENTITY work.mux2to1(Behavior) PORT MAP (i(j), i(j-1), n(0), t0(j));
	END GENERATE;
	over0: ENTITY work.mux2to1(Behavior) PORT MAP (c, i(31), n(0), ov(0));
	
	--IF % 2
	mux1: ENTITY work.mux2to1(Behavior) PORT MAP (t0(0), c, n(1), t1(0));
	mux2: ENTITY work.mux2to1(Behavior) PORT MAP (t0(1), c, n(1), t1(1));
	outputs1: FOR j IN 2 TO 31 GENERATE
	    n1: ENTITY work.mux2to1(Behavior) PORT MAP (t0(j), t0(j-2), n(1), t1(j));
	END GENERATE;
	over1: ENTITY work.mux2to1(Behavior) PORT MAP (c, t0(30), n(1), ov(1));
	over2: ENTITY work.mux2to1(Behavior) PORT MAP (c, t0(31), n(1), ov(2));

	--IF % 4
	mux3: FOR j IN 0 TO 3 GENERATE
	    mux4: ENTITY work.mux2to1(Behavior) PORT MAP (t1(j), c, n(2), t2(j));
	END GENERATE;
	mux5: FOR j IN 4 TO 31 GENERATE
	    mux6: ENTITY work.mux2to1(Behavior) PORT MAP (t1(j), t1(j-4), n(2), t2(j));
	END GENERATE;
	over3: ENTITY work.mux2to1(Behavior) PORT MAP (c, t1(28), n(2), ov(3));
	over4: ENTITY work.mux2to1(Behavior) PORT MAP (c, t1(29), n(2), ov(4));
	over5: ENTITY work.mux2to1(Behavior) PORT MAP (c, t1(30), n(2), ov(5));
	over6: ENTITY work.mux2to1(Behavior) PORT MAP (c, t1(31), n(2), ov(6));

	--IF % 8
	mux7: FOR j IN 0 TO 7 GENERATE
	    mux8: ENTITY work.mux2to1(Behavior) PORT MAP (t2(j), c, n(3), t3(j));
	END GENERATE;
	mux9: FOR j IN 8 TO 31 GENERATE
	    mux10: ENTITY work.mux2to1(Behavior) PORT MAP (t2(j), t2(j-8), n(3), t3(j));
	END GENERATE;
	over7: ENTITY work.mux2to1(Behavior) PORT MAP (c, t1(24), n(3), ov(7));
	over8: ENTITY work.mux2to1(Behavior) PORT MAP (c, t1(25), n(3), ov(8));
	over9: ENTITY work.mux2to1(Behavior) PORT MAP (c, t1(26), n(3), ov(9));
	over10: ENTITY work.mux2to1(Behavior) PORT MAP (c, t1(27), n(3), ov(10));
	over11: ENTITY work.mux2to1(Behavior) PORT MAP (c, t1(28), n(3), ov(11));
	over12: ENTITY work.mux2to1(Behavior) PORT MAP (c, t1(29), n(3), ov(12));
	over13: ENTITY work.mux2to1(Behavior) PORT MAP (c, t1(30), n(3), ov(13));
	over14: ENTITY work.mux2to1(Behavior) PORT MAP (c, t1(31), n(3), ov(14));

	--IF % 16
	mux11: FOR j IN 0 TO 15 GENERATE
	    mux12: ENTITY work.mux2to1(Behavior) PORT MAP (t3(j), c, n(4), o(j));
	END GENERATE;
	mux13: FOR j IN 16 TO 31 GENERATE
	    mux14: ENTITY work.mux2to1(Behavior) PORT MAP (t3(j), t3(j-16), n(4), o(j));
	END GENERATE;

END ARCHITECTURE Behavior;
