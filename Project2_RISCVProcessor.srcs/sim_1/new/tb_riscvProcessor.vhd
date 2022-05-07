----------------------------------------------------------------------------------
-- Company: Ababei Hardware Inc.
-- Engineer: Simon,Andrew;Prado,Jacob;Celano,Caleb
-- 
-- Create Date: 05/04/2022 08:30:29 PM
-- Design Name: RISC-V reduced instructions processor
-- Module Name: tb_riscvProcessor - Behavioral
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

entity tb_riscvProcessor is
--  Port ( );
end tb_riscvProcessor;


architecture Behavioral of tb_riscvProcessor is

component top_riscvProcessor is
  Port (
         pcClk : in STD_LOGIC;
         pcReset : in STD_LOGIC;
         pcSet : in STD_LOGIC;
         MuxDM : out STD_LOGIC_VECTOR (31 downto 0);
         instruc   : out STD_LOGIC_VECTOR (31 downto 0)
        );
end component;

--Setup signals for simulation testing
signal clock : STD_LOGIC;
signal reset : STD_LOGIC;
signal set : STD_LOGIC;

signal MuxDM : STD_LOGIC_VECTOR (31 downto 0);
signal instruc : STD_LOGIC_VECTOR (31 downto 0);

constant tpw_clk : time := 35ns;

begin

u1 : top_riscvProcessor Port Map (clock, reset, set, MuxDM, instruc);

	--Clock generation process
    clock1_gen:
        process
        begin
            clock <= '0';
            wait for tpw_clk/2;
            clock <= '1';
            wait for tpw_clk/2;
        end process;

process
begin
    set <= '0';
    reset <= '1';
    wait for tpw_clk*4;
    
    reset <= '0';
    wait for tpw_clk*20;
end process;

end Behavioral;