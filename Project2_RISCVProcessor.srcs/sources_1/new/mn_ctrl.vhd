----------------------------------------------------------------------------------
-- Company: Marquette University
-- Engineer: Jacob Prado
-- 
-- Create Date: 04/07/2022 11:02:04 AM
-- Design Name: 
-- Module Name: mn_ctrl - Behavioral
-- Project Name: Project 2_Main control component
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

entity mn_ctrl is
  Port ( 
        opcode  : in  std_logic_vector(6 downto 0);
        
        branch  : out std_logic;
        MemRead : out std_logic;
        Mem2Reg : out std_logic;
        ALUop   : out std_logic_vector(1 downto 0);
        MemWrite: out std_logic;
        ALUsrc  : out std_logic;
        RegWrite: out std_logic
  );
end mn_ctrl;

architecture CTRL_ARCH of mn_ctrl is
--Create constants for easy readability for the case statement
CONSTANT RTYPE  :   std_logic_vector(6 downto 0) := "0110011";
CONSTANT ADDI   :   std_logic_vector(6 downto 0) := "0010011";
CONSTANT LOAD   :   std_logic_vector(6 downto 0) := "0000011";
CONSTANT STORE  :   std_logic_vector(6 downto 0) := "0100011";
CONSTANT BEQ    :   std_logic_vector(6 downto 0) := "1100011";

begin
    process(opcode)
    --variable is made for assigning the datapath to be easier
    variable ctrl_sig : std_logic_vector(7 downto 0); 
    begin
        case opcode is
        when RTYPE =>
            ctrl_sig := "00100010";
        when ADDI =>
            ctrl_sig := "10100010";
        when LOAD =>
            ctrl_sig := "11110000";
        when STORE =>
            ctrl_sig := "10001000";
        when BEQ =>
            ctrl_sig := "00000101";
        when others =>
            ctrl_sig := "00000000";
        end case;
        
        ALUsrc  <= ctrl_sig(7);
        Mem2Reg <= ctrl_sig(6);
        RegWrite<= ctrl_sig(5);
        MemRead <= ctrl_sig(4);
        MemWrite<= ctrl_sig(3);
        branch  <= ctrl_sig(2);
        ALUop   <= ctrl_sig(1 downto 0);
        
    end process;

end;