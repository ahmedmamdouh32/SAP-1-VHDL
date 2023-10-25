library IEEE;
use IEEE.std_logic_1164.all;

entity wbus is
	port( 
		 clk       : in  STD_LOGIC;
		 pc        : in  STD_LOGIC_VECTOR(3 downto 0);
		 ram       : in  STD_LOGIC_VECTOR(7 downto 0);
		 IR        : in  STD_LOGIC_VECTOR(3 downto 0);
		 Acc       : in  STD_LOGIC_VECTOR(7 downto 0);
		 Adder     : in  STD_LOGIC_VECTOR(7 downto 0); 
		 selectors : in  STD_LOGIC_VECTOR(4 downto 0);
		 op        : out STD_LOGIC_VECTOR(7 downto 0) :="ZZZZZZZZ"
	     );
end wbus;


architecture behaviour of wbus is
begin
  
	process(clk,selectors) 
	begin
		
		if(clk'event and clk='0' and selectors(4)='1') then
			op(3 downto 0) <= pc;
			op(7 downto 4) <= "ZZZZ";
		elsif(clk'event and clk='1') then
			if(selectors="00100") then
				op <= ram;
			elsif(selectors="01000") then
				op(3 downto 0) <= IR;
				op(7 downto 4) <= "ZZZZ";
			elsif(selectors="01101") then
				op <= Acc;
			elsif(selectors="01110") then
				op <= Adder;
			end if;
		end if;
				
			end process;
	
	 

end behaviour;
