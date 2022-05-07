----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/04/2022 07:10:31 PM
-- Design Name: 
-- Module Name: immGenerator - Behavioral
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

entity immGenerator is
    Port ( 
           instrIN : in STD_LOGIC_VECTOR (31 downto 0);
           immOUT : out STD_LOGIC_VECTOR (31 downto 0)
          );
end immGenerator;

architecture Behavioral of immGenerator is


begin
    process (instrIN) is
    begin
        --Process immediate field from instruction based on format
        case instrIN(6 downto 0) is
            --LW instruction opcode (I format)
            when "0000011" =>
                if instrIN(31) = '0' then                                   --If 0, then sign extend positive
                    immOUT <= "00000000000000000000" & instrIN(31 downto 20);
                else                                                        --If 1, then sign extend negative
                    immOUT <= "11111111111111111111" & instrIN(31 downto 20);
                end if;
                
            --SW instruction opcode (S format)
            when "0100011" =>
                if instrIN(31) = '0' then                                   --If 0, then sign extend positive
                    immOUT <= "00000000000000000000" & instrIN(31 downto 25) & instrIN(11 downto 7);
                else                                                        --If 1, then sign extend negative
                    immOUT <= "11111111111111111111" & instrIN(31 downto 25) & instrIN(11 downto 7);
                end if;
            
            --BEQ instruction opcode (SB format)
            when "1100011" =>
                if instrIN(31) = '0' then                                   --If 0, then sign extend positive
                    immOUT <= "0000000000000000000" & instrIN(31) & instrIN(7) 
                              & instrIN(30 downto 25) & instrIN(11 downto 8) & '0';
                else                                                        --If 1, then sign extend negative
                    immOUT <= "1111111111111111111" & instrIN(31) & instrIN(7) 
                               & instrIN(30 downto 25) & instrIN(11 downto 8) & '0';
                end if;
                
             --ADDI instruction opcode (I format)
             when "0010011" =>
                if instrIN(31) = '0' then                                   --If 0, then sign extend positive
                    immOUT <= "00000000000000000000" & instrIN(31 downto 20);
                else                                                        --If 1, then sign extend negative
                    immOUT <= "11111111111111111111" & instrIN(31 downto 20);
                end if;
                      
            --If instruction does not match, output 0          
            when others =>
                immOUT <= "00000000000000000000000000000000";
       
        end case;
    
    end process;

end Behavioral;