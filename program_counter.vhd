library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity program_counter is 
	port (
	clk    : in  std_logic;
	clr    : in  std_logic; --to clear counter(active LOW)
	Cp     : in  std_logic; --counter enable
	Ep     : in  std_logic; --to send data to bus
	to_BUS : out std_logic_vector(3 downto 0) :="0000"
	);
end program_counter;


architecture program_counterArch of program_counter is 

signal temp : std_logic_vector(3 downto 0) :="0000";

begin

process (clk,clr,Cp,Ep)
begin 
	
if(clr='0') then
	temp <= "0000";
end if;


if(clk'event and clk='1') then
   if(Cp='1') then 
	temp <= temp +'1';
end if;
end if;	
	 to_BUS <=temp;


end process ;



end program_counterArch;
