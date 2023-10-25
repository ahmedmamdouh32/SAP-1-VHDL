library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;  --used for making arithmetic operations

entity Adder_Subtractor is
	 port(
		 SU               : in  STD_LOGIC; --A+B(when LOW) , A-B(when HIGH)
		 EU               : in  STD_LOGIC; --makes Adder/Subtractor send data on bus
		 From_B_register  : in  STD_LOGIC_VECTOR(7 downto 0);
		 From_Accumulator : in  STD_LOGIC_VECTOR(7 downto 0);
		 to_BUS           : out STD_LOGIC_VECTOR(7 downto 0)
	     );
end Adder_Subtractor;


architecture behaviour of Adder_Subtractor is	

signal sum : STD_LOGIC_VECTOR(7 downto 0); --store arithmetic operation result

begin  
	
	process 
	begin	
		wait for 1ns;
		
		if(SU='0') then
			sum <= unsigned(From_Accumulator) + unsigned(From_B_register);
		elsif (SU='1') then		
			sum <= unsigned(From_Accumulator) - unsigned(From_B_register);
		end if;
		
		if (EU='1') then
			to_BUS <= sum;
		else
			to_BUS<="ZZZZZZZZ";
		end if;
		
	end process;
		
			

end behaviour;
