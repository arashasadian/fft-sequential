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
            inp(7) <= 7;
            inp_imag(7) <= 1;

            inp(6) <= 6;
            inp_imag(6) <= 1;
            
            inp(5) <= 5;
            inp_imag(5) <= 1;
            
            inp(4) <= 4;
            inp_imag(4) <= 1;
            
            inp(3) <= 3;
            inp_imag(3) <= 1;
            
            inp(2) <= 2;
            inp_imag(2) <= 1;
            
            inp(1) <= 1;
            inp_imag(1) <= 1;
            
            inp(0) <= 0;
            inp_imag(0) <= 1;
            wait for 20 ns;
        end process ; -- test
        
        
        
end architecture tb;