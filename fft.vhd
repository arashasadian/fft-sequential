library ieee;
use ieee.std_logic_1164.all;
library work;
use work.fftpackage.all;


entity fft is
    generic (size : integer := SIZE);
    port (clk :in std_logic;
        input_array : in array_of_integer(size - 1 downto 0);
        input_array_imag : in array_of_integer(size-1 downto 0);
        output_real_array, output_imag_array : out array_of_integer(size - 1 downto 0)
    );
end entity fft;

architecture arch of fft is

    signal start : std_logic := '0';
    signal real_even_half, real_odd_half, imag_even_half, imag_odd_half : array_of_integer((size/2) - 1 downto 0);
    signal input_even_half : array_of_integer((size/2) - 1 downto 0);
    signal input_odd_half : array_of_integer((size/2) - 1 downto 0);
    signal input_even_half_imag : array_of_integer((size/2)-1 downto 0);
    signal input_odd_half_imag : array_of_integer((size/2)-1 downto 0);

    begin

        rom_generator(start, sin_rom, cos_rom); -- initiate rom for sin and cos

        dft_module_even_half : dft port map(clk, input_even_half,input_even_half_imag, real_even_half, imag_even_half);
        dft_module2_odd_half : dft port map(clk, input_odd_half,input_odd_half_imag, real_odd_half, imag_odd_half);

        main_process : process( clk )
            variable sin_value, cos_value, degree , prefix: integer;
        begin
            if falling_edge(clk) then
                if(start = '0') then
                    start <= '1';
                end if;
                prefix := 360 / size;
                for_loop :for k in 0 to size/2 - 1 loop
                    degree := (prefix * k) mod 360;
                    sin_value := sin_rom(degree);
                    cos_value := cos_rom(degree);
                    output_real_array(k) <= (real_even_half(k) * 100) + (cos_value * real_odd_half(k)) + (sin_value * imag_odd_half(k));
                    output_imag_array(k) <= (imag_even_half(k)*100) - (sin_value * real_odd_half(k)) + cos_value * imag_odd_half(k);
                    output_real_array(k + size/2) <= -(real_odd_half(k) * cos_value) - (imag_odd_half(k) * sin_value) + real_even_half(k)*100;
                    output_imag_array(k + size/2) <= (real_odd_half(k) * sin_value ) - (imag_odd_half(k) * cos_value) + imag_even_half(k)*100;
                    
                end loop for_loop;
            end if;
        end process ; -- main_process
        
        input_split : process( clk )
        begin
            if rising_edge(clk) then
                split_loop :for i in 0 to size/2 - 1 loop
                    input_even_half(i) <= input_array(2 * i);
                    input_odd_half(i) <= input_array(2 * i + 1);
                    input_even_half_imag(i) <= input_array_imag(2 * i);
                    input_odd_half_imag(i) <= input_array_imag(2 * i + 1);
                end loop split_loop;
            end if ;
        end process ; -- input_split

end architecture arch;