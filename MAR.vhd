library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity MAR is 
	port (
	clk      : in  std_logic;
	Lm       : in  std_logic;
	from_bus : in  std_logic_vector(3 downto 0);
	to_RAM   : out std_logic_vector(3 downto 0)
	);
end MAR;

architecture Behaviour of MAR is
begin

process (clk,lm)
  
  begin
    
    if(clk'event and clk='1') then 
      if (Lm='0') then 
      to_RAM<=from_bus;
      end if;
    end if;
    
end process;
  
end Behaviour;