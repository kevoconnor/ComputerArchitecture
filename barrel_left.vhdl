LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY barrel_left IS
    PORT (i: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	n: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	o: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	over: OUT STD_LOGIC);
END ENTITY barrel_left;

ARCHITECTURE Behavior OF barrel_left IS
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
	mux1: ENTITY work.mux2to1(Behavior) PORT MAP (i(0), c, n(1), t1(0));
	mux2: ENTITY work.mux2to1(Behavior) PORT MAP (i(1), c, n(1), t1(1));
	outputs1: FOR j IN 2 TO 31 GENERATE
	    n1: ENTITY work.mux2to1(Behavior) PORT MAP (i(j), i(j-2), n(1), t1(j));
	END GENERATE;
	over1: ENTITY work.mux2to1(Behavior) PORT MAP (c, i(30), n(1), ov(1));
	over2: ENTITY work.mux2to1(Behavior) PORT MAP (c, i(31), n(1), ov(2));

	--IF % 4
	mux3: FOR j IN 0 TO 3 GENERATE
	    n2_0: ENTITY work.mux2to1(Behavior) PORT MAP (i(j), c, n(2), t2(j));
	END GENERATE;

	outputs2: FOR j IN 4 TO 31 GENERATE
	    n2: ENTITY work.mux2to1(Behavior) PORT MAP (i(j), i(j-4), n(2), t2(j));
	END GENERATE;

	over3: ENTITY work.mux2to1(Behavior) PORT MAP (c, i(28), n(2), ov(3));
	over4: ENTITY work.mux2to1(Behavior) PORT MAP (c, i(29), n(2), ov(4));
	over5: ENTITY work.mux2to1(Behavior) PORT MAP (c, i(30), n(2), ov(5));
	over6: ENTITY work.mux2to1(Behavior) PORT MAP (c, i(31), n(2), ov(6)); 

	--IF % 8
	mux4: FOR j IN 0 DOWNTO 7 GENERATE
	    n3_0: ENTITY work.mux2to1(Behavior) PORT MAP (i(j), c, n(3), t3(j));
	END GENERATE;

	outputs3: FOR j IN 8 TO 31 GENERATE
	    n3: ENTITY work.mux2to1(Behavior) PORT MAP (i(j), i(j-8), n(3), t3(j));
	END GENERATE;

	over7: ENTITY work.mux2to1(Behavior) PORT MAP (c, i(24), n(1), ov(7));
	over8: ENTITY work.mux2to1(Behavior) PORT MAP (c, i(25), n(1), ov(8));
	over9: ENTITY work.mux2to1(Behavior) PORT MAP (c, i(26), n(1), ov(9));
	over10: ENTITY work.mux2to1(Behavior) PORT MAP (c, i(27), n(1), ov(10));
	over11: ENTITY work.mux2to1(Behavior) PORT MAP (c, i(28), n(1), ov(11));
	over12: ENTITY work.mux2to1(Behavior) PORT MAP (c, i(29), n(1), ov(12));
	over13: ENTITY work.mux2to1(Behavior) PORT MAP (c, i(30), n(1), ov(13));
	over14: ENTITY work.mux2to1(Behavior) PORT MAP (c, i(31), n(1), ov(14));

	--IF % 16
	mux5: FOR j IN 0 TO 15 GENERATE
	    n4_0: ENTITY work.mux2to1(Behavior) PORT MAP (i(j), c, n(4), o(j));
	END GENERATE;

	outputs4: FOR j IN 16 TO 31 GENERATE
	    n4: ENTITY work.mux2to1(Behavior) PORT MAP (i(j), i(j-16), n(4), o(j));
	END GENERATE;

	over15: ENTITY work.mux2to1(Behavior) PORT MAP (c, i(16), n(1), ov(15));
        over16: ENTITY work.mux2to1(Behavior) PORT MAP (c, i(17), n(1), ov(16));
        over17: ENTITY work.mux2to1(Behavior) PORT MAP (c, i(18), n(1), ov(17));
        over18: ENTITY work.mux2to1(Behavior) PORT MAP (c, i(19), n(1), ov(18));
        over19: ENTITY work.mux2to1(Behavior) PORT MAP (c, i(20), n(1), ov(19));
        over20: ENTITY work.mux2to1(Behavior) PORT MAP (c, i(21), n(1), ov(20));
        over21: ENTITY work.mux2to1(Behavior) PORT MAP (c, i(22), n(1), ov(21));
        over22: ENTITY work.mux2to1(Behavior) PORT MAP (c, i(23), n(1), ov(22));
	over23: ENTITY work.mux2to1(Behavior) PORT MAP (c, i(24), n(1), ov(23));
        over24: ENTITY work.mux2to1(Behavior) PORT MAP (c, i(25), n(1), ov(24));
        over25: ENTITY work.mux2to1(Behavior) PORT MAP (c, i(26), n(1), ov(25));
        over26: ENTITY work.mux2to1(Behavior) PORT MAP (c, i(27), n(1), ov(26));
        over27: ENTITY work.mux2to1(Behavior) PORT MAP (c, i(28), n(1), ov(27));
        over28: ENTITY work.mux2to1(Behavior) PORT MAP (c, i(29), n(1), ov(28));
        over29: ENTITY work.mux2to1(Behavior) PORT MAP (c, i(30), n(1), ov(29));
        over30: ENTITY work.mux2to1(Behavior) PORT MAP (c, i(31), n(1), ov(30));

	o0(0) <= ov(0) or ov(1) after 5 ps;
	o0(1) <= ov(2) or ov(3) after 5 ps;
	o0(2) <= ov(4) or ov(5) after 5 ps;
	o0(3) <= ov(6) or ov(7) after 5 ps;
	o0(4) <= ov(8) or ov(9) after 5 ps;
	o0(5) <= ov(10) or ov(11) after 5 ps;
	o0(6) <= ov(12) or ov(13) after 5 ps;
	o0(7) <= ov(14) or ov(15) after 5 ps;
	o0(8) <= ov(16) or ov(17) after 5 ps;
	o0(9) <= ov(18) or ov(19) after 5 ps;
	o0(10) <= ov(20) or ov(21) after 5 ps;
	o0(11) <= ov(22) or ov(23) after 5 ps;
	o0(12) <= ov(24) or ov(25) after 5 ps;
	o0(13) <= ov(26) or ov(27) after 5 ps;
	o0(14) <= ov(28) or ov(29) after 5 ps;
	o0(15) <= ov(30) or ov(31) after 5 ps;
	o1(0) <= o0(0) or o0(1) after 5 ps;
	o1(1) <= o0(2) or o0(3) after 5 ps;
	o1(2) <= o0(4) or o0(5) after 5 ps;
	o1(3) <= o0(6) or o0(7) after 5 ps;
	o1(4) <= o0(8) or o0(9) after 5 ps;
	o1(5) <= o0(10) or o0(11) after 5 ps;
	o1(6) <= o0(12) or o0(13) after 5 ps;
	o1(7) <= o0(14) or o0(15) after 5 ps;
	o2(0) <= o1(0) or o1(1) after 5 ps;
	o2(1) <= o1(2) or o1(3) after 5 ps;
	o2(2) <= o1(4) or o1(5) after 5 ps;
	o2(3) <= o1(6) or o1(7) after 5 ps;
	o3(0) <= o2(0) or o2(1) after 5 ps;
	o3(1) <= o2(2) or o2(3) after 5 ps;
	over <= o3(0) or o3(1) after 5 ps;

END ARCHITECTURE Behavior;
