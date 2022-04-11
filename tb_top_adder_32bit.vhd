----------------------------------------------------------------------------------
-- Company: Marquette University
-- Engineer: Caleb Celano
-- 
-- Create Date: 04/08/2022 09:53:55 PM
-- Design Name: 
-- Module Name: tb_top_adder_32bit - Behavioral
-- Project Name: Project 2_A
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_top_adder_32bit is
end tb_top_adder_32bit;

architecture Behavioral of tb_top_adder_32bit is

component top_adder_32bit
  Port (
    a, b : in std_logic_vector(31 downto 0);
    z : out std_logic_vector(31 downto 0);
    cout : out std_logic
   );
end component;
	for U1: top_adder_32bit use entity WORK.TOP_ADDER_32BIT(STRUCTURAL);
	signal a, b	: STD_LOGIC_VECTOR(31 downto 0);
	signal z	: STD_LOGIC_VECTOR(31 downto 0);
	signal cout	: STD_LOGIC;
	
	begin
	U1: top_adder_32bit port map (a,b,z,cout);
	
		process
		begin

		-- Case 1 that we are testing.

			a <= "00000000000000000000000000000000";
			b <= "00000000000000000000000000000000";
			wait for 10 ns;
			assert ( z = "00000000000000000000000000000000" )	report "Failed Case 1 - z" severity error;
			assert ( Cout = '0' )   report "Failed Case 1 - Cout" severity error;
			wait for 40 ns;

		-- Case 2 that we are testing.

			a <= "11111111111111111111111111111111";
			b <= "11111111111111111111111111111111";
			wait for 10 ns;
			assert ( z = "11111111111111111111111111111110" )	report "Failed Case 2 - z" severity error;
			assert ( Cout = '1' )   report "Failed Case 2 - Cout" severity error;
			wait for 40 ns;
		end process;
end Behavioral;
