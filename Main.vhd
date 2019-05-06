library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use WORK.paquete.ALL;

entity Principal is--Programa principal que ejecuta todo lo necesario para el desarrollo de la práctica
	port(
		clk,clr: in std_logic;
		A,B: in std_logic_vector(9 downto 0);--Entradas de 4 bits
		operacion: in std_logic;--Un botón que sirva como selector de operaciones
		catodo: out std_logic_vector(3 downto 0);
		display: out std_logic_vector(6 downto 0);
		leds: out std_logic_vector(9 downto 0)
	);
end Principal;

architecture Behavioral of Principal is
signal cen,uni,dec: std_logic_vector(3 downto 0);-- Variable auxiliar para almacenar el valor de las unidades y las decenas de un número en BCD
signal var10Bits: std_logic_vector(9 downto 0);
begin 
	
	
	BCD: BCD10Bits port map(var10Bits,uni, dec, cen);--Convierte un número de 5 bits a un valor en BCD
	multiplexado_Displays: controlDisplays port map(clk,clr,uni,dec,cen,catodo,display);--Manda las unidades del número a la salida 
end Behavioral;