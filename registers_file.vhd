----------------------------------------------------------------------------------
-- Company: Maruqette University
-- Engineer: Caleb Celano
-- 
-- Create Date: 04/11/2022 06:04:53 AM
-- Design Name: 
-- Module Name: registers_file - Behavioral
-- Project Name: Project 2A
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity registers_file is
  Port ( 
    clock, reset : in std_logic;
    writeenable : in std_logic;
    writedata : in std_logic_vector(31 downto 0);
    writereg : in std_logic_vector(4 downto 0);
    readreg1 : in std_logic_vector(4 downto 0);
    readreg2 : in std_logic_vector(4 downto 0); 
    readdata1 : out std_logic_vector(31 downto 0);
    readdata2 : out std_logic_vector(31 downto 0)
  );
end registers_file;

architecture Behavioral of registers_file is

type MEM_ARRAY_32x32 is array(0 to 31) of std_logic_vector(31 downto 0);
signal c0 : MEM_ARRAY_32x32  := ( others => "00000000000000000000000000000000");

begin

  write : process(reset, clock)
    begin
    	if reset = '0' then
    	  for i in 0 to 32 loop
    	    c0(i) <= (others => '0');
          end loop;
        elsif rising_edge(clock) then
          if writeenable = '1' then
            c0(to_integer(unsigned(writereg))) <= writedata;
          end if;
        end if;
  end process;
  
  readdata1 <= c0(to_integer(unsigned(readreg1)));
  readdata2 <= c0(to_integer(unsigned(readreg2)));

end Behavioral;
