library IEEE;
use IEEE.std_logic_1164.all;

entity accumulator is
	port(
     CLK        : in  STD_LOGIC;
     LA         : in  STD_LOGIC;  --makes accumulator read data from bus (active LOW)
     EA         : in  STD_LOGIC;  --makes accumulator send data to bus (active HIGH)
     From_BUS   : in  STD_LOGIC_VECTOR(7 downto 0) ;
     to_BUS     : out STD_LOGIC_VECTOR(7 downto 0) ;
     to_Add_sub : out STD_LOGIC_VECTOR(7 downto 0) 
	 );
end accumulator;


architecture behaviour of accumulator is 

signal accumulator_data : std_logic_vector(7 downto 0) ;  --to store data in accumulator

begin
	
	process
	begin		 
		wait for 1ns;			
		
		if (clk='1' and LA='0') then 
				accumulator_data <= From_BUS;
				to_Add_Sub <= From_BUS;
		end if;
	end process;
	to_BUS <= accumulator_data;
end behaviour;