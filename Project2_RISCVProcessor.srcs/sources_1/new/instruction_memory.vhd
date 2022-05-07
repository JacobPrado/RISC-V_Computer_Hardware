-- this is a read only memory, where Instructions are stored

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity instruction_memory is 
  port ( 
    addr_in : in std_logic_vector(31 downto 0); 
    instr_out : out std_logic_vector(31 downto 0) 
  );
end instruction_memory;


architecture behavioral_arch of instruction_memory is

begin	   
	
	instr_mem_process: process (addr_in) is
		variable var_addr : integer;
	begin 
		-- hard coded contents of the instruction memory; this
		-- is supposed to implement the program you want the processor to execute!	
		-- 	
		-- a simple program: 
    -- bring 1 from data mem loc 0 (hard coded therein)	and place in R4
		-- then add it with const. 3 to get 4 and place in R5; then add R5 and R4
		-- that is 4 + 3 = 7 and place in R6; finally store R6 into mem loc 1;
		-- so, finally data mem loc 1 should contain the result 7;
		--
		--  LW   $4, $0      -  R[4] <- M[R[0]], load $4 with 1 (that is data from mem location $0, which is location 0)
		--  ADDI $5, $4, 3   -  R[5] <- R[4] + 3, add 1 + 3 and place in $5
		--  ADD  $6, $5, $4  -  R[6] <- R[5] + R[4], add 4 + 1 and place in $6
		--  SW   $4, $6      -  M[R[4]] <- R[6], store data from $6 (that is value 5) into mem location $1, which is address 1

		var_addr := conv_integer(addr_in(3 downto 0));
		case var_addr is
			when 0  => instr_out <= "00000000101000000010001100000011"; -- replace with machine code of: LW   $4, $0
            when 1  => instr_out <= "00000000101100000010001110000011"; -- replace with machine code of: ADDI $5, $4, 3
            --when 2  => instr_out <= "00000000001100100000001000010011"; -- replace with machine code of: ADDI $4, $4, 3
            when 2  => instr_out <= "00000000110100000010111000000011"; -- replace with machine code of: ADD  $6, $5, $4
            when 3  => instr_out <= "00000000011100110000111010110011"; -- replace with machine code of: SW   $4, $6
			when 4  => instr_out <= "00000000011100110000111100110011";
			when 5  => instr_out <= "00000001110111100000000101100011";
			when 6  => instr_out <= "00000001110111100000111100110011";
			when 7  => instr_out <= "00000001111000000010011100100011";
			when 8  => instr_out <= "00000000111000000010111110000011";
			when 9  => instr_out <= X"00000000";
			when 10 => instr_out <= X"00000000";
			when 11 => instr_out <= X"00000000";
			when 12 => instr_out <= X"00000000";
			when 13 => instr_out <= X"00000000";
			when 14 => instr_out <= X"00000000";
			when 15 => instr_out <= X"00000000";
			when others =>  
				instr_out <= X"00000000";
		end case;
	end process;
  
end behavioral_arch;