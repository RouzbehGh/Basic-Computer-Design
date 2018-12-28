----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:43:22 07/03/2018 
-- Design Name: 
-- Module Name:    memory - Behavioral 
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
USE ieee.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity memory is
	generic ( p : INTEGER := 16 ; n : INTEGER := 10);
    Port ( address : in  STD_LOGIC_VECTOR (n-1 downto 0);
           input_data : in  STD_LOGIC_VECTOR (p-1 downto 0);
           output_data : out  STD_LOGIC_VECTOR (p-1 downto 0);
           wr : in  STD_LOGIC;
           re : in  STD_LOGIC);
end memory;

architecture Behavioral of memory is

type t_RAM is array (1023 downto 0) of std_logic_vector(p-1 downto 0);

signal temp : t_RAM :=(0=>"0101010000000011",1=>"0000010001000000",2=>"0110110000001101",3=>"1011110001000000",
								4=>"1011110000010000",5=>"0101100000010000",6=>"0101110000011110",7=>"0110000000001001",
								8=>"0110010000000000",9=>"0110100000010001",10=>"0110110000000000",11=>"0000000000000101",
								12=>"0000000000001100",13=>"0000000000000001",14=>"0000001111111111",15=>"0000000000000010",16=>"0000000000001000",others => (others =>'0'));

begin
	temp(to_integer(unsigned(address))) <= input_data when wr = '1';
	output_data <= temp(to_integer(unsigned(address))) when re = '1';
end Behavioral;

