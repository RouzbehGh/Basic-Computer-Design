----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:52:05 06/17/2018 
-- Design Name: 
-- Module Name:    MUX_8to1 - Behavioral 
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

entity MUX_8to1 is
	 generic ( p : INTEGER := 16 );
    Port ( b : in  STD_LOGIC_VECTOR (2 downto 0);
           inst1 : in  STD_LOGIC_VECTOR (p-1 downto 0);
           inst2 : in  STD_LOGIC_VECTOR (p-1 downto 0);
           inst3 : in  STD_LOGIC_VECTOR (p-1 downto 0);
           inst4 : in  STD_LOGIC_VECTOR (p-1 downto 0);
           inst5 : in  STD_LOGIC_VECTOR (p-1 downto 0);
           inst6 : in  STD_LOGIC_VECTOR (p-1 downto 0);
           inst7 : in  STD_LOGIC_VECTOR (p-1 downto 0);
           inst8 : in  STD_LOGIC_VECTOR (p-1 downto 0);
           output : out  STD_LOGIC_VECTOR (p-1 downto 0));
end MUX_8to1;

architecture Behavioral of MUX_8to1 is

begin
with b select output <= inst1 when "000",
							 inst2 when "001",
							 inst3 when "010",
							 inst4 when "011",
							 inst5 when "100",
							 inst6 when "101",
							 inst7 when "110",
							 inst8 when "111",
							 (others => '0') when others;

end Behavioral;

