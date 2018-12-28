----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:03:33 06/17/2018 
-- Design Name: 
-- Module Name:    INVERTER_8bit - Behavioral 
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

entity INVERTER_8bit is
	generic ( m: INTEGER := 8 );
    Port ( AC_input : in  STD_LOGIC_VECTOR (m-1 downto 0);
           Mux_output : out  STD_LOGIC_VECTOR (m-1 downto 0));
end INVERTER_8bit;

architecture Behavioral of INVERTER_8bit is

begin
	Mux_output <= not AC_input;
end Behavioral;

