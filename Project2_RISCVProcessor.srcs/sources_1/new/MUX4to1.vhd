----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/24/2022 06:16:52 PM
-- Design Name: 
-- Module Name: MUX4to1 - Behavioral
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

entity MUX4to1 is
    Port ( in0 : in STD_LOGIC;
           in1 : in STD_LOGIC;
           in2 : in STD_LOGIC;
           in3 : in STD_LOGIC;
           ctrl : in STD_LOGIC_VECTOR (1 downto 0);
           outChnl : out STD_LOGIC);
end MUX4to1;

architecture Behavioral of MUX4to1 is

begin
    process (in0, in1, in2, in3, ctrl) is
    begin
        case ctrl is
        when "00" =>
            outChnl <= in0;
        when "01" =>
            outChnl <= in1;
        when "10" =>
            outChnl <= in2;
        when others =>
            outChnl <= in3;
        end case;
    end process;

end Behavioral;