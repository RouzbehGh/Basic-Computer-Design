
-- VHDL Instantiation Created from source file alu.vhd -- 09:57:10 06/17/2018
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT alu
	PORT(
		a : IN std_logic_vector(15 downto 0);
		b : IN std_logic_vector(15 downto 0);
		alu_op : IN std_logic_vector(2 downto 0);          
		output : OUT std_logic_vector(15 downto 0);
		cout : OUT std_logic;
		zero : OUT std_logic
		);
	END COMPONENT;

	Inst_alu: alu PORT MAP(
		a => ,
		b => ,
		alu_op => ,
		output => ,
		cout => ,
		zero => 
	);


