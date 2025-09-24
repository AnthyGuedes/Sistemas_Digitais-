library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_detector_5b is
end tb_detector_5b;

architecture sim of tb_detector_5b is
    component detector_5b
        Port (
            clk    : in  STD_LOGIC;
            rst    : in  STD_LOGIC;
            din    : in  STD_LOGIC;
            detect : out STD_LOGIC
        );
    end component;

    signal clk_tb    : STD_LOGIC := '0';
    signal rst_tb    : STD_LOGIC := '1';
    signal din_tb    : STD_LOGIC := '0';
    signal detect_tb : STD_LOGIC;

    constant CLK_PERIOD : time := 10 ns;
begin
    
    uut: detector_5b port map (
        clk => clk_tb,
        rst => rst_tb,
        din => din_tb,
        detect => detect_tb
    );

    
    clk_process : process
    begin
        while true loop
            clk_tb <= '0';
            wait for CLK_PERIOD/2;
            clk_tb <= '1';
            wait for CLK_PERIOD/2;
        end loop;
    end process;

    stim_proc: process
    begin
        
        rst_tb <= '1'; wait for 20 ns;
        rst_tb <= '0';

            --sequencia
        din_tb <= '1'; wait for CLK_PERIOD;
        din_tb <= '1'; wait for CLK_PERIOD;
        din_tb <= '0'; wait for CLK_PERIOD;
        din_tb <= '1'; wait for CLK_PERIOD;
        din_tb <= '0'; wait for CLK_PERIOD;

        
        din_tb <= '1'; wait for CLK_PERIOD;
        din_tb <= '0'; wait for CLK_PERIOD;
        din_tb <= '1'; wait for CLK_PERIOD;

        -- outra sequencia correta: 11010
        din_tb <= '1'; wait for CLK_PERIOD;
        din_tb <= '1'; wait for CLK_PERIOD;
        din_tb <= '0'; wait for CLK_PERIOD;
        din_tb <= '1'; wait for CLK_PERIOD;
        din_tb <= '0'; wait for CLK_PERIOD;

        wait;
    end process;
end sim;