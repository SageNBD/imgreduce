library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sum_1b is
	port	(in1, in2, incarry	: in  std_logic;
			 out1, outcarry		: out std_logic);
end sum_1b;

architecture rts of sum_1b is
begin
	out1 <= in1 xor in2 xor incarry;
	outcarry <= ((in1 and in2) or (in1 and incarry) or (in2 and incarry));
end architecture;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sum_10b is
	port	(x, y : in std_logic_vector(9 downto 0);
    		 cin : in std_logic;
             z : out std_logic_vector(9 downto 0);
             cout : out std_logic);
end sum_10b;

architecture rts of sum_10b is
	component sum_1b
    	port (in1, in2, incarry : in std_logic; out1, outcarry : out std_logic);
	end component;
    signal carry : std_logic_vector(8 downto 0);
begin

	S0: sum_1b port map (x(0), y(0), cin, z(0), carry(0));
	GEN0: for i in 1 to 8 generate
    	SX: sum_1b port map (x(i), y(i), carry(i-1), z(i), carry(i));
	end generate GEN0;
    S9: sum_1b port map (x(9), y(9), carry(8), z(9), cout);

end architecture;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity reducer is
	port	(clk, in_data_valid : in std_logic;
    		 in_pixel : in std_logic_vector(31 downto 0);
             out_data_valid : out std_logic;
             out_pixel : out std_logic_vector(7 downto 0));
end reducer;

architecture rts of reducer is
	component sum_10b is
    	port	(x, y : in std_logic_vector(9 downto 0); 
        		 cin : in std_logic;
                 z : out std_logic_vector(9 downto 0);
                 cout : out std_logic);
    end component;

    function shift_right_2
		(signal z : in std_logic_vector(9 downto 0)) return std_logic_vector is
		variable a: std_logic_vector (7 downto 0);
	begin 
		a := z(9 downto 2);
    	return a;
	end function shift_right_2;
    
    type arr_pixel is array (0 to 3) of std_logic_vector(9 downto 0);
    signal intermediate_pixel : arr_pixel := (others=> (others=> '0'));
    signal sum_pixel : arr_pixel := (others=> (others=> '0'));
    signal sum_carry : std_logic_vector(3 downto 0) := (others => '0');
begin
	
    GEN_INTERMEDIATE: for i in 0 to 3 generate
        intermediate_pixel(i)(7 downto 0) <= in_pixel((i+1)*8-1 downto i*8);
    end generate GEN_INTERMEDIATE;
    
    sum_pixel(0) <= intermediate_pixel(0);
    
    GEN_SUM: for i in 0 to 2 generate
    	SUMX: sum_10b port map (sum_pixel(i), intermediate_pixel(i+1), sum_carry(i), sum_pixel(i+1), sum_carry(i+1));
    end generate GEN_SUM;
    
    out_pixel <= shift_right_2(sum_pixel(3));
    
    out_data_valid <= in_data_valid;
    
    
end architecture;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity row_buffer is
	port	(clk, rst, in_data_valid, in_has_read : in std_logic;
    		 in_data : in std_logic_vector(7 downto 0);
             out_data : out std_logic_vector(15 downto 0));
end row_buffer;

architecture rts of row_buffer is
	type row_type is array (1 to 320) of std_logic_vector(7 downto 0);
	signal row : row_type;
    signal write_idx : integer range 0 to 320;
    signal read_idx : integer range 0 to 320;
begin

	row(write_idx) <= in_data when (in_data_valid = '1' and write_idx > 0);

    out_data(15 downto 8) <= row(read_idx + 1) when (read_idx > 0);
   	out_data(7 downto 0) <= row(read_idx) when (read_idx > 0);

    
    DECIDE_INDEX_WRITE : process(clk)
    begin
    	if(rising_edge(clk)) then
            if(rst = '1') then
                write_idx <= 1;
            else
            	if(in_data_valid = '1') then
                    if(write_idx = 320) then
                        write_idx <= 1;
                    else
                        write_idx <= write_idx + 1;
                    end if;
                else
                	write_idx <= write_idx;
                end if;
            end if;
		end if;
    end process;
    
    DECIDE_INDEX_READ : process(clk)
    begin
    	if(rising_edge(clk)) then
            if(rst = '1') then
                read_idx <= 1;
            else             
                if (in_has_read = '1') then
                    if(read_idx = 319) then
                        read_idx <= 1;
                    else
                        read_idx <= read_idx + 2;
                    end if;
                else
                    read_idx <= read_idx;
                end if;
            end if;
        end if;
    end process;

end rts;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity memory_control is
	port	(clk, rst, in_pixel_valid : in std_logic;
    		 in_pixel : in std_logic_vector(7 downto 0);
             out_pixel_valid : out std_logic;
             out_pixel : out std_logic_vector(31 downto 0));
end memory_control;

architecture rts of memory_control is
	component row_buffer is
    	port	(clk, rst, in_data_valid, in_has_read : in std_logic;
    		 	 in_data : in std_logic_vector(7 downto 0);
             	 out_data : out std_logic_vector(15 downto 0));
    end component;
    signal pixel_counter : integer range 0 to 86760; -- 360*241
    signal pixel_counter_period : integer range 0 to 320;
    signal overflow_flag : std_logic := '0';
    signal pixel_even : std_logic := '0';
    signal num_write_buffer : std_logic := '0';
    signal valid_row_buf : std_logic_vector(1 downto 0) := (others => '0');
    signal row_buf_read : std_logic_vector(1 downto 0) := (others => '0');
begin

	ROW_BUFFER0: row_buffer port map (clk, rst, valid_row_buf(0), row_buf_read(0), in_pixel, out_pixel(31 downto 16));
    ROW_BUFFER1: row_buffer port map (clk, rst, valid_row_buf(1), row_buf_read(1), in_pixel, out_pixel(15 downto 0));
    
	
    COUNT : process(clk)
    begin
    	if(rising_edge(clk)) then
            if(rst = '1') then
                pixel_counter <= 1;
                pixel_counter_period <= 1;
                pixel_even <= '1';
            elsif(in_pixel_valid = '1') then
                pixel_counter <= pixel_counter + 1;
                if(pixel_counter_period = 320) then
                    pixel_counter_period <= 1;
                else
                    pixel_counter_period <= pixel_counter_period + 1;
                end if;
                pixel_even <= NOT pixel_even;
            else
                pixel_counter <= pixel_counter;
                pixel_counter_period <= pixel_counter_period;
                pixel_even <= pixel_even;
            end if;
        end if;
    end process;
    
    OVERFLOW : process(pixel_counter)
    begin
        if(pixel_counter > 321) then
            overflow_flag <= '1';
        else
            overflow_flag <= '0';
        end if;
    end process;
    
    CHANGE_WRITE_ROWBUFFER : process(clk)
    begin
    	if(rising_edge(clk)) then
            if(rst = '1') then
                num_write_buffer <= '0';
            elsif(pixel_counter_period = 319 AND in_pixel_valid = '1') then
                num_write_buffer <= NOT num_write_buffer;
            else
                num_write_buffer <= num_write_buffer;
            end if;
        end if;
    end process;
    
    --num_write_buffer <= '0' when rst else NOT num_write_buffer when (pixel_counter_period = 319 AND in_pixel_valid = '1') else num_write_buffer;
    
    valid_row_buf(0) <= NOT num_write_buffer when (rst = '0' AND in_pixel_valid = '1') else '0';
    valid_row_buf(1) <= num_write_buffer when (rst = '0' AND in_pixel_valid = '1') else '0';
    
    out_pixel_valid <= overflow_flag AND NOT pixel_even AND in_pixel_valid AND num_write_buffer;
    row_buf_read(0) <= overflow_flag AND NOT pixel_even;
    row_buf_read(1) <= overflow_flag AND NOT pixel_even;

end architecture;

library IEEE;
use IEEE.std_logic_1164.all;

entity design is
	port 	(clk, rst, in_valid : in std_logic := '0';
    		 in_pixel : in std_logic_vector(7 downto 0);
             out_valid : out std_logic := '0';
             out_pixel : out std_logic_vector(7 downto 0));
end design;

architecture rts of design is
	component memory_control is
    	port	(clk, rst, in_pixel_valid : in std_logic;
                 in_pixel : in std_logic_vector(7 downto 0);
                 out_pixel_valid : out std_logic;
                 out_pixel : out std_logic_vector(31 downto 0));
    end component;
    component reducer is
    	port	(clk, in_data_valid : in std_logic;
                 in_pixel : in std_logic_vector(31 downto 0);
                 out_data_valid : out std_logic;
                 out_pixel : out std_logic_vector(7 downto 0));
    end component;
    
    signal intermediate_data_valid : std_logic := '0';
    signal intermediate_pixel : std_logic_vector(31 downto 0) := (others => '0');
    signal intermediate_data_valid2 : std_logic := '0';
    signal intermediate_pixel2 : std_logic_vector(31 downto 0) := (others => '0');
begin
	MEM_CONTROL: memory_control port map (clk, rst, in_valid, in_pixel, intermediate_data_valid, intermediate_pixel);
    REDUCE: reducer port map (clk, intermediate_data_valid2, intermediate_pixel2, out_valid, out_pixel);
    
    INTERMEDIATE_REGISTER : process(clk)
    begin
    	if(falling_edge(clk)) then
   	    	intermediate_data_valid2 <= intermediate_data_valid;
            intermediate_pixel2 <= intermediate_pixel;
        end if;
    end process;
end architecture;
