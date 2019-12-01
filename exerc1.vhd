LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Conexão dos interruptores nos LEDs
ENTITY exerc1 IS
PORT ( SW : IN STD_LOGIC_VECTOR(9 DOWNTO 0); --interruptores
		LEDG : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)); -- LEDs 
END exerc1;

ARCHITECTURE Behavior OF exerc1 IS
BEGIN
LEDG <= SW; -- direciona os interruptores para os leds
END Behavior;
