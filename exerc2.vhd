LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;


ENTITY exerc2 IS
PORT (  CLOCK_50: IN STD_LOGIC;
		SW : IN STD_LOGIC_VECTOR(9 DOWNTO 0); --interruptores
		LEDG : OUT STD_LOGIC_VECTOR(9 DOWNTO 0):="0000000000"); -- LEDs 
END exerc2;

ARCHITECTURE Behavior OF exerc2 IS

SIGNAL bitClockCounter: INTEGER RANGE 0 TO 50000000;
SIGNAL CLK_INTERNO: STD_LOGIC;
SIGNAL CONT: INTEGER RANGE 0 TO 7 :=0;

BEGIN
---------CLOCK PLL------------------------------------------------------
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

---------CONTADOR--------------------------------------------------------
PROCESS(CLK_INTERNO)
BEGIN
	
	if CLK_INTERNO'event and CLK_INTERNO = '1' then--CLK_INTERNO'event and
		 IF SW(0)='1' THEN
			LEDG(9)<= '1';
			IF CONT < 7 THEN
			 CONT <= CONT + 1;
			ELSE CONT <= 0;
			END IF;
		ELSE
			LEDG(9)<= '0';	
			IF CONT > 0 THEN
			 CONT <= CONT - 1;
			ELSE CONT <= 7;
			END IF;		 
		END IF;
			
	END IF;
	
END PROCESS;

PROCESS(CONT)
BEGIN
	-- DEMUX COMPORTAMENTAL--------------------------------------------------------------------------
		CASE CONT IS 
		when 0 => LEDG(7)<='0';LEDG(6)<='0';LEDG(5)<='0';LEDG(4)<='0';LEDG(3)<='0';LEDG(2)<='0';LEDG(1)<='0';LEDG(0)<='1';
		when 1 => LEDG(7)<='0';LEDG(6)<='0';LEDG(5)<='0';LEDG(4)<='0';LEDG(3)<='0';LEDG(2)<='0';LEDG(1)<='1';LEDG(0)<='0';
		when 2 => LEDG(7)<='0';LEDG(6)<='0';LEDG(5)<='0';LEDG(4)<='0';LEDG(3)<='0';LEDG(2)<='1';LEDG(1)<='0';LEDG(0)<='0';
		when 3 => LEDG(7)<='0';LEDG(6)<='0';LEDG(5)<='0';LEDG(4)<='0';LEDG(3)<='1';LEDG(2)<='0';LEDG(1)<='0';LEDG(0)<='0';
		when 4 => LEDG(7)<='0';LEDG(6)<='0';LEDG(5)<='0';LEDG(4)<='1';LEDG(3)<='0';LEDG(2)<='0';LEDG(1)<='0';LEDG(0)<='0';
		when 5 => LEDG(7)<='0';LEDG(6)<='0';LEDG(5)<='1';LEDG(4)<='0';LEDG(3)<='0';LEDG(2)<='0';LEDG(1)<='0';LEDG(0)<='0';
		when 6 => LEDG(7)<='0';LEDG(6)<='1';LEDG(5)<='0';LEDG(4)<='0';LEDG(3)<='0';LEDG(2)<='0';LEDG(1)<='0';LEDG(0)<='0';
		when 7 => LEDG(7)<='1';LEDG(6)<='0';LEDG(5)<='0';LEDG(4)<='0';LEDG(3)<='0';LEDG(2)<='0';LEDG(1)<='0';LEDG(0)<='0';
		when others => LEDG(7)<='0';LEDG(6)<='0';LEDG(5)<='0';LEDG(4)<='0';LEDG(3)<='0';LEDG(2)<='0';LEDG(1)<='0';LEDG(0)<='0';
		END CASE;
END PROCESS;
		
END Behavior;