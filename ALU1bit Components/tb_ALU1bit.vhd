----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2022 03:43:04 PM
-- Design Name: 
-- Module Name: tb_ALU1bit - Behavioral
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

entity tb_ALU1bit is
    --Port ( );
end tb_ALU1bit;

architecture Behavioral of tb_ALU1bit is

--Access 1-bit ALU as a component
component ALU1bit is
    Port ( Ainvert : in STD_LOGIC;
       Binvert : in STD_LOGIC;
       CarryIn : in STD_LOGIC;
       Operation : in STD_LOGIC_VECTOR (1 downto 0);
       a : in STD_LOGIC;
       b : in STD_LOGIC;
       Less : in STD_LOGIC;
       CarryOut : out STD_LOGIC;
       Result : out STD_LOGIC
       );
end component;

--Setup signals for simulation testing
signal invA : STD_LOGIC;
signal invB : STD_LOGIC;
signal carryIN : STD_LOGIC;
signal operSIG : STD_LOGIC_VECTOR (1 downto 0);
signal inputA : STD_LOGIC;
signal inputB : STD_LOGIC;
signal lessSIG : STD_LOGIC;
signal carryOUT : STD_LOGIC;
signal resultOUT : STD_LOGIC;

--Start of Behavioral Description
begin

u1: ALU1bit
    Port Map(
        Ainvert => invA,
        Binvert => invB,
        CarryIn => carryIN,
        Operation => operSIG,
        a => inputA,
        b => inputB,
        Less => lessSIG,
        CarryOut => carryOUT,
        Result => resultOUT
    );

--Testbench Simulation process
process is 
begin
--Set initial states all 0 at start
    invA <= '0';
    invB <= '0';
    carryIN <= '0';
    operSIG <= "00";
    inputA <= '0';
    inputB <= '0';
    lessSIG <= '0';

--Test Invert Control Signals
    operSIG <= "01";    --Set operator to OR
    
    --Check Ainvert signal
    invA <= '1';        --Expected: result = 1
    invB <= '0';        --Set Binvert low
    wait for 10 ns;     --Add delay
    
    --Check Binvert signal
    invA <= '0';        --Set Ainvert low
    invB <= '1';        --Expected: result = 1
    wait for 10 ns;     --Add delay
    
--Test AND Operation (initial a = 0, b = 0)
    invA <= '0';
    invB <= '0';
    carryIN <= '0';
    operSIG <= "00";
    inputA <= '0';      --Expected: result = (a and b) = 0
    inputB <= '0';
    lessSIG <= '0';
    wait for 10 ns;
    
    --AND (a = 0, b = 1)
    --inputA <= '0';    --Expected: result = (a and b) = 0
    inputB <= '1';
    wait for 10 ns;
    
    --AND (a = 1, b = 1)
    inputA <= '1';      --Expected: result = (a and b) = 1
    --inputB <= '1';
    wait for 10 ns;
    
    --AND (a = 1, b = 0)
    --inputA <= '1';    --Expected: result = (a and b) = 0
    inputB <= '0';
    wait for 10 ns;
    
--Test OR Operation (initial a = 0, b = 0)
    invA <= '0';
    invB <= '0';
    carryIN <= '0';
    operSIG <= "01";
    inputA <= '0';      --Expected: result = (a or b) = 0
    inputB <= '0';
    lessSIG <= '0';
    wait for 10 ns;  
          
    --OR (a = 0, b = 1)
    --inputA <= '0';    --Expected: result = (a or b) = 1
    inputB <= '1';
    wait for 10 ns;
    
    --OR (a = 1, b = 1)
    inputA <= '1';      --Expected: result = (a or b) = 1
    --inputB <= '1';
    wait for 10 ns;
    
    --OR (a = 1, b = 0)
    --inputA <= '1';    --Expected: result = (a or b) = 1
    inputB <= '0';
    wait for 10 ns;
    
--Test ADD Operation (initial a = 0, b = 0, carry = 0)
    invA <= '0';
    invB <= '0';
    carryIN <= '0';
    operSIG <= "10";
    inputA <= '0';      --Expected: carry = 0, result = 0
    inputB <= '0';       
    lessSIG <= '0';
    wait for 10 ns;  

    --ADD (a = 0, b = 0, carry = 1)
    --inputA <= '0';    --Expected: carry = 0, result = 1
    --inputB <= '0';
    carryIN <= '1';
    wait for 10 ns;
    
    --ADD (a = 0, b = 1, carry = 0)
    --inputA <= '0';    --Expected: carry = 0, result = 1
    inputB <= '1';
    carryIN <= '0';
    wait for 10 ns;

    --ADD (a = 0, b = 1, carry = 1)
    --inputA <= '0';    --Expected: carry = 1, result = 0 
    --inputB <= '1';
    carryIN <= '1';
    wait for 10 ns;

    --ADD (a = 1, b = 0, carry = 0)
    inputA <= '1';      --Expected: carry = 0, result = 1
    inputB <= '0';
    carryIN <= '0';
    wait for 10 ns;
    
    --ADD (a = 1, b = 0, carry = 1)
    --inputA <= '1';    --Expected: carry = 1, result = 0 
    --inputB <= '0';
    carryIN <= '1';
    wait for 10 ns;
    
    --ADD (a = 1, b = 1, carry = 0)
    --inputA <= '1';    --Expected: carry = 1, result = 0 
    inputB <= '1';
    carryIN <= '0';
    wait for 10 ns;
    
    --ADD (a = 1, b = 1, carry = 1)
    --inputA <= '1';    --Expected: carry = 1, result = 1
    --inputB <= '1';
    carryIN <= '1';
    wait for 10 ns;

--Test Less Output Operation (initial Less = 0)
    invA <= '0';
    invB <= '0';
    carryIN <= '0';
    operSIG <= "11";
    inputA <= '0';      --Expected: result = 0
    inputB <= '0';       
    lessSIG <= '0';
    wait for 10 ns; 
    
    --Test Less = 1
    lessSIG <= '1';     --Expected result = 1
    wait for 10 ns;
    
end process;

end Behavioral;
