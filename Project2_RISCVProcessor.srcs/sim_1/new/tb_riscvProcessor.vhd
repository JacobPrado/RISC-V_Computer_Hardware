----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/04/2022 08:30:29 PM
-- Design Name: 
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
         resultMUX : out STD_LOGIC_VECTOR (31 downto 0);
         debugOUT1 : out STD_LOGIC_VECTOR (31 downto 0);
         debugOUT2 : out STD_LOGIC_VECTOR (31 downto 0);
         debugOUT3 : out STD_LOGIC_VECTOR (31 downto 0);
         debugOUT4 : out STD_LOGIC_VECTOR (31 downto 0)
        );
end component;

--Setup signals for simulation testing
signal clock : STD_LOGIC;
signal reset : STD_LOGIC;
signal set : STD_LOGIC;
signal result : STD_LOGIC_VECTOR (31 downto 0);


signal debug1 : STD_LOGIC_VECTOR (31 downto 0);
signal debug2 : STD_LOGIC_VECTOR (31 downto 0);
signal debug3 : STD_LOGIC_VECTOR (31 downto 0);
signal debug4 : STD_LOGIC_VECTOR (31 downto 0);

--resultMUX <= writeDataIN;
--debugOUT1 <= dataMemRead;
--debugOUT2 <= aluResult;
--debugOUT3 <= outputIM;
--debugOUT4 <= regDataOutA;

constant tpw_clk : time := 30ns;

begin

u1 : top_riscvProcessor Port Map (clock, reset, set, result, debug1, debug2, debug3, debug4);

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
    wait for 120 ns;
    
    reset <= '0';
    wait for 1000 ns;
end process;

end Behavioral;
