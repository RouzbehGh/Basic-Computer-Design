----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:01:45 06/17/2018 
-- Design Name: 
-- Module Name:    DECODER_2to4 - Behavioral 
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

entity DECODER_2to4 is
    Port ( sc_input : in  STD_LOGIC_VECTOR (1 downto 0);
           cu_output : out  STD_LOGIC_VECTOR (3 downto 0));
end DECODER_2to4;

architecture Behavioral of DECODER_2to4 is

begin
with sc_input select cu_output <= "0001" when "00",
						 "0010" when "01",
						 "0100" when "10",
						 "1000" when "11",
						 "0000" when others;

end Behavioral;

