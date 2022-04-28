----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/27/2022 07:26:19 PM
-- Design Name: 
-- Module Name: tb_top_ALU - Behavioral
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

entity tb_top_ALU is
--  Port ( );
end tb_top_ALU;

architecture Behavioral of tb_top_ALU is

component top_ALU is
    Port ( Xinvert : in STD_LOGIC;
           Yinvert : in STD_LOGIC;
           Op : in STD_LOGIC_VECTOR (1 downto 0);
           x : in STD_LOGIC_VECTOR(31 downto 0);
           y : in STD_LOGIC_VECTOR(31 downto 0);
           over : out STD_LOGIC;
           z : out STD_LOGIC_VECTOR(31 downto 0);
           zero : out STD_LOGIC
           );
end component;

signal sigXinv,sigYinv : std_logic;
signal sigOP : std_logic_vector (1 downto 0);
signal sigX : STD_LOGIC_VECTOR(31 downto 0);
signal sigY : STD_LOGIC_VECTOR(31 downto 0);
signal sigOVER : STD_LOGIC;
signal sigZ : STD_LOGIC_VECTOR(31 downto 0);
signal sigZero : STD_LOGIC;

begin

u1 : top_ALU
Port Map (
           Xinvert => sigXinv,
           Yinvert => sigYinv,
           Op => sigOP,
           x => sigX,
           y => sigY,
           over => sigOVER,
           z => sigZ,
           zero => sigZERO
          );
          
process is
begin
--TEST AND
    sigXinv <= '0';
    sigYinv <= '0';
    sigOP <= "00";
    sigX <= "10100000000000000000000000000000";
    sigY <= "01100000000000000000000000000000";
    wait for 10 ns;
    
--TEST OR
    sigXinv <= '0';
    sigYinv <= '0';
    sigOP <= "01";
    sigX <= "10100000000000000000000000000000";
    sigY <= "01100000000000000000000000000000";
    wait for 10 ns;
--TEST NOR
    sigXinv <= '1';     --Expected result:
    sigYinv <= '1';     --sigZ = 11011111111111111111111111111111
    sigOP <= "01";
    sigX <= "00100000000000000000000000000000";
    sigY <= "01100000000000000000000000000000";
    wait for 10 ns;
        
--TEST ADD Operation
    sigXinv <= '0';     --TEST OVERFLOW: (Ve+) + (Ve+) gives negative
    sigYinv <= '0';     --Expected Result: sigOVER = 1
    sigOP <= "10";      
    sigX <= "01100000000000000000000000000000";
    sigY <= "01100000000000000000000000000000";
    wait for 10 ns;

    sigXinv <= '0';     --TEST OVERFLOW: (Ve-) + (Ve-) gives positive
    sigYinv <= '0';     --Expected Result: sigOVER = 1
    sigOP <= "10";
    sigX <= "10011111111111111111111111111111";
    sigY <= "10011111111111111111111111111111";
    wait for 10 ns;
    
    sigXinv <= '0';     --TEST OVERFLOW: (Ve+) + (Ve+) gives positive
    sigYinv <= '0';     --Expected Result: sigOVER = 0
    sigOP <= "10";
    sigX <= "00011000000000000000000000000000";
    sigY <= "01100000000000000000000000000000";
    wait for 10 ns;    

--Test SUB
    sigXinv <= '0';     --TEST OVERFLOW: X - X gives zero
    sigYinv <= '1';     --Expected Result: sigOVER = 0, sigZERO = 1
    sigOP <= "10";
    sigX <= "10000000000000000000000000000000";
    sigY <= "10000000000000000000000000000000";
    wait for 10 ns;
    
    sigXinv <= '0';     --TEST OVERFLOW: (Ve+) - (Ve-) gives negative
    sigYinv <= '1';     --Expected Result: sigOVER = 1
    sigOP <= "10";
    sigX <= "01100000000000000000000000000000";
    sigY <= "10011111111111111111111111111111";
    wait for 10 ns;
    
    sigXinv <= '0';     --TEST OVERFLOW: (Ve-) - (Ve+) gives positive
    sigYinv <= '1';     --Expected Result: sigOVER = 1
    sigOP <= "10";
    sigX <= "10011111111111111111111111111111";
    sigY <= "01100000000000000000000000000000";
    wait for 10 ns;    

    sigXinv <= '0';     --TEST OVERFLOW: (Ve+) - (Ve+) gives positive
    sigYinv <= '1';     --Expected Result: sigOVER = 0
    sigOP <= "10";
    sigX <= "01100000000000000000000000000000";
    sigY <= "00011000000000000000000000000000";
    wait for 10 ns;
    
    wait for 1000ns;    

end process;

end Behavioral;
