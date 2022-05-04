----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/02/2022 02:59:48 PM
-- Design Name: 
-- Module Name: top_riscvProcessor - Behavioral
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

entity top_riscvProcessor is
--  Port ( );
end top_riscvProcessor;

architecture Behavioral of top_riscvProcessor is
-- =============================
-- Component Declarations
-- =============================

-- 32bit ALU component
component top_ALU is
    Port ( 
           Xinvert : in STD_LOGIC;
           Yinvert : in STD_LOGIC;
           Op : in STD_LOGIC_VECTOR (1 downto 0);
           x : in STD_LOGIC_VECTOR(31 downto 0);
           y : in STD_LOGIC_VECTOR(31 downto 0);
           over : out STD_LOGIC;
           z : out STD_LOGIC_VECTOR(31 downto 0);
           zero : out STD_LOGIC
          );
end component;

-- 32bit adder component
component top_adder_32bit is
    Port (
           a, b : in std_logic_vector(31 downto 0);
           z : out std_logic_vector(31 downto 0);
           cout : out std_logic
          );
end component;

-- ALU Control component
component ALUcontrol is
    Port ( 
           funct7 : in STD_LOGIC_VECTOR (6 downto 0);           --funct7 of instruction (aka I[31-25])
           funct3 : in STD_LOGIC_VECTOR (2 downto 0);           --funct3 of instruction (aka I[14-12])
           ALUop : in STD_LOGIC_VECTOR (1 downto 0);            --ALUop from Main Control
           ALUoperation : out STD_LOGIC_VECTOR (3 downto 0)     --ALUcontrol Output to ALU
          );
end component;

-- Main Control component
component mn_ctrl is
    Port ( 
           opcode  : in  std_logic_vector(6 downto 0);
           branch  : out std_logic;
           MemRead : out std_logic;
           Mem2Reg : out std_logic;
           ALUop   : out std_logic_vector(1 downto 0);
           MemWrite: out std_logic;
           ALUsrc  : out std_logic;
           RegWrite: out std_logic
          );
end component;

-- Data Memory component
component data_memory is
    port ( 
           reset : in std_logic;
           clk : in std_logic;
           MW : in std_logic;
           addr_in : in std_logic_vector(31 downto 0); -- we use only 4 bits though here;
           data_in : in std_logic_vector(31 downto 0);
           data_out : out std_logic_vector(31 downto 0) 
          );
end component;

-- Instruction Memory component
component instruction_memory is 
    port ( 
           addr_in : in std_logic_vector(31 downto 0); 
           instr_out : out std_logic_vector(31 downto 0) 
          );
end component;

-- Registers File component
component registers_file is
    Port ( 
           clock, reset : in std_logic;
           writeenable : in std_logic;
           writedata : in std_logic_vector(31 downto 0);
           writereg : in std_logic_vector(4 downto 0);
           readreg1 : in std_logic_vector(4 downto 0);
           readreg2 : in std_logic_vector(4 downto 0);
           readdata1 : out std_logic_vector(31 downto 0);
           readdata2 : out std_logic_vector(31 downto 0)
          );
end component;

-- 2to1 32bit MUX component
component mux2to1_32bit IS
	PORT (
    in0, in1 : IN STD_LOGIC_VECTOR (31 downto 0);
    sel : IN STD_LOGIC;
		mux_out : OUT STD_LOGIC_VECTOR (31 downto 0)
  );
END component;

-- AND Gate component
component ANDgate is
    Port ( in0 : in STD_LOGIC;
           in1 : in STD_LOGIC;
           result : out STD_LOGIC);
end component;

-- Register32 Component (PC of Processor)
component register32bit IS
  GENERIC ( N : INTEGER := 32);
  PORT ( 
    I : IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
    CLK, Reset, Set : IN STD_LOGIC;
    Q : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0)
  );
END component;

--PC signal lines
signal PCtoAdd : std_logic_vector (31 downto 0);
signal MUXintoPC : std_logic_vector (31 downto 0);

signal clk : std_logic;
signal reset : std_logic;
signal set : std_logic;

-- Instruction Memory signal lines
signal PCintoIM : std_logic_vector (31 downto 0);
signal outputIM : std_logic_vector (31 downto 0);

-- Main Control signal lines
signal branchCtrl : std_logic;
signal memReadCtrl : std_logic;
signal mem2RegCtrl : std_logic;
signal aluOpCtrl : std_logic_vector(1 downto 0);
signal memWriteCtrl : std_logic;
signal aluSrcCtrl : std_logic;
signal regWriteCtrl : std_logic;

-- Register File signal lines
signal writeDataIn : std_logic_vector (31 downto 0);
signal regDataOutA : std_logic_vector (31 downto 0);
signal regDataOutB : std_logic_vector (31 downto 0);

-- ALU Control signal lines
signal ALUCtrl2ALU : std_logic_vector (3 downto 0);

-- 2to1MUX for RegFile to ALU signal lines (Immediate Gen. Signal line)
signal immGenOut : std_logic_vector (31 downto 0);
signal reg2aluMuxOut : std_logic_vector (31 downto 0);

-- ALU component signal lines
signal overflow : std_logic;
signal aluResult : std_logic_vector(31 downto 0);
signal aluZero : std_logic;

-- Data Memory signal lines
signal dataMemRead : std_logic_vector (31 downto 0);

-- 2to1MUX for (Data Memory / ALU Output) to Register Data Write signal lines
signal dataMem_aluOut2regData : std_logic_vector (31 downto 0);

-- PC + 4 Adder signal lines
signal constant4 : std_logic_vector (31 downto 0);
signal add4Out : std_logic_vector (31 downto 0);
signal cout1 : std_logic;

-- PC + Immediate Adder signal lines
signal addImmOut : std_logic_vector (31 downto 0);
signal cout2 : std_logic;

-- Logic AND gate signal lines
signal ANDResult : std_logic;

-- Begin of process
begin

-- PC component declaration
pc : register32bit PORT MAP(MUXintoPC, clk, reset, set, PCtoAdd);

-- Instruction memory declaration
im : instruction_memory PORT MAP(PCintoIM, outputIM);

-- Main Control declaration
mn : mn_ctrl PORT MAP(outputIM(6 downto 0), branchCtrl, memReadCtrl, mem2RegCtrl, aluOpCtrl, 
                      memWriteCtrl, aluSrcCtrl, regWriteCtrl);
                      
-- Registers File declaration
rf : registers_file PORT MAP(clk, reset, regwriteCtrl, writeDataIn, outputIM(11 downto 7),
                             outputIM(19 downto 15), outputIM(24 downto 20), regDataOutA, regDataOutB);

-- ALU Control declaration
ctrlalu : ALUcontrol PORT MAP(outputIM(31 downto 25), outputIM(14 downto 12), aluOpCtrl, ALUCtrl2ALU);

-- MUX declaration  (MUX for connection between Register File and ALU)
mx1 : mux2to1_32bit PORT MAP(regDataOutB, immGenOut, aluSrcCtrl, reg2aluMuxOut);

-- ALU component declaration
alu : top_ALU PORT MAP(ALUCtrl2ALU(3), ALUCtrl2ALU(2), ALUCtrl2ALU(1 downto 0), regDataOutA,
                       reg2aluMuxOut, overflow, aluResult, aluZero);

-- Data Memory declaration
dm : data_memory PORT MAP(reset, clk, memWriteCtrl, aluResult, regDataOutB, dataMemRead);

-- MUX declaration  (MUX for connection between (Data Memory / ALU output) and Register Data Write)
mx2 : mux2to1_32bit PORT MAP(aluResult, dataMemRead, mem2RegCtrl, writeDataIn);

-- Adder for PC current + 4
constant4 <= "00000000000000000000000000000100"
add1 : top_adder_32bit PORT MAP(PCtoAdd, constant4, add4Out, cout1);

-- Adder for PC current + Immediate
add2 : top_adder_32bit PORT MAP(PCtoAdd, immGenOut, addImmOut, cout2);

-- AND gate declaration for control to select Adder result to PC
gate : ANDgate PORT MAP ( branchCtrl, aluZero, ANDresult);

-- MUX declaration (MUX for connection between next Adder Results and PC)
mx3 : mux2to1_32bit PORT MAP(add4Out, addImmOut, ANDresult, MUXintoPC);

end Behavioral;
