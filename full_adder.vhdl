LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY full_adder IS
    PORT (i0, i1, ci: IN STD_LOGIC;
	s, co: OUT STD_LOGIC);
END ENTITY full_adder;

ARCHITECTURE Behavior OF full_adder IS
    SIGNAL t0, t1, t2 : STD_LOGIC := '0';
    BEGIN
	o0: ENTITY work.XOR0(Behavior) PORT MAP (i0,i1,t0);
	o1: ENTITY work.AND0(Behavior) PORT MAP (i0,i1,t1);
	o2: ENTITY work.AND0(Behavior) PORT MAP (t0,ci,t2);
	o3: ENTITY work.OR0(Behavior) PORT MAP (t1,t2,co);
	o4: ENTITY work.XOR0(Behavior) PORT MAP (t0,ci,s);
END ARCHITECTURE Behavior;
