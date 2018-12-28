
-- VHDL Instantiation Created from source file sequence_counter.vhd -- 14:45:03 06/17/2018
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT sequence_counter
	PORT(
		clk : IN std_logic;
		clear : IN std_logic;          
		output : OUT std_logic_vector(1 downto 0)
		);
	END COMPONENT;

	Inst_sequence_counter: sequence_counter PORT MAP(
		clk => ,
		clear => ,
		output => 
	);


