----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/24/2022 05:26:40 PM
-- Design Name: 
-- Module Name: ALU1bit - Behavioral
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

entity ALU1bit is
    Port ( Ainvert : in STD_LOGIC;
           Binvert : in STD_LOGIC;
           CarryIn : in STD_LOGIC;
           Operation : in STD_LOGIC_VECTOR (1 downto 0);
           a : in STD_LOGIC;
           b : in STD_LOGIC;
           Less : in STD_LOGIC;
           CarryOut : out STD_LOGIC;
           Result : out STD_LOGIC);
end ALU1bit;

architecture Behavioral of ALU1bit is

component adder_32bit
    Port( 
          x, y, cin : in std_logic;
          sum, cout : out std_logic
         );   
end component;

component mux2to1
    Port ( in0 : in STD_LOGIC;
       in1 : in STD_LOGIC;
       sel : in STD_LOGIC;
       mux_out : out STD_LOGIC
       );
end component;

component MUX4to1
    Port ( in0 : in STD_LOGIC;
       in1 : in STD_LOGIC;
       in2 : in STD_LOGIC;
       in3 : in STD_LOGIC;
       ctrl : in STD_LOGIC_VECTOR (1 downto 0);
       outChnl : out STD_LOGIC
       );
end component;

component ANDgate
    Port ( in0 : in STD_LOGIC;
           in1 : in STD_LOGIC;
           result : out STD_LOGIC
          );
end component;

component ORgate
    Port ( in0 : in STD_LOGIC;
           in1 : in STD_LOGIC;
           result : out STD_LOGIC
          );
end component;

component Inverter
    Port ( sigIN : in STD_LOGIC;
           sigOUT : out STD_LOGIC
          );
end component;

signal Aneg : std_logic;
signal Bneg : std_logic;
signal sigAND : std_logic;
signal sigOR : std_logic;
signal muxA : std_logic;
signal muxB : std_logic;
signal addResult : std_logic;

begin

--Inverter for input a
ic1 : Inverter
Port Map ( sigIN => a,
           sigOUT => Aneg
          );

--Inverter for input b          
ic2 : Inverter
Port Map ( sigIN => b,
           sigOUT => Bneg
          );
          
--Input A MUX
m0 : mux2to1
Port Map( in0 => a,
          in1 => Aneg,
          sel => Ainvert,
          mux_out => muxA );

--Input B MUX
m1 : mux2to1
Port Map( in0 => b,
          in1 => Bneg,
          sel => Binvert,
          mux_out => muxB );
          
g0 : ANDgate
Port Map ( in0 => muxA,
           in1 => muxB,
           result => sigAND
          );

g1 : ORgate
Port Map ( in0 => muxA,
           in1 => muxB,
           result => sigOR
          );

--1 Bit Adder
a3 : adder_32bit
    Port Map( 
      x => muxA,
      y => muxB,
      cin => CarryIn,
      sum => addResult,
      cout => CarryOut
     );


m2 : MUX4to1
Port Map( in0 => sigAND,
          in1 => sigOR,
          in2 => addResult,
          in3 => Less,
          ctrl => Operation,
          outChnl => Result
);

--Aneg <= not a;
--Bneg <= not b;

          

--sigAND <= bitA and bitB;
--sigOR <= bitA or bitB;

end Behavioral;