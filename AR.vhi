
-- VHDL Instantiation Created from source file AR.vhd -- 09:06:34 06/17/2018
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT AR
	PORT(
		in_data : IN std_logic_vector(9 downto 0);
		load : IN std_logic;
		rst : IN std_logic;
		clk : IN std_logic;
		inr : IN std_logic;          
		out_data : OUT std_logic_vector(9 downto 0)
		);
	END COMPONENT;

	Inst_AR: AR PORT MAP(
		in_data => ,
		out_data => ,
		load => ,
		rst => ,
		clk => ,
		inr => 
	);


