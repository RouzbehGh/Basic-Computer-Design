----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:24:18 07/04/2018 
-- Design Name: 
-- Module Name:    sequence_counter - Behavioral 
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity sequence_counter is
    Port ( clk : in  STD_LOGIC;
           clear : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (1 downto 0):= (others => '0'));
end sequence_counter;

architecture Behavioral of sequence_counter is
signal Seq_counter : std_logic_vector(1 downto 0) := (others => '0');

begin
process(clk)
begin
	if(rising_edge(clk))then
		if(clear = '1')then
			Seq_counter <= "00";
		else
			Seq_counter <= Seq_counter + 1;
		end if;
	end if;
end process;
output <= Seq_counter;
end Behavioral;

