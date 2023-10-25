library IEEE;
use IEEE.std_logic_1164.all;

entity Output_register is
	 port(
		 clk            : in  STD_LOGIC;
		 LO             : in  STD_LOGIC;  --makes Output register read data from bus (active LOW)
		 From_BUS       : in  STD_LOGIC_VECTOR(7 downto 0);
		 Binary_display : out STD_LOGIC_VECTOR(7 downto 0)
	     );
end Output_register;


architecture behaviour of Output_register is
begin
	
	process
	begin	   
		wait for 1ns;
		if(clk='1') then
			if (LO='0') then
				Binary_display <= From_BUS;

			end if;
		end if;	 
	end process;
		
end behaviour;
