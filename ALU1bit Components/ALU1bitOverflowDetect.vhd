----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2022 09:17:26 PM
-- Design Name: 
-- Module Name: ALU1bitOverflowDetect - Behavioral
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

entity ALU1bitOverflowDetect is
    Port ( 
       Ainvert : in STD_LOGIC;
       Binvert : in STD_LOGIC;
       CarryIn : in STD_LOGIC;
       Operation : in STD_LOGIC_VECTOR (1 downto 0);
       a : in STD_LOGIC;
       b : in STD_LOGIC;
       Less : in STD_LOGIC;
       Result : out STD_LOGIC;
       Set : out STD_LOGIC;
       overflowDetect : out STD_Logic
      );
end ALU1bitOverflowDetect;

architecture Behavioral of ALU1bitOverflowDetect is

component over_detect
    Port(
         B_invert, Mux_A, Mux_B, Carry_Out, Add_Result : in std_logic;
         overflow : out std_logic
         );
end component;

component adder_32bit
    Port( 
          x, y, cin : in std_logic;
          sum, cout : out std_logic
         );   
end component;

component MUX2to1
    Port ( 
          in0 : in STD_LOGIC;
          in1 : in STD_LOGIC;
          ctrl : in STD_LOGIC;
          outChnl : out STD_LOGIC
          );
end component;

component MUX4to1
    Port ( 
           in0 : in STD_LOGIC;
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
    Port ( 
           in0 : in STD_LOGIC;
           in1 : in STD_LOGIC;
           result : out STD_LOGIC
          );
end component;

component Inverter
    Port ( 
           sigIN : in STD_LOGIC;
           sigOUT : out STD_LOGIC
          );
end component;

signal Aneg : std_logic;
signal Bneg : std_logic;
signal sigAND : std_logic;
signal sigOR : std_logic;
signal muxA : std_logic;
signal muxB : std_logic;
signal addRESULT : std_logic;
signal carryOUT : std_logic;

begin

--Inverter for input a
ic1 : Inverter
Port Map ( 
           sigIN => a,
           sigOUT => Aneg
          );

--Inverter for input b          
ic2 : Inverter
Port Map ( 
           sigIN => b,
           sigOUT => Bneg
          );
          
--Input A MUX
m0 : MUX2to1
Port Map( 
          in0 => a,
          in1 => Aneg,
          ctrl => Ainvert,
          outChnl => muxA
         );

--Input B MUX
m1 : MUX2to1
Port Map( 
          in0 => b,
          in1 => Bneg,
          ctrl => Binvert,
          outChnl => muxB 
         );
          
g0 : ANDgate
Port Map ( 
           in0 => muxA,
           in1 => muxB,
           result => sigAND
          );

g1 : ORgate
Port Map ( 
           in0 => muxA,
           in1 => muxB,
           result => sigOR
          );

--1 Bit Adder
a1 : adder_32bit
Port Map( 
          x => muxA,
          y => muxB,
          cin => CarryIn,
          sum => addResult,
          cout => carryOUT
         );

--Select Output user Operation signal
m2 : MUX4to1
Port Map( 
          in0 => sigAND,        --Operation = 00
          in1 => sigOR,         --Operation = 01
          in2 => addResult,     --Operation = 10
          in3 => Less,          --Operation = 11
          ctrl => Operation,    --Control Signal
          outChnl => Result     --Output
         );

od1 : over_detect
Port Map(
         B_invert => Binvert,
         Mux_A => muxA,
         Mux_b => muxB,
         Carry_Out => carryOUT,
         Add_Result => addRESULT,
         overflow => overflowDetect
         );

end Behavioral;
