LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Displays
ENTITY exerc4 IS
PORT (		CLOCK_50: IN STD_LOGIC;
            HEX3_D : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
            HEX2_D: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
            HEX1_D: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
            HEX0_D: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));  
END exerc4;

ARCHITECTURE Behavior OF exerc4 IS

SIGNAL bitClockCounter: INTEGER RANGE 0 TO 50000000;
SIGNAL CLK_INTERNO: STD_LOGIC;

BEGIN

--                  ---0---
--                 -      -
--                5-      -1
--                 ---6---
--                -      -
--               4-      -2
--               ---3----
--
--	 BITS  -->CARACTERES
-- 6543210 
--
-- 1000000 --> 0
-- 1111001 --> 1
-- 0100100 --> 2
-- 0110000 --> 3
-- 0011001 --> 4
-- 0010010 --> 5
-- 0000010 --> 6
-- 1111000 --> 7
-- 0000000 --> 8
-- 0011000 --> 9
-- 0001000 --> A
-- 0000011 --> b
-- 1000110 --> C
-- 0100001 --> d
-- 0001110 --> F

process(CLOCK_50)-- CLOCK_50/ 50000000 =~ 1Hz
	begin
		if CLOCK_50'event and CLOCK_50 = '1' then
			if bitClockCounter < 25000000 then					
				CLK_INTERNO <= '0'; 
				bitClockCounter <= bitClockCounter + 1;
			elsif bitClockCounter >= 25000000 and bitClockCounter < 50000000 then 
				CLK_INTERNO <= '1'; 								
				bitClockCounter <= bitClockCounter + 1;
			else
				CLK_INTERNO <= '0'; 
				bitClockCounter <= 0;
			end if;
		end if;

end process;


PROCESS (CLOCK_50)

VARIABLE CONT: INTEGER RANGE 0 TO 10 :=0;
BEGIN

	IF CLK_INTERNO'event and CLK_INTERNO='1'  THEN

		IF CONT < 10 THEN
		  CONT := CONT+1;
		 ELSE CONT := 1;
		END IF;

		CASE CONT IS 
		when 0 => HEX3_D <= "1111111"; HEX2_D <= "1111111"; HEX1_D <= "1111111"; HEX0_D <= "1111111";
		when 1 => HEX3_D <= "1111111"; HEX2_D <= "1111111"; HEX1_D <= "1111111"; HEX0_D <= "1000000";
		when 2 => HEX3_D <= "1111111"; HEX2_D <= "1111111"; HEX1_D <= "1000000"; HEX0_D <= "1111001";
		when 3 => HEX3_D <= "1111111"; HEX2_D <= "1000000"; HEX1_D <= "1111001"; HEX0_D <= "0100100";
		when 4 => HEX3_D <= "1000000"; HEX2_D <= "1111001"; HEX1_D <= "0100100"; HEX0_D <= "0110000";
		when 5 => HEX3_D <= "1111001"; HEX2_D <= "0100100"; HEX1_D <= "0110000"; HEX0_D <= "0011001";
		when 6 => HEX3_D <= "0100100"; HEX2_D <= "0110000"; HEX1_D <= "0011001"; HEX0_D <= "0010010";
		when 7 => HEX3_D <= "0110000"; HEX2_D <= "0011001"; HEX1_D <= "0010010"; HEX0_D <= "0000010";
		when 8 => HEX3_D <= "0011001"; HEX2_D <= "0010010"; HEX1_D <= "0000010"; HEX0_D <= "1111000";
		when 9 => HEX3_D <= "0010010"; HEX2_D <= "0000010"; HEX1_D <= "1111000"; HEX0_D <= "0000000";
		when 10 => HEX3_D <= "0000010"; HEX2_D <= "1111000"; HEX1_D <= "0000000"; HEX0_D <= "0011000";
		when others => HEX3_D <= "1111111"; HEX2_D <= "1111111"; HEX1_D <= "1111111"; HEX0_D <= "1111111";
		END CASE;
	 
	END IF;

END PROCESS;

END Behavior;
