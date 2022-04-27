----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/27/2022 05:09:26 PM
-- Design Name: 
-- Module Name: top_ALU - Behavioral
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

entity top_ALU is
    Port ( Xinvert : in STD_LOGIC;
           Yinvert : in STD_LOGIC;
           Op : in STD_LOGIC_VECTOR (1 downto 0);
           x : in STD_LOGIC_VECTOR(31 downto 0);
           y : in STD_LOGIC_VECTOR(31 downto 0);
           over : out STD_LOGIC;
           z : out STD_LOGIC_VECTOR(31 downto 0);
           zero : out STD_LOGIC
           );
end top_ALU;

architecture Behavioral of top_ALU is

component ALU1bit is
    Port ( Ainvert : in STD_LOGIC;
           Binvert : in STD_LOGIC;
           CarryIn : in STD_LOGIC;
           Operation : in STD_LOGIC_VECTOR (1 downto 0);
           a : in STD_LOGIC;
           b : in STD_LOGIC;
           Less : in STD_LOGIC;
           CarryOut : out STD_LOGIC;
           Result : out STD_LOGIC);
end component;

component ALU1bitOverflowDetect is
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
end component;

signal c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,c21,c22,c23,c24,c25,c26,c27,c28,c29,c30,c31 : std_logic;
signal setsig : std_logic; 
signal Les : std_logic;

begin

    c0 <= Yinvert;
    Les <= '0';
    u0 : ALU1bit PORT MAP(Xinvert, Yinvert, c0, Op, x(0), y(0), setsig, c1, z(0));
    u1 : ALU1bit PORT MAP(Xinvert, Yinvert, c1, Op, x(1), y(1), Les, c2, z(1));
    u2 : ALU1bit PORT MAP(Xinvert, Yinvert, c2, Op, x(2), y(2), Les, c2, z(2));
    u3 : ALU1bit PORT MAP(Xinvert, Yinvert, c3, Op, x(3), y(3), Les, c3, z(3));
    u4 : ALU1bit PORT MAP(Xinvert, Yinvert, c4, Op, x(4), y(4), Les, c4, z(4));
    u5 : ALU1bit PORT MAP(Xinvert, Yinvert, c5, Op, x(5), y(5), Les, c5, z(5));
    u6 : ALU1bit PORT MAP(Xinvert, Yinvert, c6, Op, x(6), y(6), Les, c6, z(6));
    u7 : ALU1bit PORT MAP(Xinvert, Yinvert, c7, Op, x(7), y(7), Les, c7, z(7));
    u8 : ALU1bit PORT MAP(Xinvert, Yinvert, c8, Op, x(8), y(8), Les, c8, z(8));
    u9 : ALU1bit PORT MAP(Xinvert, Yinvert, c9, Op, x(9), y(9), Les, c9, z(9));
    u10 : ALU1bit PORT MAP(Xinvert, Yinvert, c10, Op, x(10), y(10), Les, c10, z(10));
    u11 : ALU1bit PORT MAP(Xinvert, Yinvert, c11, Op, x(11), y(11), Les, c11, z(11));
    u12 : ALU1bit PORT MAP(Xinvert, Yinvert, c12, Op, x(12), y(12), Les, c12, z(12));
    u13 : ALU1bit PORT MAP(Xinvert, Yinvert, c13, Op, x(13), y(13), Les, c13, z(13));
    u14 : ALU1bit PORT MAP(Xinvert, Yinvert, c14, Op, x(14), y(14), Les, c14, z(14));
    u15 : ALU1bit PORT MAP(Xinvert, Yinvert, c15, Op, x(15), y(15), Les, c15, z(15));
    u16 : ALU1bit PORT MAP(Xinvert, Yinvert, c16, Op, x(16), y(16), Les, c16, z(16));
    u17 : ALU1bit PORT MAP(Xinvert, Yinvert, c17, Op, x(17), y(17), Les, c17, z(17));
    u18 : ALU1bit PORT MAP(Xinvert, Yinvert, c18, Op, x(18), y(18), Les, c18, z(18));
    u19 : ALU1bit PORT MAP(Xinvert, Yinvert, c19, Op, x(19), y(19), Les, c19, z(19));
    u20 : ALU1bit PORT MAP(Xinvert, Yinvert, c20, Op, x(20), y(20), Les, c20, z(20));
    u21 : ALU1bit PORT MAP(Xinvert, Yinvert, c21, Op, x(21), y(21), Les, c21, z(21));
    u22 : ALU1bit PORT MAP(Xinvert, Yinvert, c22, Op, x(22), y(22), Les, c22, z(22));
    u23 : ALU1bit PORT MAP(Xinvert, Yinvert, c23, Op, x(23), y(23), Les, c23, z(23));
    u24 : ALU1bit PORT MAP(Xinvert, Yinvert, c24, Op, x(24), y(24), Les, c24, z(24));
    u25 : ALU1bit PORT MAP(Xinvert, Yinvert, c25, Op, x(25), y(25), Les, c25, z(25));
    u26 : ALU1bit PORT MAP(Xinvert, Yinvert, c26, Op, x(26), y(26), Les, c26, z(26));
    u27 : ALU1bit PORT MAP(Xinvert, Yinvert, c27, Op, x(27), y(27), Les, c27, z(27));
    u28 : ALU1bit PORT MAP(Xinvert, Yinvert, c28, Op, x(28), y(28), Les, c28, z(28));
    u29 : ALU1bit PORT MAP(Xinvert, Yinvert, c29, Op, x(29), y(29), Les, c29, z(29));
    u30 : ALU1bit PORT MAP(Xinvert, Yinvert, c30, Op, x(30), y(30), Les, c30, z(30));
    u31 : ALU1bitOverflowDetect PORT MAP(Xinvert, Yinvert, c31, Op, x(31), y(31), Les, z(31), setsig, over);
    zero <= (((((((((((((((((((((((((((((((z(0) NOR z(1)) NOR z(2)) NOR z(3)) NOR z(4)) NOR z(5)) NOR z(6)) NOR z(7)) NOR z(8)) NOR z(9)) NOR z(10)) NOR z(11)) NOR z(12)) NOR z(13)) NOR z(14)) NOR z(15)) NOR z(16)) NOR z(17)) NOR z(18)) NOR z(19)) NOR z(20)) NOR z(21)) NOR z(22)) NOR z(23)) NOR z(24)) NOR z(25)) NOR z(26)) NOR z(27)) NOR z(28)) NOR z(29)) NOR z(30)) NOR z(31));
    

end Behavioral;
