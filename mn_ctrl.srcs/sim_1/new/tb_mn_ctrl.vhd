----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/08/2022 01:22:42 PM
-- Design Name: 
-- Module Name: tb_mn_ctrl - Behavioral
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

entity tb_mn_ctrl is
--  Port ( );
end tb_mn_ctrl;

architecture Behavioral of tb_mn_ctrl is
    component mn_ctrl
        port(
            opcode  :   in  STD_LOGIC_VECTOR(6 downto 0);
            branch  :   out STD_LOGIC;
            MemRead :   out STD_LOGIC;
            Mem2Reg :   out STD_LOGIC;
            ALUop   :   out STD_LOGIC_VECTOR(1 downto 0);
            MemWrite:   out STD_LOGIC;
            ALUsrc  :   out STD_LOGIC;
            RegWrite:   out STD_LOGIC
            );
    end component;
signal opCODE  :   STD_LOGIC_VECTOR(6 downto 0);
signal branCH  :   STD_LOGIC;
signal memREAD :   STD_LOGIC;
signal memtoREG:   STD_LOGIC;
signal alUOp   :   STD_LOGIC_VECTOR(1 downto 0);
signal memWRITE:   STD_LOGIC;
signal alUSrc  :   STD_LOGIC;
signal regWRITE:   STD_LOGIC;

begin

opCODE(6 downto 0) <= "0000000","0110011" after 10 ns, "0000011" after 20 ns, "0100011" after 30 ns, "1100011" after 40 ns;

u1: mn_ctrl
    PORT MAP(
    opcode  => opCODE,
    branch  => branCH,
    MemRead => memREAD,
    Mem2Reg=> memtoREG,
    ALUop   => alUOp,
    MemWrite=> memWRITE,
    ALUsrc  => alUSrc,
    RegWrite=> regWRITE );

end Behavioral;
