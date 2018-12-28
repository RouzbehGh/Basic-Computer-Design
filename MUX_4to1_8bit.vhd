----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:53:56 06/17/2018 
-- Design Name: 
-- Module Name:    MUX_4to1_8bit - Behavioral 
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

entity MUX_4to1_8bit is
	generic ( m: INTEGER := 8 );
    Port ( Bus_input : in  STD_LOGIC_VECTOR (m-1 downto 0);
           Alu_input : in  STD_LOGIC_VECTOR (m-1 downto 0);
           Inverter_input : in  STD_LOGIC_VECTOR (m-1 downto 0);
           all_zero : in  STD_LOGIC_VECTOR (m-1 downto 0);
           sel : in  STD_LOGIC_VECTOR (1 downto 0);
           AC_output : out  STD_LOGIC_VECTOR (m-1 downto 0));
end MUX_4to1_8bit;

architecture Behavioral of MUX_4to1_8bit is

begin
with sel select AC_output <= Bus_input when "00",
						 Alu_input when "01",
						 Inverter_input when "10",
						 all_zero when "11",
						 (others => '0') when others;
end Behavioral;

