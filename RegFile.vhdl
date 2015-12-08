LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE work.outputs.all;

ENTITY RegFile IS
    PORT (reg1, reg2, writeReg: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	WE, clock: IN STD_LOGIC;
	writeData: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	read1Data, read2Data: OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END RegFile;

ARCHITECTURE Behavior of RegFile IS
    SIGNAL t: STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL r: mem;
BEGIN
    dec: ENTITY work.dec5to32(Behavior) PORT MAP (WE,writeReg(4),writeReg(3),writeReg(2),writeReg(1),writeReg(0),t(0),t(1),t(2),t(3),t(4),t(5),t(6),t(7),t(8),t(9),t(10),t(11),t(12),t(13),t(14),t(15),t(16),t(17),t(18),t(19),t(20),t(21),t(22),t(23),t(24),t(25),t(26),t(27),t(28),t(29),t(30),t(31));

    regs: for i IN 0 to 31 GENERATE
        reg: ENTITY work.registers(Behavior) PORT MAP (t(i), clock, writeData, r(i));
    END GENERATE;

    mux0: ENTITY work.mux32x32to1(Behavior) PORT MAP (r(0),r(1),r(2),r(3),r(4),r(5),r(6),r(7),r(8),r(9),r(10),r(11),r(12),r(13),r(14),r(15),r(16),r(17),r(18),r(19),r(20),r(21),r(22),r(23),r(24),r(25),r(26),r(27),r(28),r(29),r(30),r(31),reg1(4),reg1(3),reg1(2),reg1(1),reg1(0),read1Data);

    mux1: ENTITY work.mux32x32to1(Behavior) PORT MAP (r(0),r(1),r(2),r(3),r(4),r(5),r(6),r(7),r(8),r(9),r(10),r(11),r(12),r(13),r(14),r(15),r(16),r(17),r(18),r(19),r(20),r(21),r(22),r(23),r(24),r(25),r(26),r(27),r(28),r(29),r(30),r(31),reg2(4),reg2(3),reg2(2),reg2(1),reg2(0),read2Data);

END ARCHITECTURE Behavior;
