----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2022 08:05:38 PM
-- Design Name: 
-- Module Name: over_detect - Behavioral
-- Project Name: 
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

entity over_detect is
  Port ( 
        B_invert, Mux_A, Mux_B, Carry_Out, Add_Result : in std_logic;
        overflow : out std_logic
  );
end over_detect;

architecture Behavioral of over_detect is
begin
process is

begin
if (B_invert = '0' and Mux_A = '0' and Mux_B = '0' and Add_Result = '1') then
    overflow <= '1';
elsif (B_invert = '0' and Mux_A = '1' and Mux_B = '1' and Add_Result = '0') then
    overflow <= '1';
elsif (B_invert = '1' and Mux_A = '1' and Mux_B = '0' and Add_Result = '1') then
    overflow <= '1';
elsif (B_invert = '1' and Mux_A = '0' and Mux_B = '1' and Add_Result = '0') then
    overflow <= '1';
else
    overflow <= '0';
end if;

-- account for the operation?
-- do we care about carryout/in?

end process;
end Behavioral;
