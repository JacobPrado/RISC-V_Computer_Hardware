----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/09/2022 06:52:41 PM
-- Design Name: 
-- Module Name: top_ALUcontrol - top_structure
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

entity top_ALUcontrol is
    Port ( 
           f7 : in STD_LOGIC_VECTOR (0 to 6);
           f3 : in STD_LOGIC_VECTOR (0 to 2);
           alu_op : in STD_LOGIC_VECTOR (0 to 1);
           alu_op_out : out STD_LOGIC_VECTOR (0 to 3)
          );
end top_ALUcontrol;

architecture top_structure of top_ALUcontrol is

COMPONENT ALUcontrol
    Port( 
          funct7 : in STD_LOGIC_VECTOR (0 to 6);           --funct7 of instruction (aka I[31-25])
          funct3 : in STD_LOGIC_VECTOR (0 to 2);           --funct3 of instruction (aka I[14-12])
          ALUop : in STD_LOGIC_VECTOR (0 to 1);            --ALUop from Main Control
          ALUoperation : out STD_LOGIC_VECTOR (0 to 3)     --ALUcontrol Output to ALU
         );   
end COMPONENT;

begin
u1 : ALUcontrol
Port Map( funct7 => f7,
          funct3 => f3,
          ALUop => alu_op,
          ALUoperation => alu_op_out );
          
end top_structure;
