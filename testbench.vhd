library work;
use work.fftpackage.all;
library ieee;
use ieee.std_logic_1164.all;


entity testbench is
end entity;

architecture tb of testbench is
    signal clk : std_logic := '0';
    signal inp , inp_imag , out_real, out_imag : array_of_integer(SIZE - 1 downto 0);
    signal end_sig : std_logic;
    
    begin
        dut : fft port map(clk, inp,inp_imag, out_real, out_imag, end_sig);

        clk <= not(clk) after 10 ns;

        test : process
        begin
            inp(7) <= 5;
            inp_imag(7) <= 3;

            inp(6) <= 8;
            inp_imag(6) <= 4;
            
            inp(5) <= 99;
            inp_imag(5) <= 30;
            
            inp(4) <= 100;
            inp_imag(4) <= 0;
            
            inp(3) <= -1;
            inp_imag(3) <= 14;
            
            inp(2) <= 0;
            inp_imag(2) <= 0;
            
            inp(1) <= 11;
            inp_imag(1) <= 0;
            
            inp(0) <= 12;
            inp_imag(0) <= 65;
            wait for 20 ns;
        end process ; -- test
        
        
        
end architecture tb;