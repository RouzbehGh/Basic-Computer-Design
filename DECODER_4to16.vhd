----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:56:41 06/17/2018 
-- Design Name: 
-- Module Name:    DECODER_4to16 - Behavioral 
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

entity DECODER_4to16 is
    Port ( opr_input : in  STD_LOGIC_VECTOR (3 downto 0);
           cu_out : out  STD_LOGIC_VECTOR (15 downto 0));
end DECODER_4to16;

architecture Behavioral of DECODER_4to16 is

begin
with opr_input select cu_out <= "0000000000000001" when "0000",
						 "0000000000000010" when "0001",
						 "0000000000000100" when "0010",
						 "0000000000001000" when "0011",
						 "0000000000010000" when "0100",
						 "0000000000100000" when "0101",
						 "0000000001000000" when "0110",
						 "0000000010000000" when "0111",
						 "0000000100000000" when "1000",
						 "0000001000000000" when "1001",
						 "0000010000000000" when "1010",
						 "0000100000000000" when "1011",
						 "0001000000000000" when "1100",
						 "0010000000000000" when "1101",
						 "0100000000000000" when "1110",
						 "1000000000000000" when "1111",
						 "0000000000000000" when others;
end Behavioral;

