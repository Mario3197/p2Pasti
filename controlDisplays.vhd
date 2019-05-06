library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity controlDisplays is --Programa que pasa un número de 10 bits a su equivalente en BCD
	port(
		clk, clr: in std_logic; -- clk Frequency 2.08 MHz
		unidades, decenas, centenas: in std_logic_vector(3 downto 0); --Entradas unidades decenas y centenas
		catodo: out std_logic_vector (3 downto 0);
		salidaDisplay: out std_logic_vector(6 downto 0) --Salidas unidades decenas y centenas
	);
end controlDisplays;

architecture Behavioral of controlDisplays is
signal auxCatodo: std_logic_vector(3 downto 0):= "1110";
signal valorDisplay: std_logic_vector(3 downto 0);
signal clk_aux: std_logic := '0';
signal clk_counter: integer range 0 to 16639 := 0;
begin 

	control_clk: process (clk,clr)
			begin if(clr = '1') then
				clk_counter <= 0;
				clk_aux <= '0';
			elsif(clk'event and clk = '1') then
				if(clk_counter = 16639) then
					clk_aux <= NOT (clk_aux);
					clk_counter <= 0;
				else
					clk_counter <= clk_counter + 1;
				end if;
			end if;
	end process;
	
    controlCatodo: process(clk_aux,clr)
        begin if(clr = '1') then
			auxCatodo <= "1110";
		elsif(clk_aux'event and clk_aux='1') then
			if(auxCatodo = "1110") then
				valorDisplay<=unidades;
			elsif(auxCatodo = "1101")then
				valorDisplay<=decenas;
			elsif(auxCatodo = "1011")then
				valorDisplay<=centenas;
			else
				valorDisplay<="0000";
			end if;	
			auxCatodo <= auxCatodo(2 downto 0) & auxCatodo(3);
		end if;
		catodo<= auxCatodo;
    end process;
	
	MUX: process (valorDisplay)
		begin if(valorDisplay="0000")then--0	
			salidaDisplay<="1000000";--gfedcba
		elsif(valorDisplay="0001")then--1	
			salidaDisplay<="1111001";
		elsif(valorDisplay="0010")then--2
			salidaDisplay<="0100100";
		elsif(valorDisplay="0011")then--3
			salidaDisplay<="0110000";
		elsif(valorDisplay="0100")then--4
			salidaDisplay<="0011001";
		elsif(valorDisplay="0101")then--5
			salidaDisplay<="0010010";
		elsif(valorDisplay="0110")then--6
			salidaDisplay<="0000010";
		elsif(valorDisplay="0111")then--7
			salidaDisplay<="1111000";
		elsif(valorDisplay="1000")then--8
			salidaDisplay<="0000000";	
		elsif(valorDisplay="1001")then--9
			salidaDisplay<="0010000";
		else
			salidaDisplay<="1111111";--En caso de que no se ingrese un número décimal, mandara una "E"	de error	
		end if;
	end process;
end Behavioral;   