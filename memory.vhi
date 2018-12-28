
-- VHDL Instantiation Created from source file memory.vhd -- 11:30:48 06/17/2018
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT memory
	PORT(
		address : IN std_logic_vector(11 downto 0);
		in_data : IN std_logic_vector(15 downto 0);
		wr : IN std_logic;
		re : IN std_logic;          
		out_data : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;

	Inst_memory: memory PORT MAP(
		address => ,
		in_data => ,
		out_data => ,
		wr => ,
		re => 
	);


