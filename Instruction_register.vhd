library IEEE;
use IEEE.std_logic_1164.all;

entity Instruction_register is
	 port(
		 LI            : in  STD_LOGIC; --makes Instruction register read data from bus
		 EI            : in  STD_LOGIC; --makes Instruction register send data to bus
		 CLK           : in  STD_LOGIC;
		 From_BUS      : in  STD_LOGIC_VECTOR(7 downto 0);
		 to_controller : out STD_LOGIC_VECTOR(3 downto 0);
		 to_BUS        : out STD_LOGIC_VECTOR(3 downto 0) 
	     );
end Instruction_register;


architecture behaviour of Instruction_register is 

signal instruction : STD_LOGIC_VECTOR(7 downto 0);

begin

process --(clk,LI,EI,CLR)
begin 	 
	wait for 1 ns	 ;
	if(clk='1') then
		if(LI='0') then
		instruction <= From_BUS;
		to_controller <= From_BUS(7 downto 4);

		end if;
		
		end if;

				
end process;
to_BUS <= instruction(3 downto 0);
end behaviour;
