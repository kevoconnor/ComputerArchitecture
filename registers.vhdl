LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE work.outputs.all;

ENTITY registers IS
    PORT (WE, clock: IN STD_LOGIC;
        writeData: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        read1Data: OUT out1);
END ENTITY registers;

ARCHITECTURE Behavior of registers IS
    BEGIN
    regs: for i IN 0 to 31 GENERATE
        reg: ENTITY work.edge_dff(Behavior) PORT MAP (WE, writeData(i), clock, read1Data(i));
    END GENERATE;
END ARCHITECTURE Behavior;

LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY single_reg IS
    PORT (WE, clock: IN STD_LOGIC;
	writeData: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	read1Data: OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END ENTITY single_reg;

ARCHITECTURE Behavior OF single_reg IS
    BEGIN
	reg: FOR i IN 0 TO 31 GENERATE
	    reg: ENTITY work.edge_dff(Behavior) PORT MAP (WE, writeData(i), clock, read1Data(i));
	END GENERATE;
END ARCHITECTURE Behavior;
