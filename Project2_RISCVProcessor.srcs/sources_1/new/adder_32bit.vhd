----------------------------------------------------------------------------------
-- Company: Marquette University
-- Engineer: Caleb Celano
-- 
-- Create Date: 04/08/2022 09:53:55 PM
-- Design Name: 
-- Module Name: 32bit_adder - Behavioral
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

entity adder_32bit is
  Port (
        x, y, cin : in std_logic;
        sum, cout : out std_logic
   );
end adder_32bit;

architecture Behavioral of adder_32bit is

begin

sum <= (x XOR y) XOR cin;
cout <= (x AND y) OR (x AND cin) OR (y AND cin);

end Behavioral;