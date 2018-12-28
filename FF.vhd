----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:10:19 06/17/2018 
-- Design Name: 
-- Module Name:    FF - Behavioral 
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

entity FF is
    Port ( clk : in  STD_LOGIC;
           input : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
			  load :in std_logic;
           output : out  STD_LOGIC);
end FF;

architecture Behavioral of FF is
signal temp :std_logic := '0';
begin
process(clk)
begin
	if(rising_edge(clk))then
		if(Reset = '1')then
			temp <= '0';
		else
			if(load = '1')then
				temp <= input;
			end if;
		end if;
	end if;
output <= temp;	
end process;
end Behavioral;

