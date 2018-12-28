----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:00:14 06/17/2018 
-- Design Name: 
-- Module Name:    DECODER_3to8 - Behavioral 
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

entity DECODER_3to8 is
	 generic ( m : INTEGER := 8 );
    Port ( 
				RFG_input : IN std_logic_vector(2 downto 0);          
				controlunit_output : OUT std_logic_vector(m-1 downto 0));
end DECODER_3to8;

architecture Behavioral of DECODER_3to8 is

begin
with RFG_input select controlunit_output <= "00000001" when "000",
						 "00000010" when "001",
						 "00000100" when "010",
						 "00001000" when "011",
						 "00010000" when "100",
						 "00100000" when "101",
						 "01000000" when "110",
						 "10000000" when "111",
						 "00000000" when others;

end Behavioral;

