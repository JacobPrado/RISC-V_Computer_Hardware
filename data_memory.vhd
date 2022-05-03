library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity data_memory is
  port (
    reset : in std_logic;
    clk : in std_logic;
    MW : in std_logic;
    addr_in : in std_logic_vector(31 downto 0); -- we use only 4 bits though here;
    data_in : in std_logic_vector(31 downto 0);
    data_out : out std_logic_vector(31 downto 0)
  );
end data_memory;


architecture behavioral_arch of data_memory is

	type MEM_ARRAY_16x32 is array(0 to 15) of std_logic_vector(31 downto 0);

begin

	data_mem_process: process (clk, MW, data_in, addr_in) is
		variable var_data_mem : MEM_ARRAY_16x32;
		variable var_addr : integer;
	begin
		var_addr := conv_integer(addr_in(3 downto 0));
		if (reset = '1') then
			-- desired initial values of the data memory:
			var_data_mem(0)  := X"00000001"; -- first memory location stores 1
			var_data_mem(1)  := X"00000000";
			var_data_mem(2)  := X"00000000";
			var_data_mem(3)  := X"00000000";
			var_data_mem(4)  := X"00000000";
			var_data_mem(5)  := X"00000000";
			var_data_mem(6)  := X"00000000";
			var_data_mem(7)  := X"00000000";
			var_data_mem(8)  := X"00000000";
			var_data_mem(9)  := X"00000000";
			var_data_mem(10) := X"00000001";
			var_data_mem(11) := X"00000010";
			var_data_mem(12) := X"00000000";
			var_data_mem(13) := X"00000011";
			var_data_mem(14) := X"00000000";
			var_data_mem(15) := X"00000000";
		elsif (rising_edge(clk) and MW = '1') then
			-- synchronous write data in on rising edge of clock
			var_data_mem(var_addr) := data_in;
		end if;

		-- asynchronous continuous read of the data memory location at address var_addr
		data_out <= var_data_mem(var_addr);

	end process;

end behavioral_arch;
