library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity Shifters is --Programa que ejecuta el LSL y el LSR
	port(
		clk: in std_logic;
		A: in std_logic_vector(9 downto 0);--Entrada de 10 bits
		selector: in std_logic_vector(3 downto 0);
		salida: out std_logic_vector(9 downto 0)
	);
end Shifters;

architecture Behavioral of Shifters is
begin process (A,selector,clk)
	
	variable aux: std_logic_vector(9 downto 0);
	
	begin if(selector'event) then
		aux:= A;
	elsif(clk'event and clk = '1') then 
		if(selector = "0100") then
			aux := aux(8 downto 0) & '0';
		elsif(selector = "0101") then
			aux := '0' & aux(9 downto 1); 
		end if;
	end if;
	salida <= aux;	    
end process;
end Behavioral;