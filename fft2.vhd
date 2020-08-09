library ieee;
use ieee.std_logic_1164.all;
library work;
use work.fftpackage.all;

entity fft2 is
    generic (rows, cols : integer := SIZE);
    port(
        input_array : in array_2d(rows - 1 downto 0)(cols - 1 downto 0);
        output_array_real : out array_2d(rows - 1 downto 0)(cols - 1 downto 0);
        output_array_imag : out array_2d(rows - 1 downto 0)(cols - 1 downto 0)
    );
end entity fft2;

architecture fft2_arch of fft2 is



    begin


end architecture fft2_arch;