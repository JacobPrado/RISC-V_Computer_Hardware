----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/11/2022 04:09:41 PM
-- Design Name: 
-- Module Name: tb_ALUcontrol - Behavioral
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

entity tb_ALUcontrol is
--  Port ( );
end tb_ALUcontrol;

architecture Behavioral of tb_ALUcontrol is

component ALUcontrol is
    Port (
          funct7 : in STD_LOGIC_VECTOR (0 to 6);
          funct3 : in STD_LOGIC_VECTOR (0 to 2);
          ALUop : in STD_LOGIC_VECTOR (0 to 1);
          ALUoperation : out STD_LOGIC_VECTOR (0 to 3)
          );
end component;

signal Funct7 : std_logic_vector(0 to 6);
signal Funct3 : std_logic_vector(0 to 2);
signal ALU_OPcontrol : std_logic_vector(0 to 1);
signal ALU_Operation : std_logic_vector(0 to 3);

--signal Funct7 : std_logic_vector(0 to 6);
--signal Funct3 : std_logic_vector(0 to 2);
--signal ALU_OPcontrol : std_logic_vector(0 to 1);
--signal ALU_Operation : std_logic_vector(0 to 4);

begin

Funct7 <= "0000000", "0100000" after 150 ns, "0000000" after 200 ns, "0100000" after 300 ns;
Funct3 <= "000", "110" after 200 ns, "111" after 250 ns;
ALU_OPcontrol <= "00", "01" after 50 ns, "10" after 100 ns;

u1: ALUcontrol
    Port Map(
        funct7 => Funct7,
        funct3 => Funct3,
        ALUop => ALU_OPcontrol,
        ALUoperation => ALU_Operation
    );

end Behavioral;
