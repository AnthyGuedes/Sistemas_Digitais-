library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_semaforo is
end tb_semaforo;

architecture sim of tb_semaforo is
    signal clk, reset, btn : STD_LOGIC := '0';
    signal verde, amarelo, vermelho : STD_LOGIC;

    component semaforo
        Port (
            clk      : in  STD_LOGIC;
            reset    : in  STD_LOGIC;
            btn      : in  STD_LOGIC;
            verde    : out STD_LOGIC;
            amarelo  : out STD_LOGIC;
            vermelho : out STD_LOGIC
        );
    end component;

begin
    -- o semáforo
    UUT: semaforo
        port map (
            clk => clk,
            reset => reset,
            btn => btn,
            verde => verde,
            amarelo => amarelo,
            vermelho => vermelho
        );

    --clock (10 ns)
    clk_process: process
    begin
        while true loop
            clk <= '0'; wait for 5 ns;
            clk <= '1'; wait for 5 ns;
        end loop;
    end process;

    -- estímulos
    stim_proc: process
    begin
        
        reset <= '1'; wait for 20 ns;
        reset <= '0';

        --
        wait for 60 ns;

        -- ativa botão durante o verde
        btn <= '1'; wait for 10 ns;
        btn <= '0';

        
        wait for 100 ns;

        
        wait;
    end process;
end sim;