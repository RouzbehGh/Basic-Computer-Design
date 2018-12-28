----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:25:53 07/01/2018 
-- Design Name: 
-- Module Name:    CPU - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CPU is
    generic ( n : INTEGER := 10 ; m : INTEGER := 8 ; p : INTEGER := 16 );
    Port ( clk : in  STD_LOGIC);
end CPU;

architecture Behavioral of CPU is

----------------------------------------- Components -------------------------------------

	COMPONENT PC
	PORT(
		input_data : IN std_logic_vector(n-1 downto 0);
		load : IN std_logic;
		Reset : IN std_logic;
		clk : IN std_logic;
		inc : IN std_logic;          
		output_data : OUT std_logic_vector(n-1 downto 0)
		);
	END COMPONENT;
	
	COMPONENT AR
	PORT(
		input_data : IN std_logic_vector(n-1 downto 0);
		load : IN std_logic;
		Reset : IN std_logic;
		clk : IN std_logic;
		inc : IN std_logic;          
		output_data : OUT std_logic_vector(n-1 downto 0)
		);
	END COMPONENT;
	
	COMPONENT MUX_2to1_10bit
	PORT(
        PC_input : in  STD_LOGIC_VECTOR (n-1 downto 0);
        AR_input : in  STD_LOGIC_VECTOR (n-1 downto 0);
        sel : in  STD_LOGIC;
        output_MAR : out  STD_LOGIC_VECTOR (n-1 downto 0)
		);
	END COMPONENT;

	COMPONENT MAR
	PORT(
		input_data : IN std_logic_vector(n-1 downto 0);
		load : IN std_logic;
		Reset : IN std_logic;
		clk : IN std_logic;
		inc : IN std_logic;          
		output_data : OUT std_logic_vector(n-1 downto 0)
		);
	END COMPONENT;
	
	COMPONENT MBR
	PORT(
		input_data : IN std_logic_vector(p-1 downto 0);
		load : IN std_logic;
		Reset : IN std_logic;
		clk : IN std_logic;
		inc : IN std_logic;
		dec : IN  STD_LOGIC;		
		output_data : OUT std_logic_vector(p-1 downto 0)
		);
	END COMPONENT;
	
	COMPONENT memory
	PORT(
		address : IN std_logic_vector(n-1 downto 0);
		input_data : IN std_logic_vector(p-1 downto 0);
		wr : IN std_logic;
		re : IN std_logic;          
		output_data : OUT std_logic_vector(p-1 downto 0)
		);
	END COMPONENT;
	
	COMPONENT MUX_2to1_16bit
	PORT(
		Bus_out : in  STD_LOGIC_VECTOR (p-1 downto 0);
      RAM_out : in  STD_LOGIC_VECTOR (p-1 downto 0);
      sel : in  STD_LOGIC;
      MBR_input : out  STD_LOGIC_VECTOR (p-1 downto 0)
		);
	END COMPONENT;
	
	COMPONENT OUTR
	PORT(
		input_data : IN std_logic_vector(m-1 downto 0);
		load : IN std_logic;
		Reset : IN std_logic;
		clk : IN std_logic;
		inc : IN std_logic       
		);
	END COMPONENT;	
	
	COMPONENT CR
	PORT(
		input_data : IN std_logic_vector(m-1 downto 0);
		load : IN std_logic;
		Reset : IN std_logic;
		clk : IN std_logic;
		inc : IN std_logic          
		);
	END COMPONENT;
	
	COMPONENT INP
	PORT(
		load : IN std_logic;
		Reset : IN std_logic;
		clk : IN std_logic;
		inc : IN std_logic;          
		output_data : OUT std_logic_vector(m-1 downto 0)
		);
	END COMPONENT;
	
	COMPONENT MUX_8to1
	PORT(
		b : IN std_logic_vector(2 downto 0);
		inst1 : IN std_logic_vector(p-1 downto 0);
		inst2 : IN std_logic_vector(p-1 downto 0);
		inst3 : IN std_logic_vector(p-1 downto 0);
		inst4 : IN std_logic_vector(p-1 downto 0);
		inst5 : IN std_logic_vector(p-1 downto 0);
		inst6 : IN std_logic_vector(p-1 downto 0);
		inst7 : IN std_logic_vector(p-1 downto 0);
		inst8 : IN std_logic_vector(p-1 downto 0);          
		output : OUT std_logic_vector(p-1 downto 0)
		);
	END COMPONENT;
	
	COMPONENT OPR
	PORT(
		input_data : IN std_logic_vector(3 downto 0);
		output_data : OUT std_logic_vector(3 downto 0);
		load : IN std_logic;
		Reset : IN std_logic;
		clk : IN std_logic;
		inc : IN std_logic          
		);
	END COMPONENT;
	
	COMPONENT alu
    PORT ( Bus_input : in  STD_LOGIC_VECTOR (m-1 downto 0);
           AC_input : in  STD_LOGIC_VECTOR (m-1 downto 0);
           alu_opr : in  STD_LOGIC_VECTOR (3 downto 0);
           output : out  STD_LOGIC_VECTOR (m-1 downto 0);
           cout : out  STD_LOGIC;
           zero : out  STD_LOGIC
		);
	END COMPONENT;	
	
	COMPONENT DECODER_2to4
	PORT(
		sc_input : IN std_logic_vector(1 downto 0);          
		cu_output : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
	COMPONENT DECODER_3to8
	PORT(
		RFG_input : IN std_logic_vector(2 downto 0);          
		controlunit_output : OUT std_logic_vector(m-1 downto 0)
		);
	END COMPONENT;
	
	COMPONENT DECODER_4to16
	PORT(
		opr_input : in  STD_LOGIC_VECTOR (3 downto 0);
      cu_out : out  STD_LOGIC_VECTOR (p-1 downto 0)
		);
	END COMPONENT;
	
	COMPONENT AC
	PORT(
		input_data : IN std_logic_vector(m-1 downto 0);
		load : IN std_logic;
		Reset : IN std_logic;
		clk : IN std_logic;
		shr : IN std_logic;
		shl : IN std_logic;
		inc : IN std_logic;          
		output_data : OUT std_logic_vector(m-1 downto 0)
		);
	END COMPONENT;
	
	COMPONENT sequence_counter
	PORT(
		clk : IN std_logic;
		clear : IN std_logic;          
		output : OUT std_logic_vector(1 downto 0)
		);
	END COMPONENT;
	
	COMPONENT FF
	PORT(
		clk : IN std_logic;
		input : IN std_logic;
		Reset : IN std_logic;
		load : IN std_logic;          
		output : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT MUX_4to1_8bit
	PORT(
	    Bus_input : in  STD_LOGIC_VECTOR (m-1 downto 0);
       Alu_input : in  STD_LOGIC_VECTOR (m-1 downto 0);
       Inverter_input : in  STD_LOGIC_VECTOR (m-1 downto 0);
       all_zero : in  STD_LOGIC_VECTOR (m-1 downto 0);
       sel : in  STD_LOGIC_VECTOR (1 downto 0);
       AC_output : out  STD_LOGIC_VECTOR (m-1 downto 0)
		);
	END COMPONENT;
	
	COMPONENT INVERTER_8bit
	PORT(
		  AC_input : in  STD_LOGIC_VECTOR (m-1 downto 0);
        Mux_output : out  STD_LOGIC_VECTOR (m-1 downto 0)
		);
	END COMPONENT;
	
	COMPONENT Control_Unit
	PORT(
		clk : IN std_logic;
		MBR9_0 : IN std_logic_vector(n-1 downto 0);
		Q : IN std_logic_vector(p-1 downto 0);
		I0 : IN std_logic;
		I1 : IN std_logic;
		C : IN std_logic_vector(4 downto 0);
		ZF : IN std_logic;
		CF : IN std_logic;
		FGI : IN std_logic;
		FGO : IN std_logic;
		T : IN std_logic_vector(3 downto 0);
		AC : IN std_logic_vector(m-1 downto 0);
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
		R_Reset : OUT std_logic;
		F_Reset : OUT std_logic;
		G_Reset : OUT std_logic;
		SEQ_COUNT_Reset : OUT std_logic;
		ALU_OP : OUT std_logic_vector(3 downto 0);
		a : OUT std_logic_vector(1 downto 0);
		AC_LD : OUT std_logic;
		MEM_W : OUT std_logic;
		PC_LD : OUT std_logic;
		AR_INC : OUT std_logic;
		MBR_DEC : OUT std_logic;
		CR_LD : OUT std_logic;
		AC_Reset : OUT std_logic;
		AC_SHR : OUT std_logic;
		AC_SHL : OUT std_logic;
		AC_INC : OUT std_logic;
		FGI_Reset : OUT std_logic;
		FGI_LD : OUT std_logic;
		FGO_Reset : OUT std_logic;
		FGO_LD : OUT std_logic;
		OUTR_LD : OUT std_logic;
		INF_LD : OUT std_logic;
		INF_Reset : OUT std_logic;
		PC_Reset : OUT std_logic;
		MAR_Reset : OUT std_logic;
		CF_Reset : OUT std_logic;
		ZF_Reset : OUT std_logic
		);
	END COMPONENT;
---------------------------------------------- Define Signals ------------------------------
	
signal C_B :std_logic_vector(p-1 downto 0):=(others => '0'); 
signal PC_LD :std_logic :='0';	
signal PC_INC :std_logic :='0';	
signal PC_OUT :std_logic_vector(n-1 downto 0) :=(others => '0');	
signal PC_Reset :std_logic :='0';
signal AR_LD :std_logic :='0';	
signal AR_INC :std_logic :='0';	
signal AR_OUT :std_logic_vector(n-1 downto 0) :=(others => '0');	
signal S_2to1_10bit :std_logic :='0';	
signal MAR_LD :std_logic :='0';	
signal MAR_IN :std_logic_vector(n-1 downto 0) :=(others => '0');	
signal MAR_OUT :std_logic_vector(n-1 downto 0) :=(others => '0');	
signal MAR_Reset :std_logic :='0';		
signal MBR_LD :std_logic :='0';	
signal MBR_IN :std_logic_vector(p-1 downto 0) :=(others => '0');	
signal MBR_OUT :std_logic_vector(p-1 downto 0) :=(others => '0');	
signal MBR_INC :std_logic :='0';	
signal MBR_DEC :std_logic :='0';		
signal MEM_OUT :std_logic_vector(p-1 downto 0) :=(others => '0');		
signal MEM_W :std_logic :='0';	
signal MUX_2to1_16bit_select :std_logic :='0';		
signal OUTR_LD :std_logic :='0';	
signal CR_LD :std_logic :='0';	
signal INP_OUT :std_logic_vector(m-1 downto 0) :=(others => '0');		
signal INP_LD :std_logic :='0';	
signal OPR_OUT :std_logic_vector(3 downto 0) :=(others => '0');		
signal OPR_LD :std_logic :='0';	
signal ALU_OUT :std_logic_vector(m-1 downto 0) :=(others => '0');		
signal ALU_OP :std_logic_vector(3 downto 0) :=(others => '0');		
signal ALU_COUT :std_logic :='0';	
signal ALU_ZERO :std_logic :='0';	
signal SEQ_COUNT_Reset :std_logic :='0';	
signal SEQ_COUNTER_OUT :std_logic_vector(1 downto 0) :=(others => '0');		
signal T :std_logic_vector(3 downto 0) :=(others => '0');		
signal DECODER_3to8_OUT :std_logic_vector(m-1 downto 0) :=(others => '0');		
signal C :std_logic_vector(4 downto 0) :=(others => '0');			
signal Q :std_logic_vector(p-1 downto 0) :=(others => '0');		
signal MUX_4to1_8bit_OUT :std_logic_vector(m-1 downto 0) :=(others => '0');		
signal AC_INC :std_logic :='0';	
signal AC_OUT :std_logic_vector(m-1 downto 0) :=(others => '0');	
signal AC_Reset :std_logic :='0';	
signal AC_LD :std_logic :='0';	
signal AC_SHL :std_logic :='0';	
signal AC_SHR :std_logic :='0';			
signal I0_LD :std_logic :='0';	
signal I0_OUT :std_logic :='0';	
signal I1_LD :std_logic :='0';	
signal I1_OUT :std_logic :='0';	
signal F_LD :std_logic :='0';	
signal F_OUT :std_logic :='0';	
signal F_Reset :std_logic :='0';	
signal G_LD :std_logic :='0';	
signal G_OUT :std_logic :='0';	
signal G_Reset :std_logic :='0';	
signal R_LD :std_logic :='0';	
signal R_OUT :std_logic :='0';	
signal R_Reset :std_logic :='0';	
signal INF_Reset :std_logic :='0';	
signal INF_LD :std_logic :='0';		
signal INF_OUT :std_logic :='0';	
signal FGI_Reset :std_logic :='0';	
signal FGI_LD :std_logic :='0';	
signal FGO_Reset :std_logic :='0';	
signal FGO_LD :std_logic :='0';	
signal FGI_OUT :std_logic :='0';	
signal FGO_OUT :std_logic :='0';	
signal ZF_Reset :std_logic :='0';	
signal CF_Reset :std_logic :='0';	
signal ZF_OUT :std_logic :='0';	
signal CF_OUT :std_logic :='0';	
signal INVERTER_OUT :std_logic_vector(m-1 downto 0) :=(others => '0');	
signal a :std_logic_vector(1 downto 0) :=(others => '0');	
signal zero :std_logic_vector(p-1 downto 0) :=(others => '0');	
signal DECODER_3to8_SELECTOR :std_logic_vector(2 downto 0) :=(others => '0');	
signal C_B_SELECTOR :std_logic_vector(2 downto 0) :=(others => '0');
signal PC_OUT_16bit :std_logic_vector(p-1 downto 0) :=(others => '0');
signal AR_OUT_16bit :std_logic_vector(p-1 downto 0) :=(others => '0');
signal INP_OUT_16bit :std_logic_vector(p-1 downto 0) :=(others => '0');
signal AC_OUT_16bit :std_logic_vector(p-1 downto 0) :=(others => '0');
	

	
begin

	DECODER_3to8_SELECTOR <= G_OUT&F_OUT&R_OUT; --C_B_SELECTOR <= b2&b1&b0 for common bus
	PC_OUT_16bit <= "000000"&PC_OUT;
	AR_OUT_16bit <= "000000"&AR_OUT;
	AC_OUT_16bit <= "00000000"&AC_OUT;
	INP_OUT_16bit <= "00000000"&INP_OUT;
	C <= DECODER_3to8_OUT(4 downto 0);
	
	---------------------------------- PC -----------------------------------------------
	
	u1 : PC PORT MAP(input_data => C_B(9 downto 0) ,output_data => PC_OUT,load => PC_LD,Reset => PC_Reset,clk => clk,inc => PC_INC);
	
	--------------------------- Flip-Flops with Decoder 3 to 8 ------------------------------

	u2 : FF PORT MAP(clk => clk,input => '1',Reset => R_Reset,load => R_LD,output => R_OUT);

	u3 : FF PORT MAP(clk => clk,input => '1',Reset => F_Reset,load => F_LD,output => F_OUT);

	u4 : FF PORT MAP(clk => clk,input => '1',Reset => G_Reset,load => G_LD,output => G_OUT);
	
	u5 : DECODER_3to8 PORT MAP(RFG_input => DECODER_3to8_SELECTOR,controlunit_output => DECODER_3to8_OUT);

	--------------------------- Sequence Counter with Decoder 2 to 4 -------------------------
	
	u6 : sequence_counter PORT MAP(clk => clk,clear => SEQ_COUNT_Reset,output => SEQ_COUNTER_OUT);
	
	u7 : DECODER_2to4 PORT MAP(sc_input => SEQ_COUNTER_OUT,cu_output => T);
	
	-------------------------------------- ALU-----------------------------------------------
	u8 : alu   PORT MAP(Bus_input => C_B(7 downto 0),AC_input => AC_OUT ,alu_opr => ALU_OP,output => ALU_OUT,cout => ALU_COUT,zero => ALU_ZERO);
	
	-------------------------------------- Operation and Decoder 4 to 16 -----------------------
	
	u9 : OPR   PORT MAP(output_data =>OPR_OUT,input_data => C_B(13 downto 10),load => OPR_LD ,Reset => '0',clk => clk,inc => '0');
	
	u10 : DECODER_4to16 PORT MAP(opr_input =>OPR_OUT ,cu_out => Q);

	-------------------------------------- Mux 4 to 1 with AC Register and Inverter -----------------------

	u11 : MUX_4to1_8bit PORT MAP(Bus_input => C_B(7 downto 0),Alu_input => ALU_OUT,Inverter_input => INVERTER_OUT,all_zero => "00000000" ,sel => a ,AC_output => MUX_4to1_8bit_OUT);
	
	u12 : AC PORT MAP(input_data => MUX_4to1_8bit_OUT,output_data => AC_OUT,load => AC_LD,Reset => AC_Reset
								,clk => clk,shr => AC_SHR,shl => AC_SHL,inc => AC_INC);

	u13 : INVERTER_8bit PORT MAP(AC_input => AC_OUT,Mux_output => INVERTER_OUT);
	
	-------------------------------------- Flip-Flop I0 and I1 with common bus -------------------------------------
		
	u14 : FF PORT MAP(clk => clk,input => C_B(14),Reset => '0',load => I0_LD,output => I0_OUT);

	u15 : FF PORT MAP(clk => clk,input => C_B(15),Reset => '0',load => I1_LD,output => I1_OUT);
	
	u16 : MUX_8to1 PORT MAP
	(b => C_B_SELECTOR,inst1 => MBR_OUT,inst2 => INP_OUT_16bit , inst3 => AR_OUT_16bit ,inst4 => PC_OUT_16bit ,inst5 => AC_OUT_16bit ,inst6 => zero ,inst7 => zero ,inst8 => zero ,output => C_B);

	
	---------------------------------------- CR & INP & OUT -----------------------------------------
	u17 : CR     PORT MAP(input_data => C_B(7 downto 0),load => CR_LD  ,Reset => '0',clk => clk,inc => '0');
	
	u18 : INP   PORT MAP(output_data => INP_OUT ,load => INP_LD ,Reset => '0',clk => clk,inc => '0');
	
	u19 : OUTR PORT MAP(input_data => C_B(7 downto 0),load => OUTR_LD,Reset => '0',clk => clk,inc => '0');

	---------------------------------------- Mux 2to1 10 bit with AR -----------------------------------------

	u20 : MUX_2to1_10bit PORT MAP(PC_input => PC_OUT,AR_input => AR_OUT,sel => S_2to1_10bit,output_MAR => MAR_IN);

	u21 : AR PORT MAP(input_data => C_B(9 downto 0),output_data => AR_OUT,load => AR_LD  ,Reset => '0',clk => clk,inc => AR_INC);

	---------------------------------------- MAR & MBR & RAM & Mux 2to1 16bit -----------------------------------------
	
	u22: MAR PORT MAP(input_data => MAR_IN,output_data => MAR_OUT,load => MAR_LD,Reset => MAR_Reset,clk => clk,inc => '0');

	u23 : MBR PORT MAP(input_data => MBR_IN ,output_data => MBR_OUT ,load => MBR_LD ,Reset => '0',clk => clk,inc => MBR_INC,dec => MBR_DEC);

	u24: memory PORT MAP(address => MAR_OUT,input_data => MBR_OUT,output_data => MEM_OUT,wr => MEM_W,re => '1');
	
	u25: MUX_2to1_16bit PORT MAP(Bus_out => C_B,RAM_out => MEM_OUT,sel =>MUX_2to1_16bit_select ,MBR_input => MBR_IN);

	---------------------------------------- Control Unit with needed Registers -----------------------------------------

	u26: FF PORT MAP(clk => clk,input => '1',Reset => FGI_Reset,load => FGI_LD,output => FGI_OUT);

	u27: FF PORT MAP(clk => clk,input => '1',Reset => FGO_Reset,load => FGO_LD,output => FGO_OUT);

	u28 : FF PORT MAP(clk => clk,input => ALU_ZERO,Reset => ZF_Reset,load => '1',output => ZF_OUT);

	u29 : FF PORT MAP(clk => clk,input => ALU_COUT,Reset => CF_Reset,load => '1',output => CF_OUT);

	u30 : FF PORT MAP(clk => clk,input => '1',Reset => INF_Reset,load => INF_LD,output => INF_OUT);
	
	u31 : Control_Unit PORT MAP(
		clk => clk,
		MBR9_0 => MBR_OUT(9 downto 0),
		Q => Q,
		I0 => I0_OUT,
		I1 => I1_OUT,
		C => C,
		ZF => ZF_OUT,
		CF => CF_OUT,
		FGI => FGI_OUT,
		FGO => FGO_OUT,
		T => T,
		AC => AC_OUT,
		INF => INF_OUT,
		B => C_B_SELECTOR,
		S => S_2to1_10bit,
		MAR_LD => MAR_LD,
		MUX_2to1_16bit_select => MUX_2to1_16bit_select,
		MBR_LD => MBR_LD,
		PC_INC => PC_INC,
		I0_LD => I0_LD,
		I1_LD => I1_LD,
		OPR_LD => OPR_LD,
		AR_LD => AR_LD,
		R_LD => R_LD,
		F_LD => F_LD,
		G_LD => G_LD,
		R_Reset => R_Reset,
		F_Reset => F_Reset,
		G_Reset => G_Reset,
		SEQ_COUNT_Reset => SEQ_COUNT_Reset,
		ALU_OP => ALU_OP,
		a => a,
		AC_LD => AC_LD,
		MEM_W => MEM_W,
		PC_LD => PC_LD,
		AR_INC => AR_INC,
		MBR_DEC => MBR_DEC,
		CR_LD => CR_LD,
		AC_Reset => AC_Reset,
		AC_SHR => AC_SHR,
		AC_SHL => AC_SHL,
		AC_INC => AC_INC,
		FGI_Reset => FGI_Reset,
		FGI_LD => FGI_LD,
		FGO_Reset => FGO_Reset,
		FGO_LD => FGO_LD,
		OUTR_LD => OUTR_LD,
		INF_LD => INF_LD,
		INF_Reset => INF_Reset,
		PC_Reset => PC_Reset,
		MAR_Reset => MAR_Reset,
		CF_Reset => CF_Reset,
		ZF_Reset => ZF_Reset
	);
end Behavioral;

