-- Design Entity: mux2to1
-- Multiplexer of two inputs, each represented on 1-bit. 
--
-- Note: You should be able to easily change this to work with 
-- inputs and output represented on 32 bits! The select or control
-- signal stays as 1-bit because the number of inputs remains two.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


ENTITY mux2to1 IS
	PORT (
    in0, in1 : IN STD_LOGIC_VECTOR (31 downto 0);
    sel : IN STD_LOGIC;
		mux_out : OUT STD_LOGIC_VECTOR (31 downto 0)
  );
END mux2to1;


ARCHITECTURE dataflow OF mux2to1 IS	

BEGIN
	mux_out <= in0 WHEN sel = '0' ELSE in1;
END dataflow ;
