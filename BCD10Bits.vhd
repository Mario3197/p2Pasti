library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity BCD10Bits is --Programa que pasa un número de 10 bits a su equivalente en BCD
	port(
		entrada: in std_logic_vector(9 downto 0);--Entrada de 10 bits
		unidades, decenas, centenas: out std_logic_vector(3 downto 0) --Salidas unidades decenas y centenas
	);
end BCD10Bits;

architecture Behavioral of BCD10Bits is
begin 
    proceso_bcd: process(entrada)
        variable z: STD_LOGIC_VECTOR(21 downto 0);
    begin
        -- Inicialización de datos en cero.
        z := (others => '0');
        -- Se realizan los primeros tres corrimientos.
        z(9 downto 0) := entrada;
        for i in 0 to 9 loop
            -- Unidades (4 bits).
            if z(13 downto 10) > 4 then
                z(13 downto 10) := z(13 downto 10) + 3;
            end if;
            -- Decenas (4 bits).
            if z(17 downto 14) > 4 then
                z(17 downto 14) := z(17 downto 14) + 3;
            end if;
            -- Centenas (3 bits).
            if z(21 downto 18) > 4 then
                z(21 downto 18) := z(21 downto 18) + 3;
            end if;
            -- Corrimiento a la izquierda.
            z(21 downto 1) := z(20 downto 0);
        end loop;
        -- Pasando datos de variable Z, correspondiente a BCD.
        unidades <= z(13 downto 10);
		decenas <= z(17 downto 14);
		centenas <= z(21 downto 18);
    end process;
end Behavioral;   
