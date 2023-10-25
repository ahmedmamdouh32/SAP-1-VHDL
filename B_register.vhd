library IEEE;
use IEEE.std_logic_1164.all;

entity B_register is
	 port(
		 clk        : in  STD_LOGIC;
		 LB         : in  STD_LOGIC;  --makes B register read data from bus (active LOW)	
 		 From_BUS   : in  STD_LOGIC_VECTOR(7 downto 0) :="ZZZZZZZZ";
		 to_Add_Sub : out STD_LOGIC_VECTOR(7 downto 0) :="00000000"
	     );
end B_register;


architecture behaviour of B_register is
begin 
	process
	begin
		wait for 1ns;
		
		if(clk='1') then
			if(LB='0') then
				to_Add_Sub <= From_BUS;

			end if;
		end if;	
	end process;

end behaviour;
