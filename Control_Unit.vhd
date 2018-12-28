----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:54:25 06/17/2018 
-- Design Name: 
-- Module Name:    Control_Unit - Behavioral 
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

entity Control_Unit is
		generic ( m: INTEGER := 8 ; n: INTEGER :=10 ; p : INTEGER := 16 );
    Port ( clk : in  STD_LOGIC;
			  MBR9_0 : in  STD_LOGIC_VECTOR (n-1 downto 0);
           Q : in  STD_LOGIC_VECTOR (p-1 downto 0);
           I0 : in  STD_LOGIC;
           I1 : in  STD_LOGIC;
           C : in  STD_LOGIC_VECTOR (4 downto 0);
           ZF : in  STD_LOGIC;
           CF : in  STD_LOGIC;
           FGI : in  STD_LOGIC;
           FGO : in  STD_LOGIC;
           T : in  STD_LOGIC_VECTOR (3 downto 0);
           AC : in  STD_LOGIC_VECTOR (m-1 downto 0);
           INF : in  STD_LOGIC;
			  B : out  STD_LOGIC_VECTOR (2 downto 0);   -- 0 => MBR , 1 => INP , 2 => AR , 3 => PC , 4 => AC  
			  S : out  STD_LOGIC;--AR or PC to MAR 
			  MAR_LD : out  STD_LOGIC := '0';	  
	    	  MUX_2to1_16bit_select : out  STD_LOGIC;--MBR input
			  MBR_LD : out  STD_LOGIC:= '0';
			  PC_INC : out  STD_LOGIC:= '0';		  
			  I0_LD :out STD_LOGIC:= '0';
			  I1_LD :out STD_LOGIC:= '0';
			  OPR_LD :out STD_LOGIC:= '0';
			  AR_LD :out STD_LOGIC:= '0';
			  R_LD :out STD_LOGIC:= '0';
			  F_LD :out STD_LOGIC:= '0';
			  G_LD :out STD_LOGIC:= '0';
			  R_Reset :out STD_LOGIC:= '0';
			  F_Reset :out STD_LOGIC:= '0';
			  G_Reset :out STD_LOGIC:= '0';
			  SEQ_COUNT_Reset :out STD_LOGIC:= '0';
			  ALU_OP :out STD_LOGIC_VECTOR(3 downto 0);
			  a :out STD_LOGIC_VECTOR(1 downto 0); -- Select of Mux 4 to 1		  
			  AC_LD :out STD_LOGIC:= '0';
			  MEM_W :out STD_LOGIC:= '0';
			  PC_LD :out STD_LOGIC:= '0';
			  AR_INC :out STD_LOGIC:= '0';
			  MBR_DEC :out STD_LOGIC:= '0';
			  CR_LD :out STD_LOGIC:= '0';
			  AC_Reset :out STD_LOGIC:= '0';
			  AC_SHR :out STD_LOGIC:= '0';
			  AC_SHL :out STD_LOGIC:= '0';
			  AC_INC :out STD_LOGIC:= '0';
			  FGI_Reset :out STD_LOGIC:= '0';
			  FGI_LD :out STD_LOGIC:= '0';
			  FGO_Reset :out STD_LOGIC:= '0';
			  FGO_LD :out STD_LOGIC:= '0';
			  OUTR_LD :out STD_LOGIC:= '0';
			  INF_LD :out STD_LOGIC:= '0';
			  INF_Reset :out STD_LOGIC:= '0';
			  PC_Reset :out STD_LOGIC:= '0';
			  MAR_Reset :out STD_LOGIC:= '0';
			  CF_Reset :out STD_LOGIC:= '0';
			  ZF_Reset :out STD_LOGIC:= '0'
			  );
			  
end Control_Unit;

architecture Behavioral of Control_Unit is
begin
process(MBR9_0,Q,C,T,I0,I1,ZF,CF,FGI,FGO,AC,INF)begin

		if(C(0) = '1')then
			if(T(0) = '1')then
			  SEQ_COUNT_Reset <= '0';
			  S <= '0';
			  MAR_LD <= '1';
			  R_LD <= '0';
			  F_LD <= '0';
			  G_LD <= '0';
			  R_Reset <= '0';
			  F_Reset <= '0';
			  G_Reset <= '0';
			  AC_LD <= '0';
			  MEM_W <= '0';
			  PC_LD <= '0';
			  AR_INC <= '0';
			  MBR_DEC <= '0';
			  CR_LD <= '0';
			  AC_Reset <= '0';
			  AC_SHR <= '0';
			  AC_SHL <= '0';
			  AC_INC <= '0';
			  FGI_Reset <= '0';
			  FGI_LD <= '0';
			  FGO_Reset <= '0';
			  FGO_LD <= '0';
			  OUTR_LD <= '0';
			  INF_LD <= '0';
			  INF_Reset <= '0';
			  PC_Reset <= '0';
			  MAR_Reset <= '0';
			  CF_Reset <= '0';
			  ZF_Reset <= '0';
			  MBR_LD <= '0';
			  PC_INC <= '0';			  
			  I0_LD <= '0';
			  I1_LD <= '0';
			  OPR_LD <= '0';
			  AR_LD <= '0';
			  SEQ_COUNT_Reset <= '0';
			  
					elsif(T(1) = '1')then
						MAR_LD <= '0';
						MUX_2to1_16bit_select <= '1';--mem
						MBR_LD <= '1';
						PC_INC <= '1';
						
					elsif(T(2) = '1')then
						MBR_LD <= '0';
						PC_INC <= '0';
						B <= "000";
						I0_LD <= '1';
						I1_LD <= '1';
						OPR_LD <= '1';
						AR_LD <= '1';
						
					elsif(T(3) = '1')then
						I0_LD <= '0';
						I1_LD <= '0';
						OPR_LD <= '0';
						AR_LD <= '0';
						
					if(I0 = '0')then
						R_LD <= '1';
						F_LD <= '1';
						G_Reset <= '1';
						
					elsif(I1 = '0')then
						R_Reset <= '1';
						F_LD <= '1';
						G_Reset <= '1';
						
					elsif(I1 = '1')then
						R_LD <= '1';
						F_Reset <= '1';
						G_Reset <= '1';
						
				end if;
				
			end if;
			
		elsif(C(1) = '1')then
			if(T(0) = '1')then
				R_LD <= '0';
				R_Reset <= '0';
				F_LD <= '0';
				F_Reset <= '0';
				G_LD <= '0';
				G_Reset <= '0';
				S <= '1';
				MAR_LD <= '1';
					elsif(T(1) = '1')then
						MAR_LD <= '0';
						MUX_2to1_16bit_select <= '1';
						MBR_LD <= '1';
					elsif(T(2) = '1')then
						MBR_LD <= '0';
						B <= "000";
						AR_LD <= '1';
					elsif(T(3) = '1')then
						AR_LD <= '0';
						R_Reset <= '1';
						F_LD <= '1';
						G_Reset <= '0';
			end if;
			elsif(C(2) = '1')then
					if(T(0) = '1')then
						R_LD <= '0';
						R_Reset <= '0';
						F_LD <= '0';
						F_Reset <= '0';
						G_LD <= '0';
						G_Reset <= '0';
						S <= '1';
						MAR_LD <= '1';
						
					elsif(T(1) = '1')then
						MAR_LD <= '0';
						MUX_2to1_16bit_select <= '1';
						MBR_LD <= '1';
							
					elsif(T(2) = '1')then
						MBR_LD <= '0';
						R_LD <= '1';
						F_LD <= '1';
						G_Reset <= '1';
						SEQ_COUNT_Reset <= '1';
			end if;
		elsif(C(3) = '1')then
				if(Q(15) = '0')then --MRI

				if(Q(0) = '1')then--ADD
					B <= "000";--MBR
					ALU_OP <= "0000";--ADD 
					a <= "01";--ALU_OUT to AC
					AC_LD <= '1';
					SEQ_COUNT_Reset <= '1';
				elsif(Q(1) = '1')then--SUB
					B <= "000";--MBR
					ALU_OP <= "0001";--SUB 
					a <= "01";--ALU_OUT to AC
					AC_LD <= '1';
					SEQ_COUNT_Reset <= '1';					
				elsif(Q(2) = '1')then--AND
					B <= "000";--MBR
					ALU_OP <= "0010";--AND 
					a <= "01";--ALU_OUT to AC
					AC_LD <= '1';					
					SEQ_COUNT_Reset <= '1';
				elsif(Q(3) = '1')then--OR
					B <= "000";--MBR
					ALU_OP <= "0011";--OR 
					a <= "01";--ALU_OUT to AC
					AC_LD <= '1';
					SEQ_COUNT_Reset <= '1';
				elsif(Q(4) = '1')then--XOR
					B <= "000";--MBR
					ALU_OP <= "0100";--XOR 
					a <= "01";--ALU_OUT to AC	
					AC_LD <= '1';
					SEQ_COUNT_Reset <= '1';
				elsif(Q(5) = '1')then--LDA
					B <= "000";--MBR
					a <= "00";--MBR to AC	
					AC_LD <= '1';
					SEQ_COUNT_Reset <= '1';
				elsif(Q(6) = '1')then--STA
					if(T(0) = '1')then
						SEQ_COUNT_Reset <= '0';
						S <= '1';
						MAR_LD <= '1';
						B <= "100";--AC
						MUX_2to1_16bit_select <= '0';--C_B
						MBR_LD <= '1';
					elsif(T(1) = '1')then
						SEQ_COUNT_Reset <= '1';
						MAR_LD <= '0';
						MBR_LD <= '0';
						MEM_W <= '1';
					end if;
				elsif(Q(7) = '1')then--BUN
					SEQ_COUNT_Reset <= '1';
					PC_LD <= '1';
					B <= "010";
				elsif(Q(8) = '1')then--BSA
					if(T(0) = '1')then
						SEQ_COUNT_Reset <= '0';
						B <= "011";--PC
						MUX_2to1_16bit_select <= '0';--C_B
						MBR_LD <= '1';
						S <= '1';--AR to MAR
						MAR_LD <= '1';
					elsif(T(1) = '1')then
						SEQ_COUNT_Reset <= '0';
						MBR_LD <= '0';
						MAR_LD <= '0';
						MEM_W <= '1';
						AR_INC <= '1';
					elsif(T(2) = '1')then
						SEQ_COUNT_Reset <= '1';
						MEM_W <= '0';
						AR_INC <= '0';
						B <= "010";--AR
						PC_LD <= '1';
					end if;
				elsif(Q(9) = '1')then--DSZ
					if(T(0) = '1')then
						SEQ_COUNT_Reset <= '0';
						MBR_DEC <= '1'; 
					elsif(T(1) = '1')then
						SEQ_COUNT_Reset <= '0';
						MBR_DEC <= '0';
						MEM_W <= '1';
						B <= "000";
						a <= "00";
						AC_LD <= '1';
					elsif(T(2) = '1')then
						SEQ_COUNT_Reset <= '1';
						MEM_W <= '0';
						AC_LD <= '0';
						if(AC = "00000000")then
							PC_INC <= '1';
						else
							PC_INC <= '0';
						end if;
					end if;
				elsif(Q(10) = '1')then--LDC
					SEQ_COUNT_Reset <= '1';
					B <= "000";
					CR_LD <= '1';
				elsif(Q(11) = '1')then--BZ
					SEQ_COUNT_Reset <= '1';
					if(ZF = '1')then
						PC_INC <= '1';
					else
						B <= "000";
						PC_LD <= '1';
					end if;
				elsif(Q(12) = '1')then--BC
					SEQ_COUNT_Reset <= '1';
					if(CF = '1')then
						PC_INC <= '1';
					else
						B <= "000";
						PC_LD <= '1';
					end if;
				elsif(Q(13) = '1')then--NOP
				
				end if;	
			elsif(I1 = '0')then--RRI
				if(MBR9_0(0) = '1')then--CLA
					SEQ_COUNT_Reset <= '1';
					AC_Reset <= '1';
				elsif(MBR9_0(1)= '1')then--CLS
					SEQ_COUNT_Reset <= '1';
					CF_Reset <= '1';
					ZF_Reset <= '1';
				elsif(MBR9_0(2)= '1')then--CMA
					SEQ_COUNT_Reset <= '1';
					a <= "10";
					AC_LD <= '1';
				elsif(MBR9_0(3)= '1')then--SRA
					SEQ_COUNT_Reset <= '1';
					AC_SHR <= '1';
				elsif(MBR9_0(4)= '1')then--SLA
					SEQ_COUNT_Reset <= '1';
					AC_SHL <= '1';
				elsif(MBR9_0(5)= '1')then--INC
					SEQ_COUNT_Reset <= '1';
					AC_INC <= '1';
				elsif(MBR9_0(6)= '1')then--HALT
					SEQ_COUNT_Reset <= '1';
					R_LD <= '0';
					R_Reset <= '0';
					F_LD <= '0';
					F_Reset <= '0';
					G_LD <= '0';
					G_Reset <= '0';
			----------------------------- Reset all parameters -----------------------
				  AC_LD <= '0';
				  MEM_W <= '0';
				  PC_LD <= '0';
				  AR_INC <= '0';
				  MBR_DEC <= '0';
				  CR_LD <= '0';
				  AC_Reset <= '0';
				  AC_SHR <= '0';
				  AC_SHL <= '0';
				  AC_INC <= '0';
				  FGI_Reset <= '0';
				  FGI_LD <= '0';
				  FGO_Reset <= '0';
				  FGO_LD <= '0';
				  OUTR_LD <= '0';
				  INF_LD <= '0';
				  INF_Reset <= '0';
				  PC_Reset <= '0';
				  MAR_Reset <= '0';
				  CF_Reset <= '0';
				  ZF_Reset <= '0';
				  MBR_LD <= '0';
				  PC_INC <= '0';			  
				  I0_LD <= '0';
				  I1_LD <= '0';
				  OPR_LD <= '0';
				  AR_LD <= '0';
				end if;
			elsif(I1 = '0')then--IOI
				if(MBR9_0(0)= '1')then--INP
					SEQ_COUNT_Reset <= '1';
					B <= "001";
					AC_LD <= '1';
					FGI_Reset <= '1';
				elsif(MBR9_0(1)= '1')then--OUT
					SEQ_COUNT_Reset <= '1';
					B <= "100";
					OUTR_LD <= '1';
					FGO_Reset <= '1';
				elsif(MBR9_0(2)= '1')then--SKI
					SEQ_COUNT_Reset <= '1';
					if(FGI = '1')then
						PC_INC <= '1';
					end if;
				elsif(MBR9_0(3)= '1')then--SKO
					SEQ_COUNT_Reset <= '1';
					if(FGO = '1')then
						PC_INC <= '1';
					end if;
				elsif(MBR9_0(4)= '1')then--ION
					SEQ_COUNT_Reset <= '1';
					INF_LD <= '1';
				elsif(MBR9_0(5)= '1')then--IOF
					SEQ_COUNT_Reset <= '1';
					INF_Reset <= '1';
				elsif(MBR9_0(6)= '1')then--SFI
					SEQ_COUNT_Reset <= '1';
					FGI_LD <= '1';
				elsif(MBR9_0(7)= '1')then--SFO
					SEQ_COUNT_Reset <= '1';
					FGI_LD <= '1';					
				end if;
			end if;
			if(INF = '1')then
					R_Reset <= '1';
					F_Reset <= '1';
					G_LD <= '1';
					R_LD <= '0';
					F_LD <= '0';
					G_Reset <= '0';
			else
					R_Reset <= '1';
					F_Reset <= '1';
					G_LD <= '0';
					R_LD <= '0';
					F_LD <= '0';
					G_Reset <= '1';
			end if;
		elsif(C(4) = '1')then
			if(T(0) = '1')then
					R_LD <= '0';
					R_Reset <= '0';
					F_LD <= '0';
					F_Reset <= '0';
					G_LD <= '0';
					G_Reset <= '0';
			----------------------------- Reset all parameters -----------------------
			  AC_LD <= '0';
			  MEM_W <= '0';
			  PC_LD <= '0';
			  AR_INC <= '0';
			  MBR_DEC <= '0';
			  CR_LD <= '0';
			  AC_Reset <= '0';
			  AC_SHR <= '0';
			  AC_SHL <= '0';
			  AC_INC <= '0';
			  FGI_Reset <= '0';
			  FGI_LD <= '0';
			  FGO_Reset <= '0';
			  FGO_LD <= '0';
			  OUTR_LD <= '0';
			  INF_LD <= '0';
			  INF_Reset <= '0';
			  PC_Reset <= '0';
			  MAR_Reset <= '0';
			  CF_Reset <= '0';
			  ZF_Reset <= '0';
			  MBR_LD <= '0';
			  PC_INC <= '0';			  
			  I0_LD <= '0';
			  I1_LD <= '0';
			  OPR_LD <= '0';
			  AR_LD <= '0';
			  SEQ_COUNT_Reset <= '0';
				B <= "011";
				MUX_2to1_16bit_select <= '0';--C_B
				INF_Reset <= '1';
				MBR_LD <= '1';
			elsif(T(1) = '1')then
				INF_Reset <= '0';
				MBR_LD <= '0';
				PC_Reset <= '1';
				MAR_Reset <= '1';
			elsif(T(2) = '1')then
				PC_Reset <= '0';
				MAR_Reset <= '0';
				MEM_W <= '1';
				PC_INC <= '1';
			elsif(T(3) = '1')then
				MEM_W <= '0';
				PC_INC <= '0';
				SEQ_COUNT_Reset <= '1';
				R_Reset <= '1';
				F_Reset <= '1';
				G_Reset <= '1';
			end if;
		end if;
	end process;
end Behavioral;

