----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/24/2022 06:01:53 PM
-- Design Name: 
-- Module Name: MUX2to1 - Behavioral
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

entity MUX2to1 is
    Port ( in0 : in STD_LOGIC;
           in1 : in STD_LOGIC;
           ctrl : in STD_LOGIC;
           outChnl : out STD_LOGIC);
end MUX2to1;

architecture Behavioral of MUX2to1 is

begin
    process (in0, in1, ctrl) is
    begin
        if ctrl = '1' then
            outChnl <= in1;
        else
            outChnl <= in0;
        end if;
    
    end process;

end Behavioral;
