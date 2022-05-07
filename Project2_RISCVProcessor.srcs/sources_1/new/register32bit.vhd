-- Design Entity: register32bit
--
-- Register with asynchronous Set and Reset. If Set = 1, then output
-- Q is set to all 1. Otherwise, if Reset = 1, Q is reset to all 0. 
-- In all other cases register works as D-flip-flops. 
-- You can use it to implement the Program Counter register Component
-- from the RISC-V processor design. But, it can be used whereever you
-- need a register.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


ENTITY register32bit IS
  GENERIC ( N : INTEGER := 32);
  PORT ( 
    I : IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
    CLK, Reset, Set : IN STD_LOGIC;
    Q : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0)
  );
END register32bit;


ARCHITECTURE my_functional_descr OF register32bit IS

BEGIN
	PROCESS (Set, Reset, CLK)
	BEGIN	
		IF Set = '1' THEN
			Q <= (OTHERS => '1');
		ELSIF Reset = '1' THEN
		  Q <= (OTHERS => '0');
		ELSIF (CLK'EVENT AND CLK = '1') THEN
		  Q <= I;
		END IF;
	END PROCESS;
  
END my_functional_descr;