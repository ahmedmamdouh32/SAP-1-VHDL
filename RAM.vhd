library IEEE;
use IEEE.std_logic_1164.all;

entity RAM is
	 port(
		 CE       : in  STD_LOGIC;
		 from_MAR : in  STD_LOGIC_VECTOR(3 downto 0);  --it caries the address of word
		 to_BUS   : out STD_LOGIC_VECTOR(7 downto 0)	-- it caries the address stored data
	     );
end RAM;

architecture behaviour of RAM is
type matrix is array (0 to 15)of STD_LOGIC_VECTOR(7 downto 0);  
signal memory : matrix := (   
	"00001100",	--address: 0000
	"00100110",	--address: 0001
	"11100000",	--address: 0010
	"00011010",	--address: 0011
	"11100000",	--address: 0100
	"00001111",	--address: 0101
	"00000010",	--address: 0110
	"00000111",	--address: 0111
	"00001000",	--address: 1000
	"00001001",	--address: 1001
	"00000010",  --address: 1010
	"00001011",	--address: 1011
	"11001010",	--address: 1100
	"00001101",	--address: 1101
	"00001110",	--address: 1110
	"00001111");--address: 1111 	




begin

  process(from_MAR,CE)
   begin 	 
	   
	   case from_MAR is
		   when "0000" => to_BUS <= memory(0);	 
		   when "0001" => to_BUS <= memory(1);		  
		   when "0010" => to_BUS <= memory(2);	 
		   when "0011" => to_BUS <= memory(3);	
		   when "0100" => to_BUS <= memory(4);	 
		   when "0101" => to_BUS <= memory(5);		  
		   when "0110" => to_BUS <= memory(6);	 
		   when "0111" => to_BUS <= memory(7);
		   when "1000" => to_BUS <= memory(8);	 
		   when "1001" => to_BUS <= memory(9);		  
		   when "1010" => to_BUS <= memory(10);	 
		   when "1011" => to_BUS <= memory(11);	
		   when "1100" => to_BUS <= memory(12);	 
		   when "1101" => to_BUS <= memory(13);		  
		   when "1110" => to_BUS <= memory(14);	 
		   when "1111" => to_BUS <= memory(15);	
		   when others => to_BUS <="LLLLLLLL";
	   end case;	
	   	 	   
end process;

end behaviour;

