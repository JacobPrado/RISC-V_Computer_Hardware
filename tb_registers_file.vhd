----------------------------------------------------------------------------------
-- Company: Maruqette University
-- Engineer: Caleb Celano
-- 
-- Create Date: 04/11/2022 04:20:03 PM
-- Design Name: 
-- Module Name: tb_registers_file - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_registers_file is
end tb_registers_file;

architecture Behavioral of tb_registers_file is

component registers_file
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
end component;
	for U1: registers_file use entity WORK.REGISTERS_FILE(BEHAVIORAL);
	signal clock, reset	: STD_LOGIC;
	signal writeenable	: STD_LOGIC;
	signal writedata    : STD_LOGIC_VECTOR(31 downto 0);
	signal writereg     : STD_LOGIC_VECTOR(4 downto 0);
	signal readreg1     : STD_LOGIC_VECTOR(4 downto 0);
	signal readreg2     : STD_LOGIC_VECTOR(4 downto 0);
	signal readdata1    : STD_LOGIC_VECTOR(31 downto 0);
	signal readdata2    : STD_LOGIC_VECTOR(31 downto 0);
	constant tpw_clk : time := 10ns;
	begin
	
	--Clock generation process
    clock1_gen:
        process
        begin
            clock <= '0';
            wait for Tpw_clk/2;
            clock <= '1';
            wait for Tpw_clk/2;
        end process;
	
	U1: registers_file port map (clock,reset,writeenable,writedata,writereg,readreg1,readreg2,readdata1,readdata2);
	
		process
		begin

		-- Case 1 that we are testing.

			writeenable <= '1';
			writedata <= "00000000000000000000000000000100";
			writereg <= "00010";
			wait for 10 ns;
			writeenable <= '1';
			writedata <= "00000000000000000000000000100000";
			writereg <= "01000";
			wait for 10 ns;
			readreg1 <= "00010";
			readreg2 <= "01000";
			wait for 10 ns;
			assert ( readdata1 = "00000000000000000000000000000100" )	report "Failed Case 1 - readdata1" severity error;
			assert ( readdata2 = "00000000000000000000000000100000" )   report "Failed Case 1 - readdata2" severity error;
			wait for 40 ns;

		-- Case 2 that we are testing.
		
			writeenable <= '1';
			writedata <= "11111111111111111111111111111111";
			writereg <= "00001";
			wait for 10 ns;
			writeenable <= '1';
			writedata <= "11111111111111111111111111111110";
			writereg <= "00000";
			wait for 10 ns;
			readreg1 <= "00001";
			readreg2 <= "00000";
			wait for 10 ns;
			assert ( readdata1 = "11111111111111111111111111111111" )	report "Failed Case 1 - readdata1" severity error;
			assert ( readdata2 = "11111111111111111111111111111110" )   report "Failed Case 1 - readdata2" severity error;
			wait for 40 ns;
		end process;
end Behavioral;