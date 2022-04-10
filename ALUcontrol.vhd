----------------------------------------------------------------------------------
-- Company: Maquette University Milwaukee, WI
-- Engineer: Andrew Simon (Student)
-- 
-- Create Date: 04/09/2022 04:29:16 PM
-- Design Name: 
-- Module Name: ALUcontrol - ALUcntrl_struct
-- Project Name: RISC-V Processor Project 
-- Target Devices: ALU
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
--  VERSION 2: ALU Control with full ALUop, funct3, and funct7 bit checks.
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

entity ALUcontrol is                                        --Start of Declaration
    Port ( 
           funct7 : in STD_LOGIC_VECTOR (0 to 6);           --funct7 of instruction (aka I[31-25])
           funct3 : in STD_LOGIC_VECTOR (0 to 2);           --funct3 of instruction (aka I[14-12])
           ALUop : in STD_LOGIC_VECTOR (0 to 1);            --ALUop from Main Control
           ALUoperation : out STD_LOGIC_VECTOR (0 to 3)
          );   --ALUcontrol Output to ALU
end ALUcontrol;                                             --End of Declaration

architecture ALUcntrl_behavioral of ALUcontrol is

begin                                                       --Start of Architecture
    process (funct7, funct3, ALUop) is                      --Behavioral process to determine ALUoperation signal
    begin
        case ALUop is
            when "00" =>                                    --Load/Store(lw & sw) instruction
                ALUoperation <= "0010";                     --ADD ALU operation
                
            when "01" =>                                    --Branch (beq) instruction
                ALUoperation <= "0110";                     --SUB ALU operation
            
            when "10" =>                                    --R Format instructions
                case funct7 is
                    when "0100000" =>
                        if funct3 = "000" then              --Subtract (sub) instruction
                            ALUoperation <= "0110";         --SUB ALU operation
                        end if;                             --End funct3 if
                        
                    when "0000000" =>
                        case funct3 is
                            when "000" =>                   --Addition (add) instruction
                                ALUoperation <= "0010";     --ADD ALU operation
                                
                            when "110" =>                   --Logical OR (or) instruction
                                ALUoperation <= "0001";     --OR ALU operation
                                
                            when "111" =>                   --Logical AND (and) instruction
                                ALUoperation <= "0000";     --AND ALU operation
                        end case;                           --End funct3 cases
                        
                end case;                                   --End of funct7 cases 
            
            when others =>                                  --Error case for non-expected inputs
                ALUoperation <= "1111"                      --ALU non-operation
                
        end case;                                           --End of ALUop cases
    
    end process;                                            --End of behavioral process

end ALUcntrl_behavioral;                                    --End of Architecture
