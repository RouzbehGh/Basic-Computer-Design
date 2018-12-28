
-- VHDL Instantiation Created from source file Control_Unit.vhd -- 14:02:22 06/18/2018
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Control_Unit
	PORT(
		clk : IN std_logic;
		MBR9_0 : IN std_logic_vector(9 downto 0);
		Q : IN std_logic_vector(15 downto 0);
		I0 : IN std_logic;
		I1 : IN std_logic;
		C : IN std_logic_vector(4 downto 0);
		ZF : IN std_logic;
		CF : IN std_logic;
		FGI : IN std_logic;
		FGO : IN std_logic;
		T : IN std_logic_vector(3 downto 0);
		AC : IN std_logic_vector(7 downto 0);
		INF : IN std_logic;          
		B : OUT std_logic_vector(2 downto 0);
		S : OUT std_logic;
		MAR_LD : OUT std_logic;
		MUX_2to1_16bit_select : OUT std_logic;
		MBR_LD : OUT std_logic;
		PC_INC : OUT std_logic;
		I0_LD : OUT std_logic;
		I1_LD : OUT std_logic;
		OPR_LD : OUT std_logic;
		AR_LD : OUT std_logic;
		R_LD : OUT std_logic;
		F_LD : OUT std_logic;
		G_LD : OUT std_logic;
		R_RST : OUT std_logic;
		F_RST : OUT std_logic;
		G_RST : OUT std_logic;
		SEQ_COUNT_RST : OUT std_logic;
		ALU_OP : OUT std_logic_vector(2 downto 0);
		a : OUT std_logic_vector(1 downto 0);
		AC_LD : OUT std_logic;
		MEM_W : OUT std_logic;
		PC_LD : OUT std_logic;
		AR_INC : OUT std_logic;
		MBR_DEC : OUT std_logic;
		CR_LD : OUT std_logic;
		AC_RST : OUT std_logic;
		AC_SHR : OUT std_logic;
		AC_SHL : OUT std_logic;
		AC_INC : OUT std_logic;
		FGI_RST : OUT std_logic;
		FGI_LD : OUT std_logic;
		FGO_RST : OUT std_logic;
		FGO_LD : OUT std_logic;
		OUTR_LD : OUT std_logic;
		INF_LD : OUT std_logic;
		INF_RST : OUT std_logic;
		PC_RST : OUT std_logic;
		MAR_RST : OUT std_logic;
		CF_RST : OUT std_logic;
		ZF_RST : OUT std_logic
		);
	END COMPONENT;

	Inst_Control_Unit: Control_Unit PORT MAP(
		clk => ,
		MBR9_0 => ,
		Q => ,
		I0 => ,
		I1 => ,
		C => ,
		ZF => ,
		CF => ,
		FGI => ,
		FGO => ,
		T => ,
		AC => ,
		INF => ,
		B => ,
		S => ,
		MAR_LD => ,
		MUX_2to1_16bit_select => ,
		MBR_LD => ,
		PC_INC => ,
		I0_LD => ,
		I1_LD => ,
		OPR_LD => ,
		AR_LD => ,
		R_LD => ,
		F_LD => ,
		G_LD => ,
		R_RST => ,
		F_RST => ,
		G_RST => ,
		SEQ_COUNT_RST => ,
		ALU_OP => ,
		a => ,
		AC_LD => ,
		MEM_W => ,
		PC_LD => ,
		AR_INC => ,
		MBR_DEC => ,
		CR_LD => ,
		AC_RST => ,
		AC_SHR => ,
		AC_SHL => ,
		AC_INC => ,
		FGI_RST => ,
		FGI_LD => ,
		FGO_RST => ,
		FGO_LD => ,
		OUTR_LD => ,
		INF_LD => ,
		INF_RST => ,
		PC_RST => ,
		MAR_RST => ,
		CF_RST => ,
		ZF_RST => 
	);


