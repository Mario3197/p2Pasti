library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity Selector is --Programa que controla las operaciones que la ALU realizará
	port(
		clk,clr: in std_logic;
		btn: in std_logic;
		operacion: out std_logic_vector(3 downto 0)
	);
end Selector;

architecture Behavioral of Selector is
signal contador: std_logic_vector(3 downto 0):= (others => '0');
begin process (clk,clr,btn)
	begin if(clr = '1') then
		contador <=(others => '0');
	elsif(clk'event and clk = '1') then 
		if(btn = '1') then
			if(contador = "1000") then
				contador <= (others => '0');
			else
				contador <= contador + 1;
			end if;
		end if;
	end if;    
end process;
operacion <= contador;	
end Behavioral;