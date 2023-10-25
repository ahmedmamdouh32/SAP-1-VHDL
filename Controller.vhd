library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;  --used for making arithmetic operations

entity controller is
	 port(
	     From_IR : in  STD_LOGIC_VECTOR(3 downto 0);
	     clk     : in  STD_LOGIC;
		 CON     : out STD_LOGIC_VECTOR(11 downto 0) --control signals
	     );
end controller;


architecture behaviour of controller is
signal counter : integer range 1 to 6:=1; 
signal T : STD_LOGIC_VECTOR(5 downto 0):="000001";

begin

	process(clk,counter,T)
	begin
		if(clk'event and clk='0')then 
			
			
		case counter is 
		when 1 => T <= "000001";
		when 2 => T <= "000010";
		when 3 => T <= "000100";
		when 4 => T <= "001000";
		when 5 => T <= "010000";
		when 6 => T <= "100000";
		end case;
			
 		if(counter<6) then
			counter <= counter+1; 
		else 
			counter <= 1;
		end if;
		
		end if;
		
  
		
		 if(T(0)='1') then 
			CON <="010111100011";
			
		elsif(T(1)='1') then
			CON <= "100111100011"; 
			
		elsif(T(2)='1') then
			CON <= "001001100011";
			
		elsif(T(3)='1') then
			if(From_IR="0000")then --LDA operation
				CON <= "000110100011";
			elsif(From_IR="0001" or From_IR="0010") then --ADD and SUB operations
				CON <="000110100011"; 
			elsif(From_IR="1110") then --OUT operation
				CON <= "001111110010";
		    end if;
			
		elsif(T(4)='1') then
			if(From_IR="0000")then --LDA operation
				CON <= "001011000011";
			elsif(From_IR="0001" or From_IR="0010") then --ADD and SUB operations
				CON <= "001011100001"; 	
			elsif(From_IR="1110") then
				CON <= "ZZZZZZZZZZZZ";
		    end if;	
			
		elsif(T(5)='1') then 
			if(From_IR="0000")then --LDA operation
				CON <= "ZZZZZZZZZZZZ";			
			elsif(From_IR="0001") then --ADD operations
				CON <= "001111000111";
			elsif(From_IR="0010") then --SUB operation
				CON <= "001111001111";
			elsif(From_IR="1110") then
				CON <= "ZZZZZZZZZZZZ";				
		    end if;	
			
		end if;
	 
	 	   end process;

end behaviour;
