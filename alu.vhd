----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:24:28 07/06/2018 
-- Design Name: 
-- Module Name:    alu - Behavioral 
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
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity alu is
    Port ( Bus_input : in  STD_LOGIC_VECTOR (7 downto 0);
           AC_input : in  STD_LOGIC_VECTOR (7 downto 0);
           alu_opr : in  STD_LOGIC_VECTOR (3 downto 0);
           output : out  STD_LOGIC_VECTOR (7 downto 0);
           cout : out  STD_LOGIC;
           zero : out  STD_LOGIC);
end alu;

architecture Behavioral of alu is

signal add_temp : STD_LOGIC_VECTOR(8 downto 0) := (others=>'0');
signal inc_temp : STD_LOGIC_VECTOR(8 downto 0) := (others=>'0');
signal sub_temp : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
signal output_temp : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
signal cout_temp : STD_LOGIC:= '0';

begin
add_temp <= conv_std_logic_vector((conv_integer(Bus_input) + conv_integer(AC_input)),9);
inc_temp <= conv_std_logic_vector((conv_integer(Bus_input) + 1),9);
sub_temp <= Bus_input - AC_input;
with alu_opr select output_temp <= add_temp(7 downto 0) when "0000",
											 sub_temp 			    when "0001",
											 Bus_input and AC_input				 when "0010",
											 Bus_input or  AC_input 				 when "0011",
											 Bus_input xor AC_input 				 when "0100",
											 inc_temp(7 downto 0) when "0101",
											 "00000000"   when "0110",
											 "00000000"   when "0111",
										    "00000000"   when others;

with alu_opr select cout_temp <= add_temp(8) when "0000",
										  '0' 		  when "0001",
										  '0' 		  when "0010",
										  '0' 		  when "0011",
										  '0' 		  when "0100",
										  inc_temp(8) when "0101",
										  '0'   		  when "0110",
										  '0'   		  when "0111",
										  '0'   		  when others;

									  
zero <= '1' when (cout_temp&output_temp) = "000000000" else '0';
output <= output_temp;
cout <= cout_temp;
end Behavioral;

