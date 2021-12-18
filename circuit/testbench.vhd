library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library std;
use std.textio.all;

entity tb is
end tb;

architecture testbench of tb is

	component design is
    	port 	(clk, rst, in_valid : in std_logic := '0';
                 in_pixel : in std_logic_vector(7 downto 0);
                 out_valid : out std_logic := '0';
                 out_pixel : out std_logic_vector(7 downto 0));
    end component;

    constant IM_SIZE1 : integer := 320;
    constant IM_SIZE2 : integer := 240;
    constant CLK_PERIOD : time := 10 ns;

    signal clk, rst, in_valid, out_valid : std_logic := '0';
    signal image_input : std_logic_vector(7 downto 0);
    signal image_output : std_logic_vector(7 downto 0);
    signal out_counter : integer := 0;
    signal test_numfile : integer := 0;

    type arr_filename is array(0 to 9) of string(1 to 8);
    
    function convert_to_char(slv8 : std_logic_vector(7 downto 0)) return character is
        variable aux : INTEGER := 0;
      begin
        for i in slv8'range loop
          aux := aux*2;
          case slv8(i) is
            when '0' | 'L'  => null;
            when '1' | 'H'  => aux := aux+1;
            when others     => aux := aux;
          end case;
        end loop;
        return character'val(aux);
    end convert_to_char; 

begin

    clk <= not clk after CLK_PERIOD/2;

    DUT: design port map (clk, rst, in_valid, image_input, out_valid, image_output);

    STIM : process(clk)
    	variable is_reset : std_logic := '0';
    	variable line_from_file : line;
        variable byte_from_file : std_logic_vector(7 downto 0);
        variable arr : arr_filename := ("in01.txt","in02.txt","in03.txt","in04.txt","in05.txt","in06.txt","in07.txt", "in08.txt","in09.txt","in10.txt");
	    variable num_file : integer := 0;
        file in_file : text open read_mode is arr(num_file);
    begin
    
    	arr(0) := "in01.txt";
        arr(1) := "in02.txt";
        arr(2) := "in03.txt";
        arr(3) := "in04.txt";
        arr(4) := "in05.txt";
        arr(5) := "in06.txt";
        arr(6) := "in07.txt";
        arr(7) := "in08.txt";
        arr(8) := "in09.txt";
        arr(9) := "in10.txt";
        if(falling_edge(clk)) then
            if(is_reset = '0' AND rst = '0') then
                rst <= '1';
                is_reset := '1';
            elsif(is_reset = '1' AND rst = '1') then
            	rst <= '0';
            else
                if(ENDFILE(in_file) AND num_file < 9) then
                    num_file := num_file + 1;
                    test_numfile <= num_file;
                    file_close(in_file);
                    file_open(in_file, arr(num_file), read_mode);
                end if;
                if(NOT ENDFILE(in_file)) then
                    readline(in_file, line_from_file);
                    read(line_from_file, byte_from_file);
                    image_input <= byte_from_file;
                    in_valid <= '1';
                end if;
                if(ENDFILE(in_file) AND num_file >= 9) then
                    in_valid <= '0';
                end if;
              end if;
          end if;
    end process;
    
    
    OUTPUT : process(out_valid)
    	variable char_to_file : character;
    	type char_file is file of character;
        file out_file : char_file open write_mode is "out.bin";
    begin
     	if(rising_edge(out_valid) AND out_counter < 19200) then
            char_to_file := convert_to_char(image_output);
            write(out_file, char_to_file);
            out_counter <= out_counter + 1;
        end if;
    end process;

end architecture;

