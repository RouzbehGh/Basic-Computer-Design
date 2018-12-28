----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:02:58 06/25/2018 
-- Design Name: 
-- Module Name:    AC - Behavioral 
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
use ieee.std_logic_signed.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AC is
	generic ( m : INTEGER := 8 );
    Port ( input_data : in  STD_LOGIC_VECTOR (m-1 downto 0);
           output_data : out  STD_LOGIC_VECTOR (m-1 downto 0);
           load : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           shr : in  STD_LOGIC;
           shl : in  STD_LOGIC;
           inc : in  STD_LOGIC);
end AC;

architecture Behavioral of AC is
signal t :std_logic_vector(m-1 downto 0) := (others => '0');

begin

process(clk)
begin
	if(rising_edge(clk))then
		if(Reset = '1')then
			t <= "00000000";
		else
			if(inc = '1')then
				t <= t + 1;
			else
				if(load = '1')then
					t <= input_data;
				elsif(shr = '1')then
					t <= (t(7)&t(7 downto 1));
				elsif(shl = '1')then
					t <= (t(6 downto 0)&'0');
				end if;
			end if;
		end if;
	end if;
end process;
	output_data <= t;
end Behavioral;
