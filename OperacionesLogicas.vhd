library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity OperacionesLogicas is --Programa que ejecuta las operaciones lógicas (Complemento 1, complemento 2, AND, OR)
	port(
		clk: in std_logic;
		A,B: in std_logic_vector(9 downto 0);--Entradas de 10 bits
		selector: in std_logic_vector(3 downto 0);
		salida: out std_logic_vector(9 downto 0)
	);
end OperacionesLogicas;

architecture Behavioral of OperacionesLogicas is
begin process (A,B, selector,clk)
	begin if(clk'event and clk = '1') then 	
		if(selector = "0000") then
			salida <= not (A);
		elsif(selector = "0001") then
			salida <= not (A) + '1';
		elsif(selector = "0010") then
			salida <= A AND B;
		elsif(selector = "0011") then
			salida <= A OR B;
		end if;
	end if;
end process;
end Behavioral;