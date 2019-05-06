library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity OperacionesAritmeticas is --Programa que realiza las operaciones aritméticas de suma, resta y multiplicación
	port(
		clk: in std_logic;
		A,B: in std_logic_vector(7 downto 0); -- Son los 8 bits menos significativos de A y B
		selector: in std_logic_vector(3 downto 0);
		salida: out std_logic_vector(9 downto 0)
	);
end OperacionesAritmeticas;

architecture Behavioral of OperacionesAritmeticas is

begin process (clk,A,B)
	begin if(clk'event and clk = '1') then 
		if(selector = "0110") then
			salida <= "00" & A + B;
		elsif(selector = "0111") then
			salida <= "00" & (A - B);
		elsif(selector = "1000") then
			salida <= A(4 downto 0) * B(4 downto 0);
		elsif(selector = "1001") then
			salida <= "00000" & std_logic_vector(unsigned(A(4 downto 0))/unsigned(B(4 downto 0)));
		end if;
	end if;    
end process;
end Behavioral;