library IEEE;
use IEEE.STD_LOGIC_1164.all;

package paquete is
--Declaración de los componentes que se usarán

component Selector is --Programa que controla las operaciones que la ALU realizará
	port(
		clk,clr: in std_logic;
		btn: in std_logic;
		operacion: out std_logic_vector(3 downto 0)
	);
end component;

component OperacionesLogicas is --Programa que ejecuta las operaciones lógicas (Complemento 1, complemento 2, AND, OR)
	port(
		clk: in std_logic;
		A,B: in std_logic_vector(9 downto 0);--Entradas de 10 bits
		selector: in std_logic_vector(3 downto 0);
		salida: out std_logic_vector(9 downto 0)
	);
end component;

component Shifters is --Programa que ejecuta el LSL y el LSR
	port(
		clk,clr: in std_logic;
		A: in std_logic_vector(9 downto 0);--Entrada de 10 bits
		selector: in std_logic_vector(3 downto 0);
		salida: out std_logic_vector(9 downto 0)
	);
end component;

component OperacionesAritmeticas is --Programa que realiza las operaciones aritméticas de suma, resta y multiplicación
	port(
		clk: in std_logic;
		A,B: in std_logic_vector(7 downto 0); -- Son los 8 bits menos significativos de A y B
		selector: in std_logic_vector(3 downto 0);
		salida: out std_logic_vector(9 downto 0)
	);
end component;

component BCD10Bits is --Programa que pasa un número de 10 bits a su equivalente en BCD
	port(
		entrada: in std_logic_vector(9 downto 0);--Entrada de 10 bits
		unidades, decenas, centenas: out std_logic_vector(3 downto 0) --Salidas unidades decenas y centenas
	);
end component;

component controlDisplays is --Programa que pasa un número de 10 bits a su equivalente en BCD
	port(
		clk, clr: in std_logic;
		unidades, decenas, centenas: in std_logic_vector(3 downto 0); --Entradas unidades decenas y centenas
		catodo: out std_logic_vector (3 downto 0);
		salidaDisplay: out std_logic_vector(6 downto 0) --Salidas unidades decenas y centenas
	);
end component;

end paquete;
package body paquete is

end paquete;