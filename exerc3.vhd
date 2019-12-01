LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Displays
ENTITY exerc3 IS
PORT (
            HEX3_D : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
            HEX2_D: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
            HEX1_D: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
            HEX0_D: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));  
END exerc3;

ARCHITECTURE Behavior OF exerc3 IS
BEGIN

HEX3_D <= "1000000"; -- caractere 0
HEX2_D <= "1111001"; -- caractere 1
HEX1_D <= "0100100"; -- caractere 2
HEX0_D <= "0110000"; -- caractere 3

END Behavior;
