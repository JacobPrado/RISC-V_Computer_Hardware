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
        Carry_In, Carry_Out : in std_logic;
        overflow : out std_logic
  );
end over_detect;

architecture Behavioral of over_detect is
begin
process is

begin
overflow <= Carry_In XOR Carry_Out;

end process;
end Behavioral;
