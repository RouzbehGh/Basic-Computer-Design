----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:19:22 06/19/2018 
-- Design Name: 
-- Module Name:    MUX_2to1_10bit - Behavioral 
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

entity MUX_2to1_10bit is
	generic ( n : INTEGER := 10 );
    Port ( PC_input : in  STD_LOGIC_VECTOR (n-1 downto 0);
           AR_input : in  STD_LOGIC_VECTOR (n-1 downto 0);
           sel : in  STD_LOGIC;
           output_MAR : out  STD_LOGIC_VECTOR (n-1 downto 0));
end MUX_2to1_10bit;

architecture Behavioral of MUX_2to1_10bit is

begin

with sel select output_MAR <= PC_input when '0',
						 AR_input when '1',
						 (others => '0') when others;

end Behavioral;

