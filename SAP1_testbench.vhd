library IEEE;
use IEEE.std_logic_1164.all;


entity SAP1_testbench is
	port(clk    : in STD_LOGIC;
		 clr_PC : in STD_LOGIC
		);
end SAP1_testbench;


architecture SAP1_testbench of SAP1_testbench is 
					 			   
signal CON              : STD_LOGIC_VECTOR(11 downto 0); --carry control signals
signal wbus             : STD_LOGIC_VECTOR(7 downto 0); --the BUS	
signal mar_to_ram       : STD_LOGIC_VECTOR(3 downto 0);
signal IR_to_controller : STD_LOGIC_VECTOR(3 downto 0);
signal ac_to_adder      : STD_LOGIC_VECTOR(7 downto 0);	
signal B_to_adder       : STD_LOGIC_VECTOR(7 downto 0);
signal output           : STD_LOGIC_VECTOR(7 downto 0); 
signal PC_to_wbus       : STD_LOGIC_VECTOR(3 downto 0);
signal RAM_to_wbus      : STD_LOGIC_VECTOR(7 downto 0);
signal IR_to_wbus       : STD_LOGIC_VECTOR(3 downto 0);
signal Acc_to_wbus      : STD_LOGIC_VECTOR(7 downto 0);
signal Adder_to_wbus    : STD_LOGIC_VECTOR(7 downto 0);

begin
	
	
	
	PC : entity work.program_counter(program_counterArch) port map(
		clk    => clk,
		clr    => clr_PC,
		Cp     => CON(11),
		Ep     => CON(10),
		to_BUS => PC_to_wbus
		);  
		


	MAR : entity work.MAR(behaviour) port map(
		clk      => clk,
		lm       => CON(9),
		from_bus => WBUS(3 downto 0),
		to_RAM   => mar_to_ram
		);
	

		
	RAM : entity work.RAM(behaviour) port map( 
		CE       => CON(8),
		from_MAR => mar_to_ram,
		to_BUS   => RAM_to_wbus
		);
				
		
		
	IR : entity work.Instruction_register(behaviour) port map(	
		LI            => CON(7),
		EI            => CON(6),
		CLK           => clk,
		From_BUS      => WBUS,
		to_controller => IR_to_controller,
		to_BUS        => IR_to_wbus
		);
		
		

	AC : entity work.accumulator(behaviour) port map(
			
		CLK        => clk,
		LA         => CON(5),
		EA         => CON(4),
		From_BUS   => WBUS,
		to_BUS     => Acc_to_wbus,
		to_Add_sub => ac_to_adder
		); 
		
		
	
		
	add_sub : entity work.Adder_Subtractor(behaviour) port map(
		SU               => CON(3),
		EU               => CON(2),
		From_B_register  => B_to_adder,
		From_Accumulator => ac_to_adder,
		to_BUS           => Adder_to_wbus
		);	
		

		
	B_register : entity work.B_register(behaviour) port map(
		clk        => clk,
		LB         => CON(1),
		From_BUS   => WBUS,
		to_Add_Sub => B_to_adder
		);	
		
	
		
	Output_register : entity work.Output_register(behaviour) port map(
		clk            => clk,
		LO             => CON(0),
		from_BUS       => WBUS,
		Binary_display => output
		); 
		
		
		
	Controller : entity work.controller(behaviour) port map(
		clk     => clk,
		From_IR => IR_to_controller,
		con     => CON
		);
		
		
		
	the_bus : entity work.wbus(behaviour) port map(
		clk          => clk,
		pc           => PC_to_wbus,
		ram          => RAM_to_wbus,
		IR           => IR_to_wbus,
		Acc          => Acc_to_wbus,
		Adder        => Adder_to_wbus,
		selectors(0) => CON(4), --EA
		selectors(1) => CON(2), --EU
		selectors(2) => CON(6), --EI
		selectors(3) => CON(8), --CE
		selectors(4) => CON(10),--EP
		op           => WBUS
		);
		
	

end SAP1_testbench;
