library work;
use work.fftpackage.all;
library ieee;
use ieee.std_logic_1164.all;


entity testbench is
end entity;

architecture tb of testbench is
    signal clk : std_logic := '0';
    signal inp , out_r, out_image : array_of_integer(SIZE - 1 downto 0);
    
    begin
        dut : fft port map(clk, inp, out_r, out_image);

        clk <= not(clk) after 10 ns;

        test : process
        begin
            inp(7) <= 7;
            inp(6) <= 6;
            inp(5) <= 5;
            inp(4) <= 4;
            inp(3) <= 3;
            inp(2) <= 2;
            inp(1) <= 1;
            inp(0) <= 0;
            wait for 20 ns;
        end process ; -- test
        
        
        
end architecture tb;