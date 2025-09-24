library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; 

entity somador_2bits is
    Port (
        a    : in  STD_LOGIC_VECTOR (1 downto 0);
        b    : in  STD_LOGIC_VECTOR (1 downto 0); 
        soma : out STD_LOGIC_VECTOR (2 downto 0) 
    );
end somador_2bits;

architecture Behavioral of somador_2bits is
begin
    
    soma <= std_logic_vector(resize(unsigned(a), 3) + resize(unsigned(b), 3));
end Behavioral;