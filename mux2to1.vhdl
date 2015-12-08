LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY mux2to1 IS
    PORT (i0, i1, s: IN STD_LOGIC;
	o: OUT STD_LOGIC);
END ENTITY mux2to1;

ARCHITECTURE Behavior of mux2to1 IS
    SIGNAL t0,t1,s0 : STD_LOGIC:='0';
BEGIN
    s0 <= NOT s after 5 ps;
    out0: ENTITY work.AND0(Behavior) PORT MAP (i0,s0,t0);
    out1: ENTITY work.AND0(Behavior) PORT MAP (i1,s,t1);
    out2: ENTITY work.OR0(Behavior) PORT MAP (t0,t1,o);
END ARCHITECTURE Behavior;

--ARCHITECTURE rtl of mux2to1 IS
   --SIGNAL s0 : STD_LOGIC:='0';
--BEGIN
    --o <= (i0 AND s) OR (i1 AND s0);
--END ARCHITECTURE rtl;
