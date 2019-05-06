library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity Shifters is --Programa que ejecuta el LSL y el LSR
	port(
		clk,clr: in std_logic;
		A: in std_logic_vector(9 downto 0);--Entrada de 10 bits
		selector: in std_logic_vector(3 downto 0);
		salida: out std_logic_vector(9 downto 0)
	);
end Shifters;

architecture Behavioral of Shifters is
signal clk_counter: integer range 0 to 1039999:= 0;
signal clk_aux: std_logic := '0';
begin 

clk_seg: process(clk,clr)
	begin if(clr = '1')then
		clk_aux <= '0';
		clk_counter <= 0;
	elsif(clk'event and clk = '1') then
		if(clk_counter = 1039999)then
			clk_counter <= 0;
			clk_aux <= NOT (clk_aux);
		else
			clk_counter <= clk_counter + 1;
		end if;
	end if;
end process;

operaciones: process (A,selector,clk_aux)
	variable aux: std_logic_vector(9 downto 0);
	begin if(selector'event) then
		aux:= A;
	elsif(clk_aux'event and clk_aux = '1') then 
		if(selector = "0100") then
			aux := aux(8 downto 0) & '0';
		elsif(selector = "0101") then
			aux := '0' & aux(9 downto 1); 
		end if;
	end if;
	salida <= aux;	    
end process;
end Behavioral;