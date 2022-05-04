----------------------------------------------------------------------------------
-- Company: Marquette University
-- Engineer: Caleb Celano
-- 
-- Create Date: 04/08/2022 09:53:55 PM
-- Design Name: 
-- Module Name: top_adder_32bit - Behavioral
-- Project Name: Project 2_A
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

entity top_adder_32bit is
  Port (
  a, b : in std_logic_vector(31 downto 0);
  z : out std_logic_vector(31 downto 0);
  cout : out std_logic
   );
end top_adder_32bit;

architecture Structural of top_adder_32bit is

component adder_32bit is
    port(
        x, y, cin : in std_logic;
        sum, cout : out std_logic
    );
end component;

signal c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,c21,c22,c23,c24,c25,c26,c27,c28,c29,c30,c31 : std_logic;

begin
--u30 : adder_32bit PORT MAP(x => a(0), y => b(0), cin => co, sum => z(0), cout => c31);

    c0 <= '0';
    u0 : adder_32bit PORT MAP(a(0), b(0), c0, z(0), c1);
    u1 : adder_32bit PORT MAP(a(1), b(1), c1, z(1), c2);
    u2 : adder_32bit PORT MAP(a(2), b(2), c2, z(2), c3);
    u3 : adder_32bit PORT MAP(a(3), b(3), c3, z(3), c4);
    u4 : adder_32bit PORT MAP(a(4), b(4), c4, z(4), c5);
    u5 : adder_32bit PORT MAP(a(5), b(5), c5, z(5), c6);
    u6 : adder_32bit PORT MAP(a(6), b(6), c6, z(6), c7);
    u7 : adder_32bit PORT MAP(a(7), b(7), c7, z(7), c8);
    u8 : adder_32bit PORT MAP(a(8), b(8), c8, z(8), c9);
    u9 : adder_32bit PORT MAP(a(9), b(9), c9, z(9), c10);
    u10 : adder_32bit PORT MAP(a(10), b(10), c10, z(10), c11);
    u11 : adder_32bit PORT MAP(a(11), b(11), c11, z(11), c12);
    u12 : adder_32bit PORT MAP(a(12), b(12), c12, z(12), c13);
    u13 : adder_32bit PORT MAP(a(13), b(13), c13, z(13), c14);
    u14 : adder_32bit PORT MAP(a(14), b(14), c14, z(14), c15);
    u15 : adder_32bit PORT MAP(a(15), b(15), c15, z(15), c16);
    u16 : adder_32bit PORT MAP(a(16), b(16), c16, z(16), c17);
    u17 : adder_32bit PORT MAP(a(17), b(17), c17, z(17), c18);
    u18 : adder_32bit PORT MAP(a(18), b(18), c18, z(18), c19);
    u19 : adder_32bit PORT MAP(a(19), b(19), c19, z(19), c20);
    u20 : adder_32bit PORT MAP(a(20), b(20), c20, z(20), c21);
    u21 : adder_32bit PORT MAP(a(21), b(21), c21, z(21), c22);
    u22 : adder_32bit PORT MAP(a(22), b(22), c22, z(22), c23);
    u23 : adder_32bit PORT MAP(a(23), b(23), c23, z(23), c24);
    u24 : adder_32bit PORT MAP(a(24), b(24), c24, z(24), c25);
    u25 : adder_32bit PORT MAP(a(25), b(25), c25, z(25), c26);
    u26 : adder_32bit PORT MAP(a(26), b(26), c26, z(26), c27);
    u27 : adder_32bit PORT MAP(a(27), b(27), c27, z(27), c28);
    u28 : adder_32bit PORT MAP(a(28), b(28), c28, z(28), c29);
    u29 : adder_32bit PORT MAP(a(29), b(29), c29, z(29), c30);
    u30 : adder_32bit PORT MAP(a(30), b(30), c30, z(30), c31);
    u31 : adder_32bit PORT MAP(a(31), b(31), c31, z(31), cout);

end Structural;
