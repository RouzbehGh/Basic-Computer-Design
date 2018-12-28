----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:36:05 06/17/2018 
-- Design Name: 
-- Module Name:    MUX_2to1_16bit - Behavioral 
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

entity MUX_2to1_16bit is
	generic ( p : INTEGER := 16 );
    Port ( Bus_out : in  STD_LOGIC_VECTOR (p-1 downto 0);
           RAM_out : in  STD_LOGIC_VECTOR (p-1 downto 0);
           sel : in  STD_LOGIC;
           MBR_input : out  STD_LOGIC_VECTOR (p-1 downto 0));
end MUX_2to1_16bit;

architecture Behavioral of MUX_2to1_16bit is

begin

with sel select MBR_input <= Bus_out when '0',
						 RAM_out when '1',
						 (others => '0') when others;

end Behavioral;

