
-- VHDL Instantiation Created from source file INP.vhd -- 09:05:29 06/17/2018
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT INP
	PORT(
		in_data : IN std_logic_vector(7 downto 0);
		load : IN std_logic;
		rst : IN std_logic;
		clk : IN std_logic;
		inr : IN std_logic;          
		out_data : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	Inst_INP: INP PORT MAP(
		in_data => ,
		load => ,
		rst => ,
		clk => ,
		inr => ,
		out_data => 
	);


