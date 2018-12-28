
-- VHDL Instantiation Created from source file MUX_4to1_8bit.vhd -- 12:26:37 06/17/2018
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT MUX_4to1_8bit
	PORT(
		a : IN std_logic_vector(7 downto 0);
		b : IN std_logic_vector(7 downto 0);
		c : IN std_logic_vector(7 downto 0);
		d : IN std_logic_vector(7 downto 0);
		s : IN std_logic_vector(1 downto 0);          
		z : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	Inst_MUX_4to1_8bit: MUX_4to1_8bit PORT MAP(
		a => ,
		b => ,
		c => ,
		d => ,
		s => ,
		z => 
	);


