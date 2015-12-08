LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY five2thirtytwo_tb IS
END five2thirtytwo_tb;

ARCHITECTURE test OF five2thirtytwo_tb IS
    SIGNAL i,s4,s3,s2,s1,s0,o0,o1,o2,o3,o4,o5,o6,o7,o8,o9,o10,o11,o12,o13,o14,o15,o16,o17,o18,o19,o20,o21,o22,o23,o24,o25,o26,o27,o28,o29,o30,o31: STD_LOGIC;
BEGIN
    mux_0: ENTITY work.dec5to32(Behavior) PORT MAP (i,s4,s3,s2,s1,s0,o0,o1,o2,o3,o4,o5,o6,o7,o8,o9,o10,o11,o12,o13,o14,o15,o16,o17,o18,o19,o20,o21,o22,o23,o24,o25,o26,o27,o28,o29,o30,o31);
    --mux_1: ENTITY work.mux2to1(rtl) PORT MAP (i0, i1, s, o2);

    PROCESS
	TYPE pattern_type IS RECORD
	    i,s4,s3,s2,s1,s0: STD_LOGIC;
	    o0,o1,o2,o3,o4,o5,o6,o7,o8,o9,o10,o11,o12,o13,o14,o15,o16,o17,o18,o19,o20,o21,o22,o23,o24,o25,o26,o27,o28,o29,o30,o31: STD_LOGIC;
	END RECORD;
	TYPE pattern_array IS ARRAY (NATURAL RANGE <>) OF pattern_type;
	CONSTANT patterns: pattern_array :=
	    (('1','0','0','0','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
	    ('1','0','0','0','0','1','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
	    ('1','0','0','0','1','0','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
	    ('1','0','0','0','1','1','0','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
	    ('1','0','0','1','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
	    ('1','0','0','1','0','1','0','0','0','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
	    ('1','0','0','1','1','0','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
	    ('1','0','0','1','1','1','0','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
	    ('1','0','1','0','0','0','0','0','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
	    ('1','0','1','0','0','1','0','0','0','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
	    ('1','0','1','0','1','0','0','0','0','0','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
	    ('1','0','1','0','1','1','0','0','0','0','0','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
	    ('1','0','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
	    ('1','0','1','1','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
	    ('1','0','1','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
	    ('1','0','1','1','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
	    ('1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
	    ('1','1','0','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
	    ('1','1','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0'),
	    ('1','1','0','0','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0'),
	    ('1','1','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','0','0','0'),
	    ('1','1','0','1','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','0','0'),
	    ('1','1','0','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','0'),
	    ('1','1','0','1','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0'),
	    ('1','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','0','0','0','0','0','0','0'),
	    ('1','1','1','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','0','0','0','0','0','0'),
	    ('1','1','1','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','0','0','0','0','0'),
	    ('1','1','1','0','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','0','0','0','0'),
	    ('1','1','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','0','0','0'),
	    ('1','1','1','1','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','0','0'),
	    ('1','1','1','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','0'),
	    ('1','1','1','1','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1'));
    BEGIN
      --  Check each pattern.
      for j in patterns'range loop
	  --  Set the inputs.
	  i <= patterns(j).i;
	  s0 <= patterns(j).s0;
	  s1 <= patterns(j).s1;
	  s2 <= patterns(j).s2;
	  s3 <= patterns(j).s3;
	  s4 <= patterns(j).s4;
	  --  Wait for the results.
	  wait for 1 ns;
	  --  Check the outputs.
	  assert o0 = patterns(j).o0
	    report "bad Behavior output value" severity error;
	  assert o1 = patterns(j).o1
	    report "bad Behavior output value" severity error;
	  assert o2 = patterns(j).o2
	    report "bad Behavior output value" severity error;
	  assert o3 = patterns(j).o3
	    report "bad Behavior output value" severity error;
	  assert o4 = patterns(j).o4
	    report "bad Behavior output value" severity error;
	  assert o5 = patterns(j).o5
	    report "bad Behavior output value" severity error;
	  assert o6 = patterns(j).o6
	    report "bad Behavior output value" severity error;
	  assert o7 = patterns(j).o7
	    report "bad Behavior output value" severity error;
	  assert o8 = patterns(j).o8
	    report "bad Behavior output value" severity error;
	  assert o9 = patterns(j).o9
	    report "bad Behavior output value" severity error;
	  assert o10 = patterns(j).o10
	    report "bad Behavior output value" severity error;
	  assert o11 = patterns(j).o11
	    report "bad Behavior output value" severity error;
	  assert o12 = patterns(j).o12
	    report "bad Behavior output value" severity error;
	  assert o13 = patterns(j).o13
	    report "bad Behavior output value" severity error;
	  assert o14 = patterns(j).o14
	    report "bad Behavior output value" severity error;
	  assert o15 = patterns(j).o15
	    report "bad Behavior output value" severity error;
	  assert o16 = patterns(j).o16
	    report "bad Behavior output value" severity error;
	  assert o17 = patterns(j).o17
	    report "bad Behavior output value" severity error;
	  assert o18 = patterns(j).o18
	    report "bad Behavior output value" severity error;
	  assert o19 = patterns(j).o19
	    report "bad Behavior output value" severity error;
	  assert o20 = patterns(j).o20
	    report "bad Behavior output value" severity error;
	  assert o21 = patterns(j).o21
	    report "bad Behavior output value" severity error;
	  assert o22 = patterns(j).o22
	    report "bad Behavior output value" severity error;
	  assert o23 = patterns(j).o23
	    report "bad Behavior output value" severity error;
	  assert o24 = patterns(j).o24
	    report "bad Behavior output value" severity error;
	  assert o25 = patterns(j).o25
	    report "bad Behavior output value" severity error;
	  assert o26 = patterns(j).o26
	    report "bad Behavior output value" severity error;
	  assert o27 = patterns(j).o27
	    report "bad Behavior output value" severity error;
	  assert o28 = patterns(j).o28
	    report "bad Behavior output value" severity error;
	  assert o29 = patterns(j).o29
	    report "bad Behavior output value" severity error;
	  assert o30 = patterns(j).o30
	    report "bad Behavior output value" severity error;
	  assert o31 = patterns(j).o31
	    report "bad Behavior output value" severity error;
	  --assert o2 = patterns(i).o
	    --report "bad rtl output value" severity error;
      end loop;
      assert false report "end of test" severity note;
      --  Wait forever; this will finish the simulation.
      wait;
    END PROCESS;
END test;
